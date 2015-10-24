<%-- 
    Document   : test
    Created on : Feb 26, 2015, 3:35:36 PM
    Author     : zephaniah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="/NewServlet" method="get">
    <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
   <INPUT type="submit" value="submit" name="Submit">
</form>
     <form action="/NewServlet1" method="get">
    <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
   <INPUT type="submit" value="submit1" name="Submit1">
</form>
    </body>
</html>
