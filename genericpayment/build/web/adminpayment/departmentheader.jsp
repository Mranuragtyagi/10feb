<%String ccpdh="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
String deptuser=request.getSession().getAttribute("departmentUsername")!=null?(String)request.getSession().getAttribute("departmentUsername") : "";
%>
  <div class="span12">
                <div class="row-fluid">
                  <div class="span4">
                  
                    <div class="leftheader"><!--<a href="#"><h2>Pay<span>Online</span></h2></a><h5>Government of Jharkhand</h5>--></div>
                    
                  </div>
                  <!--<div class="span3 pull-right cust-span3">
   <form id="custom-search-form" class="form-search form-horizontal span12" action="/genericpayment/genericReceipt.jsp" method="get">
                        <input type="hidden" name="step" id="step" value="10">
                        <input type="hidden" name="email" id="email" value="">
                        <div class="input-append span12">
                          <input type="text" class="search-query span12" name="er" id="challan" placeholder="Enter Receipt No">
                          <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                        </div>
                      </form>
            
                  </div>-->
                </div>
              </div>

<div class="span12" id="navbarid">
        <div class="navbar">
           <div class="navbar-inner">
       <div class="container-fluid">
          <ul class="nav">
             <li><a href="<%=ccpdh%>/adminpayment/departmentReportByPeriod.jsp"><i class="icon-home"></i>&nbsp;Home</a></li>
             <li class="dropdown " >
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">&nbsp;<i class="icon-user"></i>&nbsp;Accounts<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                       <li><a href="<%=ccpdh%>/adminpayment/changeDepartmentPassword.jsp"><i class="icon-random"></i> Change Password</a></li>
                        <li class="divider"></li>
                         <li><a href="<%=ccpdh%>/adminpayment/verifyPaymentByAdmin.jsp"><i class="icon-edit"></i> Verify Payment</a></li>
                        
                         <li class="divider"> </li>
                        <li><a href="<%=ccpdh%>/adminpayment/departmentReportByPeriod.jsp"><i class="icon-list"></i> Report</a></li>
                         <li class="divider"></li>
                        <li><a href="<%=ccpdh%>/GenericLogin?step=logout" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-off "></i> Log Out</a></li>
                    </ul>
            </li>
          </ul>
       </div>
     </div>
   </div> <!-- navbarid closed -->
</div><!-- span12 closed -->
   