<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>


<% 
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{

     String sql="select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u=(vicclass.User)request.getSession().getAttribute("user");
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
	<title>Ask Admin UserName | Payonline Jharkhand</title>
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
					<a href="#">Modify User Details and Privilege</a>
				</li>
		
				
			</ul><%= request.getParameter("msg") != null ? "<div class='alert alert-block'><h4 class='alert-heading'>" + request.getParameter("msg") + "</h4></div>" : ""%>
  <div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Modify User Details and Privilege</h2>
						
					</div>
					<div class="box-content">

    
            <%= request.getAttribute("err")!=null?"<font face=verdana size=2 color=red><b>"+(String)request.getAttribute("msg")+"</br></font>":"" %>
            <form action="<%=ccp%>/GenericAdminServlet" method="post" onSubmit="return checkForm(this)" name="frm">
                 <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
            <input type="hidden" name="step" value="showuser">
  <table class="table table-striped table-bordered bootstrap-datatable datatable">          
            <tr>
                <th>Department </th>
                <%if(al!=null){
                Iterator it=al.iterator();
                %>
                   <td> <select name="department" id="department">
                        <option value="#">-------select------- </option>
                     <%
                        while(it.hasNext()){                          
                            GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                        <option value="<%=cfrb.getDeptid()!=null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                    <%}%>
                    </select>
                    <%}%>
               </td>
            </tr>
                <tr>
                    <th>
                             Username </th>
                            <td><input name="username" type="text" size="20" maxlength="20" onKeyPress="toUpper()">
                            
                    </td>
                </tr>
                <tr><th ></th><td><input type="submit" value="Continue"  class="btn-primary"name="continue" onclick="return(fieldValidation());" style="font-family: Verdana; font-weight: bold; font-size: 8pt"></td></tr>
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
   
            
              <script type="text/javascript" src="script/validate.js" language="JavaScript"></script>
        <script type="text/javascript" language="JavaScript">
            function checkForm(f){
                  var namerex=/^[a-zA-Z ]+$/;
                var msg="Please enter the Username to Modify!!!";
                var correct=true;
                if(!f.username.value.match(namerex)){
                    correct=false;
                }if(correct==false){
                    alert(msg);
                }
                return correct;		
            }
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