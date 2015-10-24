<%@ page contentType="text/html;charset=utf-8" errorPage="/error.jsp"%>
<%@ page import="vicclass.* ,java.util.*,java.sql.*,genericepayadmin.*"%>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
{"list":[
<%      
      User u=(User)request.getSession().getAttribute("user");
      Connection con=null ;
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("dept"));
      int dept_id=Integer.parseInt(dept);
      String state=StringEscapeUtils.escapeHtml(request.getParameter("state"));
      int state_id=Integer.parseInt(state);     
      BranchBean branchbean=new BranchBean();
      List ar=branchbean.getParentList(con, state_id, dept_id);
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext()){ 
        BranchBean ds=(BranchBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getParent_id()+"\",\"txt\":\""+ ds.getParent_name()+"\"}");
    }  
%>
]}
