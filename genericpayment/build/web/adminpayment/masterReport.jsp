<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
     String sql="select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     java.sql.Connection con=null;
     vicclass.User u=(vicclass.User)request.getSession().getAttribute("user");
     u.createConnection();
     con=u.getConnection();
     ArrayList al=new ArrayList();
     java.sql.ResultSet rs=null;
     try{
        stmt=con.prepareStatement(sql);
        stmt.setString(1,"A");
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
<%String rtype=request.getAttribute("Reporttype")!=null?(String)request.getAttribute("Reporttype") : "";%>
<html lang="en">
<head>
    <title>Master Report | PayOnline Jharkhand</title>
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
					<a href="<%=ccph%>/adminContent.jsp">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">Department Details</a>
				</li>
			</ul>
            
            <div class="row-fluid sortable">
            
				<div class="box box-primary span12">
					<div class="box-header" data-original-title>
						<h2><i class="icon-edit"></i><span class="break"></span>Department Details</h2>
						
					</div>
					<div class="box-content">
       
  <%if(rtype=="DD" || rtype.equals("DD")){%>
   
      <form action="<%=ccph%>/GenericAdminServlet" method="post" class="form-horizontal">
          <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
      <fieldset>
      <input type="hidden" name="step" value="15" />
     					 <div class="control-group">
							  <label class="control-label" for="department">Department</label>
							  <div class="controls">
		<%if(al!=null){
                Iterator it=al.iterator();
                %>
                    <select name="department" id="department" required>
                        <option value="#">-------select------- </option>
                     <%
                        while(it.hasNext()){                          
                            GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                        <option value="<%=cfrb.getDeptid()!=null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                    <%}%>
                    </select>
                    <input type="submit" value="Submit" class="btn btn-primary">
                    <%}%>
                    </div>
                   
             </div>
             
             </fieldset>
             
     </form>
         <%}%>
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

		<script src="<%=ccph%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<script src="<%=ccph%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccph%>/assets/metro/js/custom.js"></script>
	<!-- end: JavaScript-->
	<%}%>
</body>
</html>

    
    
