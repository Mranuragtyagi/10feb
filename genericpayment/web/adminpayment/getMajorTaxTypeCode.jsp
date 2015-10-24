<%@ page contentType="text/html;charset=utf-8" errorPage="/error.jsp"%>
<%@ page import="vicclass.* ,java.util.*,java.sql.*,genericepayadmin.*"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
{"list":[
<%      
      User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("state_code"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=gad.getMajorTaxTypeByDeptid(con,dept);
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getMajortaxcode() +"\",\"txt\":\""+ ds.getMajortaxcode() +"\"}");
    }
      
%>
]}