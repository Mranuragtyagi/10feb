<%@ page import="genericepayment.*" errorPage="/error.jsp" %>
<%String ccp_adminheader="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
GenericBean gbh=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
String dlrnameh=gbh.getDlrname()!=null?gbh.getDlrname(): "";
%>
<div class="row-fluid">
                  <div class="span8">
                    <div class="leftheader"><!--<a href="#"><h2>Pay<span>Online</span></h2><h5>Government of Jharkhand</h5></a>--></div>
                  </div>
                  <div class="span4">
                      <form id="custom-search-form" class="form-search form-horizontal pull-right" action="<%=ccp_adminheader%>/GenericServlet" method="post">
                        <input type="hidden" name="step" id="step" value="10">
                        <input type="hidden" name="email" id="email" value="">
                        <div class="input-append">
                          <input type="text" class="search-query" name="challan" id="challan" placeholder="Enter Receipt No">
                          <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                        </div>
                      </form>
                  </div>
                </div>
<div class="span12" style="margin-bottom:-8px;">
  <div id="navbarid">
     <div class="navbar">
       <div class="navbar-inner">
          <ul class="nav">
             <li><a href="<%=ccp_adminheader%>/adminpayment/adminContent.jsp"><i class="icon-home icon-white"></i>&nbsp;Home</a></li>
            <li class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">&nbsp;<i class="icon-th icon-white"></i>&nbsp;Department <b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                    <li><a href="<%=ccp_adminheader%>/adminpayment/addtax.jsp"><i class="icon-plus-sign "></i>&nbsp; Add Tax</a></li>
                    <li><a href="<%=ccp_adminheader%>/adminpayment/modifyTax.jsp"><i class=" icon-wrench "></i>&nbsp; Modify Tax</a></li>
                    <li><a href="<%=ccp_adminheader%>/adminpayment/listTaxPurposes.jsp"><i class="icon-list"></i>&nbsp;List of Taxes</a></li>
                    <li><a href="<%=ccp_adminheader%>/adminpayment/adddepartment.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-plus-sign "></i>&nbsp;Add Department</a></li>
                    <li><a href="<%=ccp_adminheader%>/adminpayment/modifyAdminDepartment.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-wrench"></i>&nbsp;Modify Department</a></li>
                    <li><a href="<%=ccp_adminheader%>/adminpayment/unlockDept.jsp"><i class="icon-list"></i>&nbsp;Unlock Department</a></li>
                    <li><a href="<%=ccp_adminheader%>/adminpayment/listDept.jsp"><i class="icon-list"></i>&nbsp;List of Department</a></li>
                </ul>
            </li>
             <li><a href="<%=ccp_adminheader%>/adminpayment/masterReport.jsp"><i class="icon-th icon-white"></i>&nbsp;Reports</a></li>
            <li class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">&nbsp;<i class="icon-user icon-white"></i>&nbsp;User Management<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                        <li><a href="<%=ccp_adminheader%>/GenericAdServlet?step=1" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-plus-sign"></i>&nbsp;&nbsp;Add User</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=ccp_adminheader%>/adminpayment/askAdminUserName.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-wrench"></i>&nbsp;&nbsp;Modify User</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=ccp_adminheader%>/adminpayment/changeAdminPassword.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-wrench"></i>&nbsp;&nbsp;Change Password</a></li>
                    </ul>
            </li>
            
            <li><a href="<%=ccp_adminheader%>/adminpayment/uploadSettleTxt.jsp"><i class="icon-th icon-white"></i>&nbsp;Payment Settlement</a></li>
            <li><a href="<%=ccp_adminheader%>/adminpayment/settleList.jsp"><i class="icon-th icon-white"></i>&nbsp;Settlement List</a></li>
            
        <li><a href="<%=ccp_adminheader%>/GenericLogin?step=logout" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-off icon-white"></i>&nbsp;Log Out</a></li>
          </ul>
       </div>
     </div>
   </div> <!-- navbarid closed -->
</div>