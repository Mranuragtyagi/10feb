<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>

<%

if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
} else{
String msg=request.getParameter("msg")!=null?request.getParameter("msg"):"";%>
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
	<title>Unlock Tax  | Payonline Jharkhand</title>
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
					<a href="#">Unlock Sub Tax/Fee</a>
				</li>
		
				
			</ul>
  <div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Unlock Sub Tax/Fee</h2>
						
					</div>
					<div class="box-content">

  
  <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
      <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
  <input type="hidden" name="step" value="25">
  <%if(msg!=null){%>
  <div><font color="Green"><%=msg%></font></div>
  <%}%>
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
                         <option value="<%=cfrb.getDeptid()!= null ? cfrb.getDeptid():null%>"><%=cfrb.getDepartment()!=null?cfrb.getDepartment():""%></option>
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
                    <th>Traesury Head Code</th>
                    <td><input type="text" name="treasury"  id="treasury" required></td>
            </tr>
            <tr>
                <td align="center" colspan="2"><input type="submit"  class="btn btn-primary"  name="unlock" id="unlock" value="Unlock" onclick="getvalidate();"></td>
            </tr>
            </table>
            <div id="myscript"></div>
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

            
    
    <script type="text/javascript" language="javascript"> 
        function getTaxType(){
                 var dept = $("#department").val();
                var majrtax = $("#majortaxtype").val();
                $.post("<%=ccp%>/JsonService?step=getLockText&majrtax="+majrtax+"&dept="+dept, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#taxtype").html(options);
                },"json"); 
            };
             /*    $(function(){                
                $("#majortaxtype").change(function(){    
                    $.getJSON("getLockTaxType.jsp",{'majrtax': $(this).val(),'dept': $(department).val(), ajax: 'true'}, function(res){     
                        var options = '<option value="#">-----SELECT-----</option>';
                      var items = res.list;                        
                       var x = '';
                        for (var i = 0; i < items.length; i++) {
                          options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                       }
                        $("#taxtype").html(options);
                    })
                })
            }); */
        </script> 
        
         <script type="text/javascript" language="javascript">
     
      function show(){
        $.ajax({ 
            type: 'POST',  url: '<%=ccp%>/adminpayment/getLockTrasuryHeadCode.jsp', data: { dept: $('#department').val(),taxtype: $('#taxtype').val(),mjrtax: $('#majortaxtype').val()}
            }).done(function(msg){
                $('#myscript').html(msg);
            });
          
        }
        </script>
       
                
                <script type="text/javascript" language="javascript">
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
               /* $(function(){
                $("#department").change(function(){    
                    $.getJSON("getMajorTaxType.jsp",{'state_code': $(this).val(), ajax: 'true'}, function(res){     
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
                    
        </script>
                <script>
                     function getvalidate()
            {

                var dept = document.frm.department.value;////department,majortaxtype,taxtype,treasury
                var mtax = document.frm.majortaxtype.value;
                var taxtype = document.frm.taxtype.value;
                var treasury = document.frm.treasury.value;
                if (dept == "#") {
                    alert("Please Select the Department Name ");
                    document.frm.department.focus();
                    return false;
                }
                if (mtax == "#") {
                    alert("Please Select Major Tax");
                    document.frm.majortax.focus();
                    return false;
                }
                if (taxtype == "#")
                {
                    alert("Please fill the Tax Type");
                    document.frm.short.focus();
                    return false;
                }

                if (treasury == "")
                {
                    alert("Please fill the Treasury Head Code");
                    document.frm.short.focus();
                    return false;
                }
            }
            </script>
<%}%>
  </body>
</html>
