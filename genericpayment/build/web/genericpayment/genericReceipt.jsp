<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%--errorPage="../error.jsp"--%>
<%@page import="java.sql.*,java.text.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%

  DecimalFormat df=new DecimalFormat("##################0.00");
 SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy");
  PreparedStatement ps=null; PreparedStatement pss=null;    ResultSet rs=null; ResultSet rss=null; String status="" ; 
  String sql="" ; String Challanstatus="" ;
 // vicclass.User user=request.getSession().getAttribute("user")!=null ? (vicclass.User)request.getSession().getAttribute("user") : null;
  vicclass.User user=new vicclass.User();
  user.createConnection();
  Connection conn=user.getConnection();
  String msg="";
  RequestDispatcher rd=null;
  String challan=StringEscapeUtils.escapeHtml(request.getParameter("er"));
  System.out.println(challan);
  String sq="";
  //String sql="select * from echallan_trans where CHALLAN_NO='"+id+"' " ;
 // String challan="0805201411372675" ;
  String sq1="select  ifnull(REGISTERED,'N') as REGISTERED ,CHALLAN_STATUS from generic_epayment where challan_no=? and status is null and cin is null";
   pss=conn.prepareStatement(sq1);
  pss.setString(1,challan);
  rss=pss.executeQuery();
  if(rss.next()){
   if(rd==null)
   {
     rd = request.getRequestDispatcher("searchMsg.jsp");
     rd.forward(request, response);
   }
  }
 
  sq="select  ifnull(REGISTERED,'N') as REGISTERED ,CHALLAN_STATUS from generic_epayment where challan_no=? and status='0300' and cin is not null";
 pss=conn.prepareStatement(sq);
  pss.setString(1,challan);
  rss=pss.executeQuery();
  if(rss.next()){
   status=rss.getString("REGISTERED") ;
   Challanstatus=rss.getString("CHALLAN_STATUS") ;
  }
  else{
  msg="Please Fill The Correct Challan Number";
  if(rd==null)
  {
       rd = request.getRequestDispatcher("/landing.jsp?msg1=" + msg);
       rd.forward(request, response);
  }
  }
        if(status.equalsIgnoreCase("Y")){
          sql="select gp.VERIFY_DATE,gp.SUBTAX,gp.IDENTITY,gp.IDENTITY_NO,gp.CIN,gup.DLRNAME,gup.ADDRESS,gup.MOBILE,gup.CITY,gup.STATE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID join  generic_user_profile gup on gp.email=gup.email  where gp.challan_no=? and gp.status='0300' and gp.cin is not null " ;
      }
      else{
         sql="select gp.VERIFY_DATE,gp.SUBTAX,gp.IDENTITY,gp.IDENTITY_NO,gp.CIN,gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.MOBILE,gp.EMAIL,gp.CHALLAN_NO,gp.AMOUNT,gp.DEPARTMENT,cd.DEPT_NAME,gp.PERIOD_FROM,gp.PERIOD_TO,gp.PAYMENT_DATE,gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID where gp.challan_no=? and gp.status='0300' and gp.cin is not null";
      }
   ps=conn.prepareStatement(sql);
   ps.setString(1,challan);
   rs=ps.executeQuery();
  if(rs.next()){
    String addr=rs.getString("Address")+", "+rs.getString("City")+", "+rs.getString("State");
  %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
<title>genericReceipt</title>
<%@ include file="../assets/metro/__inc/base_links_payment_page.jsp"%>
</head>
<body>
<%@ include file="../assets/metro/__inc/user_header.jsp"%>
<!-- start: Header -->
<div class="container-fluid-full">
  <div class="row-fluid">
    <!-- start: Main Menu -->
    <%@ include file="../assets/metro/__inc/user_main_menu.jsp"%>
    <!-- end: Main Menu -->
    <!-- start: Content -->
    <div id="content" class="span10">
      <div class="row-fluid sortable">
        <div class="box span12">
          <div class="box-content">
            <div class="span11" id="printdiv" >
              <div class="row-fluid spanborder" id="rowfluid">
                <!--<div class="span12" style="background-color:rgb(255,99,7);margin-top:-1%;color:#FFF;padding-top:5px; padding-left:5px;"><div class="font16">&nbsp;&nbsp;&nbsp;Department of <span id="department_data"><%=rs.getString("DEPT_NAME")!=null?rs.getString("DEPT_NAME") : ""%></span></div></div>-->
                <div class="span12 logo"  id="logo" style="display:none;">
                  <div class="row-fluid">
                    <div class="span6">
                      <div style="margin-left:5px;">
                        <div class="leftheader"></div>
                      </div>
                    </div>
                    <div class="span6">
                      <div style="float:right; margin-right:5px;">
                        <!--<img src="<%=ccp%>/assets/metro/img/printrightheader.png" width="160" height="50" />-->
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row-fluid">
                  <div class="span5 font14"> &nbsp;&nbsp;&nbsp;Department : <span id="department_data" class="fc_000"><%=rs.getString("DEPT_NAME")!=null?rs.getString("DEPT_NAME") : ""%></span><br/>
                    &nbsp;&nbsp;&nbsp;Tax Type/Purpose : <span id="purpose_data"><%=rs.getString("PURPOSE")!=null?rs.getString("PURPOSE"):""%></span><br/>
                    &nbsp;&nbsp;&nbsp;Sub Tax Type : <span id="subtax_data"><%=rs.getString("SUBTAX")!=null?rs.getString("SUBTAX") : ""%></span> </div>
                  <div class="span5 font14" style="padding-right:10px; float:right; text-align:right;"><span class="font16 ">Date : </span><span id="date_data"><%=rs.getDate("PAYMENT_DATE")!=null?sdf.format(rs.getDate("PAYMENT_DATE")):""%></span><br/>
                    <div>CIN :<span id="challan_data"><%=rs.getString("CIN")!=null?rs.getString("CIN"):""%></span></div>
                    <div>Challan No :<span id="challan_data"><%=rs.getString("CHALLAN_NO")!=null?rs.getString("CHALLAN_NO"):""%></span></div>
                  </div>
                </div>
                <div class="span12" style="margin:0px; margin-right:40px; margin-top:30px;">
                  <table class="table tableformrec table-striped">
                    <tr>
                      <td><span class="font16">Payment Detail</span><br />
                        <br /></td>
                      <td><span class="font16">Amount</span><br />
                        <br /></td>
                    </tr>
                    <tr>
                      <td height="60px" id="tdprint"><br />
                        <div class="font14"><%=rs.getString("PURPOSE")!=null?rs.getString("PURPOSE"):""%> Payable For Period <span id="quarter_month_data" style="color:#666; font-weight:bold;"><%=rs.getDate("PERIOD_FROM")!=null?sdf.format(rs.getDate("PERIOD_FROM")): "NA"%></span> To <span id="period_data" style="color:#666; font-weight:bold;"><%=rs.getDate("PERIOD_TO")!=null?sdf.format(rs.getDate("PERIOD_TO")): "NA"%></span><br/>
                          <br/>
                          <hr>
                        </div>
                        <div>
                          <%if(Challanstatus.equals("1")){%>
                          <span style="float:right; margin-right: 14%; font-size:14px; color: #600; font-weight:bold;"><img src="<%=ccp%>/assets/metro/img/paid_stamp_small1.png" alt="PAID"><br/>
                          <br/>
                          Verified and Used By Department</br>
                          on <%=rs.getDate("VERIFY_DATE")!=null?sdf.format(rs.getDate("VERIFY_DATE")):""%></span>
                          <%}else{%>
                          <span style="float:right; margin-right: 14%; font-size:14px; color: #600; font-weight:bold;"><img src="<%=ccp%>/assets/metro/img/paid_stamp_small1.png" alt="PAID"></span>
                          <%}%>
                          <span id="name_data" class="bold color_000"><%=rs.getString("DLRNAME")!=null?rs.getString("DLRNAME"): ""%></span><br/>
                          Id Proof: <span id="idproof_data"> <%=rs.getString("IDENTITY")!=null?rs.getString("IDENTITY") : ""%></span><br/>
                          Id Value: <span id="idvalue_data"> <%=rs.getString("IDENTITY_NO")!=null?rs.getString("IDENTITY_NO") : ""%></span><br/>
                          <span id="addr_data"><%=addr!=null?addr : ""%></span><br/>
                          Mobile: <span id="mobile_data"> <%=rs.getString("MOBILE")!=null?rs.getString("MOBILE") : ""%></span><br/>
                          Email : <span id="email_data"><%=rs.getString("EMAIL")!=null?rs.getString("EMAIL") : ""%></span> <br/>
                        </div>
                        <div id="qrcode" style="width:100px; height:100px; margin-top:15px;"></div></td>
                      <td colspan="2" id="tdprint3"><br />
                        <span id="amount_data1" class="bold font14">Rs. <%=rs.getDouble("AMOUNT")!=0.0?df.format(rs.getDouble("AMOUNT")):"0.0" %></span></td>
                    </tr>
                    <tr>
                      <td align="right" id="tdprint1">Payable Amount</td>
                      <td id="tdprint2" style="font-weight:bolder;">Rs. <span id="amount_data2" class="font16"><%=rs.getDouble("AMOUNT")!=0.0?df.format(rs.getDouble("AMOUNT")):"0.0" %></span></td>
                    </tr>
                    <!--tr><td class="lb1">Remarks</td><td id="remarks_data"></td><td class="lb1">Description</td><td id="desc_data"></td></tr-->
                  </table>
                  <!--table class="tableform table-striped table-hover" width="90%" style="margin-left:10px;">
        <tr><td class="lb1">Department </td><td id="department_data"></td><td class="lb1">Amount</td><td id="amount_data"></td></tr>
        <tr><td class="lb1">Tax Type/Purpose </td><td id="purpose_data"></td><td class="lb1">Type of Period</td><td>Annual</td></tr>
        <tr><td class="lb1">Period</td><td id="period_data"></td><td class="lb1" id="quarter_month"></td><td id="quarter_month_data"></td></tr>
        <tr><td class="lb1">Remarks</td><td id="remarks_data"></td><td class="lb1">Description</td><td id="desc_data"></td></tr>
        </table-->
                </div>
                <div class="span8">
                    <%if(Challanstatus.equals("0")){%>
                    <div>
                      <label style="float:left; font-family:cambria; color:red;">* Neither Verified nor Used by Department</label>
                    </div>
                    <%}%>
                  </div>
                <div class="span3" id="butondiv">
                  
                    <div align="center" id="verifybutton">
                      <button type="button" class="btn  btn-info" value="Back" onClick="myFunction('printdiv');" > &nbsp;&nbsp;Print&nbsp;&nbsp; </button>
                    </div>
                  </div>
                </div>
             
            </div>
            <div class="span11">
              <form name="" action="" method="POST">
                <%}rs.close();
            ps.close();
            rss.close();
            pss.close();
            conn.close();
         %>
              </form>
            </div>
          </div>
        </div>
        <!--/span-->
      </div>
    </div>
    <!--/.fluid-container-->
    <!-- end: Content -->
  </div>
  <!--/#content.span10-->
