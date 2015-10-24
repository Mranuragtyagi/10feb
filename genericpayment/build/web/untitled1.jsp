<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%  String ac=java.net.InetAddress.getLocalHost().getHostAddress() ;
    String reponseParts[] = ac.split("\\.");
    String  first = reponseParts[0];
    String  second = reponseParts[1];
    String  third = reponseParts[2];
    String  fourth = reponseParts[3];
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>untitled1</title>
  </head>
  <body>
   <% if(fourth.equals("17") || fourth=="17"){%>
   <tr>
    <td>Shiva</td>
   </tr>
   <%}%>
  </body>
</html>