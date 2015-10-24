<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%String ccph="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
 
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Payonline Database Configuration</title>
  </head>
  <script type="text/javascript">
  function checkForm(f)
{
	var msg="Following fields should not be left Blank: \n";
	var correct=true;

	if(f.durl.value.length==0)
	{
		correct=false;
		msg=msg+"Database IP, ";
	}
	if(f.dbname.value.length==0)
	{
		correct=false;
		msg=msg+"Database Name, ";	
	}
	if(f.username.value.length==0)
	{
		correct=false;
		msg=msg+"Database username, ";	
	}
 	if(f.passw.value.length==0)
	{
		correct=false;
		msg=msg+"Database password, ";
	} 	
	msg=msg.substr(0,msg.length-2);
	if(correct==false)
	{
		alert(msg);
	}
	return correct;	
}
  </script>
  <body>
  
  <form name="frm" action="DbPropertiesEntry" method="POST" onsubmit="return checkForm(this)">
       
      <table align="center">
  <tr>
    <td width="6">&nbsp;</td>
    <td colspan="2" align="right"><a href="<%=ccph%>/GenericLogin"><font color="Black" size="5">Home</font></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><font color="#6699FF" size="5"> <strong>Mysql Database Configuration</strong></font> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><font color="Red"><%=request.getParameter("msg")==null?"":request.getParameter("msg")%></font></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><font size="5">To set up your payonline database, enter the following informations</font></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
  <td width="228">&nbsp;</td>
  <td width="408">
  <input type="hidden" name="driver" value="com.mysql.jdbc.Driver">  </td>
  </tr>
    <tr>
      <td>&nbsp;</td>
  <td><font size="5">Database IP</font> <br><font size="4">eg. 192.168.10.77</font> </td>
  <td> <input type="text" name="durl" size="50">  </td>
  </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
    <td>&nbsp;</td>
  <td><font size="5">Database name.</font><br>
    <font size="4">eg. payonline  </font></td>
  <td> <input type="text" name="dbname" size="50">  </td>
  </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
    <td>&nbsp;</td>
  <td><font size="5">Database Username  </font></td>
  <td>
  <input type="text" name="username" size="50"> </td>
  </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
  <td><font size="5">Database PasswordF  </font></td>
  <td> <input type="password" name="passw" size="50"></td>
  </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
    <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td>
  <input type="submit" name="Submit" value="Save" style="font-family: sans-serif; font-size:20px;">  </td>
  </tr>
  </table>
</form>
  </body>
</html>