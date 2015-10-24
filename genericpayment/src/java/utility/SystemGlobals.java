package utility;

import genericepayadmin.GenericSettingBean;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import vicclass.User;

public class SystemGlobals{
    
    private static SystemGlobals globals = new SystemGlobals();
    private String appPath = null;
    private String driver = null;
    private String url = null;
    private String username = null;
    private String password = null;
    private String enabled = "";
    private String dbname = null;
    private String host = null;
    
    // sms settings
    private int sms_ide = 0;
    private String sms_usernm = null;
    private String sms_pwd = null;
    private String provider_name = null;
    private String host_url = null;
    private int host_port = 0;
    private String sender_id = null;
    
    // email setting
    private int email_ide = 0;
    private String email_usernm = null;
    private String email_pwd = null;
    private String mail_server = null;
    private String email_address = null;
    private int smtp_port = 0;
    
    //billdesk setting    
    private String billdesk_chksum = null;
    private String billdesk_url = null;
    private String merchant_id = null;
    private String security_id = null;
    private String response_url = null;
    private int generic_id = 0;
    
    /* Footer and banner setting settings */
    private String copyright = null;
    private String version = null;
    private String terms = null;
    private String contactus = null;
    private String content1 = null;
    private String content2 = null;
    private int content_id = 0;

    /*Cnnection pool*/
    private int maxActive=10;
    private int maxIdle=1;
    
    private SystemGlobals() {
    }

    public static void initGlobalsGeneric() {
        Connection con = null;
        User u = new User();        
        u.createConnection();
        con = u.getConnection();        
        GenericSettingBean gbnmethod = new GenericSettingBean();
        try {
            gbnmethod.selectBilldesk_Setting(con);
            gbnmethod.selectSMS_Setting(con);
            gbnmethod.selectEmail_Setting(con);
            gbnmethod.selectBanner_Setting(con);            
            /*sms setting starts*/
            globals.sms_ide = gbnmethod.getSMS_ID();
            globals.sms_usernm = gbnmethod.getSMS_USERNAME();
            globals.sms_pwd = gbnmethod.getSMS_PASSWORD();
            globals.provider_name = gbnmethod.getPROVIDER_NAME();
            globals.host_port = gbnmethod.getHOST_PORT();
            globals.host_url = gbnmethod.getHOST_URL();
            globals.sender_id = gbnmethod.getSENDER_ID();

            /*email setting starts*/
            globals.email_ide = gbnmethod.getEMAIL_ID();
            globals.email_usernm = gbnmethod.getEMAIL_USERNAME();
            globals.email_pwd = gbnmethod.getEMAIL_PASSWORD();
            globals.mail_server = gbnmethod.getMAIL_SERVER();
            globals.email_address = gbnmethod.getEMAIL_ADDRESS();
            globals.smtp_port = gbnmethod.getSMTP_PORT();

            /*billdesk setting starts*/
            globals.billdesk_chksum = gbnmethod.getBilldeskchksum();
            globals.billdesk_url = gbnmethod.getBilldeskurl();
            globals.merchant_id = gbnmethod.getMerchantid();
            globals.security_id = gbnmethod.getSecurityid();
            globals.response_url = gbnmethod.getResponseurl();
            globals.generic_id = gbnmethod.getGeneric_id();
            
            /* banner and footer setting */
            globals.copyright = gbnmethod.getCopyright();
            globals.version = gbnmethod.getVersion();
            globals.terms = gbnmethod.getTerms();
            globals.contactus = gbnmethod.getContactus();
            globals.content1 = gbnmethod.getContent1();
            globals.content2 = gbnmethod.getContent2();
            globals.content_id = gbnmethod.getContent_id();

        } catch (Exception e) {
            System.out.println("exception in initGlobalsGeneric method : " + e.getMessage());
        } finally {
            try {
                con.close();
            } catch (Exception e) {
                System.out.println("connection problem in system globals" + e.getMessage());
            }
        }
    }

