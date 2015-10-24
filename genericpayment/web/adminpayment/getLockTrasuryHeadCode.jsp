<%@ page contentType="text/html;charset=windows-1252" errorPage="/error.jsp"%>
<%@ page import="vicclass.*,java.text.*,java.sql.*"%>

<%
String tax="" ;
String treasuryhead="" ;
 Connection con=null ;
try{
    User u=(User)request.getSession().getAttribute("user");   
    SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
    String dept=request.getParameter("dept")==null ? "" : request.getParameter("dept") ;
    String taxtype=request.getParameter("taxtype")==null ? "" : request.getParameter("taxtype") ;
    String mjtax=request.getParameter("mjrtax")==null ? "" : request.getParameter("mjrtax") ;
    String sql="select TAX_PURPOSE,TREASURY_HEAD_CODE from echallan_tax_purposes where DEPT_ID=? and TAX_PURPOSE=? and major_tax_id=? and status='I' " ;
    PreparedStatement st=null ;
    con=u.getConnection() ;  
    st=con.prepareStatement(sql);
    st.setString(1,dept);
    st.setString(2,taxtype.toUpperCase());
    st.setString(3,mjtax);
    ResultSet rs=st.executeQuery() ;
    if(rs.next()){
        tax=rs.getString("TAX_PURPOSE");
        treasuryhead=rs.getString("TREASURY_HEAD_CODE");
    }
}catch(Exception e){
    System.out.println(e.getMessage());
}     
%>
<%if(!tax.equals("")){%>

    <script type="text/javascript" charset="utf-8">
    //alert('Ajax Called Start');
    $(function(){
        $("#treasury").val("<%= treasuryhead== null ? "" :  treasuryhead%>");
        $('#treasury').attr('readonly', 'readonly');
        if( $("#treasury").val()==""){$("#treasury").attr("readonly", false);}  
     
    });
    </script>
    
    <%}else{%>
     <script type="text/javascript" charset="utf-8">
    //alert('Ajax Called Start');
    $(function(){
       
        $("#treasury").val("");
        $('#treasury').attr('readonly', 'readonly');
        if( $("#treasury").val()==""){$("#treasury").attr("readonly", false);}  
     
    });
    </script>
    <%}%>