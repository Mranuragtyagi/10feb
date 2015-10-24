<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" isErrorPage="true"
         import="java.io.CharArrayWriter, java.io.PrintWriter" %>
          
<html>

<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="pragma" content="no-cache" />

  <head> 
      <%
       response.setStatus(response.SC_OK);
       String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
       %>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
        <title>error</title>
    </head>
  <body>Something went wrong. Please try again later.<br/><a href="<%=ccp%>/GenericLogin?step=login" target="_top"> Please Login Again</a>
   
  </body>
     
</html>
