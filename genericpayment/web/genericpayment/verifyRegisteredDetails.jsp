<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="genericepayment.*"  %>
<%@ page import="java.text.*" %>
<%@ include file="../portalheader.jsp"%>
<% 
java.text.DecimalFormat df=new java.text.DecimalFormat("################.00");
//GenericBean genericbean=(GenericBean)request.getSession().getAttribute("genericbean");
GenericBean genericbean=(GenericBean)request.getAttribute("genericbean");
SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>verifydetails</title>
    <script type="text/javascript">
    function a(){
        frm.operation.value="Back" ;
        frm.submit();
    }function b(){
        frm.operation.value="Verify" ;
        frm.submit();
    }

</script>
<style>
th{
		text-align:right;}
</style>
  </head>
  <body onunload="javascript:window.history.forward();">
  
   <div class="span12">
   <div class="Buy-cont-wrap1" style="margin-left: 17%; margin-bottom:2%;">
				    <div class="tabs-outer1" >
					<!--div class="tabs-cont customer-info-tab tab-active" id="step1">
                                      
						<div class="tabs-order"></div>
						<div align="center">User Details</div>
					</div-->
						<div class="tabs-cont delivery-modes-tab tab-active" id="step2">
							<div class="tabs-payment"></div>
							<div align="center"> Tax Info</div>
						</div>
					<div class="tabs-cont order-summary-tab tab-active" id="step3"
						style="">
						<div class="tabs-confirm"></div>
						<div align="center">Verify</div>
					</div>
					<div class="tabs-cont payment-tab tab-disabled" id="step4">
						<div class="tabs-complete"></div>
						<div align="center">Payment</div>
					</div>
				</div>
   </div>
   </div>
   <br/>
  
  
  <div class="span12">
  <form name="frm" action="<%=ccp%>/GenericServlet" method="POST">
    <input type="hidden" name="step" id="step" value="5">
  <input type="hidden" name="operation" value="">
  <input type="hidden" name="ptyp" value="<%=genericbean.getPeriodtype()%>">
  <input type="hidden" name="fyer" value="<%=genericbean.getFinalyear()%>">
  <input type="hidden" name="qrtr" value="<%=genericbean.getQuarter()%>">
  <input type="hidden" name="frmdt" value="<%=genericbean.getFromdate()%>">
  <input type="hidden" name="todt" value="<%=genericbean.getTodate()%>">
  <input type="hidden" name="mnth" value="<%=genericbean.getMonth()%>">
  <input type="hidden" name="treasuryhead" value="<%=genericbean.getTreasuryhead()!=null?genericbean.getTreasuryhead():""%>"/>
  <input type="hidden" name="email" readonly="readonly" value="<%=genericbean.getEmail()!=null?genericbean.getEmail(): ""%>"/>
   <input type="hidden" name="mobile" readonly="readonly" value="<%=genericbean.getMobile()!=null?genericbean.getMobile(): ""%>"/>
   <input type="hidden" name="pincode" readonly="readonly" value="<%=genericbean.getPincode()!=null?genericbean.getPincode() : ""%>"/>
    <input type="hidden" name="state" readonly="readonly" value="<%=genericbean.getState()!=null?genericbean.getState() : ""%>"/>
    <input type="hidden" name="city" readonly="readonly" value="<%=genericbean.getCity()!=null?genericbean.getCity() : ""%>"/>
    <input type="hidden" name="address" readonly="readonly" value="<%=genericbean.getAddress()!=null?genericbean.getAddress() : ""%>"/>
    <input type="hidden" name="dlrname" readonly="readonly" value="<%=genericbean.getDlrname()!=null?genericbean.getDlrname() : ""%>"/>
    <input type="hidden" name="citycode" readonly="readonly" value="<%=genericbean.getCitycode()!=null?genericbean.getCitycode() : ""%>"/>
    <input type="hidden" name="statecode" readonly="readonly" value="<%=genericbean.getStatecode()!=null?genericbean.getStatecode() : ""%>"/>


  <div align=""><%= request.getParameter("err")!=null ? request.getParameter("err") : "" %>  </div>

      <table class="tablebox table-hover"  style="width:75%; margin-left:9%;">
        <tr>
          <th>Department</th>
          <td>
            <input type="text" name="depttname" readonly="readonly" value="<%=genericbean.getDepartmentname()!=null?genericbean.getDepartmentname() : ""%>"/>
            <input type="hidden" name="department" value="<%=genericbean.getDepartmentid()!=null?genericbean.getDepartmentid() : 0%>"/>
          </td>
       
          <th>Purpose</th>
          <td>
            <input type="text" name="purpose" readonly="readonly" value="<%=genericbean.getPurpose()!=null?genericbean.getPurpose():""%>"/>
          </td>
        </tr>
       
        <tr>
          <th>Period From</th>
          <td>
            <input type="text" name="periodfrom" readonly="readonly" value="<%=sdf.format(genericbean.getPeriod_from())!=null?sdf.format(genericbean.getPeriod_from()): null%>"/>
          </td>
       
          <th>Period to</th>
          <td>
            <input type="text" name="periodto" readonly="readonly" value="<%=sdf.format(genericbean.getPeriod_to())!=null?sdf.format(genericbean.getPeriod_to()): null%>"/>
          </td>
        </tr>
         <tr>
          <th>Description</th>
          <td>
            <input type="text" name="description" readonly="readonly" value="<%=genericbean.getDescription()!=null?genericbean.getDescription() : ""%>"/>
          </td>
          <th>Remarks</th>
          <td>
            <input type="text" name="remarks" readonly="readonly" value="<%=genericbean.getRemarks()!=null?genericbean.getRemarks() : ""%>"/>
          </td>
        </tr>
        <tr>
          <th colspan="2">Amount</th>
          <td colspan="2">
            <input type="text" name="amount" readonly="readonly" value="<%=genericbean.getAmount()!=0.00?genericbean.getAmount(): 0.00%>"/>
          </td>
        </tr>
        </table>
          <table class="tablebox table-hover"  style="width:75%; margin-left:9%;">
       <tr>
          <th>Name</th>
          <td>
            <input type="text" name="dlrname" readonly="readonly" value="<%=genericbean.getDlrname()!=null?genericbean.getDlrname() : ""%>"/>
          </td>
       
          <th>Address</th>
          <td>
            <input type="text" name="address" readonly="readonly" value="<%=genericbean.getAddress()!=null?genericbean.getAddress() : ""%>"/>
          </td>
        </tr>
        <tr>
          <th>City</th>
          <td>
            <input type="text" name="city" readonly="readonly" value="<%=genericbean.getCity()!=null?genericbean.getCity() : ""%>"/>
          </td>
       
          <th>State</th>
          <td>
            <input type="text" name="state" readonly="readonly" value="<%=genericbean.getState()!=null?genericbean.getState() : ""%>"/>
          </td>
        </tr>
        <tr>
          <th>Pin Code</th>
          <td>
            <input type="text" name="pincode" readonly="readonly" value="<%=genericbean.getPincode()!=null?genericbean.getPincode() : ""%>"/>
          </td>
       
          <th>Mobile No</th>
          <td>
            <input type="text" name="mobile" readonly="readonly" value="<%=genericbean.getMobile()!=null?genericbean.getMobile(): ""%>"/>
          </td>
        </tr>
        <tr>
          <th colspan="2">Email Id</th>
          <td colspan="2">
            <input type="text" name="email" readonly="readonly" value="<%=genericbean.getEmail()!=null?genericbean.getEmail(): ""%>"/>
          </td>
        </tr>
        <tr>
        </table>
         
           <div align="center">
           <input type="button" name="back"  class="btn-success"  value="Back" onclick="a();"/> 
           <input type="button" name="verify"  class="btn-success" value="Verify" onclick="b();"/> 
           </div>
        
       
     
    </form> </div> </body>
     <%@ include file="../portalfooter.jsp" %>
</html>