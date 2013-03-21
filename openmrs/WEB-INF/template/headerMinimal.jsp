<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="org.openmrs.web.WebConstants" %>
<%
	pageContext.setAttribute("msg", session.getAttribute(WebConstants.OPENMRS_MSG_ATTR));
	pageContext.setAttribute("msgArgs", session.getAttribute(WebConstants.OPENMRS_MSG_ARGS));
	pageContext.setAttribute("err", session.getAttribute(WebConstants.OPENMRS_ERROR_ATTR));
	pageContext.setAttribute("errArgs", session.getAttribute(WebConstants.OPENMRS_ERROR_ARGS));
	session.removeAttribute(WebConstants.OPENMRS_MSG_ATTR);
	session.removeAttribute(WebConstants.OPENMRS_MSG_ARGS);
	session.removeAttribute(WebConstants.OPENMRS_ERROR_ATTR);
	session.removeAttribute(WebConstants.OPENMRS_ERROR_ARGS);
%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<c:choose>
			<c:when test="${!empty pageTitle}">
				<title>${pageTitle}</title>
			</c:when>
			<c:otherwise>
				<title><spring:message code="openmrs.title"/></title>
			</c:otherwise>
		</c:choose>

		<openmrs:htmlInclude file="/css/openmrs.min.css" />
		
		<openmrs:htmlInclude file="/scripts/openmrs.concatenated.js" />
		<openmrs:htmlInclude file="/scripts/openmrsmessages.js" appendLocale="true" />
		<openmrs:htmlInclude file="/dwr/engine.js" />
		<script type="text/javascript">
			<c:if test="${empty DO_NOT_INCLUDE_JQUERY}">
				var $j = jQuery.noConflict();
			</c:if>
			/* variable used in js to know the context path */
			var openmrsContextPath = '${pageContext.request.contextPath}';
			var dwrLoadingMessage = '<spring:message code="general.loading" />';
			var jsDateFormat = '<openmrs:datePattern localize="false"/>';
			var jsTimeFormat = '<openmrs:timePattern format="jquery" localize="false"/>';
			var jsLocale = '<%= org.openmrs.api.context.Context.getLocale() %>';
			
			/* prevents users getting false dwr errors msgs when leaving pages */
			var pageIsExiting = false;
			if (typeof(jQuery) != "undefined")
			    jQuery(window).bind('beforeunload', function () { pageIsExiting = true; } );
			
			var handler = function(msg, ex) {
				if (!pageIsExiting) {
					var div = document.getElementById("openmrs_dwr_error");
					div.style.display = ""; // show the error div
					var msgDiv = document.getElementById("openmrs_dwr_error_msg");
					msgDiv.innerHTML = '<spring:message code="error.dwr"/>' + " <b>" + msg + "</b>";
				}
				
			};
			dwr.engine.setErrorHandler(handler);
			dwr.engine.setWarningHandler(handler);
		</script>
		<link rel="shortcut icon" type="image/ico" href="<openmrs:contextPath/><spring:theme code='favicon' />">
		<link rel="icon" type="image/png" href="<openmrs:contextPath/><spring:theme code='favicon.png' />">
		

		<openmrs:extensionPoint pointId="org.openmrs.headerMinimalIncludeExt" type="html" requiredClass="org.openmrs.module.web.extension.HeaderIncludeExt">
			<c:forEach var="file" items="${extension.headerFiles}">
				<openmrs:htmlInclude file="${file}" />
			</c:forEach>
		</openmrs:extensionPoint>

	</head>

<body>
	<div id="pageBody">
		<div id="contentMinimal">
			<c:if test="${msg != null}">
				<div id="openmrs_msg"><spring:message code="${msg}" text="${msg}" arguments="${msgArgs}" /></div>
			</c:if>
			<c:if test="${err != null}">
				<div id="openmrs_error"><spring:message code="${err}" text="${err}" arguments="${errArgs}"/></div>
			</c:if>
			<div id="openmrs_dwr_error" style="display:none" class="error">
				<div id="openmrs_dwr_error_msg"></div>
				<div id="openmrs_dwr_error_close" class="smallMessage">
					<i><spring:message code="error.dwr.stacktrace"/></i> 
					<a href="#" onclick="this.parentNode.parentNode.style.display='none'"><spring:message code="error.dwr.hide"/></a>
				</div>
			</div>

