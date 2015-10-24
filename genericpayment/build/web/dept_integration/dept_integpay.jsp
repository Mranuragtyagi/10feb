<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="genericepayment.*"  %>
<%@ page import="utility.SystemGlobals"  %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>pay_confirm</title>
  </head>
  <body>
  <%
   String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    dept_integration.Dept_Integchalan ch=(dept_integration.Dept_Integchalan)request.getSession().getAttribute("challan");
    java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/MM/yyyy");
    String secrets=SystemGlobals.getBilldesk_chksum();
    String bill_url=SystemGlobals.getBilldesk_url();
    String ur="dept_integration/dept_integ_response.jsp";
    if(ch.getDEPT_CODE().equalsIgnoreCase("openapi")){
        ur="/genericpayment/genericResponse.jsp";
    }
    String mssg=SystemGlobals.getMerchant_id()+"|"+ch.getCHALLAN_NO()+"|NA|"+ch.getAMOUNT()+"|NA|NA|NA|INR|NA|R|"+SystemGlobals.getSecurity_id()+"|NA|NA|F|"+ch.getTREASURY_CODE()+"|NA|NA|NA|NA|NA|NA|"+ccp+ur+"|"+secrets+"";
     
    String hash=GenericBean.checkSumSHA256(mssg);
    mssg=SystemGlobals.getMerchant_id()+"|"+ch.getCHALLAN_NO()+"|NA|"+ch.getAMOUNT()+"|NA|NA|NA|INR|NA|R|"+SystemGlobals.getSecurity_id()+"|NA|NA|F|"+ch.getTREASURY_CODE()+"|NA|NA|NA|NA|NA|NA|"+ccp+ur+"|"+hash+""; 
    System.out.println("msgFirst : "+mssg);   
  %>
  Jharkhand Online Payment Portal
<form  id="frm" action="https://payments.billdesk.com/MercOnline/jsp/taxPayMerchant.jsp" method="POST">
        <input type="hidden" name="msg" id="msg" value="<%=mssg%>"/>
 <table>
 <tr>
 <td>Name
 </td>
 <td><%=ch.getNAME()%>
 </td>
 </tr>
 <tr>
 <td>Vehicle Number</td>
 <td><%=ch.getMISC()%>
 </td>
 </tr>
 <tr>
 <td>Challan Number</td>
 <td><%=ch.getCHALLAN_NO()%>
 </td>
 </tr>
 <tr>
 <td>Amount</td>
 <td><%=ch.getAMOUNT()%>
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