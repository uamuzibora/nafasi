		<br/>
		</div>
	</div>
	<openmrs:htmlInclude file="/openmrs.concatenated.js" />
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
