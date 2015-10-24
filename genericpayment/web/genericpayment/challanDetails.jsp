<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="genericepayment.*"  %>
<%@ include file="../portalheader.jsp"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%
 java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/MM/yyyy");
 java.text.DecimalFormat df=new java.text.DecimalFormat("################.00");
 GenericBean challandetails=request.getAttribute("challandetails")!=null?(GenericBean)request.getAttribute("challandetails") : new GenericBean();
 String addr=challandetails.getAddress()+", "+challandetails.getCity()+", "+challandetails.getState();
 String msg=request.getParameter("msg")!=null?StringEscapeUtils.escapeHtml(request.getParameter("msg")): "" ;

%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>challanDetails</title>
  </head>
  <body>
    <form name="" action="" method="POST">
    <%if(msg==""){%>
      <table align="center" class="table table-bordered table-hover">
        <tr>
          <th>Name</th>
          <td>
            <input type="text" name="dlrname" readonly="readonly" value="<%=challandetails.getDlrname()!=null?challandetails.getDlrname(): ""%>"/>
          </td>
        </tr>
        <tr>
          <th>Challan No</th>
          <td>
            <input type="text" name="challan" readonly="readonly" maxlength="16" size="16" value="<%=challandetails.getChallanno()!=null?challandetails.getChallanno():""%>"/>
          </td>
        </tr>
        <tr>
          <th>Email Id</th>
          <td>
            <input type="text" name="email" readonly="readonly" value="<%=challandetails.getEmail()!=null?challandetails.getEmail() : ""%>"/>
          </td>
        </tr>
        <tr>
          <th>Address</th>
          <td>
            <input type="text" name="address" readonly="readonly" value="<%=addr!=null?addr : ""%>"/>
          </td>
        </tr>
        <tr>
          <th>Amount</th>
          <td>
            <input type="text" name="amount" readonly="readonly" value="<%=challandetails.getAmount()!=0.0?df.format(challandetails.getAmount()):"0.0" %>"/>
          </td>
        </tr>
        <tr>
          <th>Purpose</th>
          <td>
            <input type="text" name="purpose" readonly="readonly" value="<%=challandetails.getPurpose()!=null?challandetails.getPurpose():""%>"/>
          </td>
        </tr>
         <tr>
          <th>Payment Date</th>
          <td>
            <input type="text" name="paymentdate" readonly="readonly" value="<%=challandetails.getPaymentdate()!=null?sdf.format(challandetails.getPaymentdate()):""%>"/>
          </td>
        </tr>
        <tr>
          <th>Department</th>
          <td>
            <input type="text" name="department" readonly="readonly" value="<%=challandetails.getDepartmentname()!=null?challandetails.getDepartmentname() : ""%>"/>
          </td>
        </tr>
        <tr>
          <th>Period From</th>
          <td>
            <input type="text" name="periodfrom" readonly="readonly" value="<%=challandetails.getPeriod_from()!=null?sdf.format(challandetails.getPeriod_from()): ""%>"/>
          </td>
        </tr>
         <tr>
          <th>Period To</th>
          <td>
            <input type="text" name="periodto" readonly="readonly" value="<%=challandetails.getPeriod_to()!=null?sdf.format(challandetails.getPeriod_to()): ""%>"/>
          </td>
        </tr>
        <tr>
          <th>Mobile</th>
          <td>
            <input type="text" name="mobile" readonly="readonly" maxlength="10" size="10" value="<%=challandetails.getMobile()!=null?challandetails.getMobile() : ""%>"/>
          </td>
        </tr>
      </table>
      <%}else{%>
      <div align="center"><font color="Red"><%=msg%></font></div>
      <%}%>
    </form>
  </body>
   <%@ include file="../portalfooter.jsp" %>
</html>