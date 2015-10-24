<!DOCTYPE html>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";

if(request.getSession().getAttribute("fastbean")==null){
    response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{
%>
<html lang="en">
    <head>
        <title>Register | Government of Jharkhand Electronic Revenue Receipt Portal</title>
        <%@ include file="../assets/metro/__inc/base_links_payment_page.jsp"%>
        <link id="base-style-responsive" href="../assets/metro/css/cmxform.css" rel="stylesheet">
    </head>
    <body onload="getState();getDist();">
        <!-- start: Header -->
        <%@ include file="../assets/metro/__inc/user_header.jsp"%>

        <div class="container-fluid-full" style="height:auto !important;">
            <div class="row-fluid"> 

                <!-- start: Main Menu -->
                <%@ include file="../assets/metro/__inc/user_main_menu.jsp"%>
                <div id="content" class="span10 nopadd">
                    <div class="row-fluid">
                        <div class="well" style="min-height:600px;  margin-bottom:0px;">

                            <form action="<%=ccp%>/GenericServlet" method="post" name="frm">
                                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
                                <input type="hidden" name="step" value="3">
                                <fieldset> <legend>Complete Your Registration </legend></fieldset>
                                <table class="table ">
                                    <tr>
                                        <th>Address</th>
                                        <td><textarea name="address" class="span6" autocomplete="off"></textarea></td>
                                    </tr>
                                    <tr>
                                        <th>State</th>
                                        <td>
                                            <select name="state" id="userstate" class="span6" autocomplete="off"  onChange="javascript:setCookie('userstate');" >
                                                <option value="34">Loading </option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>City</th>
                                        <td><select  name="city" id="usercity"  class="span6" autocomplete="off"  onchange="javascript:setCookie('usercity');">
                                                <option value="#">-------SELECT------- </option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Pin Code</th>
                                        <td><input type="text" name="pincode" autocomplete="off" maxlength="6" class="span6"></td>
                                    </tr>
                                    <tr>
                                        <th>Security Question</th>
                                        <td>
                                            <select  id="question" name="question" class="span6">
                                                <option value="#" selected>-------SELECT------- </option>
                                                <option value="Your Hobbies">Your Hobbies</option>
                                                <option value="Your Place Of Birth">Your Place Of Birth</option>
                                                <option value="Your First School Name">Your First School Name</option>
                                                <option value="Your childhood hero" >Your childhood hero</option>
                                                <option value="Your favorite sports team" >Your favorite sports team</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Enter Answer</th>
                                        <td><input type="text" name="eanswer" autocomplete="off" class="span6"></td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2"><input type="button" class="btn btn-warning" value="Submit" onclick="detailsValidation();"></td>
                                    </tr>
                                </table>
                                <%--
                                    String firstname = request.getParameter("firstname");
                                    String emaill = request.getParameter("email");
                                    String mobile = request.getParameter("phonenumber");
                                    String password = request.getParameter("password1");
                                    String confirmpass = request.getParameter("confirmpassword");

                                    GenericFastBean fastbean = new GenericFastBean();
                                    fastbean.setName(firstname);
                                    fastbean.setEmail(emaill);
                                    fastbean.setPhone(mobile);
                                    fastbean.setPwd(password);
                                    fastbean.setConfirmpwd(confirmpass);

                                    request.getSession().setAttribute("fastbean", fastbean);
                                --%>
                            </form>
                        </div></div></div></div></div>
        <div class="clearfix"></div>
        <%@ include file="../assets/metro/__inc/footer.jsp"%>
        <script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
        <script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
        <!--script src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script-->
        <script type="text/javascript" src="<%=ccp%>/assets/metro/js/custom.js"></script> 
        <script type="text/javascript">
                            function detailsValidation() {
                                var address = document.frm.address.value;
                                var addressRegex = /^[0-9a-zA-Z-/,. ]+$/;
                                var cityValidate = document.frm.city.value;
                                var pincode = document.frm.pincode.value;
                                var pincodeRegex = /^\d{6}$/;
                                var question = document.frm.question.value;
                                var eanswer = document.frm.eanswer.value;
                                var answerRegex = /^[a-zA-Z]+$/;

                                if (!address.match(addressRegex)) {
                                    alert("Please enter the valid address!");
                                    document.frm.address.focus();
                                    return false;
                                } else if (cityValidate == '#') {
                                    alert("Please select the city!");
                                    document.frm.city.focus();
                                    return false;
                                } else if (!pincode.match(pincodeRegex)) {
                                    alert("Please enter the valid pincode!");
                                    document.frm.pincode.focus();
                                    return false;
                                } else if (question == '#') {
                                    alert("Please select the question!");
                                    document.frm.question.focus();
                                    return false;
                                } else if (!eanswer.match(answerRegex)) {
                                    alert("Please enter the answer!");
                                    document.frm.eanswer.focus();
                                    return false;
                                } else {
                                    document.frm.submit();
                                }
                            }
        </script>
        <script type="text/javascript" language="javascript">

            
             
            $(document).ready(function() {
                
             

                $.post("<%=ccp%>/JsonService?step=states", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            if(items[i].state_code == 34){
                                x='selected'
                            }else{
                                x=''
                            }
                            options += '<option value="' +items[i].state_code+ '"' + x + '>' + items[i].state_name + '</option>';
                        }
                        $("#userstate").html(options);
                },"json"); 
               $.post("<%=ccp%>/JsonService?step=dist", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++){
                            if(items[i].state_code == 34){
                                x='selected'
                                options += '<option value="' + items[i].district_code + '"' + x + '>' + items[i].district_name + '</option>';
                            }else{
                                x=''
                            }
                        }
                        $("#usercity").html(options);
                },"json"); 

            });
            $(function() {
               $("#userstate").change(function() {
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
                })
            });
          
        </script>
        <%}%>
    </body>
</html>