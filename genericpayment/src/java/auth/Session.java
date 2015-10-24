package auth;

import genericepayment.GenericBean;
import java.sql.*;
import java.util.Enumeration;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utility.SystemGlobals;
import vicclass.User;

public class Session {
    static Connection conn;
    static {
        try{
            /*
            Class.forName(SystemGlobals.getDriver());
            conn = DriverManager.getConnection(SystemGlobals.getUrl(), SystemGlobals.getUsername(), SystemGlobals.getPassword()); 
             */
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhrpayonline", "root", "");
            System.out.println("Connection is created ." + conn);
        }catch (Exception ee){
            System.err.println(ee.getMessage());
        }
    }

    public static void create(HttpServletRequest request) {
        try {
            String session_id;
            String token;
            String ip_address;
            String user_agent;
            session_id = "" + request.getSession().getId();
            Cookie c = new Cookie("uid", session_id);
            token = request.getParameter("token");
            user_agent = request.getHeader("user-agent");
            ip_address = request.getHeader("X-FORWARDED-FOR");
            if(ip_address == null){
                ip_address = request.getRemoteAddr();
            }
            request.getSession().invalidate();
            session_id = request.getSession(true).getId();
            String sql = "insert into sessions (`session_id`, `token`, `ip_address`, `user_agent`) values (?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, session_id);
            ps.setString(2, token);
            ps.setString(3, ip_address);
            ps.setString(4, user_agent);
            ps.executeUpdate();
            ps.close();
            ps = conn.prepareStatement("delete from sessions where last_activity < date_sub(now(), interval 5 minute )");
            ps.executeUpdate();
            ps.close();
        }catch (Exception ee){
            System.out.println("Session Save Error :" + ee);
        }
    }

    public static boolean Validate(HttpServletRequest request, HttpServletResponse response) {
        boolean v = false;
        try{
            Enumeration headerNames = request.getHeaderNames();
            String JSESSIONID = null;
            while (headerNames.hasMoreElements()) {
                String key = (String) headerNames.nextElement();
                String value = request.getHeader(key);
                /*System.out.println("V=>"+key+" : "+value);*/
                if (value.indexOf("JSESSIONID") != -1) {
                    JSESSIONID = value;
                }
            }
            JSESSIONID = JSESSIONID.split("=")[1];
            String session_id;
            String token;
            String ip_address;
            String user_agent;
            session_id = "" + request.getSession().getId();
            token = request.getParameter("token");
            user_agent = request.getHeader("user-agent");
            ip_address = request.getHeader("X-FORWARDED-FOR");
            if (ip_address == null) {
                ip_address = request.getRemoteAddr();
            }
            User u = (User) request.getSession().getAttribute("userloggedin");
            GenericBean gb = (GenericBean) request.getSession().getAttribute("signupbean");
            /*
            if(!JSESSIONID.equalsIgnoreCase(session_id)) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
             throw new Exception("Invalide Session ID");
             }
             */
            PreparedStatement ps = conn.prepareStatement("delete from sessions where last_activity < date_sub(now(), interval 5 minute )");
            ps.executeUpdate();
            ps.close();
            String sql = "select * from sessions where session_id=? and ip_address=? and user_agent=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, session_id);
            ps.setString(2, ip_address);
            ps.setString(3, user_agent);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()){
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
                throw new Exception("Invalide Session ID");
            }
            ps.close();
            ps = conn.prepareStatement("update sessions set session_id=?,last_activity=sysdate() where session_id=?  ");
            ps.setString(2, session_id);
            request.getSession().invalidate();
            session_id = request.getSession(true).getId();
            ps.setString(1, session_id);
            ps.executeUpdate();
            v = true;
            request.getSession().setAttribute("signupbean", gb);
            request.getSession().setAttribute("userloggedin", u);
        }catch (Exception ee){
            v = false;
            System.out.println("Session Validation :" + ee);
        }
        return v;
    }

    public static void destroy(HttpServletRequest request) {
        try {
            String session_id;
            session_id = "" + request.getSession().getId();
            String sql = "delete from  sessions  where `session_id` = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, session_id);
            ps.executeUpdate();
            ps.close();
        }catch (Exception ee) {
            System.out.println("Session Destroy Error :" + ee);
        }
        request.getSession().invalidate();
    }
}
