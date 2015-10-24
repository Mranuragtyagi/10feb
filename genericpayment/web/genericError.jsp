<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ include file="./portalheader.jsp"%>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>genericError</title>
    <style>.cont{margin-top:3%;}i{margin-top:5px;}#sublink{ font-family:Arial, Helvetica, sans-serif; font-size:12px;  color:rgb(0,136,204); cursor:pointer;}</style>
  </head>
  <body>
    <div class="container cont" >
  <div>
    <div class="span7">
      <div class="hero-unit center">
          <h3> <font face="Tahoma" color="red">An Error Has Occurred Please Click Here <a href="<%=ccp%>/GenericLogin"> <span id="sublink"> Home Page</span></a></font></h3>
          <br/>
            <!--a href="<%=ccp%>/GenericLogin"> <span id="sublink"> Home Page</span></a-->
        </div>
  </div>
</div>
  </body>
</html>
   <%@ include file="./portalfooter.jsp" %>



