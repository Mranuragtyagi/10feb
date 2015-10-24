<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="genericepayment.*"  %>
<%@ page import="utility.SystemGlobals"  %>
<%
    String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
    GenericBean genericbean=(GenericBean)request.getSession().getAttribute("genericbean");
    java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/MM/yyyy");
    String secrets=SystemGlobals.getBilldesk_chksum();
    String bill_url=SystemGlobals.getBilldesk_url();
    String mssg=SystemGlobals.getMerchant_id()+"|"+genericbean.getChallanno()+"|NA|"+genericbean.getAmount()+"|NA|NA|NA|INR|NA|R|"+SystemGlobals.getSecurity_id()+"|NA|NA|F|"+genericbean.getTreasuryhead()+"|NA|NA|NA|NA|NA|NA|"+ccp+"/genericpayment/genericResponse.jsp|"+secrets+"";
    //String hash=genericbean.HmacSHA256(mssg,secrets);
    String hash=genericbean.checkSumSHA256(mssg);
    mssg=SystemGlobals.getMerchant_id()+"|"+genericbean.getChallanno()+"|NA|"+genericbean.getAmount()+"|NA|NA|NA|INR|NA|R|"+SystemGlobals.getSecurity_id()+"|NA|NA|F|"+genericbean.getTreasuryhead()+"|NA|NA|NA|NA|NA|NA|"+ccp+"/genericpayment/genericResponse.jsp|"+hash+""; 
    System.out.println("msgFirst : "+mssg);
    %>
    
<html>
   <body>
    <form action="<%=bill_url%>" method="POST">
        <input type="hidden" name="msg" id="msg" value="<%=mssg%>"/>
        <div align="center"> <input type="submit" class="btn-success" value="Payment"></div>
    </form>
   </body>
</html>
<%response.sendRedirect(bill_url+"?msg="+mssg);%> 