<%@page import="vicclass.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.text.*, genericepayment.*" %>
<%String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
String msg=request.getParameter("msgcontact")!=null?request.getParameter("msgcontact"):"";
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <%@ include file="assets/metro/__inc/base_links.jsp"%>
        <title>JSP Page</title>
    </head>
    <body onload="getdept();">
 <!-- start: Header -->
<%@ include file="assets/metro/__inc/user_header.jsp"%>
<!-- start: Header -->

<div class="container-fluid-full">
  <div class="row-fluid"> 
    
    <!-- start: Main Menu -->
    <%@ include file="assets/metro/__inc/user_main_menu.jsp"%>
    <!-- end: Main Menu --> 
    
    <!-- start: Content -->
    <div id="content" class="span10">
                <div class="span12">
                     <div><font style="color: red"><%=msg%></font></div>
                    <form name="frmcntct" method="post" action="<%=ccp%>/GenericServlet">
                        <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                        <input type="hidden" name="step" value="16"/>
                        <div class="form-group span6">
                            <label class="span3" for="exampleName">Name</label>
                            <input class="span6" type="text" class="form-control" name="sname" id="sname" placeholder="Enter Name">
                        </div>
                        <div class="form-group span6">
                            <label class="span3" for="departmentName">Department Name</label>
                            
                           <select class="span6" id="department" name="department"> 
                                <option value="#">-----Select-----</option>
                                </select>
                        </div>
                         <div class="form-group span6">
                            <label class="span3" for="exampleIssue">Issue Subject</label>
                            <input class="span6" type="text" class="form-control" id="isuesubjct" name="isuesubjct" placeholder="Enter Issue Subject">
                        </div>
                        <div class="form-group span6">
                            <label class="span3" for="exampleEmail">Email</label>
                            <input class="span6" type="text" class="form-control" id="emaileda" name="email" placeholder="Enter Email">
                        </div>
                        <div class="form-group span6">
                            <label class="span3" for="exampleMessage">Message</label>
                            <input class="span6" type="text" class="form-control" id="mesg" name="mesg" placeholder="Enter Message">
                        </div> 
                        <button type="button" class="btn btn-default" onclick="fieldValidation()">Submit</button>
                    </form>
                </div>
                
            </div>
  <!--/#content.span10--> 
</div>
<!--/fluid-row-->
</div>
<div class="clearfix"></div>
<%@ include file="assets/metro/__inc/footer.jsp"%>

<!-- start: JavaScript--> 

<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script> 
<script type="text/javascript" language="javascript" src="<%=ccp%>/assets/metro/js/jquery-ui.js"></script> 
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<!--<script type="text/javascript" src="<%=ccp%>/bootstrap/js/combine.js"></script>--> 
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
<script type="text/javascript" src="<%=ccp%>/assets/metro/js/chartvalue.jsp"></script> 
            
             <script type="text/javascript">
                       function getdept(){
           
                $.post("<%=ccp%>/JsonService?step=departmnt", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-----SELECT-----</option>';
                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            options += '<option value="' + items[i].val + '"'+ x +'>' + items[i].txt + '</option>';
                        }
                        $("#department").html(options);
                },"json"); 
            };
                 
         function fieldValidation(){
                                  var isuesubjct=document.getElementById("isuesubjct").value;
                                  var mesg=document.getElementById("mesg").value;
                                 var alphbet = /^[a-zA-Z ]+$/;
                                    var alphnumr = /^[a-zA-Z0-9. ]+$/;
                                    var decregx = /^[a-zA-Z0-9. ]+$/;
                                    var amntegx = /^[0-9. ]+$/;
                                      var email = document.getElementById('emaileda').value;
                                   
                                    var atpos=email.indexOf("@");
                                    var dotpos=email.lastIndexOf(".");
                                 if(!document.frmcntct.sname.value.match(alphbet)){
                                    alert("Please! Enter Your Name");
                                    document.getElementById('sname').focus();
                                    return false;
                                }
                                else if(!document.frmcntct.isuesubjct.value.match(alphnumr)){
                                    alert("Please! Enter Your Subject");
                                    document.getElementById('isuesubjct').focus();
                                    return false;
                                } 
                              else if((atpos < 1) || ( dotpos - atpos < 2 )){
                                alert("Not a valid e-mail address!");
                                document.frmcntct.email.focus();
                                return false;
                            } 
                            else if(!document.frmcntct.mesg.value.match(alphnumr)){
                                    alert("Please Enter the Description");
                                    document.getElementById('mesg').focus();
                                    return false;
                                } 
                                else{
                                    frmcntct.submit();
                             }
                                 }
        
    </script>
    </body>
   
</html>