    public static void copyProperties(Properties props) {
        globals = new SystemGlobals();
        try {
            globals.driver = props.getProperty("jdbc.driver");
            globals.url = props.getProperty("jdbc.url");
            globals.username = props.getProperty("jdbc.username");
            globals.password = props.getProperty("jdbc.password");
            globals.dbname = props.getProperty("jdbc.dbname");
            globals.host = props.getProperty("jdbc.host");
            globals.enabled = props.getProperty("enabled");
            globals.maxActive=Integer.parseInt(props.getProperty("maxactive"));
            globals.maxIdle=Integer.parseInt(props.getProperty("maxidle"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static void initGlobals(String appPath) {
        globals = new SystemGlobals();
        globals.appPath = appPath;
        try {
            Properties props = new Properties();
            InputStream input = null;
            input = new FileInputStream(appPath);
            props.load(input);
            globals.driver = props.getProperty("jdbc.driver");
            globals.url = props.getProperty("jdbc.url");
            globals.username = props.getProperty("jdbc.username");
            globals.password = props.getProperty("jdbc.password");
            globals.dbname = props.getProperty("jdbc.dbname");
            globals.host = props.getProperty("jdbc.host");
            globals.enabled = props.getProperty("enabled");
             globals.maxActive=Integer.parseInt(props.getProperty("maxactive"));
            globals.maxIdle=Integer.parseInt(props.getProperty("maxidle"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public static boolean getStatus(String appPath) {
        boolean boo = false;
        try {
            Properties props = new Properties();
            InputStream input = null;
            input = new FileInputStream(appPath);
            props.load(input);
            globals.enabled = props.getProperty("enabled");
            if (globals.enabled.equals("true")) {
                boo = true;
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return boo;
    }

    public static boolean getDBConnectivity(String driver, String url, String uname, String pass) throws Exception {
        boolean boo = false;
        try {
            Class.forName(driver);
            DriverManager.getConnection(url, uname, pass);
            boo = true;
        }catch (ClassNotFoundException e) {
            System.out.println("Error: " + e.getMessage());
            //  throw e;
        }catch (SQLException e) {
            System.out.println("app " + e.getMessage());
            // throw e;
        }catch (Exception e) {
            System.out.println("app " + e.getMessage());
            // throw e;
        }
        return boo;
    }

    public static String getPath() {
        return globals.appPath;
    }

    public static String getDriver() {
        return globals.driver;
    }

    public static String getUrl() {
        return globals.url;
    }

    public static String getUsername() {
        return globals.username;
    }

    public static String getPassword() {
        return globals.password;
    }

    public static String getEnabled() {
        return globals.enabled;
    }

    public static String getCopyright() {
        return globals.copyright;
    }

    public static String getVersion() {
        return globals.version;
    }

    public static String getTerms() {
        return globals.terms;
    }

    public static String getContactus() {
        return globals.contactus;
    }

    public static String getContent1() {
        return globals.content1;
    }

    public static String getContent2() {
        return globals.content2;
    }

    public static int getContent_id() {
        return globals.content_id;
    }

    // sms settings
    public static int getSms_ide() {
        return globals.sms_ide;
    }

    public static String getSms_usernm() {
        return globals.sms_usernm;
    }

    public static String getSms_pwd() {
        return globals.sms_pwd;
    }

    public static String getProvider_name() {
        return globals.provider_name;
    }

    public static String getHost_url() {
        return globals.host_url;
    }

    public static int getHost_port() {
        return globals.host_port;
    }

    public static String getSender_id() {
        return globals.sender_id;
    }

    // email setting
    public static int getEmail_ide() {
        return globals.email_ide;
    }

    public static String getEmail_usernm() {
        return globals.email_usernm;
    }

    public static String getEmail_pwd() {
        return globals.email_pwd;
    }

    public static String getMail_server() {
        return globals.mail_server;
    }

    public static String getEmail_address() {
        return globals.email_address;
    }

    public static int getSmtp_port() {
        return globals.smtp_port;
    }

    // billdesk setting
    public static String getBilldesk_chksum() {
        return globals.billdesk_chksum;
    }

    public static String getBilldesk_url() {
        return globals.billdesk_url;
    }

    public static String getDbname() {
        return globals.dbname;
    }

    public static String getHost() {
        return globals.host;
    }

    public static String getMerchant_id() {
        return globals.merchant_id;
    }

    public static String getSecurity_id() {
        return globals.security_id;
    }

    public static String getResponse_url() {
        return globals.response_url;
    }

    public static int getGeneric_id() {
        return globals.generic_id;
    }

    /**
     * @return the maxActive
     */
    public static int getMaxActive() {
        return globals.maxActive;
    }

    /**
     * @param maxActive the maxActive to set
     */
    public void setMaxActive(int maxActive) {
        this.maxActive = maxActive;
    }

    /**
     * @return the maxIdle
     */
    public static int getMaxIdle() {
        return globals.maxIdle;
    }

    /**
     * @param maxIdle the maxIdle to set
     */
    public void setMaxIdle(int maxIdle) {
        this.maxIdle = maxIdle;
    }
}
