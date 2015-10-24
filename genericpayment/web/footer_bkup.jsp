
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
              <div class="span3 roundbox"><div class="fb-like-box" data-href="https://www.facebook.com/payonlinejharkhand" data-width="240" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false"></div>
                </div><div class="span9 roundbox">
                
                <span class="lb1 bold">Commercial Tax  </span><span class="fc_000" id="footercomtax"></span><br />
                 <span class="lb1 bold">Mines and Geology  </span><span class="fc_000" id="footermines"></span>      <br />
               <span class="lb1 bold">Excise And Prohibition  </span><span class="fc_000" id="footerexcise"></span>
            <span class="lb1 bold">Registration </span><span class="fc_000"  id="footerreg"></span>
            
                <br/>
                <br/>
                 <br/>
               </div>
               <div class="span12 fc_000">
               
               <div class="span6">Copyright@ 2014 Jharkhand Government Incorporated.All rights reserved </div>
               <div class="span6 pullright">Terms of Use&nbsp;|&nbsp;Privacy Policy&nbsp;|&nbsp;Disclaimer&nbsp;|&nbsp;Feedback&nbsp;|&nbsp;Sitemap |&nbsp;FAQs </div>
               </div>
               <div class="span12 fc_000">
              <div class="span6"> Version - 0.59 Release Date - 23-05-2014 </div>
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