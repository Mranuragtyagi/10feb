<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>pay_confirm</title>
  </head>
  <body>
  <%
           jhpolice.Challan ch=(jhpolice.Challan)request.getSession().getAttribute("challan");
           String secret="TXJHHbuJkYIaK7" ;
           String mssg="JHRKHDSP|"+ch.getChallan_no()+"|NA|"+ch.getAmount()+"|NA|NA|NA|INR|NA|R|jhrkhdsp|NA|NA|F|"+ch.getTreasurycode()+"|NA|NA|NA|NA|NA|NA|http://payonline.jharkhand.gov.in/jhpolice/jhGenericResponse.jsp";
          // String hash=genericepayment.GenericBean.HmacSHA256(mssg,secret);
          // mssg="JHRKHDSP|"+ch.getChallan_no()+"|NA|"+ch.getAmount()+"|NA|NA|NA|INR|NA|R|jhrkhdsp|NA|NA|F|"+ch.getTreasurycode()+"|NA|NA|NA|NA|NA|NA|http://payonline.jharkhand.gov.in/jhpolice/jhGenericResponse.jsp|"+hash+""; 
           
  %>
  Jharkhand Online Payment Portal
<form  id="frm" action="https://payments.billdesk.com/MercOnline/jsp/taxPayMerchant.jsp" method="POST">
        <input type="hidden" name="msg" id="msg" value="<%=mssg%>"/>
 <table>
 <tr>
 <td>Name
 </td>
 <td><%=ch.getName()%>
 </td>
 </tr>
 <tr>
 <td>Vehicle Number</td>
 <td><%=ch.getVehicle_no()%>
 </td>
 </tr>
 <tr>
 <td>Challan Number</td>
 <td><%=ch.getChallan_no()%>
 </td>
 </tr>
 <tr>
 <td>Amount</td>
 <td><%=ch.getAmount()%>
 </td>
 </tr>
 <tr>
 <td><input type="submit" name="save"  value="Proceed to Pay" /></td>
 <td> 
 </td>
 </tr>
 </table>
 </form>
  </body>
  <%
  request.getSession().removeAttribute("challan"); 
  %>
   <script>
    document.getElementById('frm').submit();
  </script>
</html>