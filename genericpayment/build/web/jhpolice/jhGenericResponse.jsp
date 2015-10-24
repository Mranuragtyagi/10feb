<%@ page contentType="text/html;charset=windows-1252" errorPage="/genericpayment/genericTransactionError.jsp"  import=" genericepayment.*, java.sql.*,vicclass.User,sms.*" %>
<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>

<%
 
String SCODE="ihSkaRaA";

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
        if(AuthStatus.equals("0300")){
            try{
                    String sql="update JH_POLICE_EPAYMENT set STATUS='0300',TRANS_DATE=?, TRANSID=?, BANK_REFNO=?, BANK_NAME=? , CIN=? where CHALLAN_NO=? " ;
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
          
          response.sendRedirect("http://wsdl.jhpolice.gov.in/smsresponse.php?STATUS=0300&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE);
        }
        
        else if(AuthStatus.equals("0399")){
             try{
                     String sql="update JH_POLICE_EPAYMENT set status='0399',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?, CIN=? where CHALLAN_NO=? " ;
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
                response.sendRedirect("http://wsdl.jhpolice.gov.in/smsresponse.php?STATUS=0399&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE);
             }
        else if(AuthStatus.equals("NA")){
                try{
                        String sql="update JH_POLICE_EPAYMENT set status='NA',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?, CIN=? where CHALLAN_NO=? " ;
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
                    response.sendRedirect("http://wsdl.jhpolice.gov.in/smsresponse.php?STATUS=NA&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE);
             }
             
        else if(AuthStatus.equals("0002")){
                try{
                    String sql="update JH_POLICE_EPAYMENT set status='0002',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?, CIN=? where CHALLAN_NO=? " ;
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
                       response.sendRedirect("http://wsdl.jhpolice.gov.in/smsresponse.php?STATUS=0002&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE);
        }else if(AuthStatus.equals("0001")){
                try{
                    String sql="update JH_POLICE_EPAYMENT set status='0001',trans_date=?, TRANSID=?, bank_refno=?, bank_name=?, CIN=? where CHALLAN_NO=? " ;
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
                         String msg="cancelled due to error at payment gateway" ;
                         //request.setAttribute("er",msg);
                        response.sendRedirect("http://wsdl.jhpolice.gov.in/smsresponse.php?STATUS=0001&TRANS_DATE="+t+"&TRANSID="+TxnReferenceNo+"&BANK_REFNO="+BankReferenceNo+"&BANK_NAME="+BankID+"&CIN="+AdditionalInfo7+"&CHALLAN_NO="+CustomerID+"&SCODE="+SCODE);
             }
             }
        else{   
                String msg="checksum mismatch" ;
                response.sendRedirect("http://jhpolice.gov.in/smsresponse.php?STATUS=checksum mismatch&TRANS_DATE=INVALID REQUEST&TRANSID=INVALID REQUEST&BANK_REFNO=INVALID REQUEST&BANK_NAME=INVALID REQUEST&CIN=INVALID REQUEST&CHALLAN_NO=INVALID REQUEST&SCODE="+SCODE);
             }
             conn.close();
             }catch(Exception e){
             response.sendRedirect("http://wsdl.jhpolice.gov.in/smsresponse.php?STATUS="+e.getMessage()+"&TRANS_DATE=INVALID REQUEST&TRANSID=INVALID REQUEST&BANK_REFNO=INVALID REQUEST&BANK_NAME=INVALID REQUEST&CIN=INVALID REQUEST&CHALLAN_NO=INVALID REQUEST&SCODE="+SCODE);
             }
             
            
            %>


