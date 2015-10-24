<%@ page contentType="text/html;charset=utf-8" errorPage="/error.jsp"%>
<%@ page import="vicclass.* ,java.util.*,java.sql.*,genericepayadmin.*"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>

 <%
  User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String headcode="" ;
        String majortax=StringEscapeUtils.escapeHtml(request.getParameter("majortax"));
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("dept"));
      GenericAdminDao gad=new GenericAdminDao();
      try{
       headcode=gad.getSingleTaxTypeByDeptid(con,dept,majortax);
      }catch(Exception e){
      System.out.println(e.getMessage());
      }
   
    
 if(!headcode.equals("")){%>
    <script type="text/javascript" charset="utf-8">
    //alert('Ajax Called Start');
  
     
        $('#majortaxtypecode').val("<%= headcode==null?"":headcode%>");
      //  $('#majortaxtypecode').attr('readonly', 'readonly');
        if( $('#majortaxtypecode').val()==""){$("#majortaxtypecode").attr("readonly", false);}
    </script>
    <%}%>