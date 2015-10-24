<%-- 
    Document   : termsOfUse
    Created on : Apr 13, 2015, 5:55:15 PM
    Author     : zephaniah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
    <head>
<title>Terms Of Use</title>
<%@ include file="assets/metro/__inc/base_links.jsp"%>
</head>
<body>
<!-- start: Header -->
<%@ include file="assets/metro/__inc/user_header.jsp"%>
<!-- start: Header -->

<div class="container-fluid-full">
  <div class="row-fluid"> 
    
    <!-- start: Main Menu -->
    <%@ include file="assets/metro/__inc/user_main_menu.jsp"%>
    <!-- end: Main Menu --> 
    
    <!-- start: Content -->
    <div id="content" class="span10">
      <div class="row-fluid">
          <p>The PayOnline Collaborative Application Development Platform has been designed, developed and hosted by Department of Electronics and Information Technology, Ministry of Communications & IT, Government of India. By using PayOnline, you agree to be bound by the terms of use of this platform. Violation of any of the terms below will result in the termination of your account. This platform is being provided on an "as is, where is" basis. By using PayOnline, you agree to use it at your own risk.</p> 


          <h3>Description of Service</h3>
          <P>Generic Payonline system is an Web Based  Portal for any kind of Payment to the  Departments of State Government Under Different Budget heads e.g. Tax Payment , Different type of Fees, levies  and Duties, and generate online receipt/ challan.</p>
         
•	It provides a transperent Process of Payment to the Department and Users .
<br>
•	Reduces time consumption in Payment Process, 
<br>
•	Providing Process of Payment to department at the Door Step of the Users.
<br>
•	Easy and safe way of payment.. 
<h3>Using PayOnline.</h3>
<P>Today, people have lots of  work and less of time. Generic Payonline may helps to protect the people valuable time by intrducing online payment system through which people can make their liabilities of various Govt.department. Using this online system of payment people can avoid long queues and mental harasment.Through this system tax payer can pay easily his/her State Govt. liabilities from anywhere of the world.This system will take only few minutes to complete the entire process.</p>

<p>Generic Payonline system is an Web Based  Application/Portal for the tax payer to make their  payment easy of Tax , Fees and Duties.</p>
<h3>The purpose of this system is to provide </h3>
•	Internet Banking Facility. This is 24 X 7 facility to pay Government tax and non-tax payments into the Government Accounts.
<br>
•	Users of this site can remit amounts through e-payment facility of the concern Banks.
<br>
•	Facility for generating and printing challan online.
<br>
•	Facility to pay taxes, non-tax payments to any of the Govt.departments under the State from anywhere.
<br>
•	For frequently access it takes only one time registration.

<h3>Limitation of Liability</h3>
<p>PayOnline does not guarantee that the platform shall meet any specific requirements, or that it will be available uninterrupted, or that it is secure, encrypted and error-free, or that the results obtained using the platform will be accurate or reliable, or that the quality of any products, services, information available on the platform will meet user expectations. </p>
<p>Users expressly understand and agree, that in no event will the Government of India be liable for any expense, loss or damage including, without limitation, indirect or consequential loss or damage, or any expense, loss or damage whatsoever arising from use, or loss of use, of data, arising out of or in connection with the use of PayOnline. </p>
<h3>Right to Modify or Terminate</h3>
<p>PayOnline reserves the right at any time to modify or discontinue, temporarily or permanently, the Service (or any part of it), with or without notice. PayOnline in its sole discretion reserves the right to suspend or terminate any user account and refuse any current or future use of the platform for any reason at any time. Such termination may result in the deactivation or deletion of the account, and the loss of all the content hosted therein. </p>
<h3>Applicable Law</h3>
<p>These terms and conditions shall be governed by and construed in accordance with the Indian Law. Any dispute arising under these terms and conditions shall be subjected to the exclusive jurisdiction of the courts of India.</p>

    </div>
    <!--/.fluid-container--> 
    <!-- end: Content --> 
  </div>
  <!--/#content.span10--> 
</div>
<!--/fluid-row-->
</div>
<div class="clearfix"></div>

<%@ include file="assets/metro/__inc/footer.jsp"%>

<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 

</body>
</html>
