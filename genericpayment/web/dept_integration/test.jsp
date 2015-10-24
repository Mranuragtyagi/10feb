<%-- 
    Document   : test
    Created on : Jan 15, 2015, 5:09:13 PM
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
        <%
     response.sendRedirect("http://192.168.137.191:1111/Payonline/error_url.jsp?msg=TEST");
     %>
    </body>
</html>
