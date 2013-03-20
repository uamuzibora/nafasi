		<br/>
		</div>
	</div>
	<div id="footer">
		<div id="footerInner">
		
			<span id="localeOptions">
				<%  //removes last instance of lang= from querystring and encodes the url to avoid xml problems
					String qs = org.apache.commons.lang.StringEscapeUtils.escapeXml(request.getQueryString());
					if (qs == null)
						qs = "";
					int i = qs.lastIndexOf("&amp;lang=");
					if (i == -1)
						i = qs.length();
					pageContext.setAttribute("qs", qs.substring(0, i));
					pageContext.setAttribute("locales", org.openmrs.api.context.Context.getAdministrationService().getPresentationLocales());
					pageContext.setAttribute("openmrsVersion", org.openmrs.util.OpenmrsConstants.OPENMRS_VERSION);
					pageContext.setAttribute("locale", org.openmrs.api.context.Context.getLocale());
				%>
		
				<c:forEach items="${locales}" var="loc" varStatus="status">
					<%
						java.util.Locale locTmp = (java.util.Locale) pageContext.getAttribute("loc");
						pageContext.setAttribute("locDisplayName", locTmp.getDisplayName(locTmp));
					%>
					<c:if test="${status.index != 0}">| </c:if>
					<c:if test="${fn:toLowerCase(locale) == fn:toLowerCase(loc)}">${locDisplayName}</c:if>
					<c:if test="${fn:toLowerCase(locale) != fn:toLowerCase(loc)}"><a href="?${qs}&amp;lang=${loc}">${locDisplayName}</a></c:if> 
				</c:forEach>
			</span>	
	
			<span id="buildDate"><spring:message code="footer.lastBuild"/>: <%= org.openmrs.web.WebConstants.BUILD_TIMESTAMP %></span>
			
			<span id="codeVersion"><spring:message code="footer.version"/>: ${openmrsVersion}</span>
			
			<span id="poweredBy"><a href="http://openmrs.org"><spring:message code="footer.poweredBy"/> <img border="0" align="top" src="<%= request.getContextPath() %>/images/openmrs_logo_tiny.png"/></a></span>
		</div>
	</div>
<!-- Piwik --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://192.168.1.2:8080/" : "http://192.168.1.2:8080/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
window.onload = function(){
	setTimeout(function(){
		var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
		var t = performance.timing;
		var totaltime = t.loadEventEnd - t.navigationStart;
		var networktime = t.requestStart - t.navigationStart;
		var servertime = t.responseStart - t.requestStart;
		var downloadtime = t.responseEnd - t.responseStart;
		var browsertime = t.loadEventEnd - t.responseEnd;
		var n = performance.navigation;
		var navtype = n.type;
		if (navtype == 0)
  		{
 			piwikTracker.setCustomVariable (1, 'Page Load Time', totaltime, 'page');
			piwikTracker.setCustomVariable (2, 'Network Time', networktime, 'page');
			piwikTracker.setCustomVariable (3, 'Server Response Time', servertime, 'page');
			piwikTracker.setCustomVariable (4, 'Page Download Time', downloadtime, 'page');
			piwikTracker.setCustomVariable (5, 'Browser Time', browsertime, 'page');
		
  		}
		piwikTracker.trackPageView();
		piwikTracker.enableLinkTracking();
	}, 0);
}
} catch( err ) {}
</script><noscript><p><img src="https://192.168.1.2:8080/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
</body>
</html>
