<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%String msg=StringEscapeUtils.escapeHtml(request.getParameter("msg")); %>
<% 
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{ 

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
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>departmentLocation</title>
     <%@ include file="../assets/metro/__inc/base_links.jsp"%>
  </head>
  <body>
  <%@ include file="../assets/metro/__inc/header.jsp"%><!-- start: Header -->
  <div class="container-fluid-full">
    <div class="row-fluid"> <!-- start: Main Menu -->
        <%@ include file="../assets/metro/__inc/main_menu.jsp"%><!-- end: Main Menu --> 
            <div id="content" class="span10"><!-- start: Content -->
                <ul class="breadcrumb">
                    <li><i class="icon-home"></i> <a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a> <i class="icon-angle-right"></i></li>
                        <li><i class="icon-edit"></i> <a href="#">Add Department Location</a></li>
                </ul>
                <%if(msg!=null){%>
                    <div class="alert alert-block">
                        <h4 class="alert-heading"><%=msg%></h4>
                    </div>
                <%}%>
                    <div class="row-fluid sortable">
                        <div class="box span12">
                            <div class="box-header">
                                <h2><i class="fa fa-edit"></i><span class="break"></span>Add Department Location</h2>
                            </div>
                            <div class="box-content">
                                <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
                                    <input type="hidden" name="step" value="32">
                                        <table class="table table-striped table-bordered bootstrap-datatable datatable">          
                                            <tr>
                                                <th>Department</th>
                                                <td>
                                                    <%if(al!=null){
                                                        Iterator it=al.iterator();
                                                    %>
                                                    <select name="department" id="department" >
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
                                                <th>Address</th>
                                                <td><textarea rows="" cols="" name="address" class="span6"></textarea></td>
                                            </tr>
                                            <tr>
                                                <th>State</th>
                                                <td>
                                                    <select name="state" id="userstate" class="span6"  onChange="javascript:setCookie('userstate');" >
                                                        <option value="34">Loading </option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>City</th>
                                                <td>
                                                    <select  name="city" id="usercity"  class="span6"  onchange="javascript:setCookie('usercity');">
                                                        <option value="#">-------SELECT------- </option>
                                                    </select>
                                                </td>
                                            </tr>
                                             <tr>
                                                <th>Pin Code</th>
                                                <td><input type="text" name="pincode" maxlength="6" class="span6"></td>
                                            </tr>
                                            <tr>
                                                <th>Mobile No</th>
                                                <td><input type="text" name="mobile" maxlength="10" class="span6"></td>
                                            </tr>
                                             <tr>
                                                <th>email Id</th>
                                                <td><input type="text" name="email" class="span6"></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><input type="submit"  class="btn btn-primary" value="Submit"></td>
                                            </tr>
                                        </table>
                                </form>
                            </div>
                        </div>
                    </div>
            </div><!--/.fluid-container--> 
    </div><!-- end: Content -->
  </div><!--/#content.span10--> 
<!--/fluid-row-->

<div class="clearfix"></div>
<%@ include file="../assets/metro/__inc/footer.jsp"%> 

<script  type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script>
  <script type="text/javascript" language="javascript">
	
	
	

	$(document).ready(function(){
                    $.getJSON("<%=ccp%>/json/states.txt", function(res){ 
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;       
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
							if(items[i].state_code==34){
                       			options += '<option value="' + items[i].state_code + '" Selected>' + items[i].state_name + '</option>';
							}else{options += '<option value="' + items[i].state_code + '"'+ x +'>' + items[i].state_name + '</option>';}                          
                        }
                        $("#userstate").html(options);
                    })
					$.getJSON("<%=ccp%>/json/districts.txt", function(res){ 
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;       
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                        if(items[i].state_code==$("#userstate").val()){
                            options += '<option value="' + items[i].district_code + '"'+ x +'>' + items[i].district_name + '</option>';
                            }
                        }
                        $("#usercity").html(options);
                    })
                });
         $(function(){                
                $("#userstate").change(function(){      
                    $.getJSON("<%=ccp%>/json/districts.txt", function(res){ 
                        var options = '<option value="#">-----SELECT-----</option>';
                        var items = res.list;       
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                        if(items[i].state_code==$("#userstate").val()){
                            options += '<option value="' + items[i].district_code + '"'+ x +'>' + items[i].district_name + '</option>';
                            }
                        }
                        $("#usercity").html(options);
                    })
                })
            });
			
 function setCookie(cname)
	{
	cvalue=$('#'+cname).val();
	var d = new Date();
	d.setTime(d.getTime()+(1*24*60*60*1000));
	var expires = "expires="+d.toGMTString();
	document.cookie = cname + "=" + cvalue + "; " + expires;

	}
function getCookie(cname)
{
var name = cname + "=";
var ca = document.cookie.split(';');
for(var i=0; i<ca.length; i++) 
  {
  var c = ca[i].trim();
  if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
return "";
}	

		
    </script>
<%}%>
  </body>
</html>