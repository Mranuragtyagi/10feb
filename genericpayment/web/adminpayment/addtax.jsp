<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="java.util.*,genericepayadmin.* " %>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
 <% 
if (request.getSession().getAttribute("user")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
String msg=StringEscapeUtils.escapeHtml(request.getParameter("msg")!=null?request.getParameter("msg"): "") ;
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
<title>Add Tax Xml | Payonline Jharkhand</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
     <link rel="stylesheet" type="text/css" href="<%=ccp%>/assets/metro/css/jquery-ui.css" >
  </head>
     <body onload="enableInputText()">
     
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
                                <a href="#">Add Sub Tax/Fee</a>
                            </li>
			</ul>
			<div class="row-fluid sortable">
                            <div class="box span12">
                                <div class="box-header" data-original-title>
                                    <h2><i class="halflings-icon edit"></i><span class="break"></span>Add Sub Tax/Fee</h2>
                                </div>
                              <%=msg%>
                                <form action="<%=ccp%>/GenericAdminServlet" method="POST" name="frm">
                                        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" id="step" value="3">
                              
                                <div class="box-content">
                                    <table class="table table-bordered table-hover">
                                        <tr>
                                            <th>Department</th>
                                            <td><%if(al!=null){
                                                Iterator it=al.iterator();
                                                %>
                                                    <select name="department" id="department" onchange="getMajor();">
                                                    <option value="#">-------Select------- </option>
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
                                            <th>Major Tax</th>
                                            <td><select id="majortaxtype" name="majortaxtype">
                                            	<option value="#">-----Select-----</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Tax Type</th>
                                            <td><input type="text" name="taxtype"  id="taxtype" ></td>
                                        </tr>
                                        <tr>
                                            <th>Short Code</th>
                                            <td><input type="text" name="taxtypecode"  id="taxtypecode"></td>
                                        </tr>
                                        <tr>
                                            <th>Treasury Head Code</th>
                                            <td><input type="text" name="treasury"  id="treasury" maxlength="30" ></td>
                                        </tr>
                                        <tr>
                                            <th>Description</th>
                                            <td><input type="text" name="desc" id="desc"></td>
                                        </tr>
                                        <tr>
                                            <th>Amount</th>
                                            <td><input type="text" name="amount" id="amount" > &nbsp;&nbsp;&nbsp;<input type="checkbox" name="chk" id="chk" value="Fixd" onclick="javascript:enableInputText();">Fixed</td>                
                                        </tr>
                                        <tr id="abc">
                                            <td align="center" colspan="2"><input type="button"  class="btn btn-primary" value="Add" onclick="fieldValidation();"></td><!-- onclick="fieldValidation();"-->
                                        </tr>
                                    </table>
                                </div>
                                </form>	
                            </div><!--/span-->
                             
                        </div>
                    </div><!--/.fluid-container-->
			<!-- end: Content -->
                </div><!--/#content.span10-->
            </div>
            <!--/fluid-row-->
      
            <div class="clearfix"></div>
                <%@ include file="../assets/metro/__inc/footer.jsp"%>
                <%}%>
	<!-- start: JavaScript-->
		<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
                <script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script>
                <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
                <script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
                <script type="text/javascript">
                function enableInputText(){
                    var val=document.getElementById('chk').value;
                        if(document.getElementById('chk').checked){
                            document.getElementById('amount').disabled='';
                        }else{
                     document.getElementById('amount').disabled='true';
                     document.getElementById('amount').value='';
                }
            }
			 function fieldValidation(){
                        	  var name=document.getElementById("department").value;
                                  var majrtax=document.getElementById("majortaxtype").value;
                                   var name=document.getElementById("taxtype").value;
                                     var name=document.getElementById("treasury").value;taxtypecode
                                     var shrcod=document.getElementById("taxtypecode").value;//chk
                                     var chk=document.getElementById("chk").value;
			  var numbers = /^[0-9]+$/;
                          var alphbet = /^[a-zA-Z ]+$/;
                          var alphnumr = /^[a-zA-Z0-9 ]+$/;
                          var decregx = /^[a-zA-Z0-9. ]+$/;
                          var amntegx = /^[0-9. ]+$/;
         if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Enter the Department");
                document.getElementById('department').focus();
                return false;
            }  else if((document.frm.majortaxtype.value == '#')||(document.frm.majortaxtype.value =="")){
                alert("Enter the MajorTax");
                document.getElementById('majortaxtype').focus();//shrcod
                return false;
            }  	
            else if((document.frm.taxtype.value == "")||(document.frm.taxtype.value ==null)||(!document.frm.taxtype.value.match(alphbet))){
                alert("Enter the alphabetical tax type");
                document.getElementById('taxtype').focus();
                return false;
            }
            else if((document.frm.taxtypecode.value == "")||(document.frm.taxtypecode.value ==null)||(!document.frm.taxtypecode.value.match(alphnumr))){
                alert("Enter the Short Code");
                document.getElementById('taxtypecode').focus();
                return false;
            }           else if((document.frm.treasury.value == "")||(document.frm.treasury.value == null)||(!document.frm.treasury.value.match(numbers))){
                alert("Enter the treasury code in digits");
                document.getElementById('treasury').focus();
                return false;
            }     else if((document.frm.desc.value == "")||(document.frm.desc.value == null)||(!document.frm.desc.value.match(decregx))){
                alert("Enter the Description");
                document.getElementById('desc').focus();
                return false;
            }   else if((document.getElementById('chk').checked)&&(!document.frm.amount.value.match(amntegx))){
                  alert("Enter the Amount");
                document.getElementById('amount').focus();
               return false;
           } 
            else{
                frm.submit();
           }
        }
    </script>                                
    <script type="text/javascript" language="javascript">
           function getMajor(){
                var departmentval = $("#department").val();
                $.post("<%=ccp%>/JsonService?step=majortaxtype&state_code="+departmentval, function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#majortaxtype").html(options);
                },"json"); 
            };
        </script>	<!-- end: JavaScript-->

</body>

</html>

