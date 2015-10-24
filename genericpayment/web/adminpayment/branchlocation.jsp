<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="org.apache.commons.lang.StringEscapeUtils" %>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%
    String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
    String msg = StringEscapeUtils.escapeHtml(request.getParameter("msg"));
    if (request.getSession().getAttribute("user") == null){
        response.sendRedirect("http://" + request.getHeader("HOST") + request.getContextPath() + "/logout.jsp");
    }else{
        String sql = "select initcap(DEPT_NAME) as DEPT_NAME,DEPT_ID from generic_dept where STATUS=? ";
        java.sql.PreparedStatement stmt = null;
        vicclass.User u = (vicclass.User) request.getSession().getAttribute("user");
        java.sql.Connection con = null;
        con = u.getConnection();
        ArrayList al = new ArrayList();
        java.sql.ResultSet rs = null;
        try{
            stmt = con.prepareStatement(sql);
            stmt.setString(1, "A");
            rs = stmt.executeQuery();
            while (rs.next()){
                GenericAdminBean genericbean = new GenericAdminBean();
                genericbean.setDepartment(rs.getString("DEPT_NAME"));
                genericbean.setDeptid(rs.getString("DEPT_ID"));
                al.add(genericbean);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(stmt != null){stmt.close();}
                if (rs != null){rs.close();}
            }catch (Exception e){
                System.out.println(e.getMessage());
            }
        }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <title>Branch-Location</title>
        <%@ include file="../assets/metro/__inc/base_links.jsp" %>
    </head>
    <body onload="getState();getDist();">
        <%@ include file="../assets/metro/__inc/header.jsp"%><!-- start: Header -->
        <div class="container-fluid-full">
            <div class="row-fluid"> <!-- start: Main Menu -->
                <%@ include file="../assets/metro/__inc/main_menu.jsp"%><!-- end: Main Menu --> 
                <div id="content" class="span10"><!-- start: Content -->
                    <ul class="breadcrumb">
                        <li><i class="icon-home"></i> <a href=<%=ccp%>/adminpayment/adminContent.jsp>Home</a> <i class="icon-angle-right"></i></li>
                        <li><i class="icon-edit"></i> <a href="#">Add Department Location</a></li>
                    </ul>
                    <%if(msg != null){%>
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
                                <form action="<%=ccp%>/BranchMaster" method="POST" name="frm">
                                      <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                    <input type="hidden" name="step" value="1">
                                    <table class="table table-striped table-bordered bootstrap-datatable datatable">
                                        <tr>
                                            <th>Department</th>
                                            <td>
                                                <%
                                                    if(al != null){
                                                        Iterator it = al.iterator();
                                                %>
                                                <select name="department" id="department" class="span6">
                                                    <option value="">-select-</option>
                                                    <%
                                                        while (it.hasNext()){
                                                            GenericAdminBean cfrb = (GenericAdminBean) it.next();
                                                    %>
                                                    <option value="<%=cfrb.getDeptid() != null ? cfrb.getDeptid() : null%>"><%=cfrb.getDepartment() != null ? cfrb.getDepartment() : ""%></option>
                                                    <%}%>
                                                </select>
                                                <%}%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>State</th>
                                            <td>
                                                <select name="state" id="userstate" class="span6"  onChange="javascript:setCookie('userstate');getOnchangDist();getParent();" >
                                                    <option value="34">Loading </option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>City</th>
                                            <td>
                                                <select  name="city" id="usercity"  class="span6"  onchange="javascript:setCookie('usercity');">
                                                    <option value="">-select-</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Parent</th>
                                            <td>
                                                <select name="parent" id="parent" class="span6">
                                                    <option value="0">-select-</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Branch Address</th>
                                            <td>
                                                <textarea name="branchaddress" class="span6" cols="2"></textarea>
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>PIN</th>
                                            <td><input type="text" name="pin" class="span6" maxlength="6"></td>
                                        </tr>
                                        <tr>
                                            <th>Branch Name</th>
                                            <td><input type="text" name="branchname" class="span6"></td>
                                        </tr>
                                        <tr>
                                            <th>Abbrevation</th>
                                            <td><input type="text" name="abbrevation"  class="span6"></td>
                                        </tr>
                                        <tr>
                                            <td align="center"><input type="submit"  class="btn btn-primary" value="Submit" onclick="return fieldValidation();"></td>
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
          
            
             function getState(){
                $.post("<%=ccp%>/JsonService?step=states", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            if(items[i]){
                                x=''
                            }
                            
                            options += '<option value="' +items[i].state_code+ '"' + x + '>' + items[i].state_name + '</option>';
                        }
                        $("#userstate").html(options);
                },"json"); 
            };
             function getDist(){
                $.post("<%=ccp%>/JsonService?step=dist", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++){
                            if(items[i]){
                               x=''
                            }else{
                                x=''
                            }
                        }
                        $("#usercity").html(options);
                },"json"); 
            };
            
         
              function getOnchangDist(){
                $.post("<%=ccp%>/JsonService?step=distonchng", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++){
                             if (items[i].state_code === $("#userstate").val()){
                                options += '<option value="' + items[i].district_code + '"' + x + '>' + items[i].district_name + '</option>';
                            }
                        }
                        $("#usercity").html(options);
                },"json"); 
            };
                
                       function getParent(){
                           
                var departmentval = $("#department").val();
                var userstate = $("#userstate").val();
                $.post("<%=ccp%>/JsonService?step=getParent&dept="+departmentval+"&state="+userstate, function(data){ 
                    var items = data.list;
                      var options = '<option value="0">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#parent").html(options);
                },"json"); 
            };
                
                
            function setCookie(cname){
                cvalue = $('#' + cname).val();
                var d = new Date();
                d.setTime(d.getTime() + (1 * 24 * 60 * 60 * 1000));
                var expires = "expires=" + d.toGMTString();
                document.cookie = cname + "=" + cvalue + "; " + expires;
            }
            function getCookie(cname){
                var name = cname + "=";
                var ca = document.cookie.split(';');
                for(var i = 0; i < ca.length; i++){
                    var c = ca[i].trim();
                    if (c.indexOf(name) === 0){
                        return c.substring(name.length, c.length);                        
                    }
                }
                return "";
            }
        </script>
                                <script>
		//department,state,city,parent,branchaddress,pin,branchname,abbrevation
		 function fieldValidation(){
                    
				  var name=document.getElementById("department").value;
                                   var state=document.frm.state.value;
                                    var city=document.frm.city.value;
                                     var parent=document.frm.parent.value;
                                      var branchaddress=document.frm.branchaddress.value;
                                       var pin=document.frm.pin.value;
                                        var branchname=document.frm.branchname.value;
                                         var abbrevation=document.frm.abbrevation.value;
                                         
            if((document.frm.department.value == '#')||(document.frm.department.value =="")){
                alert("Please Select the Department");
                document.frm.department.focus();
                return false;
            }
           else if((document.frm.state.value == '#')||(document.frm.state.value =="")){
                alert("Please Select the State");
                document.frm.state.focus();
                return false;
            }else if((document.frm.city.value == '#')||(document.frm.city.value =="")){
                alert("Please Select the City");
                document.frm.city.focus();
                return false;
            }else if((document.frm.branchaddress.value == '#')||(document.frm.branchaddress.value =="")){
                alert("Enter the Branchaddress");
                document.frm.branchaddress.focus();
                return false;
            }else if((document.frm.pin.value == '#')||(document.frm.pin.value =="")){
                alert("Enter the Pincode");
                document.frm.pin.focus();
                return false;
            }else if((document.frm.branchname.value == '#')||(document.frm.branchname.value =="")){
                alert("Enter the Branchname");
                document.frm.branchname.focus();
                return false;
            }else if((document.frm.abbrevation.value == '#')||(document.frm.abbrevation.value =="")){
                alert("Enter the Abbrevation");
                document.frm.abbrevation.focus();
                return false;
            }
		 }
		 </script>
        <%}%>
    </body>
</html>