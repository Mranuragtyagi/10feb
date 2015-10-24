package genericepayadmin;
import exceptions.DataAlreadyExistsException;
import exceptions.DeleteNotAllowedException;
import exceptions.NoDataFoundException;
import exceptions.SelectNotAllowedException;
import exceptions.UnknownException;
import exceptions.UpdateNotAllowedException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import vicclas.MD5;

public class GenericAdminDao {

    public GenericAdminDao() {
    }

    public ArrayList getLockedIdProofByDeptid(Connection con, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = "select initcap(IDPROOF) as IDPROOF from generic_idproof where DEPARTMENT=? and "
                    + " STATUS=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, "I");
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setIdproof(rs.getString("IDPROOF"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    public void doInsertDepartment(Connection con, GenericAdminBean gb) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_dept (dept_id, dept_name,status) values(upper(uuid()),upper(?),?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, gb.getDepartment());
            ps.setString(2, "A");
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
                System.out.println(e.getMessage());
            }
        }
    }

    public void doInsertIdProof(Connection con, String dept, String idproof) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_idproof (DEPARTMENT, IDPROOF,status,CREATED_DATE,UNIQUEID) values(?,?,?,sysdate(),upper(uuid()))";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, idproof);
            ps.setString(3, "A");
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
                System.out.println("error in insertion of idproof : " + e.getMessage());
            }
        }
    }

    public String getTaxPurposeIdByTreasuryCode(Connection conn, String taxpurpose, String thc, int deptid, String majortax) throws Exception {
        String taxpurposeid = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String sql = "select TAX_PURPOSE_ID from echallan_tax_purposes where TAX_PURPOSE=? and "
                    + " TREASURY_HEAD_CODE=? and DEPT_ID=? and MAJOR_TAX_ID=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, taxpurpose.toUpperCase());
            ps.setString(2, thc);
            ps.setInt(3, deptid);
            ps.setString(4, majortax);
            rs = ps.executeQuery();
            if (rs.next()) {
                taxpurposeid = rs.getString("TAX_PURPOSE_ID");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            rs.close();
            ps.close();
        }
        return taxpurposeid;
    }

    public ArrayList getDepartmentDetailsByPeriodWithPaginationGeneral(Connection conn, Date pfrom, Date pto, String type, String dept) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList getuserlist = null;
        GenericAdminBean genrbean = null;
        if (type.equalsIgnoreCase("all")){
            String sql = "select gp.purpose,gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,"
                    + " gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,"
                    + " chd.DEPT_ID,chd.dept_name from generic_epayment gp join generic_dept chd  on "
                    + " chd.DEPT_ID=gp.department where gp.PAYMENT_DATE between ? and ?  and gp.DEPARTMENT=? "
                    + " and gp.challan_no is not null and gp.cin is not null";
            try {
                ps = conn.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                ps.setString(3, dept);
                rs = ps.executeQuery();
                getuserlist = new ArrayList();
                while (rs.next()) {
                    genrbean = new GenericAdminBean();
                    genrbean.setChallanstatus(rs.getString("CHALLAN_STATUS"));
                    genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                    genrbean.setDlrname(rs.getString("DLRNAME"));
                    genrbean.setAddress(rs.getString("ADDRESS"));
                    genrbean.setCity(rs.getString("CITY"));
                    genrbean.setState(rs.getString("STATE"));
                    genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                    genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                    genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                    genrbean.setAmount(rs.getDouble("AMOUNT"));
                    genrbean.setDepartment(rs.getString("dept_name"));
                    genrbean.setPurpose(rs.getString("purpose"));
                    getuserlist.add(genrbean);
                }
                rs.close();
                ps.close();

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return getuserlist;
        } else {
            String sql = "select gp.purpose, gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,"
                    + " gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,"
                    + " chd.DEPT_ID,chd.dept_name from generic_epayment gp join generic_dept chd "
                    + " on chd.DEPT_ID=gp.department where gp.PAYMENT_DATE between ? and ? and "
                    + " gp.CHALLAN_STATUS=? and gp.DEPARTMENT=? and gp.challan_no is not null "
                    + " and gp.cin is not null ";
            try {
                ps = conn.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                ps.setString(3, type);
                ps.setString(4, dept);
                rs = ps.executeQuery();
                getuserlist = new ArrayList();
                while (rs.next()) {
                    genrbean = new GenericAdminBean();
                    genrbean.setChallanstatus(rs.getString("CHALLAN_STATUS"));
                    genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                    genrbean.setDlrname(rs.getString("DLRNAME"));
                    genrbean.setAddress(rs.getString("ADDRESS"));
                    genrbean.setCity(rs.getString("CITY"));
                    genrbean.setState(rs.getString("STATE"));
                    genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                    genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                    genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                    genrbean.setAmount(rs.getDouble("AMOUNT"));
                    genrbean.setDepartment(rs.getString("dept_name"));
                    genrbean.setPurpose(rs.getString("purpose"));
                    getuserlist.add(genrbean);
                }
                rs.close();
                ps.close();

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return getuserlist;

        }

    }

    public ArrayList getLockTaxTypeByDeptid(Connection con, String dept, String mjtax) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = " select initcap(TAX_PURPOSE) as TAX_PURPOSE from echallan_tax_purposes where "
                    + " DEPT_ID=? and MAJOR_TAX_ID=? and status='I' ";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, mjtax);
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setTax(rs.getString("TAX_PURPOSE"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    public ArrayList getIdProofByDeptid(Connection con,
            String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = " select initcap(IDPROOF) as IDPROOF from generic_idproof where DEPARTMENT=? and STATUS=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, "A");
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setIdproof(rs.getString("IDPROOF"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    /**
     * @param con
     * @param dept
     * @return
     * @throws Exception
     */
    public ArrayList getLockMajorTaxTypeByDeptid(Connection con, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql =" select initcap(MAJOR_TAX) as MAJOR_TAX,MAJOR_TAX_CODE,MAJOR_TAX_ID from "
                    + " generic_major_tax where DEPT_ID=? and STATUS=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, "I");
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setMajortax(rs.getString("MAJOR_TAX"));
                gab.setMajortaxcode(rs.getString("MAJOR_TAX_CODE"));
                gab.setMajortaxid(rs.getString("MAJOR_TAX_ID"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    public void doUnlockTaxByDeptid(Connection con, String deptid,
            String taxpurposeid) throws Exception {
        PreparedStatement ps = null;
        try {
            String sql = " update echallan_tax_purposes set STATUS='A' where DEPT_ID=? and TAX_PURPOSE_ID=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, deptid);
            ps.setString(2, taxpurposeid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try{
                if(ps!=null)ps.close();
            }catch(Exception e ){
                System.out.println(e.getMessage());
            }
            
        }
    }

    public void doUnlockDept(Connection con, String dept) throws Exception {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("update generic_dept set STATUS=? where DEPT_ID=?");
            ps.setString(1, "A");
            ps.setString(2, dept);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    public void doUnlockMajorTax(Connection con, String majorid) throws Exception {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("update generic_major_tax set STATUS=? where MAJOR_TAX_ID=?");
            ps.setString(1, "A");
            ps.setString(2, majorid);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    public boolean doFindByUser(Connection conn, String username,String pasword, String rnd) throws NullPointerException {
        boolean flag = false;        
        return flag;
    }
    
    public boolean doFindByDepartment(Connection conn, String username, String pasword, String dept) throws Exception {
        boolean f = false;
        try {    
            String sql = "select username, password from generic_dept_users where username =? and department=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, dept);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                String pwd = rs.getString("password");
                MD5 m = new MD5();
                String mf = m.calcMD5(pasword);
                if (mf.equals(pwd)) {
                    f = true;
                } else {
                    f = false;
                }
            } else {
                ps.close();
                rs.close();
                throw new Exception();
            }


        } catch (SQLException e) {
            System.out.println("erro at do query in User " + e.getMessage());
        } catch (NullPointerException e) {
            throw new NullPointerException();
        }
        return f;
    }

    public String getDistCodeByDept(Connection conn, String username, String dept) throws UnknownException {
        String disttcode = "";
        PreparedStatement ps = null;
        try {            
            String sql ="select role from generic_dept_users where username=? and department=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, dept);
            ResultSet rs = ps.executeQuery();
            rs.next();
            disttcode = rs.getString("role");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return disttcode;
    }

    public String getPwdStatusFirstTime(Connection conn, String username, String dept) throws UnknownException {
        String ispwdchange = "";
        PreparedStatement ps = null;
        try {            
            String sql = "select ispwdchng from generic_dept_users where username=? and department=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, dept);
            ResultSet rs = ps.executeQuery();
            rs.next();
            ispwdchange = rs.getString("ispwdchng");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ispwdchange;
    }

    public String getDeptUserAuthority(Connection conn, String username, String dept) throws UnknownException {
        String userrole = "";
        PreparedStatement ps = null;
        try {            
            String sql = "select role from generic_dept_users where username=? and department=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, dept);
            ResultSet rs = ps.executeQuery();
            rs.next();
            userrole = rs.getString("role");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return userrole;
    }

    public GenericAdminBean getDetailsByEmail(Connection con,
            String email) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        GenericAdminBean genrbean = null;        
        String sql = "select email from generic_user_profile where email=?  ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                genrbean = new GenericAdminBean();                
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
        return genrbean;
    }

    public void doInsertTax(Connection con,
            GenericAdminBean gb) throws Exception {
        PreparedStatement ps = null;        
        String sql = "insert into echallan_tax_purposes(dept_id, TREASURY_HEAD_CODE,TAX_PURPOSE,DESCRIPTION,TAX_PURPOSE_ID,ISFIXED,FIXAMOUNT,TAX_PURPOSE_CODE,MAJOR_TAX,MAJOR_TAX_ID) values(?,?,upper(?),?,UPPER(uuid()),?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, gb.getDeptid());
            ps.setString(2, gb.getTreasury_head_code());
            ps.setString(3, gb.getTax());
            ps.setString(4, gb.getDescription());
           ps.setString(5, gb.getIsfixed());
            ps.setDouble(6, gb.getAmount());
            ps.setString(7, gb.getTaxpurposecode());
            ps.setString(8, gb.getMajortax());
            ps.setString(9, gb.getMajortaxid());
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
                System.out.println(e.getMessage());
            }
        }
    }

    public String getMajorTaxById(Connection conn, String mtaxid) throws UnknownException {
        String mjtax = "";
        PreparedStatement ps = null;
        try {
            String sql =" select major_tax from generic_major_tax where major_tax_id=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, mtaxid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            mjtax = rs.getString("major_tax");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return mjtax;
    }

    public ArrayList getDetailsByDepartment(Connection con, String department) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        GenericAdminBean genrbean = null;
        ArrayList al = new ArrayList();
        String sql = " select gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city,gp.state,"
                + " gp.payment_date,gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id, "
                + " chd.dept_name from generic_epayment gp join generic_dept chd  on "
                + " chd.dept_id=gp.department where gp.department=? and gp.challan_no is not null ";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, department);
            rs = ps.executeQuery();
            while (rs.next()) {
                genrbean = new GenericAdminBean();
                genrbean.setChallanstatus(rs.getString("challan_status"));
                genrbean.setChallanno(rs.getString("challan_no"));
                genrbean.setDlrname(rs.getString("dlrname"));
                genrbean.setAddress(rs.getString("address"));
                genrbean.setCity(rs.getString("city"));
                genrbean.setState(rs.getString("state"));
                genrbean.setPaymentdate(rs.getDate("payment_date"));
                genrbean.setPeriodfrom(rs.getDate("period_from"));
                genrbean.setPeriodto(rs.getDate("period_to"));
                genrbean.setAmount(rs.getDouble("amount"));
                genrbean.setDepartment(rs.getString("dept_name"));
                al.add(genrbean);
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

    public ArrayList getDistrictList(Connection conn) throws UnknownException {
        ArrayList al = new ArrayList();
        PreparedStatement ps = null;
        String sql = "select state_code, district_code, district_name from districts where state_code ='34' "
                + " order by district_code";
        try{
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean d = new GenericAdminBean();
                d.setStatecode(rs.getString("state_code"));
                d.setDistrictcode(rs.getString("district_code"));
                d.setDistrictname(rs.getString("district_name"));
                al.add(d);
            }
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return al;
    }

    public ArrayList getDivList(Connection conn) throws UnknownException {
        ArrayList al = new ArrayList();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(" select div_code, div_name, div_short_name from mining_division order by div_code ");
            while (rs.next()) {
                GenericAdminBean d = new GenericAdminBean();
                d.setDivisioncode(rs.getString("div_code"));
                d.setDivisionname(rs.getString("div_name"));
                al.add(d);
            }
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return al;
    }

    public ArrayList getDeptList(Connection conn) throws UnknownException {
        ArrayList al = new ArrayList();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs =
                    stmt.executeQuery(
                    //" select dept_id, INITCAP(dept_name) as dept_name from GENERIC_DEPT order by dept_id ");
                    //checked
                    "select dept_id, concat(ucase(mid(dept_name,1,1)),lcase(mid(dept_name,2)))as dept_name from generic_dept order by dept_id ");
            while (rs.next()) {
                GenericAdminBean d = new GenericAdminBean();
                d.setDeptid(rs.getString("dept_id"));
                d.setDepartment(rs.getString("dept_name"));
                al.add(d);
            }
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return al;
    }

    public ArrayList getBranchLocation(Connection conn) throws UnknownException {
        ArrayList al = new ArrayList();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs =stmt.executeQuery(" select dept_id, concat(ucase(mid(dept_name,1,1)), "
                    + " lcase(mid(dept_name,2)))as dept_name from generic_dept order by dept_id ");
            while (rs.next()) {
                GenericAdminBean d = new GenericAdminBean();
                d.setDeptid(rs.getString("dept_id"));
                d.setDepartment(rs.getString("dept_name"));
                al.add(d);
            }
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return al;
    }

    public void doInsertNewUser(Connection conn, GenericAdminBean gb) throws Exception {
        try {            
            String sql = " insert into generic_dept_users(username, fullname, password, branch_location, role, "
                    + " department, state, no_of_attempts, status, ispwdchng, created_date, modified_date) "
                    + " values (?,?,?,?,?,?,?,?,?,?,now(), now())";
            MD5 m = new MD5();
            String pwd = m.calcMD5(gb.getUsername().toLowerCase());
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, gb.getUsername());
            ps.setString(2, gb.getFullname());
            ps.setString(3, pwd);
            ps.setString(4, gb.getLocations());
            ps.setString(5, gb.getUserrole());
            ps.setString(6, gb.getDeptid());
            ps.setString(7, gb.getState());
            ps.setString(8, "0");            
            ps.setString(9, "1");
            ps.setString(10, "0");
            ps.execute();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public String getDiv_Name(Connection conn,
        String div_code) throws UnknownException {
        String div_name = "";
        PreparedStatement ps = null;
        try {
            String sql = " select g01_division from t_division where g01_div_code=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, div_code);
            ResultSet rs = ps.executeQuery();
            rs.next();
            div_name = rs.getString("g01_division");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return div_name;
    }

    public GenericAdminBean queryByUserName(Connection conn,
            String username) throws NoDataFoundException,
            SelectNotAllowedException,
            UnknownException {
        GenericAdminBean genrbean = null;
        try {
            GenericAdminDao gad = new GenericAdminDao();
            //table does not exists
            String sql = "select username,fullname,cir_ncode,div_code,scope,code_util.getcirclename(cir_ncode) "
                    + " cir_name, userrole from generic_dept_users where upper(username)=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username.toUpperCase());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                genrbean = new GenericAdminBean();
                genrbean.setUsername(rs.getString("username"));
                genrbean.setFullname(rs.getString("fullname"));
                genrbean.setCirncode(rs.getInt("cir_ncode"));
                genrbean.setCirname(rs.getString("cir_name"));
                genrbean.setUserrole(rs.getString("userrole"));
                genrbean.setDivisioncode(rs.getString("div_code"));
                genrbean.setScope(rs.getString("scope"));
                if (genrbean.getScope().equals("D")) {
                    String divcode = genrbean.getDivisioncode();
                    String div = gad.getDiv_Name(conn, divcode);
                    genrbean.setDivisionname(div);
                }
            } else {
                throw new NoDataFoundException();
            }
        } catch (SQLException e) {
            if (e.getMessage().startsWith("ORA-00942")
                    || e.getMessage().startsWith("ORA-01031")) {
                throw new SelectNotAllowedException();
            } else {
                throw new UnknownException(e.toString());
            }
        } catch (NoDataFoundException e) {
            throw new NoDataFoundException();
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return genrbean;
    }

    public static ArrayList getCircleList(Connection conn) throws UnknownException {
        ArrayList al = new ArrayList();
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs =
                    //rowid does not exists
                    stmt.executeQuery("select rowid,cir_ncode,cir_code,cir_name,div_code,ip from t_circle order by cir_ncode");
            while (rs.next()) {
                GenericAdminBean c = new GenericAdminBean();
                c.setCirncode(rs.getInt("cir_ncode"));
                c.setCirname(rs.getString("cir_name"));
                c.setDivisioncode(rs.getString("div_code"));
                al.add(c);
            }
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return al;
    }

    public static ArrayList getDivisionList(Connection conn) throws UnknownException {
        ArrayList ar = new ArrayList();
        try {
            Statement stmt = conn.createStatement();
            String sql =
                    //table not esists t_division
                    "select G01_div_code as  div_code , G01_division as div_name from t_division ";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                //div_code=rs.getString("div_code");
                GenericAdminBean t = new GenericAdminBean();
                t.setDivisioncode(rs.getString("div_code"));
                t.setDivisionname(rs.getString("div_name"));
                ar.add(t);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ar;
    }

    public GenericAdminBean queryByUserNameForOthersDept(Connection conn,
            String username,
            String deptid) throws NoDataFoundException,
            SelectNotAllowedException,
            UnknownException {
        GenericAdminBean gbr = null;
        try {
            //table not exists new_dept_users
            String sql = "select username, fullname, role, department, state, branch_location from "
                    + " generic_dept_users where upper(username)=? and department=? ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username.toUpperCase());
            stmt.setString(2, deptid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                gbr = new GenericAdminBean();
                gbr.setUsername(rs.getString("username"));
                gbr.setFullname(rs.getString("fullname"));
                gbr.setUserrole(rs.getString("role"));
                gbr.setDepartment(rs.getString("department"));                
                gbr.setState(rs.getString("state"));
                gbr.setLocations(rs.getString("branch_location"));                
            } else {
                throw new NoDataFoundException();
            }
        } catch (SQLException e) {
            if (e.getMessage().startsWith("ORA-00942")
                    || e.getMessage().startsWith("ORA-01031")) {
                throw new SelectNotAllowedException();
            } else {
                throw new UnknownException(e.toString());
            }
        } catch (NoDataFoundException e) {
            throw new NoDataFoundException();
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return gbr;
    }

    public static String getDivCode(Connection conn,
            int circle) throws UnknownException {
        String div_code = "";
        try {
            //checked
            String sql = "select div_code from t_circle where cir_ncode=? ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, circle);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            div_code = rs.getString("div_code");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return div_code;
    }

    public void doUpdate(Connection conn, GenericAdminBean gb,
            String username) throws DataAlreadyExistsException,
            UpdateNotAllowedException,
            UnknownException {
        try {
            java.util.Date d = new java.util.Date();
            java.sql.Date presentdate = new java.sql.Date(d.getTime());
            PreparedStatement ps = conn.prepareStatement("update generic_dept_users set fullname=?,cir_ncode=?,"
                    + "role=?, created_date=? where upper(username)=?");
            conn.setAutoCommit(false);
            ps.setString(1, gb.getFullname());
            ps.setInt(2, gb.getCirncode());
            ps.setString(3, gb.getUserrole());
            ps.setString(4, gb.getDivisioncode());
            ps.setString(5, gb.getScope());
            ps.setDate(6, presentdate);
            ps.setString(7, username.toUpperCase());
            ps.executeUpdate();
            conn.commit();
        } catch (SQLException e) {
            if (e.getMessage().startsWith("ORA-00001")) {
                throw new DataAlreadyExistsException();
            } else if (e.getMessage().startsWith("ORA-00942")
                    || e.getMessage().startsWith("ORA-01031")) {
                throw new UpdateNotAllowedException();
            } else {
                throw new UnknownException(e.toString());
            }
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public void doDelete(Connection conn,
            GenericAdminBean gab) throws DataAlreadyExistsException,
            DeleteNotAllowedException,
            UnknownException {
        try {
            conn.setAutoCommit(false);
            //table does not exists users
            String sql = "delete from generic_dept_users where username=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, gab.getUsername());
            stmt.executeQuery();

//user table ???
            String sql1 = "drop generic_dept_users ?";
            PreparedStatement stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, gab.getUsername());
            stmt1.execute();
            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
                System.out.println("Deletion of user RollBacked");
            } catch (SQLException ee) {
                System.out.println(ee.getMessage());
            }
            if (e.getMessage().startsWith("ORA-00001")) {
                throw new DataAlreadyExistsException();
            } else if (e.getMessage().startsWith("ORA-00942")
                    || e.getMessage().startsWith("ORA-01031")
                    || e.getMessage().startsWith("ORA-01940")) {
                throw new DeleteNotAllowedException();
            } else {
                throw new UnknownException(e.toString());
            }
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public static void resetPassword(Connection conn,
            String username) throws UnknownException {
        try {
            java.util.Date d = new java.util.Date();
            java.sql.Date presentdate = new java.sql.Date(d.getTime());
            MD5 md = new MD5();
            String pwd = md.calcMD5(username.toLowerCase());
            PreparedStatement ps =conn.prepareStatement("update generic_dept_users set password=?, "
                    + " created_date=?, no_of_attempts=? where upper(username)=? ");
            ps.setString(1, pwd);
            ps.setDate(2, presentdate);
            ps.setInt(3, 0);
            ps.setString(4, username.toUpperCase());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public static void unLockAccount(Connection conn,
            String username) throws UnknownException {
        try {
            java.util.Date d = new java.util.Date();
            java.sql.Date presentdate = new java.sql.Date(d.getTime());
            MD5 md = new MD5();
            String pwd = md.calcMD5(username.toLowerCase());
            PreparedStatement ps = conn.prepareStatement("update generic_dept_users set no_of_attempts=? "
                    + "where upper(username)=? ");
            ps.setInt(1, 0);
            ps.setString(2, username.toUpperCase());
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public void doUpdateOfOtherDeptUsers(Connection conn, GenericAdminBean gb,
            String dept) throws DataAlreadyExistsException,
            UpdateNotAllowedException,
            UnknownException {
        try {
            java.util.Date d = new java.util.Date();
            java.sql.Date presentdate = new java.sql.Date(d.getTime());
            PreparedStatement ps = conn.prepareStatement("update generic_dept_users set username=?, fullname=?, "
                    + "department=?, role=?, created_date=? where upper(username)=? and department=? ");
            conn.setAutoCommit(false);
            ps.setString(1, gb.getUsername().toUpperCase());
            ps.setString(2, gb.getFullname());
            ps.setString(3, gb.getDepartment());            
            ps.setString(4, gb.getUserrole());                        
            ps.setDate(5, presentdate);
            ps.setString(6, gb.getUsername());
            ps.setString(7, dept);
            ps.executeUpdate();
            conn.commit();
        } catch (SQLException e) {
            if (e.getMessage().startsWith("ORA-00001")) {
                throw new DataAlreadyExistsException();
            } else if (e.getMessage().startsWith("ORA-00942")
                    || e.getMessage().startsWith("ORA-01031")) {
                throw new UpdateNotAllowedException();
            } else {
                throw new UnknownException(e.toString());
            }
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public void doDeleteOtherDeptUSers(Connection conn, String dept,
            String usrname) throws DataAlreadyExistsException,
            DeleteNotAllowedException,
            UnknownException {
        try {
            conn.setAutoCommit(false);
            //table does not exists delete from new_dept_users where username=? and dept=?
            String sql = "delete from generic_dept_users where upper(username)=? and department=?  ";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usrname.toUpperCase());
            stmt.setString(2, dept);
            stmt.execute();
            conn.commit();
            conn.setAutoCommit(true);
        } catch (SQLException e) {
            try {
                conn.rollback();
                System.out.println("Deletion of user RollBacked");
            } catch (SQLException ee) {
                System.out.println(ee.getMessage());
            }
            if (e.getMessage().startsWith("ORA-00001")) {
                throw new DataAlreadyExistsException();
            } else if (e.getMessage().startsWith("ORA-00942")
                    || e.getMessage().startsWith("ORA-01031")
                    || e.getMessage().startsWith("ORA-01940")) {
                throw new DeleteNotAllowedException();
            } else {
                throw new UnknownException(e.toString());
            }
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public static void resetPasswordOfOtherDept(Connection conn, String username, String dept) throws UnknownException {
        try {
            java.util.Date d = new java.util.Date();
            java.sql.Date presentdate = new java.sql.Date(d.getTime());
            MD5 md = new MD5();
            String pwd = md.calcMD5(username.toLowerCase());
            PreparedStatement ps = conn.prepareStatement("update generic_dept_users set password=?, created_date=?, "
                    + " no_of_attempts=? where upper(username)=? and department =? ");
            ps.setString(1, pwd);
            ps.setDate(2, presentdate);
            ps.setInt(3, 0);
            ps.setString(4, username.toUpperCase());
            ps.setString(5, dept);
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public static void unLockAccountOfOtherDept(Connection conn,
            String username,
            String dept) throws UnknownException {
        try {
            java.util.Date d = new java.util.Date();
            java.sql.Date presentdate = new java.sql.Date(d.getTime());
            MD5 md = new MD5();
            String pwd = md.calcMD5(username.toLowerCase());
            PreparedStatement ps = conn.prepareStatement("update generic_dept_users set no_of_attempts=? where "
                    + " upper(username)=? and department =? ");
            ps.setInt(1, 0);
            ps.setString(2, username.toUpperCase());
            ps.setString(3, dept);
            ps.execute();
            ps.close();
        } catch (SQLException e) {
            throw new UnknownException(e.toString());
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
    }

    public boolean doFindAdminLogin(Connection conn, String username,String pwd) throws NullPointerException {
        boolean f = false;
        String sql = "select username, fullname, password, branch_location, role, department, state, "
                + " no_of_attempts, status, ispwdchng, created_date from generic_dept_users where "
                + " upper(username)=? and role='admin'";
        GenericAdminBean gb = new GenericAdminBean();
        try {
            try {
                PreparedStatement ps =conn.prepareStatement(sql);
                ps.setString(1, username.toUpperCase());
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String pwd1 = rs.getString("password");
                    gb.setPassword(pwd1);
                    gb.setUsername(rs.getString("username"));
                    gb.setFullname(rs.getString("fullname"));
                    gb.setUserrole(rs.getString("role"));
                    gb.setDepartment(rs.getString("department"));
                    gb.setState(rs.getString("state"));
                    gb.setCreated_dt(rs.getDate("created_date"));
                    gb.setLocations(rs.getString("branch_location"));
                    MD5 m = new MD5();
                    String mf = m.calcMD5(pwd);
                    if (mf.equals(pwd1)) {
                        f = true;
                    } else {
                        f = false;
                    }
                }else{
                    ps.close();
                    rs.close();
                    throw new Exception();
                }
            } catch (SQLException e) {
                System.out.println("e " + e.getMessage());
            } catch (NullPointerException e) {
                throw new NullPointerException();
            } catch (Exception e) {
                try {
                    String sql1 = "select username, fullname, password, branch_location, role, department, state, "
                        + " no_of_attempts, status, ispwdchng, created_date from generic_dept_users where "
                        + " upper(username)=? ";
                    PreparedStatement ps =conn.prepareStatement(sql1);
                    ps.setString(1, username.toUpperCase());
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        String pwd1 = rs.getString("password");
                        gb.setPassword(pwd1);
                        gb.setUsername(rs.getString("username"));
                        gb.setFullname(rs.getString("fullname"));
                        gb.setUserrole(rs.getString("role"));
                        gb.setDepartment(rs.getString("department"));
                        gb.setState(rs.getString("state"));                        
                        gb.setCreated_dt(rs.getDate("created_date"));
                        gb.setLocations(rs.getString("branch_location"));                        
                        MD5 m = new MD5();
                        String mf = m.calcMD5(pwd1);
                        if (mf.equals(pwd)) {
                            f = true;
                        } else {
                            f = false;
                        }
                    } else {
                        conn.close();
                    }
                    conn.close();
                } catch (SQLException sqle){
                    System.out.println("e " + sqle.getMessage());
                } catch (NullPointerException nulp) {
                    throw new NullPointerException();
                } catch (Exception exce) {
                    System.out.println(exce.getMessage());
                }
                System.out.println(e.getMessage());
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }
        return f;
    }
    
    /*public boolean doFindAdminLogin(Connection conn, String username,String pwd,String rnd) throws NullPointerException {
        boolean f = false;
        String sql = "select username, fullname, password, branch_location, role, department, state, "
                + " no_of_attempts, status, ispwdchng, created_date from generic_dept_users where "
                + " upper(username)=? and role='admin'";
        GenericAdminBean gb = new GenericAdminBean();
        try {
            try {
                PreparedStatement ps =conn.prepareStatement(sql);
                ps.setString(1, username.toUpperCase());
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    MD5 m = new MD5();
                    String pwd1 = m.calcMD5(rs.getString("password")+ rnd) ;
                    gb.setPassword(pwd1);
                    gb.setUsername(rs.getString("username"));
                    gb.setFullname(rs.getString("fullname"));
                    gb.setUserrole(rs.getString("role"));
                    gb.setDepartment(rs.getString("department"));
                    gb.setState(rs.getString("state"));
                    gb.setCreated_dt(rs.getDate("created_date"));
                    gb.setLocations(rs.getString("branch_location"));
                    System.out.println("pwd db "+pwd1+" pwd in "+pwd);
                    if (pwd1.equals(pwd)) {
                        f = true;
                    } else {
                        f = false;
                    }
                }else{
                    ps.close();
                    rs.close();
                    throw new Exception();
                }
            } catch (SQLException e) {
                System.out.println("e " + e.getMessage());
            } catch (NullPointerException e) {
                throw new NullPointerException();
            } catch (Exception e) {
                try {
                    String sql1 = "select username, fullname, password, branch_location, role, department, state, "
                        + " no_of_attempts, status, ispwdchng, created_date from generic_dept_users where "
                        + " upper(username)=? ";
                    PreparedStatement ps =conn.prepareStatement(sql1);
                    ps.setString(1, username.toUpperCase());
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        String pwd1 = rs.getString("password");
                        gb.setPassword(pwd1);
                        gb.setUsername(rs.getString("username"));
                        gb.setFullname(rs.getString("fullname"));
                        gb.setUserrole(rs.getString("role"));
                        gb.setDepartment(rs.getString("department"));
                        gb.setState(rs.getString("state"));                        
                        gb.setCreated_dt(rs.getDate("created_date"));
                        gb.setLocations(rs.getString("branch_location"));                        
                        MD5 m = new MD5();
                        String mf = m.calcMD5(pwd1);
                        if (mf.equals(pwd)) {
                            f = true;
                        } else {
                            f = false;
                        }
                    } else {
                        conn.close();
                    }
                    conn.close();
                } catch (SQLException sqle){
                    System.out.println("e " + sqle.getMessage());
                } catch (NullPointerException nulp) {
                    throw new NullPointerException();
                } catch (Exception exce) {
                    System.out.println(exce.getMessage());
                }
                System.out.println(e.getMessage());
            }
        } catch (Exception exc) {
            System.out.println(exc.getMessage());
        }
        return f;
    }*/

    public static void changeAdmPaswrd(String oldpwd,
            Connection conn, String username,
            String password) throws Exception {
        try {
            String sql = "select password as pwd from generic_dept_users where upper(username)=?";
            PreparedStatement ps1 = conn.prepareStatement(sql);
            ps1.setString(1, username.toUpperCase());
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                String pwd1 = rs.getString("pwd");
                MD5 m = new MD5();
                //  String mf = m.calcMD5(pwd1);
                String mf = m.calcMD5(oldpwd);
                if (mf.equals(pwd1)) {
                    MD5 md = new MD5();
                    String pwd = md.calcMD5(password);
                    java.util.Date d = new java.util.Date();
                    java.sql.Date pred = new java.sql.Date(d.getTime());
                    sql = "update generic_dept_users set password=?, created_date=?  where upper(username)=? ";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, pwd);
                    ps.setDate(2, pred);
                    ps.setString(3, username.toUpperCase());
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

    public String getDepartmentByDeptid(Connection conn,
            String dept) throws Exception {
        String departmentname = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String sql ="select INITCAP(DEPT_NAME) as DEPT_NAME from generic_dept where DEPT_ID=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, dept);
            rs = ps.executeQuery();
            if (rs.next()) {
                departmentname = rs.getString("DEPT_NAME");
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            rs.close();
            ps.close();
        }
        return departmentname;
    }

    public void doUpdateDepartment(Connection con, String department,
            String deptid) throws Exception {
        PreparedStatement ps = null;
        try {
            String sql =
                    // "update GENERIC_DEPT set DEPT_NAME=? where DEPT_ID=?";
                    "update generic_dept set dept_name=? where dept_id=?";

            ps = con.prepareStatement(sql);
            ps.setString(1, department);
            ps.setString(2, deptid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            ps.close();
        }
    }

    public void doDeleteDepartmentByDeptid(Connection con,
            String deptid) throws Exception {
        PreparedStatement ps = null;
        try {
            String sql =
                    //"update GENERIC_DEPT set STATUS='I' where DEPT_ID=?";
                    "update generic_dept set status='I' where dept_id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, deptid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            ps.close();
        }
    }

    public ArrayList getTaxTypeByDeptid(Connection con,
            String dept, String mjtax) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = "select initcap(tax_purpose) as tax_purpose from echallan_tax_purposes where dept_id=? and major_tax_id=? and status='A'";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, mjtax);
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setTax(rs.getString("TAX_PURPOSE"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    public ArrayList getMajorTaxTypeByDeptid(Connection con,
            String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql =
                    //  "select initcap(MAJOR_TAX) as MAJOR_TAX,MAJOR_TAX_CODE,MAJOR_TAX_ID from GENERIC_MAJOR_TAX where DEPT_ID=? and STATUS=?";
                    //initcap need to convert
                    "select initcap(major_tax) as major_tax,major_tax_code,major_tax_id from generic_major_tax where dept_id=? and status=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, "A");
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setMajortax(rs.getString("MAJOR_TAX"));
                gab.setMajortaxcode(rs.getString("MAJOR_TAX_CODE"));
                gab.setMajortaxid(rs.getString("MAJOR_TAX_ID"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    /* public ArrayList getSingleTaxTypeByDeptid(Connection con, 
     String dept,String majortax) throws Exception {
     PreparedStatement ps = null;
     ResultSet rs = null;
     ArrayList al = new ArrayList();
     try {
     String sql = 
     "select MAJOR_TAX_CODE from GENERIC_MAJOR_TAX where DEPT_ID=? and upper(MAJOR_TAX)=?";
     ps = con.prepareStatement(sql);
     ps.setString(1, dept);
     ps.setString(2, majortax.toUpperCase());
     rs = ps.executeQuery();
     while (rs.next()) {
     GenericAdminBean gab = new GenericAdminBean();
     gab.setMajortaxcode(rs.getString("MAJOR_TAX_CODE"));
     al.add(gab);
     }
     } catch (Exception e) {
     System.out.println(e.getMessage());
     }
     return al;
     }*/
    public String getSingleTaxTypeByDeptid(Connection con,
            String dept, String majortax) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String majortaxcode = "";
        try {
            String sql =
                    //   "select MAJOR_TAX_CODE from GENERIC_MAJOR_TAX where DEPT_ID=? and upper(MAJOR_TAX)=? and STATUS=?";
                    //checked
                    "select major_tax_code from generic_major_tax where dept_id=? and upper(major_tax)=? and status=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, majortax.toUpperCase());
            ps.setString(3, "A");
            rs = ps.executeQuery();
            if (rs.next()) {
                majortaxcode = rs.getString("major_tax_code");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return majortaxcode;
    }

    public void doUpdateTaxtypeByTaxid(Connection con, String department,
            String taxtype, String treasury,
            String taxpurposeid) throws Exception {
        PreparedStatement ps = null;
        try {
            String sql = "update echallan_tax_purposes set tax_purpose=? , treasury_head_code=? where dept_id=? and tax_purpose_id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, taxtype);
            ps.setString(2, treasury);
            ps.setString(3, department);
            ps.setString(4, taxpurposeid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            ps.close();
        }
    }

    public String getTaxPurposeIdByTreasuryCode(Connection conn,
            String taxpurpose, String thc,
            String deptid) throws Exception {
        String taxpurposeid = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String sql = "select tax_purpose_id from echallan_tax_purposes  where tax_purpose=? and treasury_head_code=? and dept_id=? ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, taxpurpose);
            ps.setString(2, thc);
            ps.setString(3, deptid);
            rs = ps.executeQuery();
            if (rs.next()) {
                taxpurposeid = rs.getString("tax_purpose_id");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            rs.close();
            ps.close();
        }
        return taxpurposeid;
    }

    public void doDeleteTaxByDeptid(Connection con, String deptid,
            String taxpurposeid) throws Exception {
        PreparedStatement ps = null;
        try {
            String sql = "update echallan_tax_purposes set status='I' where dept_id=? and tax_purpose_id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, deptid);
            ps.setString(2, taxpurposeid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            ps.close();
        }
    }

    public String getStatusByChallan(Connection conn, String deptid,String challan) throws Exception {
        String status = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String sql = "select challan_status from generic_epayment where department=? and challan_no=? and cin is not null";
            ps = conn.prepareStatement(sql);
            ps.setString(1, deptid);
            ps.setString(2, challan);
            rs = ps.executeQuery();

            if (rs.next()) {
                status = rs.getString("challan_status");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            rs.close();
            ps.close();
        }
        return status;
    }

    public String getStatusByChallanForAdmin(Connection conn,
            String challan) throws Exception {
        String status = "";
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            String sql =
                    "select challan_status from generic_epayment where challan_no=? and cin is not null ";
            ps = conn.prepareStatement(sql);
            ps.setString(1, challan);
            rs = ps.executeQuery();
            if (rs.next()) {
                status = rs.getString("challan_status");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            rs.close();
            ps.close();
        }
        return status;
    }

    public String getRegistrationStatusByChallan(Connection con, String challan) throws Exception {
        PreparedStatement ps = null;
        GenericAdminBean genrbean = null;
        ResultSet rs = null;
        String stats = null;
        String sql =" select registered from generic_epayment where challan_no=? and cin is not null ";
        try{
            ps = con.prepareStatement(sql);
            ps.setString(1, challan);
            rs = ps.executeQuery();
            if (rs.next()) {
                genrbean = new GenericAdminBean();
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

    public GenericAdminBean getUserDetailsByChallan(Connection con, String deptid, String challan) throws Exception {
        ResultSet rs = null;
        GenericAdminBean genrbean = null;
        String sql = "";
        PreparedStatement ps = null;
        String status = getRegistrationStatusByChallan(con, challan) != null ? getRegistrationStatusByChallan(con,challan): "";
        if (status.equalsIgnoreCase("Y")) {
            sql = "select gup.dlrname,gup.address,gup.mobile,gup.city,gup.state,gp.email,gp.challan_no, "
                    + "gp.amount,gp.department,cd.dept_name, gp.period_from, "
                    + "gp.period_to,gp.payment_date,gp.purpose from generic_epayment gp "
                    + "join generic_dept cd on gp.department=cd.dept_id join generic_user_profile gup "
                    + "on gp.email=gup.email where gp.challan_no=? and gp.department=? and "
                    + "gp.cin is not null  ";
        } else {
            sql ="select gp.DLRNAME, gp.ADDRESS, gp.CITY, gp.STATE, gp.MOBILE, gp.EMAIL, gp.CHALLAN_NO, "
                    + " gp.AMOUNT, gp.DEPARTMENT, cd.DEPT_NAME, gp.PERIOD_FROM, gp.PERIOD_TO, gp.PAYMENT_DATE,"
                    + " gp.PURPOSE from generic_epayment gp join generic_dept cd on gp.DEPARTMENT=cd.DEPT_ID "
                    + " where gp.CHALLAN_NO= ? and gp.DEPARTMENT=? and gp.cin "
                    + " is not null";
        }
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, challan);
            ps.setString(2, deptid);
            rs = ps.executeQuery();
            if (rs.next()) {
                genrbean = new GenericAdminBean();
                genrbean.setDlrname(rs.getString("DLRNAME"));
                genrbean.setAddress(rs.getString("ADDRESS"));
                genrbean.setCity(rs.getString("CITY"));
                genrbean.setState(rs.getString("STATE"));
                genrbean.setMobile(rs.getString("MOBILE"));
                genrbean.setEmail(rs.getString("EMAIL"));
                genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                genrbean.setAmount(rs.getDouble("AMOUNT"));
                genrbean.setDepartment(rs.getString("DEPT_NAME"));
                genrbean.setDeptid(rs.getString("DEPARTMENT"));
                genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                genrbean.setPurpose(rs.getString("PURPOSE"));
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
        return genrbean;
    }

    public GenericAdminBean getUserDetailsByChallanForAdmin(Connection con,
            String challan) throws Exception {
        ResultSet rs = null;
        GenericAdminBean genrbean = null;
        String sql = "";
        PreparedStatement ps = null;
        String status =
                getRegistrationStatusByChallan(con, challan) != null ? getRegistrationStatusByChallan(con,
                challan)
                : "";
        if (status.equalsIgnoreCase("Y")) {
            sql = "select gup.dlrname,gup.address,gup.mobile,gup.city,gup.state,gp.email,gp.challan_no,"
                    + "gp.amount,gp.department,cd.dept_name,gp.period_from,gp.period_to,"
                    + "gp.payment_date,gp.purpose from generic_epayment gp join generic_dept cd on gp.department=cd.dept_id join "
                    + "generic_user_profile gup on gp.email=gup.email  where gp.challan_no=? and gp.cin is not null  ";
        } else {
            sql = "select gp.dlrname,gp.address,gp.city,gp.state,gp.mobile,gp.email,gp.challan_no,"
                    + "gp.amount,gp.department,cd.dept_name,gp.period_from,gp.period_to,"
                    + "gp.payment_date,gp.purpose from generic_epayment gp join "
                    + "generic_dept cd on gp.department=cd.dept_id where gp.challan_no= ? and gp.cin is not null  ";

        }
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, challan);
            rs = ps.executeQuery();
            if (rs.next()) {
                genrbean = new GenericAdminBean();
                genrbean.setDlrname(rs.getString("DLRNAME"));
                genrbean.setAddress(rs.getString("ADDRESS"));
                genrbean.setCity(rs.getString("CITY"));
                genrbean.setState(rs.getString("STATE"));
                genrbean.setMobile(rs.getString("MOBILE"));
                genrbean.setEmail(rs.getString("EMAIL"));
                genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                genrbean.setAmount(rs.getDouble("AMOUNT"));
                genrbean.setDepartment(rs.getString("DEPT_NAME"));
                genrbean.setDeptid(rs.getString("DEPARTMENT"));
                genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                genrbean.setPurpose(rs.getString("PURPOSE"));
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
        return genrbean;
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

    public static void changeDeptPaswrd(String oldpwd,
            Connection conn, String username,
            String password,
            String dept) throws Exception {
        try {
            String sql = "";
            sql = "select password as pwd from generic_dept_users where upper(username)=?  and department=? ";
            PreparedStatement ps1 = conn.prepareStatement(sql);
            ps1.setString(1, username.toUpperCase());
            ps1.setString(2, dept);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                String pwd1 = rs.getString("pwd");
                MD5 m = new MD5();
                String mf = m.calcMD5(oldpwd); // 
                if (mf.equals(pwd1)) {
                    MD5 md = new MD5();
                    String pwd = md.calcMD5(password);
                    java.util.Date d = new java.util.Date();
                    java.sql.Date pred = new java.sql.Date(d.getTime());
                    // sql = "update GENERIC_DEPT_USERS set password=?, created_dt=?  where upper(username)=? and DEPT=? ";

                    sql = "update generic_dept_users set password=?, created_date=?  where upper(username)=? and department=? ";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, pwd);
                    ps.setDate(2, pred);
                    ps.setString(3, username.toUpperCase());
                    ps.setString(4, dept);
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

    public static void changeDeptPaswrdFirstTime(String oldpwd, Connection conn, String username, String password, String dept) throws Exception {
        try {
            String sql = "";
            sql = "select password as pwd from generic_dept_users where upper(username)=?  and department=? ";
            PreparedStatement ps1 = conn.prepareStatement(sql);
            ps1.setString(1, username.toUpperCase());
            ps1.setString(2, dept);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                String pwd1 = rs.getString("pwd");
                MD5 m = new MD5();
                String mf = m.calcMD5(oldpwd); // 
                if (mf.equals(pwd1)) {
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

    public ArrayList getDepartmentDetailsByPeriod(Connection con, Date pfrom,
            Date pto, String type,
            String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        GenericAdminBean genrbean = null;
        ArrayList al = new ArrayList();
        String sql = "";
        //sql="select gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,chd.DEPT_ID,chd.dept_name from GENERIC_EPAYMENT gp join GENERIC_DEPT chd  on chd.DEPT_ID=gp.department where gp.PERIOD_FROM='"+pfrom+"' and gp.PERIOD_TO='"+pto+"'";
        try {
            if (type.equalsIgnoreCase("all")) {
                sql =
                        // "select gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,chd.DEPT_ID,chd.dept_name from GENERIC_EPAYMENT gp join GENERIC_DEPT chd  on chd.DEPT_ID=gp.department where gp.PAYMENT_DATE between ? and ? and gp.DEPARTMENT=? and gp.challan_no is not null ";
                        "select gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city,gp.state,gp.payment_date,"
                        + "gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,"
                        + "chd.dept_name from generic_epayment gp join generic_dept chd  "
                        + "on chd.dept_id=gp.department where gp.payment_date "
                        + "between ? and ? and gp.department=? and gp.challan_no is not null ";
                ps = con.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                ps.setString(3, dept);
                rs = ps.executeQuery();
            } else {
                sql =
                        //  "select gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,chd.DEPT_ID,chd.dept_name from GENERIC_EPAYMENT gp join GENERIC_DEPT chd  on chd.DEPT_ID=gp.department where gp.PAYMENT_DATE between ? and ? and gp.CHALLAN_STATUS=? and gp.DEPARTMENT=? and gp.challan_no is not null ";
                        "select gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city,gp.state,gp.payment_date,"
                        + "gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,"
                        + "chd.dept_name from generic_epayment gp join generic_dept chd  on"
                        + " chd.dept_id=gp.department where gp.payment_date between ? and ? and "
                        + "gp.challan_status=? "
                        + "and gp.department=? and gp.challan_no is not null ";
                ps = con.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                ps.setString(3, type);
                ps.setString(4, dept);
                rs = ps.executeQuery();
            }
            while (rs.next()) {
                genrbean = new GenericAdminBean();
                genrbean.setChallanstatus(rs.getString("challan_status"));
                genrbean.setChallanno(rs.getString("challan_no"));
                genrbean.setDlrname(rs.getString("dlrname"));
                genrbean.setAddress(rs.getString("address"));
                genrbean.setCity(rs.getString("city"));
                genrbean.setState(rs.getString("state"));
                genrbean.setPaymentdate(rs.getDate("payment_date"));
                genrbean.setPeriodfrom(rs.getDate("period_from"));
                genrbean.setPeriodto(rs.getDate("period_to"));
                genrbean.setAmount(rs.getDouble("amount"));
                genrbean.setDepartment(rs.getString("dept_name"));
                al.add(genrbean);
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

    public ArrayList getDepartmentDetailsByPeriodWithPagination(Connection conn,
            Date pfrom,
            Date pto,
            String type,
            String dept, String distcodd) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList getuserlist = null;
        GenericAdminBean genrbean = null;

        if (type.equalsIgnoreCase("all")) {



            String sql = "select gp.purpose,gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city,"
                    + "gp.state,gp.payment_date,gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,chd.dept_name "
                    + "from generic_epayment gp join "
                    + "generic_dept chd  on chd.dept_id=gp.department where gp.payment_date between ? and ?  and "
                    + "gp.department=? and gp.city_code=? and gp.challan_no is not null and gp.cin is not null";
            try {
                ps = conn.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                //  ps.setString(3,type);
                ps.setString(3, dept);
                ps.setString(4, distcodd);
                rs = ps.executeQuery();
                getuserlist = new ArrayList();
                while (rs.next()) {
                    genrbean = new GenericAdminBean();
                    genrbean.setChallanstatus(rs.getString("CHALLAN_STATUS"));
                    genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                    genrbean.setDlrname(rs.getString("DLRNAME"));
                    genrbean.setAddress(rs.getString("ADDRESS"));
                    genrbean.setCity(rs.getString("CITY"));
                    genrbean.setState(rs.getString("STATE"));
                    genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                    genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                    genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                    genrbean.setAmount(rs.getDouble("AMOUNT"));
                    genrbean.setDepartment(rs.getString("dept_name"));
                    genrbean.setPurpose(rs.getString("purpose"));
                    getuserlist.add(genrbean);
                }
                rs.close();
                ps.close();

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return getuserlist;
        } else {


            String sql =
                    "select  gp.purpose, gp.challan_status,gp.challan_no,"
                    + "gp.dlrname,gp.address,gp.city,gp.state,gp.payment_date,"
                    + "gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,"
                    + "chd.dept_name from generic_epayment gp join generic_dept chd  on chd.dept_id=gp.department "
                    + "where gp.payment_date between ? and ? and gp.challan_status=? and gp.department=? and "
                    + "gp.city_code=? and gp.challan_no is not null and gp.cin is not null  ";

            try {
                ps = conn.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                ps.setString(3, type);
                ps.setString(4, dept);
                ps.setString(5, distcodd);
                rs = ps.executeQuery();
                getuserlist = new ArrayList();
                while (rs.next()) {
                    genrbean = new GenericAdminBean();
                    genrbean.setChallanstatus(rs.getString("CHALLAN_STATUS"));
                    genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                    genrbean.setDlrname(rs.getString("DLRNAME"));
                    genrbean.setAddress(rs.getString("ADDRESS"));
                    genrbean.setCity(rs.getString("CITY"));
                    genrbean.setState(rs.getString("STATE"));
                    genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                    genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                    genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                    genrbean.setAmount(rs.getDouble("AMOUNT"));
                    genrbean.setDepartment(rs.getString("dept_name"));
                    genrbean.setPurpose(rs.getString("purpose"));
                    getuserlist.add(genrbean);
                }
                rs.close();
                ps.close();

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return getuserlist;
        }
    }

    public ArrayList getDepartmentDetailsByPeriodAdminEnd(Connection conn,
            Date pfrom,
            Date pto,
            String type,
            String dept) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList getuserlist = null;
        GenericAdminBean genrbean = null;

        if (type.equalsIgnoreCase("all")) {

            String sql = "select gp.purpose,gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city,"
                    + "gp.state,gp.payment_date,gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,chd.dept_name "
                    + "from generic_epayment gp join "
                    + "generic_dept chd  on chd.dept_id=gp.department where gp.payment_date between ? and ?  and "
                    + "gp.department=? and gp.cin is not null";
            try {
                ps = conn.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                ps.setString(3, dept);
                rs = ps.executeQuery();
                getuserlist = new ArrayList();
                while (rs.next()) {
                    genrbean = new GenericAdminBean();
                    genrbean.setChallanstatus(rs.getString("CHALLAN_STATUS"));
                    genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                    genrbean.setDlrname(rs.getString("DLRNAME"));
                    genrbean.setAddress(rs.getString("ADDRESS"));
                    genrbean.setCity(rs.getString("CITY"));
                    genrbean.setState(rs.getString("STATE"));
                    genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                    genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                    genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                    genrbean.setAmount(rs.getDouble("AMOUNT"));
                    genrbean.setDepartment(rs.getString("dept_name"));
                    genrbean.setPurpose(rs.getString("purpose"));
                    getuserlist.add(genrbean);
                }
                rs.close();
                ps.close();

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return getuserlist;
        } else {
            String sql = "select  gp.purpose, gp.challan_status,gp.challan_no,"
                    + "gp.dlrname,gp.address,gp.city,gp.state,gp.payment_date,"
                    + "gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,"
                    + "chd.dept_name from generic_epayment gp join generic_dept chd  on chd.dept_id=gp.department "
                    + "where gp.payment_date between ? and ? and gp.challan_status=? and gp.department=? "
                    + "and gp.cin is not null ";

            try {
                ps = conn.prepareStatement(sql);
                ps.setDate(1, pfrom);
                ps.setDate(2, pto);
                ps.setString(3, type);
                ps.setString(4, dept);
                rs = ps.executeQuery();
                getuserlist = new ArrayList();
                while (rs.next()) {
                    genrbean = new GenericAdminBean();
                    genrbean.setChallanstatus(rs.getString("CHALLAN_STATUS"));
                    genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                    genrbean.setDlrname(rs.getString("DLRNAME"));
                    genrbean.setAddress(rs.getString("ADDRESS"));
                    genrbean.setCity(rs.getString("CITY"));
                    genrbean.setState(rs.getString("STATE"));
                    genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                    genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                    genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                    genrbean.setAmount(rs.getDouble("AMOUNT"));
                    genrbean.setDepartment(rs.getString("dept_name"));
                    genrbean.setPurpose(rs.getString("purpose"));
                    getuserlist.add(genrbean);
                }
                rs.close();
                ps.close();

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            return getuserlist;
        }
    }

    public GenericAdminBean getAllDetailsByDepartment(Connection conn, String deptid) throws NoDataFoundException,
            SelectNotAllowedException,
            UnknownException {
        GenericAdminBean gbr = null;
        PreparedStatement stmt = null;
        try {
            //  String sql = "select  TREASURY_HEAD_CODE,TAX_PURPOSE,DESCRIPTION,TAX_PURPOSE_ID,ISFIXED,FIXAMOUNT, GENERIC_DEPT.dept_name as dname from echallan_tax_purposes join  GENERIC_DEPT on GENERIC_DEPT.dept_id=echallan_tax_purposes.dept_id where echallan_tax_purposes.dept_id=? ";
            //checked
            String sql = "select  treasury_head_code,tax_purpose,description,tax_purpose,"
                    + "isfixed,fixamount, generic_dept.dept_name as dname from echallan_tax_purposes "
                    + "join  generic_dept on generic_dept.dept_id=echallan_tax_purposes.dept_id "
                    + "where echallan_tax_purposes.dept_id=? ";

            stmt = conn.prepareStatement(sql);
            stmt.setString(1, deptid);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                gbr = new GenericAdminBean();
                gbr.setUsername(rs.getString("username"));
                gbr.setFullname(rs.getString("fullname"));
                gbr.setUserrole(rs.getString("userrole"));
                gbr.setDepartment(rs.getString("dept"));
                gbr.setScope(rs.getString("scope"));
                gbr.setState(rs.getString("state"));
                gbr.setDivisioncode(rs.getString("div_code"));
                gbr.setDistrictcode(rs.getString("distcode"));
            } else {
                throw new NoDataFoundException();
            }
        } catch (SQLException e) {
            if (e.getMessage().startsWith("ORA-00942")
                    || e.getMessage().startsWith("ORA-01031")) {
                throw new SelectNotAllowedException();
            } else {
                throw new UnknownException(e.toString());
            }
        } catch (NoDataFoundException e) {
            throw new NoDataFoundException();
        } catch (Exception e) {
            throw new UnknownException(e.toString());
        }
        return gbr;
    }

    public ArrayList getInstantAndRegisteredDetails(Connection con, String typ, String dept, Date pf, Date pt) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList ar = null;
        String sql = "";
        GenericAdminBean genrbean = null;
        try {
            if (typ.equalsIgnoreCase("I")) {
                //sql = "select gp.REGISTERED, gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,chd.DEPT_ID,chd.dept_name from GENERIC_EPAYMENT gp join GENERIC_DEPT chd  on chd.DEPT_ID=gp.department where gp.PAYMENT_DATE between ? and ? and gp.DEPARTMENT=? and gp.REGISTERED is null and gp.challan_no is not null";
                //checked
                sql = "select gp.registered, gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city"
                        + ",gp.state,gp.payment_date,gp.period_from,gp.period_to,"
                        + "gp.amount,gp.department,chd.dept_id,chd.dept_name from generic_epayment gp join generic_dept "
                        + "chd  on chd.dept_id=gp.department where gp.payment_date between ? and ? and gp.department=? and"
                        + " gp.registered is null and gp.challan_no is not null";

            } else if (typ.equalsIgnoreCase("R")) {
                // sql = "select gp.REGISTERED, gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,chd.DEPT_ID,chd.dept_name from GENERIC_EPAYMENT gp join GENERIC_DEPT chd  on chd.DEPT_ID=gp.department where gp.PAYMENT_DATE between ? and ? and gp.DEPARTMENT=? and gp.REGISTERED is not null and gp.challan_no is not null";
                //checked
                sql = "select gp.registered, gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city,gp.state,"
                        + "gp.payment_date,gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,"
                        + "chd.dept_name from generic_epayment gp join generic_dept chd  "
                        + "on chd.DEPT_ID=gp.department where gp.payment_date between ? and ? and "
                        + "gp.department=? and gp.registered is not null and gp.challan_no is not null";

            } else if (typ.equalsIgnoreCase("A")) {
                //  sql = "select gp.REGISTERED, gp.CHALLAN_STATUS,gp.CHALLAN_NO,gp.DLRNAME,gp.ADDRESS,gp.CITY,gp.STATE,gp.PAYMENT_DATE,gp.PERIOD_FROM,gp.PERIOD_TO,gp.AMOUNT,gp.DEPARTMENT,chd.DEPT_ID,chd.dept_name from GENERIC_EPAYMENT gp join GENERIC_DEPT chd  on chd.DEPT_ID=gp.department where gp.PAYMENT_DATE between ? and ? and gp.DEPARTMENT=? and gp.challan_no is not null";
                //checked
                sql = "select gp.registered, gp.challan_status,gp.challan_no,gp.dlrname,gp.address,gp.city,gp.state,"
                        + "gp.payment_date,gp.period_from,gp.period_to,gp.amount,gp.department,"
                        + "chd.dept_id,chd.dept_name from generic_epayment gp join generic_dept chd "
                        + " on chd.dept_id=gp.department where gp.payment_date "
                        + "between ? and ? and gp.department=? and gp.challan_no is not null";

            }
            ps = con.prepareStatement(sql);
            ps.setDate(1, pf);
            ps.setDate(2, pt);
            ps.setString(3, dept);
            rs = ps.executeQuery();
            ar = new ArrayList();
            while (rs.next()) {
                genrbean = new GenericAdminBean();
                genrbean.setIsregistered(rs.getString("registered"));
                genrbean.setChallanstatus(rs.getString("challan_status"));
                genrbean.setChallanno(rs.getString("challan_no"));
                genrbean.setDlrname(rs.getString("dlrname"));
                genrbean.setAddress(rs.getString("address"));
                genrbean.setCity(rs.getString("city"));
                genrbean.setState(rs.getString("state"));
                genrbean.setPaymentdate(rs.getDate("payment_date"));
                genrbean.setPeriodfrom(rs.getDate("period_from"));
                genrbean.setPeriodto(rs.getDate("period_to"));
                genrbean.setAmount(rs.getDouble("amount"));
                genrbean.setDepartment(rs.getString("dept_name"));
                ar.add(genrbean);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return ar;
    }

    public void doInsertMajorTax(Connection con, GenericAdminBean gb) throws Exception {
        PreparedStatement ps = null;
        String sql =
                //"insert into GENERIC_MAJOR_TAX (DEPT_ID,MAJOR_TAX,MAJOR_TAX_ID,MAJOR_TAX_CODE,STATUS) values (?,?,(select max(to_number(MAJOR_TAX_ID))+1 from generic_major_tax),?,?)";
                //checked
                "insert into generic_major_tax (dept_id,major_tax,major_tax_code,status,MAJOR_TAX_ID) values (?,?,?,?,upper(uuid()))";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, gb.getDepartment());
            ps.setString(2, gb.getMajortax());
            ps.setString(3, gb.getMajortaxcode());
            ps.setString(4, "A");
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    public void doEditMajorTax(Connection con, GenericAdminBean gb, String majorid) throws Exception {
        PreparedStatement ps = null;
        try {
            //  ps = con.prepareStatement(
            //"update GENERIC_MAJOR_TAX set MAJOR_TAX=?, MAJOR_TAX_CODE=? where MAJOR_TAX_ID=? and dept_id=? AND STATUS=?");
            // "update GENERIC_MAJOR_TAX set MAJOR_TAX=?, MAJOR_TAX_CODE=? where MAJOR_TAX_ID=? and dept_id=? AND STATUS=?");
            //checked 
            ps = con.prepareStatement("update generic_major_tax set major_tax=?, major_tax_code=? "
                    + "where major_tax_id=? and dept_id=? and status=?");
            ps.setString(1, gb.getMajortax());
            ps.setString(2, gb.getMajortaxcode());
            ps.setString(3, majorid);
            ps.setString(4, gb.getDepartment());
            ps.setString(5, "A");
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

   /* public int getMajorTaxId(Connection con, String majortax, String majortaxcode, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        int majortaxid = 0;
        //String sql = "select MAJOR_TAX_ID from GENERIC_MAJOR_TAX where upper(MAJOR_TAX)=? and upper(MAJOR_TAX_CODE)=? and DEPT_ID=? and STATUS=?";
        //checked
        String sql = "select major_tax_id from generic_major_tax where upper(major_tax)=? and upper(major_tax_code)=? and dept_id=? and status=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, majortax.toUpperCase());
            ps.setString(2, majortaxcode.toUpperCase());
            ps.setString(3, dept);
            ps.setString(4, "A");
            rs = ps.executeQuery();
            if (rs.next()) {
                majortaxid = rs.getInt("MAJOR_TAX_ID");
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
        return majortaxid;
    }*/
    
    public String getMajorTaxId(Connection con, String majortax, String majortaxcode, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String majortaxid = "";
        //String sql = "select MAJOR_TAX_ID from GENERIC_MAJOR_TAX where upper(MAJOR_TAX)=? and upper(MAJOR_TAX_CODE)=? and DEPT_ID=? and STATUS=?";
        //checked
        String sql = "select major_tax_id from generic_major_tax where upper(major_tax)=? and upper(major_tax_code)=? and dept_id=? and status=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, majortax.toUpperCase());
            ps.setString(2, majortaxcode.toUpperCase());
            ps.setString(3, dept);
            ps.setString(4, "A");
            rs = ps.executeQuery();
            if (rs.next()) {
                majortaxid = rs.getString("MAJOR_TAX_ID");
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
        return majortaxid;
    }

    public void doUpdateMajorTax(Connection con, String majorid) throws Exception {
        PreparedStatement ps = null;
        try {
            // ps = con.prepareStatement("update GENERIC_MAJOR_TAX set STATUS=? where MAJOR_TAX_ID=?");
            //checked
            ps = con.prepareStatement("update generic_major_tax set status=? where major_tax_id=?");
            ps.setString(1, "I");
            ps.setString(2, majorid);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    public Connection createConnection_mysql() throws Exception {
        Connection conn = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            //   con = DriverManager.getConnection("jdbc:mysql://192.168.10.12:3306/checkpost", "chkuserlive", "chkuserlive");
            conn = DriverManager.getConnection("jdbc:mysql://192.168.137.13:3306/mact-server-1-3-13", "anurag", "anurag123");
            //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/checkpostlive",  "chkuser", "chkuser");
            System.out.println("Connection done");
        } catch (SQLException sqe) {
            System.out.println("Connection not established " + sqe.getMessage());
            throw sqe;
        } catch (Exception e) {
            System.out.println("Connection not established " + e.getMessage());
            throw e;
        }
        return conn;

    }

    public String getMajorTaxIdByDept(Connection con, String majortax, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String majortaxid = null;
        String sql = "select MAJOR_TAX_ID from generic_major_tax where upper(MAJOR_TAX)=? and DEPT_ID=? and STATUS=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, majortax.toUpperCase());
            ps.setString(2, dept);
            ps.setString(3, "I");
            rs = ps.executeQuery();
            if (rs.next()) {
                majortaxid = rs.getString("MAJOR_TAX_ID");
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
        return majortaxid;
    }
    public void doInsertBilldeskChksum(Connection con, String chksum, String url) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_msg (BILLDESK_CHECKSUM,BILLDESK_URL,GENERIC_ID,CREATED_DATE) values(?,?,(select (ifnull(max(GENERIC_ID),0)+1) from generic_msg),sysdate())";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, chksum);
            ps.setString(2, url);
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

    public String getLockUniquIdByDept(Connection con, String idprof, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String uniqid = null;
        String sql = "select UNIQUEID from generic_idproof  where upper(IDPROOF)=? and DEPARTMENT=? and STATUS=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idprof.toUpperCase());
            ps.setString(2, dept);
            ps.setString(3, "I");
            rs = ps.executeQuery();
            if (rs.next()) {
                uniqid = rs.getString("UNIQUEID");
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
        return uniqid;
    }

    public void doUnlockIdProof(Connection con, String uniq) throws Exception {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("update generic_idproof set STATUS=? where UNIQUEID=?");
            ps.setString(1, "A");
            ps.setString(2, uniq);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    public String getUniquIdByDept(Connection con, String idprof, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String uniqid = null;
        String sql = "select UNIQUEID from generic_idproof where upper(IDPROOF)=? and DEPARTMENT=? and STATUS=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, idprof.toUpperCase());
            ps.setString(2, dept);
            ps.setString(3, "A");
            rs = ps.executeQuery();
            if (rs.next()) {
                uniqid = rs.getString("UNIQUEID");
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
        return uniqid;
    }

    public void doEditIdProofByDept(Connection con, String dept, String idproof, String uniq) throws Exception {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("update generic_idproof set IDPROOF=? where DEPARTMENT=? AND STATUS=? and UNIQUEID=?");
            ps.setString(1, idproof);
            ps.setString(2, dept);
            ps.setString(3, "A");
            ps.setString(4, uniq);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    public void doUpdateIdProofByDept(Connection con, String dept, String idproof, String uniq) throws
            Exception {
        PreparedStatement ps = null;
        try {
            ps = con.prepareStatement("update generic_idproof set STATUS=? where DEPARTMENT=? and IDPROOF=? and UNIQUEID=?");
            ps.setString(1, "I");
            ps.setString(2, dept);
            ps.setString(3, idproof);
            ps.setString(4, uniq);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    public void doInsertDepartmentLocation(Connection con, int department, String address, int statecode, int citycode, String statename, String cityname, String pincode, String mobile, String email) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_department_location (dept_id,address,state_code,city_code,state,city,pincode,mobile,email,created_dt,location_id) values(?,?,?,?,?,?,?,?,?,sysdate(),upper(uuid()))";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, department);
            ps.setString(2, address);
            ps.setInt(3, statecode);
            ps.setInt(4, citycode);
            ps.setString(5, statename);
            ps.setString(6, cityname);
            ps.setString(7, pincode);
            ps.setString(8, mobile);
            ps.setString(9, email);
            ps.execute();
        } catch (Exception e) {
            System.out.println("error in insertion of department location : " + e.getMessage());
            throw e;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                System.out.println("error in insertion of department location : " + e.getMessage());
                throw e;
            }
        }
    }

    public ArrayList getFailedOrIntiatedTransactionList(Connection conn, Date pfrom, Date pto, String dept) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList getuserlist = new ArrayList();
        GenericAdminBean genrbean = null;
        String sql =
                "select  gp.purpose, gp.challan_status,gp.challan_no,"
                + "gp.dlrname,gp.address,gp.city,gp.state,gp.payment_date,"
                + "gp.period_from,gp.period_to,gp.amount,gp.department,chd.dept_id,"
                + "chd.dept_name from generic_epayment gp join generic_dept chd  on chd.dept_id=gp.department "
                + "where gp.payment_date between ? and ?  and gp.department=?  "
                + " and gp.challan_no is not null and gp.cin is null  ";
        try {
            ps = conn.prepareStatement(sql);
            ps.setDate(1, pfrom);
            ps.setDate(2, pto);
            ps.setString(3, dept);
            rs = ps.executeQuery();
            while (rs.next()) {
                genrbean = new GenericAdminBean();
                genrbean.setChallanno(rs.getString("CHALLAN_NO"));
                genrbean.setDlrname(rs.getString("DLRNAME"));
                genrbean.setAddress(rs.getString("ADDRESS"));
                genrbean.setCity(rs.getString("CITY"));
                genrbean.setState(rs.getString("STATE"));
                genrbean.setPaymentdate(rs.getDate("PAYMENT_DATE"));
                genrbean.setPeriodfrom(rs.getDate("PERIOD_FROM"));
                genrbean.setPeriodto(rs.getDate("PERIOD_TO"));
                genrbean.setAmount(rs.getDouble("AMOUNT"));
                genrbean.setDepartment(rs.getString("dept_name"));
                genrbean.setPurpose(rs.getString("purpose"));
                getuserlist.add(genrbean);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println("Error in Fetching Failed Transaction Details:   " + e.getMessage());
        }
        return getuserlist;

    }
    
    public String getBranchId(Connection con, String blocasn, String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        String branchid = "";
        //String sql = "select MAJOR_TAX_ID from GENERIC_MAJOR_TAX where upper(MAJOR_TAX)=? and upper(MAJOR_TAX_CODE)=? and DEPT_ID=? and STATUS=?";
        //checked,ps.setString(4, "A");// and status=?
        String sql = "SELECT id FROM branch_location WHERE branch_name=? and department_id=? and status=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, blocasn);
            ps.setString(2, dept);
            ps.setString(3, "A");
            rs = ps.executeQuery();
            if (rs.next()) {
                branchid = rs.getString("id");
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
        return branchid;
    }
    
     public void doEditBranchLocasn(Connection con, genericepayment.GenericBean gb, String branchid) throws Exception {
        PreparedStatement ps = null;
        try {
            //
    ps = con.prepareStatement("UPDATE branch_location SET state_id=?,district_id=?,address=?,pincode=? WHERE id=? and status=?");
    ps.setString(1, gb.getBranchstate());
    ps.setString(2, gb.getBranchdistrict());
    ps.setString(3, gb.getBranchaddress());
    ps.setString(4, gb.getBranchpincode());
    ps.setString(5,branchid);
    ps.setString(6, "A");
    ps.executeUpdate();
    ps.close();
} catch (Exception e) {
    System.out.println(e.getMessage());
    throw e;
}
    }
     public void doUpdateBranchLocsn(Connection con, String branchid) throws Exception {
        PreparedStatement ps = null;
        try {
            // ps = con.prepareStatement("update GENERIC_MAJOR_TAX set STATUS=? where MAJOR_TAX_ID=?");
            //checked
            ps = con.prepareStatement("update branch_location set status=? where id=?");
            ps.setString(1, "I");
            ps.setString(2, branchid);
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }
     
     public ArrayList getBranchdata(Connection con,String dept) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql ="SELECT initcap(branch_name) as branch_name FROM branch_location WHERE department_id=? and status=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, dept);
            ps.setString(2, "A");
            rs = ps.executeQuery();
            while (rs.next()) {
                GenericAdminBean gab = new GenericAdminBean();
                gab.setBranch_name(rs.getString("branch_name"));
                al.add(gab);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }
     public void doInsertAnnualyear(Connection con, GenericAdminBean gb) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_anual_date (id,cdate) values(upper(uuid()),?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, gb.getAnual_yr());
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
                System.out.println(e.getMessage());
            }
        }
    }
     
     public void doInsertqrtrmnthyear(Connection con, GenericAdminBean gb) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into generic_month_date (id,qurt_mnth_yr) values(upper(uuid()),?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, gb.getQrtrmnth_yer());
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
                System.out.println(e.getMessage());
            }
        }
    }
}
