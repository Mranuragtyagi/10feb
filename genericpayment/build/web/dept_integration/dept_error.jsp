<%-- 
    Document   : dept_error
    Created on : Jan 15, 2015, 2:55:18 PM
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
        <%System.out.println("E"+request.getSession().getAttribute("error_url"));
            %>
        <h1><%=request.getSession().getAttribute("msg")==null?"":""+request.getSession().getAttribute("msg")%></h1>
        <form id="frm" name="frm" action="<%=request.getSession().getAttribute("error_url")%>" method="POST">
                <input type="hidden" name="csrfPreventionSalt" value="<%= request.getAttribute("csrfPreventionSalt")%>"/>
            <input type="hidden" name="msg" value="<%=request.getSession().getAttribute("msg")%>">
        </form>
    </body>
    <script>
    document.getElementById('frm').submit();
  </script>
</html>
