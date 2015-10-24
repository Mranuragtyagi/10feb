package genericepayadmin;

import dept_integration.Dept_Integbean;
import dept_integration.IPAddressValidator;
import java.sql.*;
import org.apache.commons.validator.UrlValidator;

public class GenericSettingBean {

    /* VARIABLES FOR SMS DETAILS   */
    private String SMS_USERNAME;
    private String SMS_PASSWORD;
    private int SMS_ID;
    private String PROVIDER_NAME;
    private String HOST_URL;
    private int HOST_PORT;
    private String SENDER_ID;
    /* VARIABLES FOR EMAIL DETAILS   */
    private String EMAIL_USERNAME;
    private String EMAIL_PASSWORD;
    private int EMAIL_ID;
    private String MAIL_SERVER;
    private String EMAIL_ADDRESS;
    private int SMTP_PORT;

    /*Banner Content variable  */
    private String content1;
    private String content2;
    private String content3;
    private int content_id;

    /* footer setting */
    private String copyright;
    private String contactus;
    private String version;
    private String terms;

    private String tempid;
    private String tempmsg;
    private String tempmail;

    /* Billdesk setting */
    private String billdeskchksum;
    private String billdeskurl;
    private String merchantid;
    private String securityid;
    private String responseurl;
    private int generic_id;

    public GenericSettingBean() {
        // temp

        tempid = "";
        tempmsg = "";
        tempmail = "";

        /* VARIABLES FOR SMS DETAILS   */
        SMS_USERNAME = null;
        SMS_PASSWORD = null;
        SMS_ID = 0;
        PROVIDER_NAME = null;
        HOST_URL = null;
        HOST_PORT = 0;
        SENDER_ID = null;
        /* VARIABLES FOR EMAIL DETAILS   */
        EMAIL_USERNAME = null;
        EMAIL_PASSWORD = null;
        EMAIL_ID = 0;
        MAIL_SERVER = null;
        EMAIL_ADDRESS = null;
        SMTP_PORT = 0;

        /*Banner Content variable  */
        content1 = null;
        content2 = null;
        content3 = null;
        content_id = 0;

        /*footer setting variable */
        copyright = null;
        contactus = null;
        version = null;
        terms = null;

        /* billdesk setting */
        merchantid = "";
        responseurl = "";
        securityid = "";
        billdeskchksum = "";
        billdeskurl = "";
        generic_id = 0;

    }

    /* VARIABLES FOR SMS DETAILS   */
    public void setSMS_ID(int sMS_ID) {
        this.SMS_ID = sMS_ID;
    }

    public int getSMS_ID() {
        return SMS_ID;
    }

    public void setPROVIDER_NAME(String pROVIDER_NAME) {
        this.PROVIDER_NAME = pROVIDER_NAME;
    }

    public String getPROVIDER_NAME() {
        return PROVIDER_NAME;
    }

    public void setHOST_URL(String hOST_URL) {
        this.HOST_URL = hOST_URL;
    }

    public String getHOST_URL() {
        return HOST_URL;
    }

    public void setHOST_PORT(int hOST_PORT) {
        this.HOST_PORT = hOST_PORT;
    }

    public int getHOST_PORT() {
        return HOST_PORT;
    }

    public void setSENDER_ID(String sENDER_ID) {
        this.SENDER_ID = sENDER_ID;
    }

    public String getSENDER_ID() {
        return SENDER_ID;
    }

    public void setSMS_USERNAME(String sMS_USERNAME) {
        this.SMS_USERNAME = sMS_USERNAME;
    }

    public String getSMS_USERNAME() {
        return SMS_USERNAME;
    }

    public void setSMS_PASSWORD(String sMS_PASSWORD) {
        this.SMS_PASSWORD = sMS_PASSWORD;
    }

    public String getSMS_PASSWORD() {
        return SMS_PASSWORD;
    }

