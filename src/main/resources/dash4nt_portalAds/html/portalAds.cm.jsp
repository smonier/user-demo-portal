<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>

<link rel="stylesheet" type="text/css" href="/modules/bootstrap4-core/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/modules/demo-user-portal/css/demo-portal-style.css">

<c:set var="mediaWidth" value="${not empty currentResource.moduleParams.mediaWidth ? currentResource.moduleParams.mediaWidth : '1028'}" />
<c:set var="mediaHeight" value="${currentResource.moduleParams.mediaHeight}" />
<c:set var="mediaScale" value="${not empty currentResource.moduleParams.mediaScale ? currentResource.moduleParams.mediaScale : 1}" />
<c:set var="mediaQuality" value="${not empty currentResource.moduleParams.mediaQuality ? currentResource.moduleParams.mediaQuality : 72}" />

<c:set var="teaser" value="${currentNode.properties['dash4:teaser'].string}" />
<utility:logger level="INFO" value="The teaser is ${teaser}"/>

<template:module node="${currentNode.properties['dash4:image'].node}" view="hidden.getURL" var="imageURL" editable="false" templateType="txt">
    <template:param name="width" value="${mediaWidth}"/>
    <template:param name="height" value="${mediaHeight}"/>
    <template:param name="scale" value="${mediaScale}"/>
    <template:param name="quality" value="${mediaQuality}"/>
</template:module>

<template:include view="hidden.getLinkToURL"/>


<div class="inner-page">
    <a href="${moduleMap.linkUrl}" class="link-ads" target="${moduleMap.linkTarget}">
        <div class="slider-item" style="background-image: url('${imageURL}');">
            <div class="container">
                <div class="row slider-text align-items-center justify-content-center">
                    <div class="col-md-8 text-center col-sm-12 pt-5 element-animate">
                        ${teaser}
                    </div>
                </div>
            </div>
        </div>
    </a>
</div>

<%--<a href="${moduleMap.linkUrl}" class="link-thumbnail" target="${moduleMap.linkTarget}">--%>
<%--    ${teaser}--%>
<%--&lt;%&ndash;    <span class="${iconClass}"></span>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <template:include view="hidden.image">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <template:param name="class" value="img-fluid"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </template:include>&ndash;%&gt;--%>
<%--</a>--%>