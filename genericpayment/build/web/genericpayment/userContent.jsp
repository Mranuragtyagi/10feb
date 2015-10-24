<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="genericepayment.*"  %>
<%@page import="java.util.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%if (request.getSession().getAttribute("userloggedin")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
String mssg=StringEscapeUtils.escapeHtml(request.getParameter("mssg")!=null?request.getParameter("mssg"):"") ;
GenericBean gb=request.getSession().getAttribute("signupbean")!=null? (GenericBean)request.getSession().getAttribute("signupbean"): new GenericBean() ;
String dlrname=gb.getDlrname()!=null?gb.getDlrname(): "";
String email=request.getSession().getAttribute("email")!=null?(String)request.getSession().getAttribute("email") : "";
%>

<html lang="en">
<head>
     <title>Home | PayOnline</title>
     <%@ include file="../assets/metro/__inc/base_links_payment_page.jsp"%>
     <link id="base-style-responsive" href="../assets/metro/css/cmxform.css" rel="stylesheet">
 </head>
 <body>
		<!-- start: Header -->
    <%@ include file="../assets/metro/__inc/user_header.jsp"%>
		<!-- start: Header -->
        <div class="container-fluid-full">
            <div class="row-fluid">
			<!-- start: Main Menu -->
                <%@ include file="../assets/metro/__inc/user_main_menu.jsp"%>
			<!-- end: Main Menu -->
			
			<!-- start: Content -->
                    <div id="content" class="span10">
			<ul class="breadcrumb">
                            <li>
                                <i class="icon-home"></i>
                                <a href="<%=ccp%>/genericpayment/userContent.jsp">Home</a>
                                <i class="icon-angle-right"></i> 
                            </li>
			</ul>
			<div class="row-fluid sortable">
                            <div class="well" style="min-height:600px;  margin-bottom:0px;">
    <%//@ include file="header.jsp"%> 
       <!--apn12 div closed-->
     
<!-- span12 closed -->            
                                <div class="span12">
                                    <div class="row-fluid less-left-margin">
                                        <div class="span3">
                                            <div id="RegisterName" style="padding:5px;"> Welcome <%=dlrname%></div>
                                            <div id="listofbank" style="margin-top:2%">
                                                <p  style="font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;" > Other Payment sites</p>
                                                    <p id="los"> 
                                                    <a target="_blank" href="http://jharkhandcomtax.gov.in/commercialtax/" > Department of Commercial Tax</a> <br/>
                                                    <a target="_blank" href="http://www.jharkhand.gov.in/new_depts/trans/trans_fr.html" color:#464646;>Department of Transport</a> <br/>
                                                    <a target="_blank" href="http://www.jharkhand.gov.in/new_depts/regns/regns_fr.html" color:#464646;>Department of Registration</a> <br/> </p>
                                            </div>
                                        </div>
                                        <div class="span9">
                                            <fieldset>
                                                <legend style="font:Arial, Helvetica, sans-serif; font-size:17px; font-weight:bold; color:#ffa200;">Pay Your Taxes Through</legend>
                                                <div class="span12">
                                                    <div class="row-fluid">
                                                        <div class="span6">
                                                            <div id="netbankings">NET BANKING </div>
                                                            <div id="subnetbankings">Quick, Easy And Always Available</div>
                                                        </div>
                                                        <div class="span6">
                                                            <div id="cardpayments">CARD PAYMENT </div>
                                                            <div id="subcardpayments">Quick, Easy And Always Available</div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </fieldset> <br/>
                                            <div id="thumbnail" style=" word-wrap: break-word;">
                                                <ul class="thumbnails">
                                                    <li class="span6">
                                                        <div class="thumbnail">
                                                            <div id="Lcanvas" style="height:100%; width:100%;">
                                                                <div id="faq" style="pointer-events:none; padding-left:20px;">
                                                                    <p> Features:-</p>
                                                                    <label> <span>*</span> Easy, convenient & fast. </label>
                                                                    <label><span>*</span> Facility is available 24 X 7. </label>
                                                                    <label><span>*</span> No more queues and waiting. </label>
                                                                    <label><span>*</span> Instant online receipts for payment made. </label>
                                                                    <label><span>*</span> Revenue will come earlier in to the Government <br/>treasury as compared to old system. </label>
                                                                </div>
                                                            </div> <!-- div id Lcanvas closed -->
                                                        </div><!-- div id thumbnails closed -->
                                                    </li>
                                                    <li class="span6">
                                                        <div class="thumbnail">
                                                          <div id="PPcanvas"  style="height:100%;  width:100%;">
                                                            <div id="faq" style="pointer-events:none; padding-left:20px;">
                                                                <p> Can we help you?</p>
                                                                <label>Contact us to get quick answers to your questions. Our friendly representatives are happy to work with you and look forward to hearing from you.</label>
                                                                <label> Live Support call :- 7776543210 </label>
                                                                <label> Helpdesk Number :- 7776543210 </label>
                                                                <label>Mail-Id :- genericpayment@gmail.com </label>
                                                                <label></label>
                                                            </div>
                                                          </div><!-- div id PPcanvas closed --> 
                                                        </div><!-- div id thumbnails closed -->
                                                    </li>
                                                </ul>
                                            </div> <!--thumbnail div closed-->
                                        </div><!--span9 div closed-->
                                    </div><!--row fluid div closed--> 
                                </div><!--span12 closed-->
                            </div><!--well div closed-->
			</div><!--row fluid div closed-->
                    </div><!--/span10-->
			<!-- end: Content -->
		</div><!--row fluid-->
            </div><!--/container-->
	<div class="clearfix"></div>
	<%@ include file="../assets/metro/__inc/footer.jsp"%>
	<!-- start: JavaScript-->
        <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
        <!-- end: JavaScript-->
        <%}%>
    </body>
</html>