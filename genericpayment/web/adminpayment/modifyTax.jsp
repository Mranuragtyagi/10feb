<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="java.util.*,genericepayadmin.* " %>
 <% if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
   
    String action=request.getParameter("action")!=null?request.getParameter("action"): "";
    String dep=(String)request.getAttribute("dep");
      String msg=StringEscapeUtils.escapeHtml(request.getParameter("msg"));
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
<html lang="en">
<head>
	
	<!-- start: Meta -->
	<title>Comtax Xml | Payonline Jharkhand</title>
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
					<a href="#">Modify Sub Tax/Fee</a>
				</li>
			</ul> <%if(msg!=null){%>
      <div class="alert alert-block">
        <h4 class="alert-heading"><%=msg%></h4>
      </div>
      <%}%>
           
			<div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Modify Sub Tax/Fee</h2>
						
					</div>
					<div class="box-content">
                     
<form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
         
  <input type="hidden" name="step" value="7">
   <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
  <input type="hidden" name="actn" id="actn" value="">
  <input type="hidden" name="deid" id="deid" value="<%=dep!=null?dep :""%>">
  <%if(action=="" || action.equals("")){%>
 <table class="table table-striped table-bordered bootstrap-datatable datatable">          
            
   <tr>
                <th>Department</th>
                <td><%if(al!=null){
                Iterator it=al.iterator();
                %>
                <select name="department" id="department" onchange="getMajor();" >
                        <option value="#">-------select------- </option>
                     <%
                        while(it.hasNext()){                          
                            GenericAdminBean cfrb=(GenericAdminBean) it.next();%>                    
                         <option value="<%=cfrb.getDeptid()!= null?cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
                    <%}%>
                    </select>
                    <%}%>
                </td>
               </tr>
                <tr>
                <th>Major Tax</th>
                <td>  <select id="majortaxtype" name="majortaxtype" onchange="getTaxType();">
                                            	<option value="#">-----Select-----</option>
                                            </select></td>
                <!--input type="text" name="taxtype"  id="taxtype" required-->
            </tr>
            <tr>
                <th>Tax Type</th>
               <td>  <select id="taxtype" name="taxtype" onchange="show();">
                                            	<option value="#">-----SELECT-----</option>
                                            </select></td>
                <!--input type="text" name="taxtype"  id="taxtype" required-->
            </tr>
            <tr>
                    <th>Treasury Head Code</th>
                    <td><input type="text" name="treasury"  id="treasury" required></td>
            </tr>
            <tr>
                <th>Description</th>
                <td><input type="text" name="desc" id="desc"></td>
            </tr>
            <tr>
                <td align="center" colspan="2"><input type="button"  class="btn btn-primary btn-small" name="edit" id="edit" value="Edit" onclick=" fieldValidation(); ">
              <input type="button"  class="btn btn-primary btn-small"  name="del" id="del" value="Delete" onclick="fieldValidationDel(); " ></td>
            </tr>
        </tr>
    </table>
     <div id="myscript"></div>
    <%}%>
  </form>
   <%if(action!=""){%>
   <form action="<%=ccp%>/GenericAdminServlet" name="" method="POST">
        <input type="hidden" name="step" value="6">
         <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
  <input type="hidden" name="deid" value="<%=dep%>">
  <%if(action.equals("edit")){%>
  <table>
    <tr>
        <th>Department</th>
        <td><input type="text" class="btn btn-primary btn-small" name="department" value="<%=request.getParameter("deprtmnt")!=null?request.getParameter("deprtmnt") :""%>"></td>
        <td><input type="submit" class="btn btn-primary btn-small" value="Submit"></td>
    </tr>
  </table>
  <%}else if(action.equals("deletSuccess")){%>
    <div class="success"><font color="Green">Deleted Successfully</font></div>
        
  <%}else if(action.equals("editSuccess")){%>
   <div class="success"><font color="Green">Updated Successfully</font></div>
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
	
	
	<!-- start: JavaScript-->

		<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 


  <script>
		
		 function fieldValidation(){
				  var name=document.getElementById("department").value;
                                  var name=document.getElementById("taxtype").value;
                                   var name=document.getElementById("desc").value;
            if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Enter the Department");
                document.getElementById('department').focus();
                return false;
            }else if((document.frm.taxtype.value == '#')||(document.frm.taxtype.value =="")){
                alert("Enter the tax type");
                document.getElementById('taxtype').focus();
                return false;
            }else  if((document.frm.desc.value == "")||(document.frm.desc.value ==null)){
                alert("Enter Desc");
                document.getElementById('desc').focus();
                return false;
            }else{
                a();
            }
	}
                         
                         function fieldValidationDel(){
                 var name=document.getElementById("department").value;
                 var name=document.getElementById("taxtype").value;
                 var name=document.getElementById("desc").value;
            if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Enter the Department");
                document.getElementById('department').focus();
                return false;
            }else if((document.frm.taxtype.value == '#')||(document.frm.taxtype.value =="")){
                alert("Enter the tax type");
                document.getElementById('taxtype').focus();
                return false;
            }else  if((document.frm.desc.value == "")||(document.frm.desc.value ==null)){
                alert("Enter Desc");
                document.getElementById('desc').focus();
                return false;
            }else{
                b();
            }
			 }
		</script>
         <script type="text/javascript">
        function a(){
           var a = document.frm.edit.value;
                if(a=='Edit'){
                    document.frm.actn.value="edit";
                    document.frm.submit();
                }
        }
        
        function b(){
         var b = document.frm.del.value;
                if(b=='Delete'){
                    document.frm.actn.value="del";
                    document.frm.submit();
                }
        }
    </script>
    
    
   <script type="text/javascript" language="javascript"> 
        /*$(function(){                
                  $("#majortaxtype").change(function(){    
                    $.getJSON("<%=ccp%>/adminpayment/getTaxTypeByDepartment.jsp",
                    {'majrtax': $(this).val(),'dept': $(department).val(), ajax: 'true'}, function(res){     
                        var options = '<option value="#">-----SELECT-----</option>';
                      var items = res.list;                        
                       var x = '';
                        for (var i = 0; i < items.length; i++) {
                          options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                       }
                        $("#taxtype").html(options);
                        })
                    });
                
            });*/
         function getTaxType(){
                 var dept = $("#department").val();
                var majrtax = $("#majortaxtype").val();
                $.post("<%=ccp%>/JsonService?step=getTaxTypeDept&majrtax="+majrtax+"&dept="+dept, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#taxtype").html(options);
                },"json"); 
            };
        </script> 
        
         <script type="text/javascript" language="javascript">
     
      function show(){
        $.ajax({ 
            type: 'POST',  url: '<%=ccp%>/adminpayment/getTaxType.jsp', data: { dept: $('#department').val(),taxtype: $('#taxtype').val(),mjrtax: $('#majortaxtype').val()}
            }).done(function(msg){
                $('#myscript').html(msg);
            });
          
        }
        </script>
       <script type="text/javascript" language="javascript">
           /* $(function(){
                $("#department").change(function(){    
                    $.getJSON("%=ccp%>/adminpayment/getMajorTaxType.jsp",{'state_code': $(this).val(), ajax: 'true'}, function(res){     
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;                        
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#majortaxtype").html(options);
                    })
                })
            });*/
           
            function getMajor(){
                var departmentval = $("#department").val();
                $.post("<%=ccp%>/JsonService?step=getMajorTaxType&state_code="+departmentval, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#majortaxtype").html(options);
                },"json"); 
            };
        </script>
        	<%}%>
</body>
</html>
