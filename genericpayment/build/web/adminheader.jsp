<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<head>
 <%@ include file="head_tag.jsp"%> 
<title>E generic Payment</title>
        <script type="text/javascript" src="<%=ccp%>/jquery/jquery.validate.min.js"></script>

</head>
<body>
<div class="container">
 <div class="content">
  <div class="wrapper">
   <div class="row">
     <div class="span12">
      <div class="row-fluid">
       <div class="well" style="min-width:280px; min-height:620px;  margin-bottom:0px;">
         <div class="row-fluid">
                  <div class="span8">
                    <div class="leftheader"><!--<a href="#"><h2>Pay<span>Online</span></h2><h5>Government of Jharkhand</h5></a>--></div>
                  </div>
                  <div class="span4">
                      <form id="custom-search-form" class="form-search form-horizontal pull-right" action="<%=ccp%>/GenericServlet" method="post">
                        <input type="hidden" name="step" id="step" value="10">
                        <input type="hidden" name="email" id="email" value="">
                        <div class="input-append ">
                          <input type="text" class="search-query" name="challan" id="challan" placeholder="Enter Receipt No">
                          <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                        </div>
                      </form>
                   
                  </div>
                </div>
     <!--span12 div closed-->
     
<div class="span12">
  <div id="navbarid">
     <div class="navbar">
       <div class="navbar-inner" >
          <ul class="nav">
             <li><a href="<%=ccp%>/adminpayment/adminContent.jsp"><i class="icon-home icon-white"></i>&nbsp;Home</a></li>
            <li class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">&nbsp;<i class="icon-th icon-white"></i>&nbsp;Department <b class="caret"></b></a>
                <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                    <li><a href="<%=ccp%>/adminpayment/billdeskSetting.jsp"><i class=" icon-wrench "></i>&nbsp;Billdesk Settings</a></li>
                    <li><a href="<%=ccp%>/adminpayment/editBilldeskSettings.jsp"><i class=" icon-wrench "></i>&nbsp;Modify Billdesk Settings</a></li>
                  
                    <li><a href="<%=ccp%>/adminpayment/addMajorTax.jsp"><i class="icon-plus-sign"></i>&nbsp;Add Major Tax</a></li>
                    <li><a href="<%=ccp%>/adminpayment/modifyMajorTax.jsp"><i class=" icon-wrench "></i>&nbsp; Modify Major Tax</a></li>
                    <li><a href="<%=ccp%>/adminpayment/unlockMajorTax.jsp"><i class=" icon-wrench "></i>&nbsp; Unlock Major Tax</a></li>
                  
                    <li><a href="<%=ccp%>/adminpayment/addtax.jsp"><i class="icon-plus-sign "></i>&nbsp; Add Tax</a></li>
                    <li><a href="<%=ccp%>/adminpayment/modifyTax.jsp"><i class=" icon-wrench "></i>&nbsp; Modify Tax</a></li>
                    <li><a href="<%=ccp%>/adminpayment/unlockTax.jsp"><i class=" icon-wrench "></i>&nbsp; Unlock Tax</a></li>
                     <li><a href="<%=ccp%>/adminpayment/addIdProof.jsp"><i class="icon-plus-sign "></i>&nbsp; Add Id Proof</a></li>
                     <li><a href="<%=ccp%>/adminpayment/modifyIdProof.jsp"><i class=" icon-wrench "></i>&nbsp; Modify Id Proof</a></li>
                     <li><a href="<%=ccp%>/adminpayment/unlockIdProof.jsp"><i class=" icon-wrench "></i>&nbsp; Unlock Id Proof</a></li>
                    <li><a href="<%=ccp%>/adminpayment/listTaxPurposes.jsp"><i class="icon-list"></i>&nbsp;List of Taxes</a></li>
                    <li><a href="<%=ccp%>/adminpayment/adddepartment.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-plus-sign "></i>&nbsp;Add Department</a></li>
                    <li><a href="<%=ccp%>/adminpayment/modifyAdminDepartment.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-wrench"></i>&nbsp;Modify Department</a></li>
                    <li><a href="<%=ccp%>/adminpayment/unlockDept.jsp"><i class="icon-list"></i>&nbsp;Unlock Department</a></li>
                    <li><a href="<%=ccp%>/adminpayment/listDept.jsp"><i class="icon-list"></i>&nbsp;List of Department</a></li>
                    <li><a href="<%=ccp%>/genericsettings"><i class=" icon-wrench "></i>&nbsp;Settings</a></li>
                    
                </ul>
            </li>
             <li><a href="<%=ccp%>/adminpayment/masterReport.jsp"><i class="icon-th icon-white"></i>&nbsp;Reports</a></li>
            <li class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">&nbsp;<i class="icon-user icon-white"></i>&nbsp;User Management<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                        <li><a href="<%=ccp%>/GenericAdServlet?step=1" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-plus-sign"></i>&nbsp;&nbsp;Add User</a></li>
                        <%--<li><a href="<%=ccp%>/adminpayment/addAdminUser.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-plus-sign"></i>&nbsp;&nbsp;Add User</a></li>--%>
                        <li class="divider"></li>
                        <li><a href="<%=ccp%>/adminpayment/askAdminUserName.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-wrench"></i>&nbsp;&nbsp;Modify User</a></li>
                        <li class="divider"></li>
                        <li><a href="<%=ccp%>/adminpayment/changeAdminPassword.jsp" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-wrench"></i>&nbsp;&nbsp;Change Password</a></li>
                    </ul>
            </li>
             <li><a href="<%=ccp%>/adminpayment/uploadSettleTxt.jsp"><i class="icon-th icon-white"></i>&nbsp;Payment Settlement</a></li>
            <li><a href="<%=ccp%>/adminpayment/settleList.jsp"><i class="icon-th icon-white"></i>&nbsp;Settlement List</a></li>
            <li><a href="<%=ccp%>/adminpayment/comtaxXml.jsp"><i class="icon-th icon-white"></i>&nbsp;Comtax Xml</a></li>
            
        <li><a href="<%=ccp%>/GenericLogin?step=logout" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-off icon-white"></i>&nbsp;Log Out</a></li>
          </ul>
       </div>
     </div>
   </div> <!-- navbarid closed -->
</div><!-- span12 closed -->
                                         
 <div class="span12" style="margin-top:15px; padding-bottom:10px;">
  <div class="row-fluid">
   <div class="span12" style="min-height:230px;">
    <div class="span2">
    </div>
     <div class="span10"> 