</div>
<!--/fluid-row-->
<div class="clearfix"></div>
<%@ include file="../assets/metro/__inc/footer.jsp"%>
<!-- start: JavaScript-->
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
<script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/qrcode.min.js"></script>
<script type="text/javascript">




$( document ).ready(function() {
var qrcode = new QRCode(document.getElementById("qrcode"), {
	width : 100,
	height : 100
});


var msg="http://payonline.jharkhand.gov.in/genericpayment/genericReceipt.jsp?er="+document.getElementById("challan_data").innerHTML;
    qrcode.makeCode(msg);
  });
 </script>
<script type="text/javascript">   
function myFunction(printdiv1)
{
          /* document.getElementById("rowfluid").style="border:1px solid #000";
            document.getElementById("tdprint").style="border-bottom:1px solid #000";
              document.getElementById("tdprint3").style="border-bottom:1px solid #000";
               document.getElementById("tdprint2").style="border-top:1px solid #000";*/
             document.getElementById("butondiv").style.display="none";
             document.getElementById("logo").style.display="block";
             var printContents = document.getElementById(printdiv1).innerHTML;
             var originalContents = document.body.innerHTML;
             document.body.innerHTML = printContents;
			 document.body.style.width="800px";
             window.print();
             document.body.innerHTML = originalContents;
             document.getElementById("butondiv").style.display="";
             document.getElementById("logo").style.display="none";
             document.body.style.width="100%";
     }
  </script>
</body>
</html>
