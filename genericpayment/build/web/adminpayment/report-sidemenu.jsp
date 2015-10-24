<%  
    String ccp2="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
%>
<div class="span3" id="sidebar">
   <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
       
                <li class="bg"> <a href="<%=ccp2%>/GenericAdminServlet?step=14&reportType=DD">Department Details</a> </li>
                <li class="bg"> <a href="<%=ccp2%>/GenericAdminServlet?step=14&reportType=DWPD">Date Wise Payment Details </a> </li>
                <li class="bg"> <a href="<%=ccp2%>/GenericAdminServlet?step=14&reportType=CD" >Challan Details</a>  </li>
                <li class="bg" > <a href="<%=ccp2%>/GenericAdminServlet?step=14&reportType=PTRI">Payment Through Registered and Instant</a></li>
            </ul>
       
</div>
<!-- <div class="span3"> closed -->

