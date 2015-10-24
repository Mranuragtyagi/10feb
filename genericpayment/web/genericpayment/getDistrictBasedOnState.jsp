<%@ page contentType="text/html;charset=utf-8" errorPage="/error.jsp"%>
<%@ page import="java.util.*,vicclass.*"%>
{"list":[
<%     
      User u=new User();
       java.sql.Connection con=null;
        u.createConnection();
        con=u.getConnection();
      String state_code=request.getParameter("state_code");
      ArrayList ar=District.getDistrictList(con,state_code);
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      {
        District ds=(District) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"state_code\":\""+ds.STATE_CODE+"\",\"district_code\":\"" + ds.DISTRICT_CODE +"\",\"district_name\":\""+ ds.DISTRICT_NAME +"\"}");
      }
      
      
%>
]}