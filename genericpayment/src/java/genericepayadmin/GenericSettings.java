package genericepayadmin;

import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;
import utility.SystemGlobals;
import vicclass.User;

public class GenericSettings extends HttpServlet {

    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType(CONTENT_TYPE);
        User u = request.getSession().getAttribute("user") != null ? (User) request.getSession().getAttribute("user") : null;

        GenericSettingBean sbean = new GenericSettingBean();
        sbean.selectSMS_Setting(u.getConnection());
        GenericSettingBean mailbean = new GenericSettingBean();
        mailbean.selectEmail_Setting(u.getConnection());
        GenericSettingBean bannerbean = new GenericSettingBean();
        bannerbean.selectBanner_Setting(u.getConnection());//selectBanner_Setting
        GenericSettingBean msgtemplt = new GenericSettingBean();
        msgtemplt.selectMsg_template(u.getConnection());
        GenericSettingBean billdeskbean = new GenericSettingBean();
        billdeskbean.selectBilldesk_Setting(u.getConnection());
        request.setAttribute("sbean", sbean);
        request.setAttribute("mailbean", mailbean);
        request.setAttribute("bannerbean", bannerbean);
        request.setAttribute("billdeskbean", billdeskbean);
        request.setAttribute("msgtemplt", msgtemplt);
        RequestDispatcher rd = null;
        if (rd == null) {
            rd = request.getRequestDispatcher("adminpayment/genericSettings.jsp");
        }
        rd.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        GenericSettingBean sbean = new GenericSettingBean();
        GenericSettingBean mailbean = new GenericSettingBean();
        GenericSettingBean bannerbean = new GenericSettingBean();
        GenericSettingBean billdeskbean = new GenericSettingBean();
        GenericSettingBean msgtemplt = new GenericSettingBean();
        RequestDispatcher rd = null;
        String step = request.getParameter("step");
        User u = request.getSession().getAttribute("user") != null ? (User) request.getSession().getAttribute("user") : new User();
        if(step == null){
            response.setContentType(CONTENT_TYPE);
            String fileDir = "assets/metro/images";
            String path = getServletContext().getRealPath(fileDir);
            String filename = null;
            String original = null;
            File f = null;
            //path="D:/";
            long size = 0;            
            try{                
                MultipartRequest multi = new MultipartRequest(request, path, 500 * 1024 * 1024, new GenFileRenamePolicy());
                Enumeration files = multi.getFileNames();
                while (files.hasMoreElements()) {
                    String name = (String) files.nextElement();
                    filename = multi.getFilesystemName(name);
                    original = multi.getOriginalFileName(name);
                    String type = multi.getContentType(name);
                    f = multi.getFile(name);
                    if (filename == null) {
                        throw new Exception("Please browse then upload file.");
                    }
                    if(filename != null && !filename.equals(original)) {
                        //out.println("original file name: " + original);
                    }
                    if (f != null) {
                        size = f.length();
                    }
                    if (type.contains("application/pdf") || type.contains("image")) {
                    } else {
                        throw new Exception("Please upload PDF or JPG file only. You are trying to upload file type of " + type.toString());
                    }
                    if (filename != null && !filename.equals(original)) {
                    }
                    if (f != null) {
                        size = f.length();
                        if (size > (1024 * 1024 * 3)) {
                            throw new Exception("File size cannot be more than 3MB");
                        }
                    } else {
                        throw new Exception("Please browse and upload file.");
                    }                    
                    sbean.selectSMS_Setting(u.getConnection());
                    mailbean.selectEmail_Setting(u.getConnection());
                    bannerbean.selectBanner_Setting(u.getConnection());
                    billdeskbean.selectBilldesk_Setting(u.getConnection());
                    msgtemplt.selectMsg_template(u.getConnection());
                    request.setAttribute("sbean", sbean);
                    request.setAttribute("mailbean", mailbean);
                    request.setAttribute("bannerbean", bannerbean);
                    request.setAttribute("billdeskbean", billdeskbean);
                    request.setAttribute("msgtemplt", msgtemplt);
                    rd = request.getRequestDispatcher("adminpayment/genericSettings.jsp?msg=Success");
                     rd.forward(request, response);
                    
                }
            } catch (Exception e) {
               out.print("Error"); 
                System.out.println("Error " + e.getMessage());
                if (f != null) {
                    f.delete();
                     if (rd == null) {
                    rd = request.getRequestDispatcher("adminpayment/genericSettings.jsp?msg=" + e.getMessage());
                     rd.forward(request, response);
                }
                }
            }
           
        }
        
