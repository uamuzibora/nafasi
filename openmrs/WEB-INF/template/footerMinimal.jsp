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
