<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<html>
  <head>
      <meta http-equiv="cache-control" content="no-cache" />
     <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>Logout</title>
  </head>
  <%
  String ccp="http://"+ request.getHeader("HOST")+request.getContextPath()+"";
  %>
  <body>You have been Logout/Your Session has Expired. If you are opening this site in multiple tabs/browsers, please use only one tab/browser  and close others.  <a href="<%=ccp%>/GenericLogin?step=login" target="_top"> Please Login Again</a></body>
</html>