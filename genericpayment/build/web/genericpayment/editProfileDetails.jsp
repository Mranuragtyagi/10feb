<!DOCTYPE html>
<% String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="genericepayment.*"  %>

<%if (request.getSession().getAttribute("userloggedin")==null){
response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/logout.jsp");
}else{%>
<%
String email=request.getSession().getAttribute("email")!=null?(String)request.getSession().getAttribute("email") : "";
GenericBean signupbean=request.getSession().getAttribute("signupbean")!=null?(GenericBean)request.getSession().getAttribute("signupbean") : new GenericBean();
String msg=request.getParameter("msg")!=null?request.getParameter("msg") : "";
String editProfileErrorMsg=request.getAttribute("editProfileErrorMsg")!=null?(String)request.getAttribute("editProfileErrorMsg") : "";
%>
<html lang="en">
<head>
 <title>Change Profile Details | Payonline</title>
	 <%@ include file="../assets/metro/__inc/base_links.jsp"%>
     <link id="base-style-responsive" href="../assets/metro/css/cmxform.css" rel="stylesheet">
<script type="text/javascript">
function editProfileValidation(){ 
    var firstname=document.frm.firstname.value;
     var nameEx=/^[a-zA-Z ]+$/;
    var phonenumber=document.frm.phonenumber.value;
    var mobileEx=/^\d{10}$/;  
    var address=document.frm.address.value;
    var addressRegex=/^[0-9a-zA-Z-/, ]+$/;
     var stateValidate=document.frm.state.value;
    var cityValidate=document.frm.city.value;
    var pincode=document.frm.pincode.value;
    var pincodeRegex=/^\d{6}$/;
    var question=document.frm.question.value;
    var eanswer=document.frm.eanswer.value;
    var answerRegex=/^[a-zA-Z]+$/

 if(!firstname.match(nameEx)){
    alert("Please Enter Valid Name!");
    document.frm.firstname.focus();
    return false;
  }else if(!mobileEx.test(phonenumber)){
        alert("Please Enter Valid Mobile No!");
        document.frm.phonenumber.focus();
        return false;
    }else if(!address.match(addressRegex)){
     alert("Please enter the valid address!");
     document.frm.address.focus();
     return false;
}else if(stateValidate=='#'){
     alert("Please select the state!");
     document.frm.state.focus();
     return false;
}else if(cityValidate=='#'){
     alert("Please select the city!");
     document.frm.city.focus();
     return false;
}else if(!pincode.match(pincodeRegex)){
     alert("Please enter the valid pincode!");
     document.frm.pincode.focus();
     return false;
}else if(question=='#'){
     alert("Please select the question!");
     document.frm.question.focus();
     return false;
}else if(!eanswer.match(answerRegex)){
     alert("Please enter the answer!");
     document.frm.eanswer.focus();
     return false;
}else{
document.frm.submit();
}
}
</script>


 </head>

<body onload="getState();getDist();">
		<!-- start: Header -->
        <%@ include file="../assets/metro/__inc/user_header.jsp"%>
		<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<%@ include file="../assets/metro/__inc/user_main_menu.jsp"%>
			<!-- end: Main Menu -->
			
			<!-- start: Content -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="<%=ccp%>/genericpayment/userContent.jsp">Home</a>
					<i class="icon-angle-right"></i> 
				</li>
				<li>
					<i class="icon-edit"></i>
					<a href="#">Profile Setting</a>
				</li>
			</ul>
           
			<div class="row-fluid sortable">
            
				<div class="box span12">
					<div class="box-header" data-original-title>
						<h2><i class="fa fa-edit"></i><span class="break"></span>Profile Setting</h2>
					</div>
					<div class="box-content">
                                        <div><font color="Red"><%=msg%></font></div>
                                         <div><font color="Red"><%=editProfileErrorMsg%></font></div>
                  <form accept-charset="UTF-8" class="cmxform" id="signupForm" action="<%=ccp%>/GenericServlet" method="post" name="frm">
                  <input type="hidden" name="step" value="9">
                  <input type="hidden" name="email" value="<%=email%>" >
                  <table align="center" class="table table-bordered">
      <tr>
      <th>Full Name</th>
        <td><input  id="firstname" name="firstname" value="<%=signupbean.getDlrname()!=null?signupbean.getDlrname() : ""%>" placeholder="Full Name"  type="text" ></td>
      </tr>

      <tr>
          <th>Phone #</th>
          <td><input id="phonenumber" name="phonenumber" value="<%=signupbean.getMobile()!=null?signupbean.getMobile():""%>" placeholder="Phone Number" type="text" maxlength="10" ></td>
      </tr>
     
      <tr>
          <th>Address</th>
          <td><input id="address" name="address" value="<%=signupbean.getAddress()!=null?signupbean.getAddress():""%>" placeholder="Address" type="text" ></td>
      </tr>
      
      <tr>
                <th>State</th>
                <td>
                    <select name="state" id="userstate"  onchange="getOnchangDist();">
                        <option value="34">Loading </option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>City</th>
                <td>
                   <select  name="city" id="usercity">
                        <option value="#">-------SELECT------- </option>
                    </select>
                </td>
            </tr>
      
      <!--tr>
          <th>City</th>
          <td><input id="city" name="city"  value="<%=signupbean.getCity()!=null?signupbean.getCity():""%>" placeholder="City" type="text" ></td>
      </tr>
      
      <tr>
      <th>State </th>
        <td><input id="state" name="state" value="<%=signupbean.getState()!=null?signupbean.getState():""%>" placeholder="State" type="text" ></td>
      </tr-->
      
      <tr>
      <th> Pin-Code</th>
        <td><input id="pincode" name="pincode" value="<%=signupbean.getPincode()!=null?signupbean.getPincode(): ""%>" placeholder="Pincode" type="text" maxlength="6" ></td>
      </tr>
      
       <tr>
                <th>Security Question</th>
                <td>
                    <select  id="question" name="question">
                         <option value="#" selected>-------SELECT------- </option>
                         <option value="Your Hobbies" <%= signupbean.getQuestion().equals("Your Hobbies")?"selected":"" %>>Your Hobbies</option>
                         <option value="Your Place Of Birth" <%= signupbean.getQuestion().equals("Your Place Of Birth")?"selected":"" %>>Your Place Of Birth</option>
                         <option value="Your First School Name" <%= signupbean.getQuestion().equals("Your First School Name")?"selected":"" %>>Your First School Name</option>
                         <option value="Your childhood hero" <%= signupbean.getQuestion().equals("Your childhood hero")?"selected":"" %>>Your childhood hero</option>
                         <option value="Your favorite sports team" <%= signupbean.getQuestion().equals("Your favorite sports team")?"selected":"" %>>Your favorite sports team</option>
                    </select>
                </td>
            </tr>
            
            
      <tr>
      <th> Enter Answer</th>
      <td><input  id="eanswer" name="eanswer" value="<%=signupbean.getAnswer()!=null?signupbean.getAnswer():""%>" placeholder="Enter Answer" type="text" ></td>
      </tr>
      
      <tr><td colspan="2" align="center"><button class="btn btn-primary" type="button" onclick="editProfileValidation()" >Submit </button> </td></tr>
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
	
	
	<!-- start: JavaScript-->

		<script src="<%=ccp%>/assets/metro/js/jquery-1.9.1.min.js"></script>
<script src="<%=ccp%>/assets/metro/js/bootstrap.min.js"></script> 
<script src="<%=ccp%>/assets/metro/js/jquery.validate.js"></script>
<script src="<%=ccp%>/assets/metro/js/custom.js"></script> 
 <script type="text/javascript" language="javascript">
	function getState(){
                $.post("<%=ccp%>/JsonService?step=states", function(data){ 
                    var items = data.list;
                      var options = '<option value="#">-------Select------</option>';                                             
                        var x = '';
                        for (var i = 0; i < items.length; i++) {
                            if(items[i].state_code == '<%=signupbean.getStatecode()%>'){
                                x='selected'
                            }else{
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
                            if(items[i].state_code == '<%=signupbean.getStatecode()%>' & items[i].district_code== '<%=signupbean.getCitycode()%>'){
                                x='selected'
                               // options += '<option value="' + items[i].district_code + '"' + x + '>' + items[i].district_name + '</option>';
                              options += '<option value="' + items[i].district_code + '"' + x + '>' + items[i].district_name + '</option>';
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
                             if (items[i].state_code == $("#userstate").val()){
                                options += '<option value="' + items[i].district_code + '"' + x + '>' + items[i].district_name + '</option>';
                            }
                        }
                        $("#usercity").html(options);
                },"json"); 
            };
			
 	
    </script>
	<!-- end: JavaScript-->
	<%}%>
</body>
</html>