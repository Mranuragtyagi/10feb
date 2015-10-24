<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>

 <%if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
    String action=request.getParameter("action")!=null?request.getParameter("action"): "";
    String dep=(String)request.getAttribute("dep");
     String sql="select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u=(vicclass.User) request.getSession().getAttribute("user");
     java.sql.Connection con=null;
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
<html>
  <head>
     <!-- start: Meta -->
	<title>Modify Admin Department | Payonline Jharkhand</title>
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
					<a href="#">Modify Department</a>
				</li>
		
				
			</ul>
  <div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Modify Department</h2>
						
					</div>
					<div class="box-content">

  
  

  <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
  <input type="hidden" name="step" value="5">
  <input type="hidden" name="actn" id="actn" value="">
  <input type="hidden" name="deid" id="deid" value="<%=dep!=null?dep :""%>">
  <%if(action=="" || action.equals("")){%>
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
                         <option value="<%=cfrb.getDeptid()!= null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                    <%}%>
                    </select>
                    <%}%>
              
                    <input class="btn-primary" type="button" name="edit" id="edit" value="Edit" onclick="return(a())">
                    <input class="btn-primary" type="button" name="del" id="del" value="Delete" onclick="return(b())">
                </td>
        </tr>
    </table>
    <%}%>
  </form>
   <%if(action!=""){%>
  <form action="<%=ccp%>/GenericAdminServlet" name="edfrom" method="POST">
        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
  <input type="hidden" name="step" value="6">
  <input type="hidden" name="deid" value="<%=dep%>">
  <%if(action.equals("edit")){%>
  <table class="table table-bordered table-hover">
    <tr>
        <th>Department</th>
        <td><input type="text" name="department" value="<%=request.getParameter("deprtmnt")!=null?request.getParameter("deprtmnt") :""%>"></td>
        <td><input type="button" name="" value="Submit" onclick="fieldValidation();" class="btn-success btn-mini"></td>
    </tr>
  </table>
  <%}else if(action.equals("deletSuccess")){%>
    <div class="success"><font color="Green">Deleted Successfully</font></div>
        
  <%}else if(action.equals("editSuccess")){%>
   <div class="success"><font color="Green">Updated Successfully</font></div>
           <%}else if(action.equalsIgnoreCase("ValidationError")){%>
    <div class="success"><font color="Green">Please Enter The Valid Department Name.</font></div>
   <%}%>
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
    
    <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.dataTables.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>

  
  
    <script type="text/javascript">
        function a(){
			 var name=document.getElementById("department").value;
            if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Enter the Department");
                document.getElementById('department').focus();
                return false;
            }
         var a = document.frm.edit.value;
                if(a=='Edit'){
                    document.frm.actn.value="edit";
                    document.frm.submit();
                }
        }
        
        function b(){
			 var name=document.getElementById("department").value;
            if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Enter the Department");
                document.getElementById('department').focus();
                return false;
            }
         var b = document.frm.del.value;
                if(b=='Delete'){
                    document.frm.actn.value="del";
                    document.frm.submit();
                }
        }
    </script>

<script>
		
		 function fieldValidation(){
              //  var name=document.getElementById("department").value;
                var deprt=document.edfrom.department.value;
               // var deptRegex=/^[a-zA-Z ]+$/;
                var deptRegex=/^[a-zA-Z ]+$/;
         //   if((document.frm.department.value == '#')||(document.frm.department.value =="")||(!name.match(deptRegex))){
                 if(!deprt.match(deptRegex)){
                alert("Please Enter the Appropriate Department");
                document.edfrom.department.focus();
                return false;
            }else{
                document.edfrom.submit();
            }
        }
		 </script> 
<%}%>
  </body>
</html>