        else if (step.equals("sms")) {
            int HOST_PORT = 0;
            String PROVIDER_NAME = "", SENDER_ID = "", HOST_URL = "", USERNAME = "", PASSWORD = "";
            String msg1 = "";            
            sbean.selectSMS_Setting(u.getConnection());
            PROVIDER_NAME = request.getParameter("smsprovidername");
            SENDER_ID = request.getParameter("smssenderid");
            HOST_URL = request.getParameter("smshosturl");
            HOST_PORT = Integer.parseInt(request.getParameter("smsport"));
            USERNAME = request.getParameter("smsusername");
            PASSWORD = request.getParameter("smspassword");
            sbean.setPROVIDER_NAME(PROVIDER_NAME);
            sbean.setSENDER_ID(SENDER_ID);
            sbean.setHOST_URL(HOST_URL);
            sbean.setHOST_PORT(HOST_PORT);
            sbean.setSMS_USERNAME(USERNAME);
            sbean.setSMS_PASSWORD(PASSWORD);
            GenericSettingBean gbean = new GenericSettingBean();
            try {
             //   msg1 = gbean.deptValidationsms(u.getConnection(), PROVIDER_NAME, SENDER_ID, HOST_URL, HOST_PORT, USERNAME, PASSWORD);
                 msg1 = "Please Fill The Appropriate";
                if(msg1.equalsIgnoreCase("Please Fill The Appropriate")){
                    if (sbean.getSMS_ID() != 0) {
                        sbean.updateSMS_Setting(u.getConnection());
                        out.print("success");
                    } else {
                        sbean.saveSMS_Setting(u.getConnection());
                        out.print("success");
                    }
                }else{
                    if(rd == null){                        
                        out.print( msg1);
                    }
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                out.print("Error");                
            }
        } else if (step.equals("email")) {
            String MAIL_SERVER = "", EMAIL_ADDRESS = "", USERNAME = "", PASSWORD = "";
            int SMTP_PORT = 0;
            String msg1 = "";            
            mailbean.selectEmail_Setting(u.getConnection());
            EMAIL_ADDRESS = request.getParameter("emailadds");
            MAIL_SERVER = request.getParameter("mailserver");
            USERNAME = request.getParameter("emailusername");
            PASSWORD = request.getParameter("emailpassword");
            SMTP_PORT = Integer.parseInt(request.getParameter("mailsmtpport"));
            mailbean.setEMAIL_ADDRESS(EMAIL_ADDRESS);
            mailbean.setMAIL_SERVER(MAIL_SERVER);
            mailbean.setSMTP_PORT(SMTP_PORT);
            mailbean.setEMAIL_USERNAME(USERNAME);
            mailbean.setEMAIL_PASSWORD(PASSWORD);
            GenericSettingBean gbean = new GenericSettingBean();
            try {
                //msg1 = gbean.deptValidationEmail(u.getConnection(), EMAIL_ADDRESS, MAIL_SERVER, USERNAME, PASSWORD, SMTP_PORT);
                  msg1 = "Please Fill The Appropriate";
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {

                    if (mailbean.getEMAIL_ID() != 0) {
                        mailbean.updateEmail_Setting(u.getConnection());
                        out.print("success");
                    } else {
                        mailbean.saveEmail_Setting(u.getConnection());
                        out.print("success");
                    }
                } else {
                    if (rd == null) {                        
                         out.print( msg1);
                    }
                }
            }catch (Exception e){
                out.print("Error");                
            }
        } else if (step.equalsIgnoreCase("banner")) {
            String banner1 = "", banner2 = "", copyright = "", terms = "", contactus = "", version = "";
            String msg1 = "";            
            bannerbean.selectBanner_Setting(u.getConnection());
            banner1 = request.getParameter("banner1");
            banner2 = request.getParameter("banner2");
            copyright = request.getParameter("copyright");
            terms = request.getParameter("terms");
            contactus = request.getParameter("contact");
            version = request.getParameter("version");
            bannerbean.setContent1(banner1);
            bannerbean.setContent2(banner2);
            bannerbean.setCopyright(copyright);
            bannerbean.setTerms(terms);
            bannerbean.setContactus(contactus);
            bannerbean.setVersion(version);
            GenericSettingBean gbean = new GenericSettingBean();
            try {
                msg1 = gbean.deptValidationbaner(u.getConnection(), banner1, banner2, copyright, version, terms, contactus);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")) {

                    if (bannerbean.getContent_id() != 0) {
                        bannerbean.updateBanner_Setting(u.getConnection());
                        out.print("success");
                    } else {
                        bannerbean.saveBanner_Setting(u.getConnection());
                        out.print("success");
                    }
                } else {
                    if(rd == null){                        
                         out.print(msg1);
                    }
                }
            }catch (Exception e) {                
                out.print("Error");
            }
        } else if (step.equalsIgnoreCase("billdesk")) {
            String chksum = "", url = "", merchant = "", security = "", responseurl = "";
            String msg1 = "";
            String msg = "Please Fill The Appropriate";
            billdeskbean.selectBilldesk_Setting(u.getConnection());
            chksum = request.getParameter("chksum");
            url = request.getParameter("url");
            merchant = request.getParameter("merchantid");
            security = request.getParameter("securityid");
            responseurl = request.getParameter("responseurl");
            billdeskbean.setBilldeskchksum(chksum);
            billdeskbean.setBilldeskurl(url);
            billdeskbean.setMerchantid(merchant);
            billdeskbean.setSecurityid(security);
            billdeskbean.setResponseurl(responseurl);
            GenericSettingBean gbean = new GenericSettingBean();
            try{
                //msg1 = gbean.deptValidationbuilddesk(u.getConnection(), chksum, url, merchant, security, responseurl);
                msg1="Please Fill The Appropriate";
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")){
                    if (billdeskbean.getGeneric_id() != 0) {
                        billdeskbean.doUpdateBilldeskSettings(u.getConnection(), chksum, url, merchant, security, responseurl, billdeskbean.getGeneric_id());
                        out.print("success");
                    }else{
                        billdeskbean.doInsertBilldeskChksum(u.getConnection(), chksum, url, merchant, security, responseurl);
                        out.print("success");
                    }
                }else{
                    out.print(msg1);
                }
            }catch(Exception e){
                out.print("Error");
            }
        }else if (step.equalsIgnoreCase("mesages")){
            String messgs = "";
            String emlmessg = "";
            String msg1 = "";
            String msg = "Please Fill The Appropriate";
            msgtemplt.selectMsg_template(u.getConnection());
            messgs = request.getParameter("mesages");
            emlmessg = request.getParameter("emlmesages");
            GenericSettingBean gbean = new GenericSettingBean();
            try{
                msg1 = gbean.deptValidationtemp(u.getConnection(), messgs, emlmessg);
                if (msg1.equalsIgnoreCase("Please Fill The Appropriate")){
                    if(msgtemplt.getTempid() != ""){
                        msgtemplt.doUpdatemsgtmplt(u.getConnection(), messgs, emlmessg, msgtemplt.getTempid());
                        out.print("success");
                        
                    }else{
                        msgtemplt.doInsertmsttemp(u.getConnection(), messgs, emlmessg);
                        out.print("success");                        
                    }
                }else{                    
                    out.print(msg1);
                }
            } catch (Exception e) { 
                System.err.println("Exception  ::" +e.getMessage());
                out.print("Error");
            }
        }
        SystemGlobals.initGlobalsGeneric();

        /*
         * sbean.selectSMS_Setting(u.getConnection());
         * mailbean.selectEmail_Setting(u.getConnection());
         * bannerbean.selectBanner_Setting(u.getConnection());
         * billdeskbean.selectBilldesk_Setting(u.getConnection());
         * msgtemplt.selectMsg_template(u.getConnection());
         * request.setAttribute("sbean", sbean);
         * request.setAttribute("mailbean", mailbean);
         * request.setAttribute("bannerbean", bannerbean);
         * request.setAttribute("billdeskbean", billdeskbean);
         * request.setAttribute("msgtemplt", msgtemplt);
         */
        
        

    }
}
