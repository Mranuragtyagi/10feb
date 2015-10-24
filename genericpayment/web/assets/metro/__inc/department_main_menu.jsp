<%String ccp_menu = "http://" + request.getHeader("HOST") + request.getContextPath() + "";%>
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
            <li><a href="<%=ccp_menu%>/adminpayment/departmentReportByPeriod.jsp"><i class="fa fa-home fa-white"></i>&nbsp;Home</a></li>
            <li><a href="<%=ccp_menu%>/adminpayment/verifyPaymentByAdmin.jsp"><i class="fa fa-edit fa-white"></i> Verify Payment</a></li>
        </ul>
    </div>
</div>
<noscript>
<div class="alert alert-block span10">
    <h4 class="alert-heading">Warning!</h4>
    <p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
</div>
</noscript>