    public void saveSMS_Setting(Connection con) {
        String sql = "insert into generic_sms_setting ( provider_name, host_url, host_port, username, password, sender_id,sms_id ) values (?, ?, ?, ?, ?, ?, ?) ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String s = "select (ifnull(max(SMS_ID),0)+1) from generic_sms_setting";
            ps = con.prepareStatement(s);
            rs = ps.executeQuery();
            rs.next();
            ps = con.prepareStatement(sql);
            ps.setString(1, this.PROVIDER_NAME);
            ps.setString(2, this.HOST_URL);
            ps.setInt(3, this.HOST_PORT);
            ps.setString(4, this.SMS_USERNAME);
            ps.setString(5, this.SMS_PASSWORD);
            ps.setString(6, this.SENDER_ID);
            ps.setInt(7, rs.getInt(1));
            ps.execute();
            rs.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void selectSMS_Setting(Connection con) {
        //String sql = " select nvl(sms_id, 0) as sms_id, provider_name, host_url, host_port, username, password, sender_id from generic_sms_setting ";
        String sql = " select ifnull(sms_id,0)sms_id , provider_name, host_url, host_port, username, password, sender_id from generic_sms_setting ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                this.SMS_ID = rs.getInt("sms_id") != 0 ? rs.getInt("sms_id") : 0;
                this.PROVIDER_NAME = (rs.getString("provider_name"));
                this.HOST_URL = (rs.getString("host_url"));
                this.HOST_PORT = (rs.getInt("host_port"));
                this.SMS_USERNAME = (rs.getString("username"));
                this.SMS_PASSWORD = (rs.getString("password"));
                this.SENDER_ID = (rs.getString("sender_id"));
            }
        } catch (Exception ex) {
            System.out.println("error in select sms data" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void updateSMS_Setting(Connection con) {
        String sql = " update generic_sms_setting set provider_name=?, host_url=?, host_port=?, username=?, password=?, sender_id=? where sms_id=? ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql);
            ps.setString(1, this.PROVIDER_NAME);
            ps.setString(2, this.HOST_URL);
            ps.setInt(3, this.HOST_PORT);
            ps.setString(4, this.SMS_USERNAME);
            ps.setString(5, this.SMS_PASSWORD);
            ps.setString(6, this.SENDER_ID);
            ps.setInt(7, this.SMS_ID);
            ps.execute();

            con.commit();
            con.setAutoCommit(true);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void setEMAIL_USERNAME(String eMAIL_USERNAME) {
        this.EMAIL_USERNAME = eMAIL_USERNAME;
    }

    public String getEMAIL_USERNAME() {
        return EMAIL_USERNAME;
    }

    public void setEMAIL_PASSWORD(String eMAIL_PASSWORD) {
        this.EMAIL_PASSWORD = eMAIL_PASSWORD;
    }

    public String getEMAIL_PASSWORD() {
        return EMAIL_PASSWORD;
    }

    public void setEMAIL_ID(int eMAIL_ID) {
        this.EMAIL_ID = eMAIL_ID;
    }

    public int getEMAIL_ID() {
        return EMAIL_ID;
    }

    public void setMAIL_SERVER(String mAIL_SERVER) {
        this.MAIL_SERVER = mAIL_SERVER;
    }

    public String getMAIL_SERVER() {
        return MAIL_SERVER;
    }

    public void setEMAIL_ADDRESS(String eMAIL_ADDRESS) {
        this.EMAIL_ADDRESS = eMAIL_ADDRESS;
    }

    public String getEMAIL_ADDRESS() {
        return EMAIL_ADDRESS;
    }

    public void setSMTP_PORT(int sMTP_PORT) {
        this.SMTP_PORT = sMTP_PORT;
    }

    public int getSMTP_PORT() {
        return SMTP_PORT;
    }

    public void saveEmail_Setting(Connection con) {

        String sql = "insert into generic_email_setting (email_address, mail_server, smtp_port, username, password,email_id) values (?, ?, ?, ?, ?, ?) ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement("select (ifnull(max(email_id),0)+1) from generic_email_setting");
            rs = ps.executeQuery();
            rs.next();

            ps = con.prepareStatement(sql);
            ps.setString(1, this.EMAIL_ADDRESS);
            ps.setString(2, this.MAIL_SERVER);
            ps.setInt(3, this.SMTP_PORT);
            ps.setString(4, this.EMAIL_USERNAME);
            ps.setString(5, this.EMAIL_PASSWORD);
            ps.setInt(6, rs.getInt(1));
            ps.execute();
            rs.close();
        } catch (Exception ex) {
            System.out.println("error in insertion of email settings" + ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void selectEmail_Setting(Connection con) {
        GenericSettingBean sbean = null;
        String sql = " select ifnull( email_id, 0) as email_id, email_address, mail_server, smtp_port, username, password from generic_email_setting ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                sbean = new GenericSettingBean();

                this.EMAIL_ID = rs.getInt("email_id") != 0 ? rs.getInt("email_id") : 0;
                this.EMAIL_ADDRESS = rs.getString("email_address");
                this.MAIL_SERVER = rs.getString("mail_server");
                this.SMTP_PORT = rs.getInt("smtp_port");
                this.EMAIL_USERNAME = rs.getString("username");
                this.EMAIL_PASSWORD = rs.getString("password");
            }
        } catch (Exception ex) {
            System.out.println("error in select of email settings" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void updateEmail_Setting(Connection con) {
        String sql = " update generic_email_setting set email_address=?, mail_server=?, smtp_port=?, username=?, password=? where email_id=? ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql);
            ps.setString(1, this.EMAIL_ADDRESS);
            ps.setString(2, this.MAIL_SERVER);
            ps.setInt(3, this.SMTP_PORT);
            ps.setString(4, this.EMAIL_USERNAME);
            ps.setString(5, this.EMAIL_PASSWORD);
            ps.setInt(6, this.EMAIL_ID);
            ps.execute();

            con.commit();
            con.setAutoCommit(true);
        } catch (Exception ex) {
            System.out.println("error in update of email settings" + ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    //Banner Content 
    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public String getContent2() {
        return content2;
    }

    public void setContent3(String content3) {
        this.content3 = content3;
    }

    public String getContent3() {
        return content3;
    }

    public void setContent_id(int content_id) {
        this.content_id = content_id;
    }

    public int getContent_id() {
        return content_id;
    }

    /*   public void  saveBanner_Setting(Connection con){
       
     String sql = "insert into generic_banner_content (CONTENT_ID,content1, content2) values ((select (nvl(max(CONTENT_ID),0)+1) from generic_banner_content), ?, ?) ";
     PreparedStatement ps = null;
     ResultSet rs = null;
     try{
            
     ps = con.prepareStatement(sql);            
     ps.setString(1, this.content1);
     ps.setString(2, this.content2);           
     ps.execute();
     }catch(Exception ex){
     System.out.println("error in insertion of banner settings" +ex.getMessage());
     }finally{
     try{
     if(ps!=null){ps.close();}
     }catch(Exception ex){
     System.out.println(ex.getMessage());
     }
            
     }        
     }
     */
    public void saveBanner_Setting(Connection con) {

        String sql = "insert into generic_banner_content (content1, content2,COPYRIGHT,VERSION,TERMS,CONTACT_US,CONTENT_ID) values (?, ?, ?,?,?,?,?) ";
        PreparedStatement ps = null;

        try {
            String s = "select (ifnull(max(CONTENT_ID),0)+1) from generic_banner_content";
            ps = con.prepareStatement(s);
            ResultSet rs = ps.executeQuery();
            rs.next();
            ps = con.prepareStatement(sql);
            ps.setString(1, this.content1);
            ps.setString(2, this.content2);
            ps.setString(3, this.copyright);
            ps.setString(4, this.version);
            ps.setString(5, this.terms);
            ps.setString(6, this.contactus);
            ps.setInt(7, rs.getInt(1));
            ps.execute();
            rs.close();
        } catch (Exception ex) {
            System.out.println("error in insertion of banner settings" + ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void selectBanner_Setting(Connection con) {
        GenericSettingBean sbean = null;
        String sql = " select ifnull( CONTENT_ID, 0) as CONTENT_ID,CONTENT1, CONTENT2,COPYRIGHT,VERSION,TERMS,CONTACT_US from generic_banner_content ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                sbean = new GenericSettingBean();
                this.content_id = rs.getInt("CONTENT_ID");
                this.content1 = rs.getString("CONTENT1");
                this.content2 = rs.getString("CONTENT2");
                this.copyright = rs.getString("COPYRIGHT");
                this.version = rs.getString("VERSION");
                this.terms = rs.getString("TERMS");
                this.contactus = rs.getString("CONTACT_US");
            }
        } catch (Exception ex) {
            System.out.println("error in select of banner settings" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void updateBanner_Setting(Connection con) {
        String sql = " update generic_banner_content set content1=?, content2=?,COPYRIGHT=?,VERSION=?,TERMS=?,CONTACT_US=? where CONTENT_ID=? ";
        PreparedStatement ps = null;
        try {
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql);
            ps.setString(1, this.content1);
            ps.setString(2, this.content2);
            ps.setString(3, this.copyright);
            ps.setString(4, this.version);
            ps.setString(5, this.terms);
            ps.setString(6, this.contactus);
            ps.setInt(7, this.content_id);
            ps.execute();

            con.commit();
            con.setAutoCommit(true);
        } catch (Exception ex) {
            System.out.println("error in update of banner settings" + ex.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }


    /* footer settings start  */
    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    public String getCopyright() {
        return copyright;
    }

    public void setContactus(String contactus) {
        this.contactus = contactus;
    }

    public String getContactus() {
        return contactus;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getVersion() {
        return version;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }

    public String getTerms() {
        return terms;
    }

    public void selectBilldesk_Setting(Connection con) {
        GenericSettingBean gb = null;
        String sql = "select ifnull(generic_id, 0) as generic_id,BILLDESK_CHECKSUM,BILLDESK_URL,MERCHANT_ID,SECURITY_ID,RESPONSE_URL from generic_msg ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                gb = new GenericSettingBean();
                this.generic_id = rs.getInt("generic_id");
                this.billdeskchksum = rs.getString("BILLDESK_CHECKSUM");
                this.billdeskurl = rs.getString("BILLDESK_URL");
                this.merchantid = rs.getString("MERCHANT_ID");
                this.securityid = rs.getString("SECURITY_ID");
                this.responseurl = rs.getString("RESPONSE_URL");
            }
        } catch (Exception ex) {
            System.out.println("error in select of billdesk settings" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }

    public void selectMsg_template(Connection con) {
        GenericSettingBean gb = null;
        String sql = "select ifnull(template_id, 0) as template_id,temp_msg,temp_mail from generic_template ";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                gb = new GenericSettingBean();
                this.tempid = rs.getString("template_id");
                this.tempmsg = rs.getString("temp_msg");
                this.tempmail = rs.getString("temp_mail");

            }
        } catch (Exception ex) {
            System.out.println("error in select of billdesk settings" + ex.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }

        }
    }//deptValidationsms,deptValidationEmail,EMAIL_ADDRESS,MAIL_SERVER,USERNAME,PASSWORD,SMTP_PORT

    public String deptValidationEmail(Connection con, String EMAIL_ADDRESS, String MAIL_SERVER, String USERNAME, String PASSWORD, int SMTP_PORT) throws Exception {
        String nameEx = "^[a-zA-Z. ]+$";
        String nameEx1 = "^[a-zA-Z0-9@. ]+$";
        String nameEx2 = "^[0-9]+$";
        String pwdRegex = "^[0-9A-Za-z!@#$%&* ]+$";
        String hstprt = String.valueOf(SMTP_PORT);
        int atpos = EMAIL_ADDRESS.indexOf("@");
        int dotpos = EMAIL_ADDRESS.lastIndexOf(".");
         int atpos1 = USERNAME.indexOf("@");
        int dotpos1 = USERNAME.lastIndexOf(".");
        String msg = "Please Fill The Appropriate";
        if (!MAIL_SERVER.matches(nameEx1)){
            msg = msg + " Mail Server\n";
        }
        if (atpos < 1 || (dotpos - atpos < 2)) {
            msg = msg + " EMAIL_ADDRESS" + "\n";
        }

        if (!hstprt.matches(nameEx2)){
            msg = msg + " SMTP Port\n";
        }
        if (atpos1 < 1 || (dotpos1 - atpos1 < 2)) {
            msg = msg + " User Name\n";
        }
        if (!PASSWORD.matches(pwdRegex)) {
            msg = msg + " Password" + "\n";
        }
        return msg;

    }

    public String deptValidationbuilddesk(Connection con, String cheksum, String url, String merchant, String security, String resp_url) throws Exception {
        String nameEx = "^[a-zA-Z- ]+$";
        String nameEx1 = "^[a-zA-Z0-9- ]+$";
        String nameEx2 = "^[0-9]+$";
        String pwdRegex = "^[0-9A-Za-z!@#$%&* ]+$";
        String hstprt = String.valueOf(SMTP_PORT);
        String msg = "Please Fill The Appropriate";
        if ((!cheksum.matches(nameEx1)) || (cheksum == null) || (cheksum == "")) {
            msg = msg + "CheckSum Name\n";
        }
        UrlValidator urlValidator = new UrlValidator();
        if (!urlValidator.isValid(url)) {
            msg = msg + "Url" + "\n";
        }
        if ((!merchant.matches(nameEx)) || (merchant == null) || (merchant == "")) {
            msg = msg + "Merchant Id \n";
        }
        if ((!security.matches(nameEx)) || (security == null) || (security == "")) {
            msg = msg + "Security Id\n";
        }//resp_url

        UrlValidator urlValidator1 = new UrlValidator();
        if (!urlValidator1.isValid(resp_url)) {
            msg = msg + "Response Url" + "\n";
        }

        return msg;

    }

    public String deptValidationsms(Connection con, String PROVIDER_NAME, String SENDER_ID, String HOST_URL, int HOST_PORT, String USERNAME, String PASSWORD) throws Exception {
        String nameEx = "^[a-zA-Z ]+$";
        String usernameEx = "^[a-zA-Z- ]+$";
      //  String nameEx1 = "^[a-zA-Z0-9@. ]+$";
        String nameEx2 = "^[0-9]+$";
        String pwdRegex = "^[0-9A-Za-z@#$%&* ]+$";
        String hstprt = String.valueOf(HOST_PORT);      
        String msg = "Please Fill The Appropriate";
        if ((!PROVIDER_NAME.matches(nameEx)) || (PROVIDER_NAME == null) || (PROVIDER_NAME == "")) {
            msg = msg + " Provider Name\n";
        }
        if (!SENDER_ID.matches(nameEx)) {
            msg = msg + " Sender Id" + "\n";
        }
        UrlValidator urlValidator = new UrlValidator();
        if (!urlValidator.isValid(HOST_URL)) {
            msg = msg + " Host Url" + "\n";
        }
        if ((!hstprt.matches(nameEx2)) || (hstprt == null) || (hstprt == "")) {
            msg = msg + " Host Port\n";
        }
        if ((!USERNAME.matches(usernameEx)) || (USERNAME == null) || (USERNAME == "")) {
            msg = msg + " User Name\n";
        }
        if (!PASSWORD.matches(pwdRegex)) {
            msg = msg + " Password" + "\n";
        }
        return msg;

    }

    public String deptValidationbaner(Connection con, String baner1, String baner2, String copyrigt, String version, String terms, String contct) throws Exception {
        String nameEx = "^[a-zA-Z0-9. ]+$";
        String nameEx1 = "^[@.a-zA-Z0-9 ]+$";
        String msg = "Please Fill The Appropriate";
        if (!baner1.matches(nameEx)) {
            msg = msg + "Banner1\n";
        }
        else if (!baner2.matches(nameEx)) {
            msg = msg + "Banner2" + "\n";
        }
       else if (!copyrigt.matches(nameEx1)) {
            msg = msg + "Copyrigt\n";
        }
       else if (!version.matches(nameEx)) {
            msg = msg + "Version\n";
        }
      else  if (!terms.matches(nameEx)) {
            msg = msg + "Terms\n";
        }
       else if (!contct.matches(nameEx)) {
            msg = msg + "Contact" + "\n";
        }
        return msg;

    }

    public String deptValidationtemp(Connection con, String smsmsg, String eml) throws Exception {
        String nameEx = "^[a-zA-Z. ]+$";
        String msg = "Please Fill The Appropriate";
        if ((!smsmsg.matches(nameEx)) || (smsmsg == null) || (smsmsg == "")) {
            msg = msg + "SMS Template\n";
        }
        if ((!eml.matches(nameEx)) || (eml == null) || (eml == "")) {
            msg = msg + "EMail Template" + "\n";
        }
        return msg;

    }

    public void doInsertBilldeskChksum(Connection con, String chksum, String url, String merchant, String security, String response) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_msg (BILLDESK_CHECKSUM,BILLDESK_URL,MERCHANT_ID,SECURITY_ID,RESPONSE_URL,GENERIC_ID,CREATED_DATE) values(?,?,?,?,?,?,sysdate())";
        try {
            ps = con.prepareStatement("select (ifnull(max(GENERIC_ID),0)+1) from generic_msg");
            ResultSet rs = ps.executeQuery();
            rs.next();
            ps = con.prepareStatement(sql);
            ps.setString(1, chksum);
            ps.setString(2, url);
            ps.setString(3, merchant);
            ps.setString(4, security);
            ps.setString(5, response);
            ps.setInt(6, rs.getInt(1));
            ps.execute();
            rs.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                System.out.println("error in insertion of billdesk settings : " + e.getMessage());
                throw e;
            }
        }
    }
    ////

    public void doInsertmsttemp(Connection con, String mesg, String emlmsg) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_template (template_id,temp_msg,temp_mail) values(upper(uuid()),?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, mesg);
            ps.setString(2, emlmsg);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                System.out.println("error in insertion of billdesk settings : " + e.getMessage());
                throw e;
            }
        }
    }

    ///
    public void doUpdateBilldeskSettings(Connection con, String chksum, String url, String merchant, String security, String response, int generic_id) throws Exception {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("update generic_msg set BILLDESK_CHECKSUM=?,BILLDESK_URL=?,MERCHANT_ID=?,SECURITY_ID=?,RESPONSE_URL=? where generic_id=?");
            ps.setString(1, chksum);
            ps.setString(2, url);
            ps.setString(3, merchant);
            ps.setString(4, security);
            ps.setString(5, response);
            ps.setInt(6, generic_id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("error in updation of billdesk settings : " + e.getMessage());
            throw e;
        }
    }

   
    public void doUpdatemsgtmplt(Connection con, String messgs, String emlmesg, String generic_id) throws Exception {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("update generic_template set temp_msg=?,temp_mail=? where template_id=?");
            ps.setString(1, messgs);
            ps.setString(2, emlmesg);
            ps.setString(3, generic_id);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println("error in updation of billdesk Template : " + e.getMessage());
            throw e;
        }
    }

    public void setBilldeskchksum(String billdeskchksum) {
        this.billdeskchksum = billdeskchksum;
    }

    public String getBilldeskchksum() {
        return billdeskchksum;
    }

    public void setBilldeskurl(String billdeskurl) {
        this.billdeskurl = billdeskurl;
    }

    public String getBilldeskurl() {
        return billdeskurl;
    }

    public void setMerchantid(String merchantid) {
        this.merchantid = merchantid;
    }

    public String getMerchantid() {
        return merchantid;
    }

    public void setSecurityid(String securityid) {
        this.securityid = securityid;
    }

    public String getSecurityid() {
        return securityid;
    }

    public void setResponseurl(String responseurl) {
        this.responseurl = responseurl;
    }

    public String getResponseurl() {
        return responseurl;
    }

    public void setGeneric_id(int generic_id) {
        this.generic_id = generic_id;
    }

    public int getGeneric_id() {
        return generic_id;
    }

    /**
     * @return the tempid
     */
    public String getTempid() {
        return tempid;
    }

    /**
     * @param tempid the tempid to set
     */
    public void setTempid(String tempid) {
        this.tempid = tempid;
    }

    /**
     * @return the tempmsg
     */
    public String getTempmsg() {
        return tempmsg;
    }

    /**
     * @param tempmsg the tempmsg to set
     */
    public void setTempmsg(String tempmsg) {
        this.tempmsg = tempmsg;
    }

    /**
     * @return the tempmail
     */
    public String getTempmail() {
        return tempmail;
    }

    /**
     * @param tempmail the tempmail to set
     */
    public void setTempmail(String tempmail) {
        this.tempmail = tempmail;
    }
}
