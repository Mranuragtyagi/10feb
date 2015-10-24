<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
String msg=(String)request.getParameter("msg");
String sql="select INITCAP(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? " ;
     java.sql.PreparedStatement stmt=null;
     vicclass.User u= (vicclass.User)request.getSession().getAttribute("user");
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
	<title>Add Major Tax| Payonline Jharkhand</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
     

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
					<a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">Add Major Tax</a>
				</li>
			</ul>
	<div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Add Major Tax</h2>
						
					</div>  
  <div class="box-content">

  
  <form action="<%=ccp%>/GenericAdminServlet" name="frm" method="POST">
       <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
   <input type="hidden" name="step" id="step" value="19">
    <div><%if(msg!=null){%>
    <div><font color="Red"><%=msg%></font></div>
    <%}%>
    

            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                    <tr>
                        <th>Department</th>
                        <td><%if(al!=null){
                            Iterator it=al.iterator();
                            %>
                                <select name="department" id="department">
                                    <option value="#">-------SELECT------- </option>
                            <%
                                        while(it.hasNext()){                          
                                        GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                                    <option value="<%=cfrb.getDeptid()!=null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                            <%}%>
                                </select>
                        <%}%>
                        </td>
                        <th>Major Tax</th>
                        <th>Major Tax Code</th>
                    </tr>
                    <tr>
                        <th>Major Tax</th>
                        <td><input type="text" name="majortax"></td>
                        <td rowspan="3"><div id="majortaxtype"></div></td>
                        <td rowspan="3"><div id="majortaxtypecode"></div></td>
                    </tr>
                    <tr>
                        <th>Short Code</th>
                        <td><input type="text" name="short"></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2"><input type="button" value="Submit" class="btn btn-primary" onclick="getvalidate();"></td>
                    </tr>
                    
                    
                </table>
            
    </div>  
    
    <div>
        <table>
            <tr>
                <td>
                    
                </td>
            </tr>
        </table>

    </div>
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
<script src="<%=ccp%>/assets/metro/js/custom.js"></script>
  
    <script type="text/javascript" language="javascript">
            $(function(){                
                $("#department").change(function(){    
                    $.getJSON("getMajorTaxType.jsp",{'state_code': $(this).val(), ajax: 'true'}, function(res){     
                        var options = '<option value="#"></option>';
                        var items = res.list;                        
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#majortaxtype").html(options);
                    })
                })
            });
        </script>
        
        
        
         <script type="text/javascript" language="javascript">
            $(function(){                
                $("#department").change(function(){    
                    $.getJSON("getMajorTaxTypeCode.jsp",{'state_code': $(this).val(), ajax: 'true'}, function(res){     
                        var options = '<option value="#"></option>';
                        var items = res.list;                        
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#majortaxtypecode").html(options);
                    })
                })
            });
        </script>
<script>
           function getvalidate()
                            {

                                var dept = document.frm.department.value;//department,majortax,short
                                var nameEx = /^[a-zA-Z ]+$/;
                                var nameEx2 = /^[a-zA-Z0-9 ]+$/;
                                var mtax = document.frm.majortax.value;
                                var scod = document.frm.short.value;
                                
                                if (dept=="#") {
                                    alert("Please Select The Department");
                                    document.frm.department.focus();
                                    return false;
                                }
                               else if (!mtax.match(nameEx)) {
                                    alert("Please fill alphabet Major Tax");
                                    document.frm.majortax.focus();
                                    return false;
                                } else if (!scod.match(nameEx)) {
                                    alert("Please fill alphabet Short Code");
                                    document.frm.short.focus();
                                    return false;
                                }
                                else
                                {
                                    frm.submit();
                                }
                               
                            }
</script>
  <%}%>
  </body>
</html>