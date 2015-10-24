<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<html>
  <head>
    <title>Department List</title>
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
					<a href="#">Department List</a>
				</li>
			</ul>
            <div class="row-fluid sortable">
            <div class="box span12" >
            <div class="box-header" data-original-title>
            <h2><i class="icon edit"></i><span class="break"></span>List Department</h2>

          </div>
          <div class="box-content">
           <table id="printview" class="display">          
       <thead>      
      <tr>
        <th>SL No</th>
        <th>DEPT NAME</th>
      <%-- <th>DEPT ID</th> --%>
      </tr>
    </thead>
    <tbody>
   <% 

     String sql="select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u=(vicclass.User)request.getSession().getAttribute("user");
     java.sql.Connection con=null;
     con=u.getConnection();
     java.sql.ResultSet rs=null;
     int i=1;
     try{
        stmt=con.prepareStatement(sql);
        stmt.setString(1,"A");
        rs=stmt.executeQuery();
        while(rs.next()){
            
      %>
      <tr>
        <td><%=i++%></td>
        <td><%=rs.getString("DEPT_NAME")%></td>
        <%-- <td><%=rs.getString("DEPT_ID")%></td> --%>
      </tr> 
  <%
    }
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
             finally{               
             try{
                 if(stmt !=null)
                     stmt.close();
                 if(rs!=null)
                     rs.close();
                 }catch(Exception e){
                     System.out.println(e.getMessage());
                 }
         }
%>
  <tbody>
     
    </table>
    
    <!--<div align="center"><input type="button" value="Print" onclick="myFunction()"></input></div>--></div>
        </div><!--/span-->

      </div>
    

  </div><!--/.fluid-container-->
  
      <!-- end: Content -->
    </div><!--/#content.span10-->
    </div><!--/fluid-row-->
    
  
  
  <div class="clearfix"></div>
  <%@ include file="../assets/metro/__inc/footer.jsp"%>
  
  
  <!-- start: JavaScript-->

        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script>                            
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
        <script type="text/javascript">

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
 
} );
    </script>
  <!-- end: JavaScript-->
  <%}%>
</body>
</html>
