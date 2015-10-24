
 <%  
    String ac=java.net.InetAddress.getLocalHost().getHostAddress() ;
    String reponseParts[] = ac.split("\\.");
    String  first = reponseParts[0];
    String  second = reponseParts[1];
    String  third = reponseParts[2];
    String  fourth = reponseParts[3];
        %>
        <div class="span12 roundbox " id="footer">
              <div class="copyright">
               <div class="span12 fc_000">
               <div class="span6">
			  
			   <%=utility.SystemGlobals.getCopyright()!=null?utility.SystemGlobals.getCopyright() : "Not Set"%><!--Copyright@ 2014 Jharkhand Government Incorporated.All rights reserved--></div>
               <div class="span6 pullright"><%=utility.SystemGlobals.getTerms()!=null?utility.SystemGlobals.getTerms() : "Not Set"%><!--Terms of Use&nbsp;|&nbsp;Privacy Policy&nbsp;|&nbsp;Disclaimer&nbsp;|&nbsp;Feedback&nbsp;|&nbsp;Sitemap |&nbsp;FAQs--></div>
               </div>
               <div class="span12 fc_000">
              <div class="span6"><%=utility.SystemGlobals.getVersion()!=null?utility.SystemGlobals.getVersion() : "Not Set"%><!--Version - 0.83 Release Date - 20-Oct-2014--></div>
              <div class="span6 pullright" style="text-align:right;">
              <% if(fourth.equals("82") || fourth=="82"){%>
                     Server : ARUN
                <%}else if(fourth.equals("86") || fourth=="86"){%>
                     Server : VARUN
                <%}else if(fourth.equals("17") || fourth=="17"){%>
                    Server : Local
                <%}else{%>
                    Server : Other
                <%}%>
                </div>
              </div>

            </div>
            <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50085699-1', 'jharkhand.gov.in');
  ga('send', 'pageview');

</script>