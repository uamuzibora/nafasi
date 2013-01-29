		<br/>
		</div>
	</div>
<!-- Piwik --> 
<script type="text/javascript">
var pkBaseURL = (("https:" == document.location.protocol) ? "https://192.168.1.2:8080/" : "http://192.168.1.2:8080/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
</script><script type="text/javascript">
try {
window.onload = function(){
	var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 1);
	var t = performance.timing;
	var totaltime = t.loadEventStart - t.navigationStart;
	var servertime = t.responseStart - t.requestStart;
	var browsertime = t.loadEventStart - t.responseEnd;
	var transmissiontime = t.responseEnd - t.responseStart;
	var n = performance.navigation;
	var navtype = n.type;
	piwikTracker.setCustomVariable (1, 'Total Load Time', totaltime, 'page');
	piwikTracker.setCustomVariable (2, 'Server Processing Time', servertime, 'page');
	piwikTracker.setCustomVariable (3, 'Browser Processing Time', browsertime, 'page');
	piwikTracker.setCustomVariable (4, 'Transmission Time', transmissiontime, 'page');
	piwikTracker.setCustomVariable (5, 'Navigation Type', navtype, 'page');
	piwikTracker.trackPageView();
	piwikTracker.enableLinkTracking();
}
} catch( err ) {}
</script><noscript><p><img src="https://192.168.1.2:8080/piwik.php?idsite=1" style="border:0" alt="" /></p></noscript>
<!-- End Piwik Tracking Code -->
</body>
</html>
