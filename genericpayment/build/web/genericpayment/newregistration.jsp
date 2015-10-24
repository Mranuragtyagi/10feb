<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>newregistration</title>
    <style type="text/css">
	body {
	background-color:#CCC;
	margin: 0;
	padding: 0;
	color: #000;
}
	#content {
		background-color:#FFF;
	width: 960px;
	margin: 0 auto; 
	border:solid #666 2px;
	border-radius:10px;
	padding:15px;
}
legend{
	font-weight:bold;
	}
table{
	width:400px;
	padding:8px;
}
th{
	text-align:right;
	
	font-size:15px;
	font-family:"Palatino Linotype", "Book Antiqua", Palatino, serif;
}

	</style>
  </head>
  <body>
  <div id="content" >
     <form action="">
     <fieldset>
     <legend>New User </legend>
     <table align="center">
      <tr>
        <th>Full Name:</th>
        <td><input type="text" name="" id=""></td>
      </tr>
      <tr>
        <th>District:</th>
        <td><input type="text" name="" id=""></td>
      </tr>
      <tr>
        <th>Town/City/Area/Locality:</th>
        <td><input type="text" name="input" id="input"></td>
      </tr>
      <tr>
        <th>Road/Street/Post Ofice:</th>
        <td><input type="text" name="input2" id="input2"></td>
      </tr>
      <tr>
        <th>Contact No:</th>
        <td><input type="text" name="input3" id="input3"></td>
      </tr>
      <tr>
        <th>Email Id:</th>
        <td><input type="text" name="email" id="email"></td>
      </tr>
      <tr>
        <th>Pan No:</th>
        <td><input type="text" name="input5" id="input5"></td>
      </tr>
       </table>
      </fieldset>
     <br/>
      <fieldset>
      <legend>Personal Information</legend>
      <table align="center">
      <tr>
        <th>User Name:</th>
        <td><input type="text" name="input6" id="input6"></td>
      </tr>
      <tr>
        <th>Password:</th>
        <td><input type="password" name="" id=""></td>
      </tr>
      <tr>
        <th>Re-Enter Password:</th>
        <td><input type="password" name="" id=""></td>
      </tr>
      <tr>
        <th>Security Question:</th>
        <td><input type="text" name="input7" id="input7"></td>
      </tr>
      <tr>
        <th>Answer:</th>
        <td><input type="text" name="input8" id="input8"></td>
      </tr>
      <tr>
        <th>Remarks:</th>
        <td><input type="text" name="input9" id="input9"></td>
      </tr>
    </table>
    </fieldset>
    <div align="center">
    <input type="submit" value="Submit" style="margin:20px;">
        <input type="reset" value="Reset" style="margin:20px;">
      
    </div>
    </form>
    </div>
    </body>
</html>