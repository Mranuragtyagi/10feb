<%String ccp_menu = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
   
<script type="text/javascript">
            function getvalidate()
            {
                    var dept=document.frmsearch.tsearch.value;
                    var nameEx2=/^[0-9]+$/;
                    if(!dept.match(nameEx2)){
                        alert("Please fill only Numeric values");
                        document.frmsearch.step.focus();
                        return false;
                    }else{
                            frmsearch.submit();
                    }
            }
</script>
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">

            <div class="sidebar-widget">
                 <form id="custom-search-form" name="frmsearch" class="form-search form-horizontal span12" action="<%=ccp_menu%>/GenericServlet" method="post">
  <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
 <input type="hidden" name="step" id="step" value="searchbox">
 <div class="input-append span11">
     <input type="text" class="search-query span12 search-box" style="position:unset;" placeholder="Enter Challan No." name="tsearch" size="10px">
<button type="button" class="btn search-box-btn" onclick="getvalidate();"><i class="fa fa-search"></i></button>
</div>
        </form>
                     <div style="clear:both;"></div>
            </div>
            <%if (request.getSession().getAttribute("userloggedin") != null) {%>
            <li><a href="<%=ccp_menu%>/genericpayment/userContent.jsp"><i class="fa fa-home"></i> Home</a></li>
            <li><a href="<%=ccp_menu%>/Dashboard.jsp"> <i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="<%=ccp_menu%>/genericpayment/registeredtaxpayee.jsp"><i class="fa fa-cc-visa"></i> Pay Tax</a></li>
            <li><a href="<%=ccp_menu%>/GenericServlet"><i class="fa fa-tasks"></i> History</a></li>
                <%} else {%>
            <li><a href="<%=ccp_menu%>/GenericLogin"><i class="fa fa-home font18 lb1"></i> Home</a></li>
            <li><a href="<%=ccp_menu%>/genericpayment/unregisteredUserDetail.jsp"><i class="fa  fa-credit-card"></i> Instant Pay</a></li>
            <li><a href="<%=ccp_menu%>/Dashboard.jsp" rel="tooltip" data-placement="bottom" data-original-title=""><i class="fa fa-dashboard"></i>Dashboard</a></li>
                <%}%>
        </ul>
    </div>

</div>
<noscript>
<div class="alert alert-block span10">
    <h4 class="alert-heading">Warning!</h4>
    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
</div>
</noscript>
