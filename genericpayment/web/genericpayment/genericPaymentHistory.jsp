<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="genericepayment.*"  %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%if (request.getSession().getAttribute("userloggedin")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{%>
<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<% 
 java.text.SimpleDateFormat sdf= new java.text.SimpleDateFormat("dd/MM/yyyy");
 ArrayList paymenthistory =(ArrayList)request.getSession().getAttribute("eclhistory");
 java.text.DecimalFormat df=new  java.text.DecimalFormat("##################0.00"); 
 String msg=request.getParameter("msg")!=null?StringEscapeUtils.escapeHtml(request.getParameter("msg")): "";
 
  int slno=1;
%>
<html lang="en">
<head>

 <title>Generic Payment History| Payonline</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
         <link rel="stylesheet" type="text/css" href="<%=ccp%>/css/jquerycss/jquery-ui.css">       
        <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >

            
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
				<li>
					<i class="icon-edit"></i>
					<a href="#">Payment History</a>
				</li>
			</ul>
           
			<div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Payment History</h2>
						
					</div>
					<div class="box-content">
  <form name="frm" action="<%=ccp%>/GenericServlet"> 
  <input type="hidden" name="pg" value=""/ >
   <%if(msg!=""){%>
        <div align="center"><font color="Red"><%=msg%></font></div>
   <%}%>
    <%
        try{
        if(paymenthistory!=null){
    %>
              <table id="printview" class="display">
                  <thead>
                  <tr>
                    <th>Sr No</th>
                    <th>Department</th>
                    <th>Receipt No</th>
                    <th>Period From</th>
                    <th>Period To</th>
                    <th>Amount Paid</th>
                    <th>Transaction Date</th>
                  </tr>
                  </thead>
                  <tbody>
                <%
                  java.util.Iterator it=paymenthistory.iterator();
                  while(it.hasNext()){
                  GenericBean historybean = (GenericBean)it.next();
              %>  
              
                  <tr>
                    <td><%=slno++%></td>
                    <td><%=historybean.getDepartmentname()!=null?historybean.getDepartmentname():""%></td>
                    <td><%=historybean.getChallanno()!=null?historybean.getChallanno():""%></td>
                    <td><%=historybean.getPeriod_from()!=null?sdf.format(historybean.getPeriod_from()):""%></td>
                    <td><%=historybean.getPeriod_to()!=null?sdf.format(historybean.getPeriod_to()):""%></td>
                    <td align="right"><%=historybean.getAmount()!=0.0?df.format(historybean.getAmount()):"0.0"%></td>
                    <td><%=historybean.getPaymentdate()!=null?sdf.format(historybean.getPaymentdate()):""%></td>
                  </tr>
              <%}%>
                  </tbody>
             </table>
             
              <%}else{ %>
                  <font size="+2" color="Red">No Data Found.</font>
                  <%}
        }catch(Exception e){System.out.println(e.getMessage());}%>
 </form>
  </div>
				</div><!--/span-->

			</div>
    

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	
	
	<div class="clearfix"></div>
	<%@ include file="../assets/metro/__inc/footer.jsp"%>
	
		<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
                <script type="text/javascript" language="javascript" src="<%=ccp%>/script/jquery-ui.js"></script>
            
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
<script src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
    <script type="text/javascript">
        function dopagination(pg){
           document.frm.method='GET' ;
           document.frm.pg.value=pg ;
           document.frm.action='<%=ccp%>/GenericServlet';
           document.frm.submit(); 
        }
        $(document).ready(function() {
             $('#printview').DataTable( {
        dom: 'T<"clear">lfrtip',
        tableTools: {
            "sSwfPath": "<%=ccp%>/assets/metro/swf/copy_csv_xls_pdf.swf",
            "aButtons": [
                "csv",
                "xls",
                {
                    "sExtends": "pdf",
                    "sPdfOrientation": "landscape",
                    "sPdfMessage": " "
                }
            ]
        }
    } );
    });
        
        
</script>
	<!-- end: JavaScript-->
	<%}%>
</body>
</html>