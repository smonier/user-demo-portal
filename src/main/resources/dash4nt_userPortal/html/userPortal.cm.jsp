<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="random" class="java.util.Random" scope="application" />

<%--<template:addResources type="css" resources="webapp/main.d1bd2f90.css" media="screen"/>--%>
<script type="application/javascript" src="/modules/demo-user-portal/javascript/webapp/${requestScope.webappJsFileName}"></script>

<c:set var="_uuid_" value="${currentNode.identifier}"/>
<c:set var="language" value="${currentResource.locale.language}"/>
<c:set var="workspace" value="${renderContext.workspace}"/>
<c:set var="isEdit" value="${renderContext.editMode}"/>
<c:set var="site" value="${renderContext.site.siteKey}"/>
<c:set var="host" value="${url.server}"/>
<c:set var="targetId" value="REACT_USER_DASHBOARD_${fn:replace(random.nextInt(),'-','_')}"/>

<div id="${targetId}"></div>
<script>
    window.userDashboardReact("${targetId}",{
        host:"${host}",
        workspace:"${renderContext.liveMode ? 'LIVE' : 'EDIT'}",
        isEdit:${isEdit},
        scope:"${site}",//site key
        locale:"${language}",
        portalId:"${_uuid_}",
        gqlEndpoint:"${host}/modules/graphql",
        contextServerUrl:window.digitalData?window.digitalData.contextServerPublicUrl:undefined,//digitalData is set in live mode only
    });
</script>
