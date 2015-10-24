<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*" %>
<%@ include file="../departmentheader.jsp"%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
ArrayList al=request.getSession().getAttribute("departmentdetails")!=null?(ArrayList)request.getSession().getAttribute("departmentdetails") : null ;
genericepayadmin.GenericAdminBean gdb=null ;
java.text.DecimalFormat df=new java.text.DecimalFormat("##############.00");
java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd/MM/yyyy");
String ust="Used" ;
String unst="Unused" ;
String ddeptid=request.getSession().getAttribute("deptid")!=null?(String)request.getSession().getAttribute("deptid") : null ;
String ty=request.getAttribute("typ")!=null ?(String)request.getAttribute("typ") :"";

 int slno=1;
    int i =1;
    int pg =request.getAttribute("pg") != null ? (Integer)request.getAttribute("pg") : 0; 
    int tpg =request.getAttribute("tpg")!=null ? (Integer)request.getAttribute("tpg") : 0;
    int recordsperpage =request.getAttribute("recordsperpage")!=null?(Integer)request.getAttribute("recordsperpage") : 0;
    slno =((pg-1)*recordsperpage +1);

%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>departmentWiseDetails</title>
    <script type="text/javascript">
        function chln(t){
        document.frm.chid.value=t;
         document.frm.submit();
        }
    </script>
    
    <script type="text/javascript">
        function dopagination(pg){
           document.frm.method='POST' ;
           document.frm.pg.value=pg ;
           document.frm.action='<%=ccp%>/GenericAdminServlet';
           document.frm.submit(); 
        }
</script>
  </head>
  <body>
  <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
  <input type="hidden" name="step" id="step" value="13">
  <input type="hidden" name="departmentid"  value="<%=ddeptid%>">
  <input type="hidden" name="chid" id="chid" value="">
   <input type="hidden" name="pg" value=""/ >
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
            <%if((ty.equalsIgnoreCase("all")) || (ty.equalsIgnoreCase("0"))){%>
            <th>Action</th>
            <%}%>
        </tr>
        <%
            Iterator it=al.iterator();
            while(it.hasNext()){
            gdb=(genericepayadmin.GenericAdminBean) it.next();
        %>
        <tr>
            <td><%=slno++%></td>
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
     <div style="overflow:scroll; height:80px; width:75%; margin-left:auto; margin-right:auto"  class="linkdesign"  >           
            <% while(i <= tpg){ %>        
                <a href="#" onclick="dopagination('<%=i%>');"><%=i++%></a>&nbsp;&nbsp;&nbsp;
                <%}%>
        </div>
    </form>
  </body>
   <%@ include file="../portalfooter.jsp" %>
   <%}%>
</html>