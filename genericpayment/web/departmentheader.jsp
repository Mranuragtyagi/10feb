<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
String deptuser=request.getSession().getAttribute("departmentUsername")!=null?(String)request.getSession().getAttribute("departmentUsername") : "";
String deptid=request.getSession().getAttribute("deptid")!=null?(String)request.getSession().getAttribute("deptid") : "";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>E generic Payment</title>
<link rel="stylesheet" href="<%=ccp%>/Bootstrap2.2/css/bootstrap.css" />
<link rel="stylesheet" href="<%=ccp%>/Bootstrap2.2/css/bootstrap-responsive.css" />
 <link rel="stylesheet" href="<%=ccp%>/Bootstrap2.2/css/sticky.css" />  
       <script type="text/javascript" src="<%=ccp%>/jquery/jquery1.8.3.js"></script>
        <script type="text/javascript" src="<%=ccp%>/jquery/jquery.validate.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/Bootstrap2.2/js/bootstrap.js"></script>
        <!--script type="text/javascript" src="<%=ccp%>/Bootstrap2.2/js/bootstrap.min.js"></script-->
        
        <script>
var message="Right Click Disabled!";
   function clickIE4(){
       if (event.button==2){
       alert(message);
       return false;
       }
   }
function clickNS4(e){
   if (document.layers||document.getElementById&&!document.all){
       if (e.which==2||e.which==3){
           alert(message);
           return false;
       }
   }
}
if (document.layers){
document.captureEvents(Event.MOUSEDOWN);
document.onmousedown=clickNS4;
} else if (document.all&&!document.getElementById){
document.onmousedown=clickIE4;
}
document.oncontextmenu=new Function("alert(message);return false")
</script>
 
</head>
<body>
<div class="container">
 <div class="content">
  <div class="wrapper">
   <div class="row">
     <div class="span12">
      <div class="row-fluid">
       <div class="well" style="min-width:280px; min-height:630px;  margin-bottom:0px;">
         <div class="row-fluid">
            <div class="span6">
               <div class="leftheader"> </div>
            </div>
                <div class="span6">
                  <div class="rightheader">onlinepayment.gov.in  </div>
                </div>
        </div>
     <!--span12 div closed-->
     
<div class="span12" style="margin-bottom:-8px;">
  <div id="navbarid">
     <div class="navbar">
       <div class="navbar-inner" >
          <ul class="nav">
             <li ><a href="<%=ccp%>/regDepartmentHome.jsp"><i class="icon-home icon-white"></i>&nbsp;Home</a></li>
             <li class="dropdown " >
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">&nbsp;<i class="icon-user icon-white"></i>&nbsp;Accounts<b class="caret"></b></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
                       <li><a href="<%=ccp%>/adminpayment/changeDepartmentPassword.jsp"><i class="icon-random"></i>&nbsp; Change Password</a></li>
                        <li class="divider"></li>
                         <li><a href="<%=ccp%>/adminpayment/verifyPaymentByAdmin.jsp"><i class="icon-edit"></i>&nbsp; Verify Payment</a></li>
                        <!--li class="divider"></li>
                        <li><a href="<%=ccp%>/adminpayment/transactionView.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-camera icon-white"></i>&nbsp;Transaction view</a></li-->
                         <li class="divider"> </li>
                        <li><a href="<%=ccp%>/adminpayment/departmentReportByPeriod.jsp">&nbsp;<i class="icon-list"></i>&nbsp;Report</a></li>
                         <li class="divider"></li>
                        <li><a href="<%=ccp%>/GenericLogin?step=logout" data-toggle="modal" rel="tooltip" data-placement="bottom" ><i class="icon-off "></i>&nbsp;Log Out</a></li>
                    </ul>
            </li>
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