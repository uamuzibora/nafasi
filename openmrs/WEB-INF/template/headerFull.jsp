<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
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
<html lang="en">
	<head>	
		<openmrs:htmlInclude file="/js/openmrs.js" />
		<openmrs:htmlInclude file="/scripts/openmrsmessages.js" appendLocale="true" />
		<openmrs:htmlInclude file="/css/openmrs.css" />
		<link href="<openmrs:contextPath/><spring:theme code='stylesheet' />" type="text/css" rel="stylesheet" />
		<openmrs:htmlInclude file="/css/style.css" />
		<openmrs:htmlInclude file="/dwr/engine.js" />
		<openmrs:htmlInclude file="/dwr/interface/DWRAlertService.js" />
		<c:if test="${empty DO_NOT_INCLUDE_JQUERY}">
			<openmrs:htmlInclude file="/scripts/jquery/jquery.min.js" />
			<openmrs:htmlInclude file="/scripts/jquery-ui/js/jquery-ui.custom.min.js" />
			<openmrs:htmlInclude file="/scripts/jquery-ui/js/jquery-ui-datepicker-i18n.js" />
			<link href="<openmrs:contextPath/>/scripts/jquery-ui/css/<spring:theme code='jqueryui.theme.name' />/jquery-ui.custom.css" type="text/css" rel="stylesheet" />
		</c:if>
		<link rel="icon" type="image/ico" href="<openmrs:contextPath/><spring:theme code='favicon' />">
		<c:choose>
			<c:when test="${!empty pageTitle}">
				<title>${pageTitle}</title>
			</c:when>
			<c:otherwise>
				<title><spring:message code="openmrs.title"/></title>
			</c:otherwise>
		</c:choose>
		
		<script type="text/javascript">
			<c:if test="${empty DO_NOT_INCLUDE_JQUERY}">
				var $j = jQuery.noConflict();
			</c:if>
			/* variable used in js to know the context path */
			var openmrsContextPath = '${pageContext.request.contextPath}';
			var dwrLoadingMessage = '<spring:message code="general.loading" />';
			var jsDateFormat = '<openmrs:datePattern localize="false"/>';
			var jsLocale = '<%= org.openmrs.api.context.Context.getLocale() %>';
			
			/* prevents users getting false dwr errors msgs when leaving pages */
			var pageIsExiting = false;
			if (jQuery)
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
		<openmrs:extensionPoint pointId="org.openmrs.headerFullIncludeExt" type="html" requiredClass="org.openmrs.module.web.extension.HeaderIncludeExt">
			<c:forEach var="file" items="${extension.headerFiles}">
				<openmrs:htmlInclude file="${file}" />
			</c:forEach>
		</openmrs:extensionPoint>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="Uamuzi Bora on OpenMRS">
		<meta name="author" content="Uamuzi Bora">

		<!-- Le styles -->
		<openmrs:htmlInclude file="/css/bootstrap.css" />
		<style type="text/css">
			body {
				padding-top: 60px;
				padding-bottom: 40px;
				}
		</style>
		
		<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
		<openmrs:htmlInclude file="/js/html5.js" />
		<![endif]-->
	
	</head>

	<body>
		<div class="navbar navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					<a class="brand" href="${pageContext.request.contextPath}/index.htm">
						<spring:message code="openmrs.title"/>
					</a>
					<div class="btn-group pull-right">
						<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
							<openmrs:authentication>
							<c:if test="${authenticatedUser != null}">
							<i class="icon-user"></i> ${authenticatedUser.personName}
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="${pageContext.request.contextPath}/options.form">
									<spring:message code="Navigation.options"/>
								</a>
							</li>
							<li>
								<a href='${pageContext.request.contextPath}/help.htm'>
									<spring:message code="header.help"/>
								</a>
							</li>
							<openmrs:extensionPoint pointId="org.openmrs.headerFull.userBar" type="html">
							<openmrs:hasPrivilege privilege="${extension.requiredPrivilege}">
							<li>
								<a href="${extension.url}">
									<spring:message code="${extension.label}"/>
								</a>
							</li>
							<c:if test="${extension.portletUrl != null}">
								<openmrs:portlet url="${extension.portletUrl}" moduleId="${extension.moduleId}" id="${extension.portletUrl}" />
							</c:if>
							</openmrs:hasPrivilege>
							</openmrs:extensionPoint>
							<li class="divider"></li>
							<li>
								<a href='${pageContext.request.contextPath}/logout'>
									<spring:message code="header.logout" />
								</a>
							</li>
						</ul>
						</c:if>
						<c:if test="${authenticatedUser == null}">
						<i class="icon-user"></i> <spring:message code="header.logged.out"/>
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href='${pageContext.request.contextPath}/login.htm'>
									<spring:message code="header.login"/>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href='${pageContext.request.contextPath}/help.htm'>
									<spring:message code="header.help"/>
								</a>
							</li>
							<openmrs:extensionPoint pointId="org.openmrs.headerFull.userBar" type="html">
							<openmrs:hasPrivilege privilege="${extension.requiredPrivilege}">
							<li>
								<a href="${extension.url}">
									<spring:message code="${extension.label}"/>
								</a>
							</li>
							<c:if test="${extension.portletUrl != null}">
								<openmrs:portlet url="${extension.portletUrl}" moduleId="${extension.moduleId}" id="${extension.portletUrl}" />
							</c:if>
							</openmrs:hasPrivilege>
							</openmrs:extensionPoint>
						</ul>
						</c:if>
						</openmrs:authentication>
					</div>
					<div class="nav-collapse">
						<openmrs:hasPrivilege privilege="View Navigation Menu">
						<ul class="nav">
							<li id="homeNavLink">
								<a href="${pageContext.request.contextPath}/">
									<spring:message code="Navigation.home"/>
								</a>
							</li>
							<li id="findPatientNavLink">
								<a href="${pageContext.request.contextPath}/findPatient.htm">
									<openmrs:hasPrivilege privilege="Add Patients">
										<spring:message code="Navigation.findCreatePatient"/>
									</openmrs:hasPrivilege>
									<openmrs:hasPrivilege privilege="Add Patients" inverse="true">
										<spring:message code="Navigation.findPatient"/>
									</openmrs:hasPrivilege>
								</a>
							</li>
							<openmrs:hasPrivilege privilege="View Concepts">
							<li id="dictionaryNavLink">
								<a href="${pageContext.request.contextPath}/dictionary">
									<spring:message code="Navigation.dictionary"/>
								</a>
							</li>
							</openmrs:hasPrivilege>
							<openmrs:extensionPoint pointId="org.openmrs.gutter.tools" type="html">
							<openmrs:hasPrivilege privilege="${extension.requiredPrivilege}">
							<li>
								<a href="${pageContext.request.contextPath}/${extension.url}">
									<spring:message code="${extension.label}"/>
								</a>
							</li>
							</openmrs:hasPrivilege>
							</openmrs:extensionPoint>
							<openmrs:hasPrivilege privilege="View Administration Functions">
							<li id="administrationNavLink">
								<a href="${pageContext.request.contextPath}/admin">
									<spring:message code="Navigation.administration"/>
								</a>
							</li>
							</openmrs:hasPrivilege>
						</ul>
						</openmrs:hasPrivilege>
					</div><!--/.nav-collapse -->
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<!-- Alert/messages boxes -->
				<div class="span-8 offset-2">
					<!-- Alert -->
					<openmrs:forEachAlert>
					<div class="alert">
						<button class="close" data-dismiss="alert">×</button>
						<i class="icon-exclamation-sign"></i> ${alert.text} ${alert.dateToExpire}
						<c:if test="${alert.satisfiedByAny}">
							<br><em>(<spring:message code="Alert.mark.satisfiedByAny"/>)</em>
						</c:if>
					</div>
					</openmrs:forEachAlert>
					<!-- End Alert -->
					<!-- Message -->
					<c:if test="${msg != null}">
						<div class="alert alert-info">
							<button class="close" data-dismiss="alert">×</button>
							<i class="icon-info-sign"></i> <spring:message code="${msg}" text="${msg}" arguments="${msgArgs}" />
						</div>
					</c:if>
					<!-- End Message -->
					<!-- Error -->
					<c:if test="${err != null}">
						<div class="alert alert-error">
							<button class="close" data-dismiss="alert">×</button>
							<i class="icon-exclamation-sign"> <spring:message code="${err}" text="${err}" arguments="${errArgs}"/>
						</div>
					</c:if>
					<!-- End Error -->
					<!-- DWR Error -->
					<div id="openmrs_dwr_error" style="display:none" class="alert alert-error">
						<button class="close" data-dismiss="alert">×</button>
						<div id="openmrs_dwr_error_msg"></div>
						<spring:message code="error.dwr.stacktrace"/>
					</div>
					<!-- End DWR Error -->
				</div>
				<!-- End Alert box -->
			</div>
			