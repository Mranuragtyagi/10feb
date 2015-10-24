<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
String msg=request.getParameter("msg")!=null?(String)request.getParameter("msg"): "";

 String sql="select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
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
   <head>
    <!-- start: Meta -->
	<title>Unlock ID Proof | Payonline Jharkhand</title>
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
					<a href="#">Unlock ID Proof</a>
				</li>
		
				
			</ul>
  <div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Unlock ID Proof</h2>
						
					</div>
					<div class="box-content">

  
  <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
  <input type="hidden" name="step" value="29">
        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
   <%if(msg!=null){%>
    <div><font color="Red"><%=msg%></font></div>
    <%}%>
  <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                    <tr>
                        <th>Department</th>
                        <td><%if(al!=null){
                            Iterator it=al.iterator();
                            %>
                            <select name="department" id="department" onchange="getMajor();" >
                                    <option value="#">-------SELECT------- </option>
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
                <th>Id proof</th>
                <td>
                    <select id="idproof" name="idproof">
                        <option value="#">-----Select-----</option>
                    </select>
                </td>
            </tr>
            
           
                    <tr align="center">
                        <td colspan="2"><input class="btn-primary" type="submit" name="unlock" value="Unlock" onclick="return getValidate()"></td>
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
            
            
             <script type="text/javascript" src="<%=ccp%>/script/jquery-latest.pack.js"></script>
      <script type="text/javascript" language="javascript">
           /* $(function(){                
                $("#department").change(function(){
                    $.getJSON("getLockedIdProof.jsp",{'depart':$("#department").val(), ajax: 'true'}, function(res){   
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;                        
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#idproof").html(options);
                    })
                })
            });*/
    
    function getMajor(){
                var departmentval = $("#department").val();
                $.post("<%=ccp%>/JsonService?step=getLockIdProve&depart="+departmentval, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#idproof").html(options);
                },"json"); 
            };
        </script>
                    <script>
                         function getValidate()
            {

    var dept=document.frm.department.value;
    var idproof=document.frm.idproof.value;
     if(dept=="#"){
      alert("Please Select the Department Name ");
      document.frm.department.focus();
      return false;
    }
    if(idproof=="#"){
      alert("Please fill Id Proof");
      document.frm.idproof.focus();
      return false;
    } 
              
            }
        </script>

     <%}%>       
  </body>
</html>