<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>login</title>
    <style type="text/css">
	legend{
	font-weight:bold;
	}
	body {
	background-color:#CCC;
	margin: 0;
	padding: 0;
	color: #000;
}
#content {
	background-color:#FFF;
	width: 600px;
	margin: 0 auto; 
	border:solid #666 2px;
	border-radius:10px;
	padding:15px;
	
}
	</style>
        <script type="text/javascript">
        function emailValidation(){
        var email=document.frm.email.value;
                var atpos=email.indexOf("@");
                var dotpos=email.lastIndexOf(".");
                if (atpos < 1 || ( dotpos - atpos < 2 )){
                    alert("Not a valid e-mail address");
                    document.frm.email.focus();
                    return false;
                    }else 
                    return true;
                }
        </script>
        
  </head>
  <body>
  <div id="content" >
  <form action="" name="frm">
  <fieldset style="width:97%;">
  <legend >LOGIN</legend>
  	<table style="width:90%;" align="center">
      <tr>
        <td>Email Id</td>
        <td><input type="text" name="email" id="email" /></td>
      </tr>
      <tr>
        <td>Password</td>
        <td>
          <input type="password" name="password" id="" />
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
        <input type="submit" name="login" value="Login" style="padding-left:10px;" onClick="return emailValidation(frm);" />
        <input type="reset" name="reset" value="Reset"></td>
      </tr>
      <tr>
        <td><a href="signup.jsp" >Sign Up</a></td>
        <td><a href="unregistered.jsp">Pay Without Registration</a></td>
      </tr>
    </table>
     </fieldset>
    </form>
   </div>
    </body>
</html>