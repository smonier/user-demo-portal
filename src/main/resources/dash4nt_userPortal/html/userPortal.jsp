<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="random" class="java.util.Random" scope="application" />

<%--<template:addResources type="css" resources="webapp/main.d1bd2f90.css" media="screen"/>--%>
<template:addResources type="javascript" resources="webapp/main.a4b1a0b0.js" />

<c:set var="workspace" value="${renderContext.workspace}"/>
<c:set var="host" value="${url.server}"/>
<c:set var="_uuid_" value="${currentNode.identifier}"/>

<%--<c:choose>--%>
<%--    <c:when test="${renderContext.editMode}" >--%>
<%--        <section class="section">--%>
<%--            <div class="container">--%>
<%--                <h1>The dashboard is not displayed in Edit mode -> preview</h1>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--    </c:when>--%>
<%--    <c:otherwise>--%>
        <c:set var="language" value="${currentResource.locale.language}"/>
        <c:set var="targetId" value="REACT_USER_DASHBOARD_${fn:replace(random.nextInt(),'-','_')}"/>


        <div id="${targetId}"></div>
        <script>
            const userDashboard_context_${targetId}={
                workspace:"${renderContext.liveMode ? 'LIVE' : 'EDIT'}",
                locale:"${language}",
                gqlEndpoint:"${host}/modules/graphql",
                portalId:"${_uuid_}"
            }
            window.addEventListener("DOMContentLoaded", (event) => {
                <%--window.userDashboardReact("${targetId}",userDashboard_context_${targetId});--%>
                <%--//in case if edit mode slow down the load waiting for the jahia GWT UI was setup,--%>
                <%--// otherwise the react app failed (maybe loosing his position as the DOM is updated by the jahia UI at the same time)--%>
                <c:choose>
                    <c:when test="${renderContext.editMode}" >
                        setTimeout(() => {
                            window.userDashboardReact("${targetId}",userDashboard_context_${targetId});
                        },500);
                    </c:when>
                    <c:otherwise>
                        window.userDashboardReact("${targetId}",userDashboard_context_${targetId});
                    </c:otherwise>
                </c:choose>
            });
        </script>
<%--    </c:otherwise>--%>
<%--</c:choose>--%>

