<%@page import="dept_integration.*" %>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/genericpayment/genericTransactionError.jsp"  import=" genericepayment.*, java.sql.*,vicclass.User,sms.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="java.sql.*"%>

<%
String response_url="";
 String SCODE="";
        /*String ipAddress=null;
        String getWay = request.getHeader("VIA");   // Gateway
        ipAddress = request.getHeader("X-FORWARDED-FOR");   // proxy
        if(ipAddress==null)
        {
            ipAddress = request.getRemoteAddr();
        }
        //System.out.println("comp name::"+java.net.InetAddress.getLocalHost().getHostName()); 
        System.out.println("IP Address: "+ipAddress);*/
           // System.out.println("GENERIC RESPONSE "+request.getParameter("msg")!=null?request.getParameter("msg") : "no generic response");
            //String respons=StringEscapeUtils.escapeHtml(request.getParameter("msg"));
    try{
    String respons=request.getParameter("msg");
    System.out.println("MMM "+respons);
    String reponseParts[] = respons.split("\\|");
    String chk="TXJHHbuJkYIaK7";
    String  MerchantID = reponseParts[0];
    String  CustomerID = reponseParts[1];
    String  TxnReferenceNo = reponseParts[2];
    String  BankReferenceNo = reponseParts[3];
    String  TxnAmount = reponseParts[4];
    String  BankID = reponseParts[5];
    String  BankMerchantID = reponseParts[6];
    String  TxnType = reponseParts[7];
    String  CurrencyName = reponseParts[8];
    String  ItemCode = reponseParts[9];
    String  SecurityType = reponseParts[10];
    String  SecurityID = reponseParts[11];
    String  SecurityPassword = reponseParts[12];
    String  TxnDate = reponseParts[13];
    String  AuthStatus = reponseParts[14];
    String  SettlementType = reponseParts[15];
    String  AdditionalInfo1 = reponseParts[16];
    String  AdditionalInfo2 = reponseParts[17];
    String  AdditionalInfo3 = reponseParts[18];
    String  AdditionalInfo4 = reponseParts[19];
    String  AdditionalInfo5 = reponseParts[20];
    String  AdditionalInfo6 = reponseParts[21];
    String  AdditionalInfo7 = reponseParts[22];
    String  ErrorStatus = reponseParts[23];
    String  ErrorDescription = reponseParts[24];
    String  CheckSum = reponseParts[25];
    String msssg=MerchantID+"|"+CustomerID+"|"+TxnReferenceNo+"|"+BankReferenceNo+"|"+TxnAmount+"|"+BankID+"|"+BankMerchantID+"|"+
    TxnType+"|"+CurrencyName+"|"+ItemCode+"|"+SecurityType+"|"+SecurityID+"|"+SecurityPassword+"|"+TxnDate+"|"+AuthStatus+"|"+
    SettlementType+"|"+AdditionalInfo1+"|"+AdditionalInfo2+"|"+AdditionalInfo3+"|"+AdditionalInfo4+"|"+AdditionalInfo5+"|"+
    AdditionalInfo6+"|"+AdditionalInfo7+"|"+ErrorStatus+"|"+ErrorDescription+"|"+chk;
    GenericBean ecl=new GenericBean();
    String hash=ecl.checkSumSHA256(msssg);
    System.out.println("MESSAGE "+msssg);
    Connection conn=null;
    User u = new User();
    java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
    Timestamp t=null;
    if(hash.equals(CheckSum)  ){
        
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        u.createConnection();
        conn=u.getConnection();
       
        String sql1= "select deptint.response_url, secret_code from department_integration deptint,department_epayment deptepay where deptepay.DEPT_CODE=deptint.dept_code";
        ps1 = conn.prepareStatement(sql1);
        rs = ps1.executeQuery();

        if (rs.next()) {
           
            response_url=rs.getString("response_url");
            SCODE=rs.getString("secret_code");
        }
       
        if(AuthStatus.equals("0300")){
            try{
                    String sql="update department_epayment set STATUS='0300',TRANS_DATE=?, TRANSID=?, BANK_REFNO=?, BANK_NAME=? , CIN=? where CHALLAN_NO=? " ;
                    u.createConnection();
                    conn=u.getConnection();
                    PreparedStatement ps=conn.prepareStatement(sql);
                    String sq=TxnDate;
                    java.text.SimpleDateFormat sdff=new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");     
                    java.util.Date sqld=sdff.parse(sq);
                    t=new Timestamp(sqld.getTime());
                    ps.setTimestamp(1,t);
                    // ps.setDate(1,new java.sql.Date(sdf.parse(TxnDate).getTime() ));
                    ps.setString(2, TxnReferenceNo);
                    ps.setString(3,BankReferenceNo);
                    ps.setString(4,BankID);
                    ps.setString(5,AdditionalInfo7);
                    ps.setString(6,CustomerID);
                    ps.executeUpdate();
                    ps.close();
            }catch(Exception e){
                    System.out.println(e.getMessage());
            }      
          
          String resp0300=response_url+"?STATUS=0300&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE;
        }
        
        else if(AuthStatus.equals("0399")){
             try{
                     String sql="update department_epayment set status='0399',trans_date=?, TRANSID=?, BANK_REFNO=?, BANK_NAME=?, CIN=? where CHALLAN_NO=? " ;
                     u.createConnection();
                     conn=u.getConnection();
                     PreparedStatement ps=conn.prepareStatement(sql);
                     String sq=TxnDate;
                     java.text.SimpleDateFormat sdff=new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");     
                     java.util.Date sqld=sdff.parse(sq);
                      t=new Timestamp(sqld.getTime());
                     ps.setTimestamp(1,t);
                     ps.setString(2, TxnReferenceNo);
                     ps.setString(3,BankReferenceNo);
                     ps.setString(4,BankID);
                     ps.setString(5,AdditionalInfo7);
                     ps.setString(6,CustomerID);
                     ps.close();
             }catch(Exception e){
                System.out.println(e.getMessage());
             }
                 String msg="cancelled due to invalid authentication at bank" ;
                 //request.setAttribute("er",msg);
               String resp0399=response_url+"?STATUS=0399&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE;
             }
        else if(AuthStatus.equals("NA")){
                try{
                        String sql="update department_epayment set status='NA',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?, CIN=? where CHALLAN_NO=? " ;
                        u.createConnection();
                        conn=u.getConnection();
                        PreparedStatement ps=conn.prepareStatement(sql);
                        String sq=TxnDate;
                        java.text.SimpleDateFormat sdff=new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");     
                        java.util.Date sqld=sdff.parse(sq);
                          t=new Timestamp(sqld.getTime());
                        ps.setTimestamp(1,t);
                     //ps.setDate(1,new java.sql.Date(sdf.parse(TxnDate).getTime() ));
                        ps.setString(2, TxnReferenceNo);
                        ps.setString(3,BankReferenceNo);
                        ps.setString(4,BankID);
                        ps.setString(5,AdditionalInfo7);
                        ps.setString(6,CustomerID);
                        ps.executeUpdate();
                        ps.close();
                }catch(Exception e){
                    System.out.println(e.getMessage());
             }
                        String msg="cancelled due to invalid input in the request message" ;
                       // request.setAttribute("er",msg);
                    String respna=response_url+"?STATUS=NA&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE;
             }
             
        else if(AuthStatus.equals("0002")){
                try{
                    String sql="update department_epayment set status='0002',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?, CIN=? where CHALLAN_NO=? " ;
                        u.createConnection();
                        conn=u.getConnection();
                        PreparedStatement ps=conn.prepareStatement(sql);
                        String sq=TxnDate;
                        java.text.SimpleDateFormat sdff=new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");     
                        java.util.Date sqld=sdff.parse(sq);
                          t=new Timestamp(sqld.getTime());
                        ps.setTimestamp(1,t);
                        ps.setString(2, TxnReferenceNo);
                        ps.setString(3,BankReferenceNo);
                        ps.setString(4,BankID);
                        ps.setString(5,AdditionalInfo7);
                        ps.setString(6,CustomerID);
                        ps.executeUpdate();
                        ps.close();
                }catch(Exception e){
                        System.out.println(e.getMessage());
             }
                        String msg="cancelled due to payment gateway is waiting for response from bank" ;
                       String resp0002=response_url+"?STATUS=0002&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE;
        }else if(AuthStatus.equals("0001")){
                try{
                    String sql="update department_epayment set status='0001',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?, CIN=? where CHALLAN_NO=? " ;
                         u.createConnection();
                         conn=u.getConnection();
                         PreparedStatement ps=conn.prepareStatement(sql);
                         String sq=TxnDate;
                         java.text.SimpleDateFormat sdff=new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss");     
                         java.util.Date sqld=sdff.parse(sq);
                         t=new Timestamp(sqld.getTime());
                         ps.setTimestamp(1,t);
                         ps.setString(2, TxnReferenceNo);
                         ps.setString(3,BankReferenceNo);
                         ps.setString(4,BankID);
                         ps.setString(5,AdditionalInfo7);
                         ps.setString(6,CustomerID);
                         ps.executeUpdate();
                         ps.close();
               
            %>
            <form id="frm" action="<%=response_url%>" method="POST">
                <input type="hidden" name="STATUS" id="STATUS" value="<%=AuthStatus%>">
                <input type="hidden" name="TRANS_DATE" id="TRANS_DATE" value="<%=t%>">
                <input type="hidden" name="TRANSID" id="TRANSID" value="<%=TxnReferenceNo%>">
                <input type="hidden" name="bank_refno" id="bank_refno" value="<%=BankReferenceNo%>">
                <input type="hidden" name="bank_name" id="bank_name" value="<%=BankID%>">
                <input type="hidden" name="CIN" id="CIN" value="<%=AdditionalInfo7%>">
                <input type="hidden" name="CHALLAN_NO" id="CHALLAN_NO" value="<%=CustomerID%>">
                <input type="hidden" name="SCODE" id="SCODE" value="<%=SCODE%>">
                </form>
                <%
                     }catch(Exception e){
                         System.out.println(e.getMessage());
                }
                         String msg="cancelled due to error at payment gateway" ;
                         //request.setAttribute("er",msg);
                        String resp001=response_url+"?STATUS=0001&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE;
             }
             }
        else{   
                String msg="checksum mismatch" ;
                String respchs=response_url+"?STATUS=checksum mismatch&TRANS_DATE=INVALID REQUEST&TRANSID=INVALID REQUEST&BANK_REFNO=INVALID REQUEST&BANK_NAME=INVALID REQUEST&CIN=INVALID REQUEST&CHALLAN_NO=INVALID REQUEST&SCODE="+SCODE;
             }
             conn.close();
             }catch(Exception e){
            String respels=response_url+"?STATUS="+e.getMessage()+"&TRANS_DATE=INVALID REQUEST&TRANSID=INVALID REQUEST&BANK_REFNO=INVALID REQUEST&BANK_NAME=INVALID REQUEST&CIN=INVALID REQUEST&CHALLAN_NO=INVALID REQUEST&SCODE="+SCODE;
             }
             
            %>

 <script>
    document.getElementById('frm').submit();
  </script>