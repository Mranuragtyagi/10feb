<!DOCTYPE html>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page contentType="text/html;charset=windows-1252" isErrorPage="true"
         import="java.io.CharArrayWriter, java.io.PrintWriter" errorPage="/error.jsp"%>
         
<%@ page import="java.util.*,genericepayadmin.* " %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{

String msg=request.getParameter("msg")!=null?(String)request.getParameter("msg"):"";%>
 <% 
    String action=request.getParameter("action")!=null?request.getParameter("action"): "";
    String dep=(String)request.getAttribute("dep");
     String sql="select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u=(vicclass.User)request.getSession().getAttribute("user");
     java.sql.Connection con=null;
     con=u.getConnection();
     ArrayList al=new ArrayList();
     java.sql.ResultSet rs=null;
     try{
        stmt=con.prepareStatement(sql);
        stmt.setString(1,"I");
        rs=stmt.executeQuery();
        while(rs.next()){
            GenericAdminBean genericbean=new GenericAdminBean();
            genericbean.setDepartment(rs.getString("DEPT_NAME"));
            genericbean.setDeptid(rs.getString("DEPT_ID"));
            al.add(genericbean);
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
<html>
  <head>
    <!-- start: Meta -->
	<title>Unlock Department | Payonline Jharkhand</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
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
					<a href="#">Unlock Department</a>
				</li>
		
				
			</ul>
  <div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Unlock Department</h2>
						
					</div>
					<div class="box-content">
  
  
  
                                            <form action="<%=ccp%>/GenericAdminServlet" name="frm" method="POST" name="frm" onsubmit="return fieldValidation();">
        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
  <input type="hidden" name="step" value="23">
  <%if(msg!=null){%>
  <div><font color="Green"><%=msg%></div>
  <%}%>
  <table class="table table-striped table-bordered bootstrap-datatable datatable">          
   <tr>
                <th>Department</th>
                <td><%if(al!=null){
                Iterator it=al.iterator();
                %>
                    <select name="department" id="department" >
                        <option value="#">-------select------- </option>
                     <%
                        while(it.hasNext()){                          
                            GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                         <option value="<%=cfrb.getDeptid()!= null ? cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                    <%}%>
                    </select>
                    <%}%>
                </td>
               </tr>
               <tr>
                    <td align="center"><input type="submit" class="btn-primary" name="submit" value="Unlock"></td>
               </tr>
  
  </table>
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
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>
<script>
		
		 function fieldValidation(){
				  var name=document.getElementById("department").value;
            if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Enter the Department");
                document.getElementById('department').focus();
                return false;
            }
		 }
		 </script> 
  <%}%>
  </body>
</html>
