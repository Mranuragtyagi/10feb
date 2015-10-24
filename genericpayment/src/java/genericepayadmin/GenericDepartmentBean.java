package genericepayadmin;
import exceptions.UnknownException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import vicclas.MD5;

public class GenericDepartmentBean{    
    private String username;
    private String fullname; 
    private String password; 
    private String branch_location_id;
    private String branch_location;
    private String role;
    private String department_id;
    private String department;
    private int state_id; 
    private String state; 
    private String no_of_attempts;
    private String status;
    private String ispwdchng; 
    private java.sql.Date created_date;
    private java.sql.Timestamp modified_date;    
    private String challan_status;
    private String challan_no; 
    private String dlrname ;
    private String address;
    private String city;
    private java.sql.Date payment_date;
    private java.sql.Date period_from;    
    private java.sql.Date period_to;
    private double amount;
    private String purpose;
    private String mobile;
    private String email;

    public GenericDepartmentBean() {
        username = null;
        fullname = null;
        password = null;
        branch_location_id = null;
        branch_location = null;
        role = null;
        department_id = null;
        department = null;
        state_id = 0;
        state = null;
        no_of_attempts = null;
        status = null;
        ispwdchng = null;
        created_date = null;
        modified_date = null;        
        challan_status = null;
        challan_no=null; 
        dlrname=null;
        address = null;
        city=null;
        payment_date=null;
        period_from=null;
        period_to = null;
        amount=0.0;
        purpose=null;
        mobile=null;
        email=null;
                
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBranch_location_id() {
        return branch_location_id;
    }

    public void setBranch_location_id(String branch_location_id) {
        this.branch_location_id = branch_location_id;
    }

    public String getBranch_location() {
        return branch_location;
    }

    public void setBranch_location(String branch_location) {
        this.branch_location = branch_location;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getState_id() {
        return state_id;
    }

    public void setState_id(int state_id) {
        this.state_id = state_id;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getNo_of_attempts() {
        return no_of_attempts;
    }

    public void setNo_of_attempts(String no_of_attempts) {
        this.no_of_attempts = no_of_attempts;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIspwdchng() {
        return ispwdchng;
    }

    public void setIspwdchng(String ispwdchng) {
        this.ispwdchng = ispwdchng;
    }

    public Date getCreated_date() {
        return created_date;
    }

    public void setCreated_date(Date created_date) {
        this.created_date = created_date;
    }

    public Timestamp getModified_date() {
        return modified_date;
    }

    public void setModified_date(Timestamp modified_date) {
        this.modified_date = modified_date;
    }

    public String getChallan_status() {
        return challan_status;
    }

    public void setChallan_status(String challan_status) {
        this.challan_status = challan_status;
    }

    public String getChallan_no() {
        return challan_no;
    }

    public void setChallan_no(String challan_no) {
        this.challan_no = challan_no;
    }

    public String getDlrname() {
        return dlrname;
    }

    public void setDlrname(String dlrname) {
        this.dlrname = dlrname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Date getPayment_date() {
        return payment_date;
    }

    public void setPayment_date(Date payment_date) {
        this.payment_date = payment_date;
    }

    public Date getPeriod_from() {
        return period_from;
    }

    public void setPeriod_from(Date period_from) {
        this.period_from = period_from;
    }

    public Date getPeriod_to() {
        return period_to;
    }

    public void setPeriod_to(Date period_to) {
        this.period_to = period_to;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public boolean getLogin(Connection connection,String rnd)throws Exception{
        boolean f = false;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = " select gdu.username, gdu.fullname, gdu.password, gdu.branch_location, "
                + " (select b.branch_name from branch_location b where b.id=gdu.branch_location)as "
                + " branch_locationname , role, department, (select d.dept_name from generic_dept d where "
                + " d.dept_id=gdu.department) as departmentname, state, (select s.state_name from states s where "
                + " s.state_code=gdu.state)as statename, gdu.no_of_attempts, gdu.status, gdu.ispwdchng, "
                + " gdu.created_date, gdu.modified_date from generic_dept_users gdu where upper(username)=? "
                + " and department=? ";
        try{
            ps = connection.prepareStatement(query);
            ps.setString(1, this.username.toUpperCase());
            ps.setString(2, this.department_id);
            rs=ps.executeQuery();
            if(rs.next()){
                 MD5 m = new MD5();
                String dbpassword = rs.getString("password");
               // String ab=dbpassword+rnd;
                String encriptedpassword = m.calcMD5(this.password);
               // String encriptedpassword =this.password;
                if(encriptedpassword.equalsIgnoreCase(dbpassword)){
                    f = true;
                    this.username = rs.getString("username");
                    this.fullname = rs.getString("fullname");                    
                    this.branch_location_id = rs.getString("branch_location");
                    this.branch_location = rs.getString("branch_locationname");
                    this.role = rs.getString("role");
                    this.department_id = rs.getString("department");
                    this.department = rs.getString("departmentname");
                    this.state_id = rs.getInt("state");
                    this.state = rs.getString("statename");
                    this.no_of_attempts = rs.getString("no_of_attempts");
                    this.status = rs.getString("status");
                    this.ispwdchng = rs.getString("ispwdchng");
                    this.created_date = rs.getDate("created_date");
                    this.modified_date = rs.getTimestamp("modified_date");
                }else{
                    f = false;
                }
            }else{
                throw new Exception();
            }
        }catch(Exception exception){
            throw exception;
        }finally{
            try{
                if(ps!=null){ps.close();}
            }catch(Exception e){
                System.err.println("Error in closing PreparedStatement :: " +e.getMessage());
            }
        }
        return f;
    }
    
    
    
    public void addDepartmentUser(Connection connection)throws Exception{
        PreparedStatement ps = null;
        String query = "insert into generic_dept_users(username, fullname, password, branch_location, role,"
                    + " department, state, no_of_attempts, status, ispwdchng, created_date) "
                    + " values (?,?,?,?,?,?,?,?,?,?,now())";
        try{
            ps = connection.prepareStatement(query);
            ps.setString(1, this.username);
            ps.setString(2, this.fullname);
            ps.setString(3, this.password);
            ps.setString(4, this.branch_location_id);
            ps.setString(5, this.role);
            ps.setString(6, this.department_id);
            ps.setInt(7, this.state_id);
            ps.setString(8, this.no_of_attempts);
            ps.setString(9, this.status);
            ps.setString(10, this.ispwdchng);
            ps.execute();
        }catch(Exception exception){
            throw exception;
        }finally{
            try{
                if(ps!=null){ps.close();}
            }catch(Exception e){
                System.err.println("Error in closing PreparedStatement :: " +e.getMessage());
            }
        
        }
    }
    
    public ArrayList getDetailsByDepartment(Connection con) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        String sql = " select gp.challan_status, gp.challan_no, gp.dlrname, gp.address, gp.city, gp.state,"
                + " gp.payment_date, gp.period_from, gp.period_to, gp.amount, gp.department, chd.dept_id, "
                + " chd.dept_name, gp.purpose from generic_epayment gp join generic_dept chd  on "
                + " chd.dept_id=gp.department where gp.department=? and branch_location=? "
                + " and gp.challan_no is not null ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, this.department_id);
            ps.setString(2, this.branch_location_id);
            rs = ps.executeQuery();
            while (rs.next()){
                GenericDepartmentBean gdbean = new GenericDepartmentBean();                
                gdbean.setChallan_status(rs.getString("challan_status"));
                gdbean.setChallan_no(rs.getString("challan_no"));
                gdbean.setDlrname(rs.getString("dlrname"));                
                gdbean.setAddress(rs.getString("address"));
                gdbean.setCity(rs.getString("city"));
                gdbean.setState(rs.getString("state"));
                gdbean.setPayment_date(rs.getDate("payment_date"));
                gdbean.setPeriod_from(rs.getDate("period_from"));
                gdbean.setPeriod_to(rs.getDate("period_to"));
                gdbean.setAmount(rs.getDouble("amount"));
                gdbean.setDepartment(rs.getString("dept_name"));
                gdbean.setPurpose(rs.getString("purpose"));
                al.add(gdbean);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return al;
    }
    
    public void doVerifyStatusByChallan(Connection con, String challan, String deptid) throws Exception {
        PreparedStatement ps = null;
        try {
            String sql = "update generic_epayment set challan_status='1', verify_date=now() "
                    + " where challan_no=? and department=? ";
            ps = con.prepareStatement(sql);
            ps.setString(1, challan);            
            ps.setString(2, deptid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            ps.close();
        }
    }
    
    public void getUserDetailsByChallan(Connection con, String deptid, String challan) throws Exception {
        ResultSet rs = null;
        GenericDepartmentBean genrbean = null;
        String sql = "";
        PreparedStatement ps = null;
        String isregistered;
        isregistered = getRegistrationStatusByChallan(con, challan) != null ? getRegistrationStatusByChallan(con,challan): "";
        if (isregistered.equalsIgnoreCase("Y")) {
            sql = "select gup.dlrname,gup.address,gup.mobile,gup.city,gup.state,gp.email,gp.challan_no, "
                    + "gp.amount,gp.department,cd.dept_name, gp.period_from, "
                    + "gp.period_to,gp.payment_date,gp.purpose from generic_epayment gp "
                    + "join generic_dept cd on gp.department=cd.dept_id join generic_user_profile gup "
                    + "on gp.email=gup.email where gp.challan_no=? and gp.department=? and "
                    + "gp.cin is not null  ";
        } else {
            sql ="select gp.dlrname, gp.address, gp.city, gp.state, gp.mobile, gp.email, gp.challan_no, "
                    + " gp.amount, gp.department, cd.dept_name, gp.period_from, gp.period_to, gp.payment_date,"
                    + " gp.purpose from generic_epayment gp join generic_dept cd on gp.department=cd.DEPT_ID "
                    + " where gp.challan_no= ? and gp.department=? and gp.cin is not null";
        }
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, challan);
            ps.setString(2, deptid);
            rs = ps.executeQuery();
            if (rs.next()) {
                
                this.dlrname =rs.getString("dlrname");
                this.address = rs.getString("address");
                this.city = rs.getString("city");
                this.state = rs.getString("state");
                this.mobile = rs.getString("mobile");
                this.email = rs.getString("email");
                this.challan_no = rs.getString("challan_no");
                this.amount = rs.getDouble("amount");
                this.department = rs.getString("dept_name");
                this.department_id = rs.getString("department");
                this.period_from = rs.getDate("period_from");
                this.period_to = rs.getDate("period_to");
                this.payment_date = rs.getDate("payment_date");
                this.purpose = rs.getString("purpose");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }
    
    public String getRegistrationStatusByChallan(Connection con, String challan) throws Exception {
        PreparedStatement ps = null;        
        ResultSet rs = null;
        String stats = null;
        String sql =" select registered from generic_epayment where challan_no=? and cin is not null ";
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, challan);
            rs = ps.executeQuery();
            if (rs.next()) {                
                stats = rs.getString("registered");
            } else {
                stats = "N";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
        }
        return stats;
    }
    
    public static void changeDeptPaswrdFirstTime(String oldpwd, Connection conn, String username, String password, String dept) throws Exception {
        try {
            String sql = sql = "select password as pwd from generic_dept_users where upper(username)=?  "
                    + " and department=? ";
            PreparedStatement ps1 = conn.prepareStatement(sql);
            ps1.setString(1, username.toUpperCase());
            ps1.setString(2, dept);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                String pwd1 = rs.getString("pwd");
                MD5 m = new MD5();
                String mf = m.calcMD5(oldpwd); // 
                if (mf.equals(pwd1)){
                    MD5 md = new MD5();
                    String pwd = md.calcMD5(password);
                    java.util.Date d = new java.util.Date();
                    java.sql.Date pred = new java.sql.Date(d.getTime());
                    sql = "update generic_dept_users set password=?, created_date=?,ispwdchng=? where upper(username)=? and department=? ";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, pwd);
                    ps.setDate(2, pred);
                    ps.setString(3, "1");
                    ps.setString(4, username.toUpperCase());
                    ps.setString(5, dept);
                    ps.execute();
                    ps.close();
                } else {
                    throw new Exception("Old Password is wrong. Please Try Again.");
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new UnknownException(e.toString());
        }
    }
    
     public static String getStatusByChallan(Connection conn, String deptid, String challan) throws Exception {        
        String status1 = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String sql = "select challan_status from generic_epayment where department=? and challan_no=? and cin is not null";
            ps = conn.prepareStatement(sql);
            ps.setString(1, deptid);
            ps.setString(2, challan);
            rs = ps.executeQuery();
            if (rs.next()) {
                status1 = rs.getString("challan_status");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            rs.close();
            ps.close();
        }
        return status1;
    }
     
     public void doCancelStatusByChallan(Connection con, String challan, String deptid) throws Exception{
        PreparedStatement ps = null;
        try{
            String sql = "update generic_epayment set challan_status='0' where challan_no=? and department=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, challan);
            ps.setString(2, deptid);
            ps.executeUpdate();
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }finally {
            ps.close();
        }
    }
    
    
}
