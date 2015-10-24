package jhpolice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
//import org.apache.http.HttpHeaders;


import vicclass.User;

public class Challan {
    String challan_no;
    double amount;
    String treasurycode;
    String secretcode;
    String name;
    String vehicle_no;
    public Challan() {
          challan_no="";
          amount=0;
          treasurycode="";
          secretcode="";
          name="";
          vehicle_no="";
    }

    public void setChallan_no(String challan_no) {
        this.challan_no = challan_no;
    }

    public String getChallan_no() {
        return challan_no;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getAmount() {
        return amount;
    }

    public void setTreasurycode(String treasurycode) {
        this.treasurycode = treasurycode;
    }

    public String getTreasurycode() {
        return treasurycode;
    }

    public void setSecretcode(String secretcode) {
        this.secretcode = secretcode;
    }

    public String getSecretcode() {
        return secretcode;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setVehicle_no(String vehicle_no) {
        this.vehicle_no = vehicle_no;
    }

    public String getVehicle_no() {
        return vehicle_no;
    }
   public void doInsert(){
      User u=new User();
       u.createConnection();
        
      Connection con=u.getConnection();
       PreparedStatement ps = null;
       ResultSet rs=null;
       String sql = 
           "insert into JH_POLICE_EPAYMENT (challan_no,amount,vehicle_no) values(?,?,?)";
       try {
            ps =con.prepareStatement("select * from JH_POLICE_EPAYMENT where challan_No=?");
            ps.setString(1,this.challan_no);
            rs = ps.executeQuery();
         if (rs.next()) {
           
       }else{
           ps = con.prepareStatement(sql);
           ps.setString(1, this.challan_no);
           ps.setDouble(2, this.amount);
           ps.setString(3, this.vehicle_no);
           ps.execute();
       }
       }catch (Exception e) {
           System.out.println(e.getMessage());
       } finally {
           try {
               if (ps != null)
                   ps.close();
                   con.close();
           } catch (Exception e) {
               System.out.println(e.getMessage());
           }
       }
   }
    public static String  doSend(String STATUS,String TRANS_DATE,String TRANSID,String BANK_REFNO,String  BANK_NAME, String CIN) throws Exception {
                String SCODE="ihSkaRaA";
                String url="http://wsdl.jhpolice.gov.in/smsresponse.php";
                String result=null;
                HttpClient client = null;
                PostMethod method = null;
                client = new HttpClient(new MultiThreadedHttpConnectionManager());
             
                method = new PostMethod(url);
               // method.addRequestHeader("Content-Type","application/xml");
                
                method.addParameter("STATUS", STATUS);
             // method.addParameter("signature",URLEncoder.encode(b,"UTF-8"));
                method.addParameter("TRANS_DATE",TRANS_DATE);
                method.addParameter("TRANSID",TRANSID);
                method.addParameter("BANK_REFNO",BANK_REFNO);
                method.addParameter("BANK_NAME",BANK_NAME);
                method.addParameter("CIN",CIN);
                method.addParameter("SCODE",SCODE);
            
                try {
                    int statusCode = client.executeMethod(method);
                    // System.out.println("lll"+method.getStatusLine().toString());
                    if (statusCode == -1) {
                        result="N";
                        System.err.println("HttpError: " + method.getStatusLine());
                    } else {
                        result=method.getResponseBodyAsString();
                        System.out.println(result);
                        //result= result.indexOf(""+mobile_no)==-1 ? "N" : "Y";
                    }
                }
                catch (Exception e) {
                
                    e.printStackTrace();
                    
                    System.err.println("Fatal protocol violation: " + e.getMessage());
                    throw e;
                   
                   
                }
               
                finally {
                    method.abort();
                    method.releaseConnection();
                    
                }
                
                return result;
            }
}
