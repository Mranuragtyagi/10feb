<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%String dept=request.getAttribute("dept")!=null?(String)request.getAttribute("dept") : "" ;
String departname=request.getAttribute("departname")!=null?(String)request.getAttribute("departname") : "" ;
%>
<%String msg=request.getParameter("msg");%>
<html lang="en">
<head>
  
  <!-- start: Meta -->
  <title>Department Wise Tax Details | Payonline Jharkhand</title>
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
          <a href="#">Department Wise Tax Details</a>
        </li>
      </ul>
            <%if(msg!=null){%>
                     
                     <div class="alert alert-block">
          <h4 class="alert-heading">Success</h4>
          <p><%=msg%></p>
        </div>
  <%}%>
      <div class="row-fluid sortable">
            
        <div class="box span12" >
          <div class="box-header" data-original-title>
            <h2><i class="icon-edit"></i><span class="break"></span><%=departname%></h2>          
          </div>
          <div class="box-content">
           <table id="printview" class="display">          
              <thead>
                              <tr>
                                <th>SL No</th>
                                <th>Major Tax</th>
                                <th>Tax Purpose</th>
                                <th>Treasury Headcode</th>
                                <th>Description</th>
                                <th>Fixed Amount</th>
                              </tr>
            </thead>
            <tbody>
            <% 
     String sql="select  TREASURY_HEAD_CODE,initcap(MAJOR_TAX) as MAJOR_TAX,initcap(TAX_PURPOSE) as TAX_PURPOSE,DESCRIPTION,TAX_PURPOSE_ID,ISFIXED,FIXAMOUNT, generic_dept.dept_name as dname from echallan_tax_purposes join  generic_dept on generic_dept.dept_id=echallan_tax_purposes.dept_id where echallan_tax_purposes.dept_id=? order by echallan_tax_purposes.MAJOR_TAX" ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u=(vicclass.User)request.getSession().getAttribute("user");
     java.sql.Connection con=null;
     con=u.getConnection();
     java.sql.ResultSet rs=null;
     int i=1;
     try{
        stmt=con.prepareStatement(sql);
        stmt.setString(1,dept);
        rs=stmt.executeQuery();
        while(rs.next()){
      %>
      <tr>
        <td><%=i++%></td>
        <!--td><%=rs.getString("dname")%></td-->
        <td><%=rs.getString("MAJOR_TAX")%></td>
        <td><%=rs.getString("TAX_PURPOSE")%></td>
         <td><%=rs.getString("TREASURY_HEAD_CODE")%></td>
          <td><%=rs.getString("DESCRIPTION")%></td>
           <%if((rs.getString("ISFIXED")!=null?rs.getString("ISFIXED") : "") .equals("Y") || (rs.getString("ISFIXED")!=null?rs.getString("ISFIXED") : "")=="Y"){%>
           <td>YES</td>
           <%}else{%>
           <td>NO</td>
           <%}%>
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
              </tbody>
               
           </table>
          </div>
        </div><!--/span-->

      </div>
    

  </div><!--/.fluid-container-->
  
      <!-- end: Content -->
    </div><!--/#content.span10-->
    </div><!--/fluid-row-->
    
  
  
  <div class="clearfix"></div>
  <%@ include file="../assets/metro/__inc/footer.jsp"%>
  
  
  <!-- start: JavaScript-->

    <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.js"></script>
<script src="<%=ccp%>/assets/metro/js/dataTables.tableTools.js"></script>                            
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
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
                    "sPdfMessage": "<%=departname%>"
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
