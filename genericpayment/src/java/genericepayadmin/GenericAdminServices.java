package genericepayadmin;

import java.sql.Connection;
import java.util.ArrayList;

public class GenericAdminServices {
    
    public void doInsertDept(Connection con, GenericAdminBean gb) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        gd.doInsertDepartment(con, gb);
    }
    public void doInsertAnual(Connection con, GenericAdminBean gb) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        gd.doInsertAnnualyear(con, gb);
    }
     public void doInsertqurtmnth(Connection con, GenericAdminBean gb) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        gd.doInsertqrtrmnthyear(con, gb);
    }

    public boolean doFindByUser(Connection con, String username, String password, String c) throws Exception {
        boolean flag = false;
        GenericAdminDao gd = new GenericAdminDao();
        flag = gd.doFindByUser(con, username, password, c);
        return flag;
    }

    public GenericAdminBean getDetailsByEmail(Connection con, String username) throws Exception {
        GenericAdminBean gas = new GenericAdminBean();
        GenericAdminDao gd = new GenericAdminDao();
        gas = gd.getDetailsByEmail(con, username);
        return gas;
    }

    public void doInsertTax(Connection con, GenericAdminBean gb) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        gd.doInsertTax(con, gb);
    }

    public ArrayList getDetailsByDepartment(Connection con, String department) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        ArrayList al = new ArrayList();
        al = gd.getDetailsByDepartment(con, department);
        return al;
    }

    public ArrayList getDistrictList(Connection con) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        ArrayList al = new ArrayList();
        al = gd.getDistrictList(con);
        return al;
    }

    public ArrayList getDivList(Connection con) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        ArrayList al2 = new ArrayList();
        al2 = gd.getDivList(con);
        return al2;
    }

    public ArrayList getDeptList(Connection con) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        ArrayList al3 = new ArrayList();
        al3 = gd.getDeptList(con);
        return al3;
    }

    public void doInsertNewUser(Connection con, GenericAdminBean gb) throws Exception {
        GenericAdminDao gd = new GenericAdminDao();
        try{
            gd.doInsertNewUser(con, gb);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    public GenericAdminBean queryByUserName(Connection con, String username) throws Exception {
        GenericAdminBean gas = new GenericAdminBean();
        GenericAdminDao gd = new GenericAdminDao();
        gas = gd.queryByUserName(con, username);
        return gas;
    }

    public GenericAdminBean queryByUserNameForOthersDept(Connection con, String username, String dept) throws Exception {
        GenericAdminBean gas = new GenericAdminBean();
        GenericAdminDao gd = new GenericAdminDao();
        gas = gd.queryByUserNameForOthersDept(con, username, dept);
        return gas;
    }

}
