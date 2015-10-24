<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="vicclass.*,java.text.*,java.sql.*"%>

<%
String tin="" ;
String treasuryhead="" ;
 Connection con=null ;
 String idvalue="" ;
 
try{
    //User u=(User)request.getSession().getAttribute("user");   
    genericepayadmin.GenericAdminDao gad=new genericepayadmin.GenericAdminDao();
    idvalue=request.getParameter("idval")==null ? "" : request.getParameter("idval") ;
    String sql="select tin from jpt101forms where tin=?" ;
    PreparedStatement st=null ;
    con=gad.createConnection_mysql() ;  
    st=con.prepareStatement(sql);
    st.setString(1,idvalue);
    ResultSet rs=st.executeQuery() ;
    if(rs.next()){
        tin=rs.getString("tin");
        System.out.println("tin is no is: " +tin);
    }
}catch(Exception e){
    System.out.println(e.getMessage());
} 

%>
<%if(!tin.equals(idvalue)){%>

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