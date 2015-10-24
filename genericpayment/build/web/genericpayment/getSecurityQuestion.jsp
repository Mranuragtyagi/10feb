
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="vicclass.*,java.sql.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
 <%
    User u=new User();
    u.createConnection();
    Connection con=u.getConnection();
    genericepayment.GenericBean gb=new genericepayment.GenericBean();
    
    String securityquestion="" ;
    String email=StringEscapeUtils.escapeHtml(request.getParameter("lemail")!=null?request.getParameter("lemail"):"");
     securityquestion=gb.getSecurityQuestionByEmail(con, email);
 %>

<script type="text/javascript" charset="utf-8">
    //alert('Ajax Called Start');
    $(function(){
        $("#question").val("<%=securityquestion != "" ? securityquestion: ""  %>"); 
    <%if(securityquestion!=""){%>        
        $('#question').attr('readonly', 'readonly');        
        if( $("#question").val()==""){$("#question").attr("readonly", false);}
     <%}%>
           
    });
    </script>
   