/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dept_integration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.MultiThreadedHttpConnectionManager;
import org.apache.commons.httpclient.methods.PostMethod;
import vicclass.User;

/**
 *
 * @author santosh
 */
public class Dept_Integchalan {
    private String CHALLAN_NO;
    private double AMOUNT;
    private String BANK_NAME;
    private String TREASURY_CODE;
    private String NAME;
    private String DEPT_CODE;
    
    private String TRANS_DATE;
    private String TRANSID;
    private String BANK_REFNO;
    private String CIN;
    private String STATUS;
    private String MISC;

    /**
     * @return the CHALLAN_NO
     */
    public String getCHALLAN_NO() {
        return CHALLAN_NO;
    }

    /**
     * @param CHALLAN_NO the CHALLAN_NO to set
     */
    public void setCHALLAN_NO(String CHALLAN_NO) {
        this.CHALLAN_NO = CHALLAN_NO;
    }

    /**
     * @return the AMOUNT
     */
    public double getAMOUNT() {
        return AMOUNT;
    }

    /**
     * @param AMOUNT the AMOUNT to set
     */
    public void setAMOUNT(double AMOUNT) {
        this.AMOUNT = AMOUNT;
    }

    /**
     * @return the BANK_NAME
     */
    public String getBANK_NAME() {
        return BANK_NAME;
    }

    /**
     * @param BANK_NAME the BANK_NAME to set
     */
    public void setBANK_NAME(String BANK_NAME) {
        this.BANK_NAME = BANK_NAME;
    }

    /**
     * @return the TREASURY_CODE
     */
    public String getTREASURY_CODE() {
        return TREASURY_CODE;
    }

    /**
     * @param TREASURY_CODE the TREASURY_CODE to set
     */
    public void setTREASURY_CODE(String TREASURY_CODE) {
        this.TREASURY_CODE = TREASURY_CODE;
    }

    /**
     * @return the NAME
     */
    public String getNAME() {
        return NAME;
    }

    /**
     * @param NAME the NAME to set
     */
    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    /**
     * @return the DEPT_CODE
     */
    public String getDEPT_CODE() {
        return DEPT_CODE;
    }

    /**
     * @param DEPT_CODE the DEPT_CODE to set
     */
    public void setDEPT_CODE(String DEPT_CODE) {
        this.DEPT_CODE = DEPT_CODE;
    }

    /**
     * @return the TRANS_DATE
     */
    public String getTRANS_DATE() {
        return TRANS_DATE;
    }

    /**
     * @param TRANS_DATE the TRANS_DATE to set
     */
    public void setTRANS_DATE(String TRANS_DATE) {
        this.TRANS_DATE = TRANS_DATE;
    }

    /**
     * @return the TRANSID
     */
    public String getTRANSID() {
        return TRANSID;
    }

    /**
     * @param TRANSID the TRANSID to set
     */
    public void setTRANSID(String TRANSID) {
        this.TRANSID = TRANSID;
    }

    /**
     * @return the BANK_REFNO
     */
    public String getBANK_REFNO() {
        return BANK_REFNO;
    }

    /**
     * @param BANK_REFNO the BANK_REFNO to set
     */
    public void setBANK_REFNO(String BANK_REFNO) {
        this.BANK_REFNO = BANK_REFNO;
    }

    /**
     * @return the CIN
     */
    public String getCIN() {
        return CIN;
    }

    /**
     * @param CIN the CIN to set
     */
    public void setCIN(String CIN) {
        this.CIN = CIN;
    }

    /**
     * @return the STATUS
     */
    public String getSTATUS() {
        return STATUS;
    }

    /**
     * @param STATUS the STATUS to set
     */
    public void setSTATUS(String STATUS) {
        this.STATUS = STATUS;
    }

    /**
     * @return the MISC
     */
    public String getMISC() {
        return MISC;
    }

    /**
     * @param MISC the MISC to set
     */
    public void setMISC(String MISC) {
        this.MISC = MISC;
    }
    public void doInsert() throws Exception {
      User u=new User();
       u.createConnection();
        
      Connection con=u.getConnection();
       PreparedStatement ps = null;
       ResultSet rs=null;
       String sql = 
           "insert into department_epayment(CHALLAN_NO,AMOUNT,BANK_NAME,TREASURY_CODE,NAME,DEPT_CODE,TRANS_DATE,TRANSID,BANK_REFNO,CIN,STATUS,MISC) values(?,?,?,?,?,?,?,?,?,?,?,?)";
       try {
            ps =con.prepareStatement("select * from department_epayment where challan_No=?");
            ps.setString(1,this.CHALLAN_NO);
            rs = ps.executeQuery();
         if (rs.next()) {
           throw new Exception("Challan_no Already Exists,Please generate a new one.");
       }else 
         {
           ps = con.prepareStatement(sql);
           ps.setString(1, this.CHALLAN_NO);
           ps.setDouble(2, this.AMOUNT);
           ps.setString(3, this.BANK_NAME);
           ps.setString(4, this.TREASURY_CODE);
           ps.setString(5, this.NAME);
           ps.setString(6, this.DEPT_CODE);
           ps.setString(7, this.TRANS_DATE);
           ps.setString(8, this.TRANSID);
           ps.setString(9, this.BANK_REFNO);
           ps.setString(10, this.CIN);
           ps.setString(11, this.STATUS);
           ps.setString(12, this.BANK_NAME);
           ps.execute();
       }
       }catch (Exception e) {
           System.out.println(e.getMessage());
           throw e;
       } finally {
           try {
               if (ps != null)
                   ps.close();
                   con.close();
           } catch (Exception e) {
               System.out.println(e.getMessage());
               throw e;
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
