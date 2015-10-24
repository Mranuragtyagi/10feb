<!DOCTYPE HTML>
<%@ page import="genericsettlement.*,java.util.*,java.text.*,java.sql.*" contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>

<html>
<%   
    if (request.getSession().getAttribute("user")==null){
    response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
    } 
    else{
        String entrydate=request.getAttribute("entry_date")==null?"":(String)request.getAttribute("entry_date");
        java.util.ArrayList settlement =  request.getAttribute("settlement")==null?new ArrayList():(ArrayList)request.getAttribute("settlement");
        String msg =  request.getAttribute("msg1")==null?"":(String) request.getAttribute("msg1");
        SimpleDateFormat sdff=new SimpleDateFormat("dd-MM-yyyy");
        Iterator settlementItr =settlement.iterator();
    %>
  <head>
    <!-- start: Meta -->
	<title>Settle List | Payonline Jharkhand</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery.dataTables.css">
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/dataTables.tableTools.css" >
     
    
  </head>
  <body>
  
   <!-- start: Header -->
        <%@ include file="../assets/metro/__inc/header.jsp"%>
		<!-- start: Header -->
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<%@ include file="../assets/metro/__inc/main_menu.jsp"%>
			<!-- end: Main Menu -->
			
			
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="<%=ccp%>/adminpayment/adminContent.jsp">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
                		<li>
					<i class="icon-edit"></i>
					<a href="#">Settle List</a>
				</li>
		
				
			</ul>
  <div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Settle List</h2>
						
					</div>
					<div class="box-content">

  
            <div id="master">
           <div id="header">
    	<h3 align="center">Pending Settlement List</h3>
    </div>
    <div style="color:#FF0000" id="msg"><%= msg.equals("") ? "" : msg %> </div>
    <div id="form1" align="center">
      
        <table>
            <tr><td>
                    <form id="frm1" class="form-horizontal" action="<%=ccp%>/Settle?step=2" method="post">
                         <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
        Date:<input type="text" name="date" id="date" value="<%=entrydate%>"/>
        <input type="button" class="btn btn-primary btn-small" value="Fetch Anomalies" id="btn"/> 
                    </form> </td><td>
       
        <%if(settlement.size()>0) {%>
        <form id="frm2" action="<%=ccp%>/Settle?step=3" method="post">
             <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
         <input type="submit" class="btn btn-primary btn-small" value="Forced Settlement" id="btn"/> 
        </form>
        <% }else { %>
        <form id="frm3" action="<%=ccp%>/Settle?step=4" method="post">
             <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
         <input type="submit" class="btn btn-primary btn-small" value="Fetch All Anomalies" id="btn"/> 
        </form>
        <%}%>
                    </td></tr></table>
    </div> 
        <div id="middle"  align="center">
   <table id="printview" class="display">
   <thead>          
        <tr>
        <th>S No.</th>
        <th>Challan No.</th>
        <th>TRANS ID</th>
        <th>CIN</th>
        <th>TREASURY CODE</th>
        <th>TOTAL</th>     
        </tr>
    </thead>
    <tbody>
          <%
            int i=1;
        while(settlementItr.hasNext())
                {
                SettleBean settle=(SettleBean)settlementItr.next();
        %>
        <tr>
        <td><%=i++%></font></td>
		<td><%=settle.getChallan_No()%></td>
		<td><%=settle.getTransid()%></td>
		<td><%=settle.getCin()%></td>
		<td><%=settle.getTreasury_code()%></td>
        <td><%=settle.getTotal1()%></td>
        </tr>
        <%
        }
        %>
        </tbody>
        </table>
        </div>
      <!--   <div id="pageNavPosition" align="center" style="cursor:pointer"></div> -->
        
    </div>
    
					</div>
				</div><!--/span-->

			</div>
    

	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	
    	<div class="clearfix"></div>
	<%@ include file="../assets/metro/__inc/footer.jsp"%>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script> 
    <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
    
     <script type="text/javascript">
   $(document).ready(function() {

            $("#date").datepicker({changeMonth: true, changeYear: true, yearRange: '2006:2019', dateFormat: 'dd/mm/yy'});

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
                }
            ]
        }
    } );

});
    </script> 
  <%}%>
  </body>
  
</html>
