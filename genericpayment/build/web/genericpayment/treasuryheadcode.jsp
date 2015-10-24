<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="vicclass.*,java.sql.*" %>
 <%
    //User u=new User();
    try{
    genericepayment.GenericBean gb=new genericepayment.GenericBean();
    User u=(User)request.getSession().getAttribute("user")!=null?(User)request.getSession().getAttribute("user"): new User() ;
    Connection con=u.getConnection();
    String headcode=""; String amont=""; String isf="" ; String sql="" ;
    PreparedStatement st=null; PreparedStatement stt=null; PreparedStatement sttt=null;
    String department=request.getParameter("department")!=null?request.getParameter("department"):"";
    String a=gb.getDeptIdByDeptName(con,department);
     String taxtype=request.getParameter("taxtype")==null ? "" : request.getParameter("taxtype") ;
     String subtax=request.getParameter("subtax")==null ? "" : request.getParameter("subtax") ;
    String reponseParts[] = department.split("@");
    //int  departmentid = Integer.parseInt(reponseParts[0]);
    int  departmentid = Integer.parseInt(a);
    ResultSet rss=null ; ResultSet rsss=null ; 
   
    String sqll="select ISFIXED from echallan_tax_purposes where DEPT_ID=? and upper(MAJOR_TAX)=? and upper(TAX_PURPOSE)=?" ;
    stt=con.prepareStatement(sqll);
    stt.setInt(1,departmentid);
    stt.setString(2,taxtype.toUpperCase());
    stt.setString(3,subtax.toUpperCase());
    rss=stt.executeQuery();
    if(rss.next()){ 
    isf = rss.getString("ISFIXED")!=null? rss.getString("ISFIXED") :"";
    }
   
    if(isf.equals("Y")){
    String sql2="select FIXAMOUNT,TREASURY_HEAD_CODE from echallan_tax_purposes where DEPT_ID=? and upper(MAJOR_TAX)=? and upper(TAX_PURPOSE)=?" ;
    sttt=con.prepareStatement(sql2);
    sttt.setInt(1,departmentid);
    sttt.setString(2,taxtype.toUpperCase());
    sttt.setString(3,subtax.toUpperCase());
    rsss=sttt.executeQuery();
    if(rsss.next()){ 
     amont=(rsss.getString("FIXAMOUNT"));
     headcode=rsss.getString("TREASURY_HEAD_CODE");
    }
    }else{
     sql="select TREASURY_HEAD_CODE from echallan_tax_purposes where DEPT_ID=? and upper(MAJOR_TAX)=? and upper(TAX_PURPOSE)=?" ;
    st=con.prepareStatement(sql);
    st.setInt(1,departmentid);
    st.setString(2,taxtype.toUpperCase());
    st.setString(3,subtax.toUpperCase());
    ResultSet rs=st.executeQuery();
    if(rs.next()){
    headcode=rs.getString("TREASURY_HEAD_CODE");
    }
    }
    try{
        if(rss!=null)
        rss.close();
        if(stt!=null)
        stt.close();
        if(rsss!=null)
        rsss.close();
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
   
 if(!headcode.equals("")){%>
    <script type="text/javascript" charset="utf-8">
    //alert('Ajax Called Start');
  
     
        $('#treasuryhead').val("<%= headcode==null?"":headcode%>");
        $('#treasuryhead').attr('readonly', 'readonly');
        if( $('#treasuryhead').val()==""){$("#treasuryhead").attr("readonly", false);}
         $('#amount').val("<%= amont==""?"":amont%>");
        if( $('#amount').val()==0.0){$("#amount").attr("readonly", false);}
           else if( $('#amount').val()!=0.0){$("#amount").attr("readonly", true);}
   
    </script>
    <%}
     }catch(Exception e){
    System.out.println("error in genericpayment/treasuryheadcode.jsp fetching treasury head code or fix amount: " +e.getMessage());
    }%>
   