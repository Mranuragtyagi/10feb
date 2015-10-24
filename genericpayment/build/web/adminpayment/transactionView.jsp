<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*,genericepayadmin.*,vicclass.*,java.sql.*" %>
<%@ include file="../departmentheader.jsp"%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
User u=request.getSession().getAttribute("user")!=null?(User)request.getSession().getAttribute("user") : null ;
Connection con=u.getConnection();
genericepayadmin.GenericAdminBean gdb=null ;
java.text.DecimalFormat df=new java.text.DecimalFormat("##############.00");
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/MM/yyyy");
String ust="Used" ;
String unst="Unused" ;
String ddeptid=request.getSession().getAttribute("deptid")!=null?(String)request.getSession().getAttribute("deptid") : null ;
GenericAdminDao gd=new GenericAdminDao();
ArrayList al=gd.getDetailsByDepartment(con,ddeptid);
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>transactionView</title>
    <script type="text/javascript">
        function chln(t){
        document.frm.chid.value=t;
         document.frm.submit();
        }
    </script>
  </head>
  <body>
  <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
  <input type="hidden" name="step" id="step" value="12">
  <input type="hidden" name="departmentid"  value="<%=ddeptid%>">
  <input type="hidden" name="chid" id="chid" value="">
    <table class="tablebox table-bordered table-hover">
    <%if(al!=null || al.size()!=0){%>
        <tr>
            <th>Sr No</th>
            <th>Challan No</th>
            <th>Dealer Name</th>
            <th>Address</th>
            <th>Period From</th>
            <th>Period To</th>
            <th>Amount</th>
            <th>Payment Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
        int i=0;
        Iterator it=al.iterator();
        while(it.hasNext()){
        gdb=(genericepayadmin.GenericAdminBean) it.next();
        %>
        <tr>
            <td><%=++i%></td>
            <td><%=gdb.getChallanno()!=null?gdb.getChallanno() :""%></td>
            <td><%=gdb.getDlrname()!=null?gdb.getDlrname() : "" %></td>
            <td><%=gdb.getAddress()%>/<%=gdb.getCity()%>/<%=gdb.getState()%></td>
            <td><%=gdb.getPeriodfrom()!=null?sdf.format(gdb.getPeriodfrom()) :""%></td>
            <td><%=gdb.getPeriodto()!=null?sdf.format(gdb.getPeriodto()) :""%></td>
            <td><%=gdb.getAmount()!=null?df.format(gdb.getAmount()) : "" %></td>
            <td><%=gdb.getPaymentdate()!=null?sdf.format(gdb.getPaymentdate()): ""%></td>
            <%if(gdb.getChallanstatus().equals("0")){%>
            <td><%=unst%></td>
            <td><input type="button" name="ver" value="Verify" onclick="chln('<%=gdb.getChallanno()!=null?gdb.getChallanno() :""%>')"></td>
            <%}else if(gdb.getChallanstatus().equals("1")){%>
            <td><%=ust%></td>
            <%}%>
        </tr>
        <%}}else{%>
        <div><font color="Red">Data Not Found</font></div>
        <%}%>
    </table>
    </form>
  </body>
   <%@ include file="../portalfooter.jsp" %>
   <%}%>
</html>