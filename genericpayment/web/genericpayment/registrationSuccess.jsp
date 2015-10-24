<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ include file="../portalheader.jsp"%> 
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
      
    </table>
     </fieldset>
    </form>
   </div>
  
   <%@ include file="../portalfooter.jsp" %>
