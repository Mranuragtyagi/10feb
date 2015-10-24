package genericepayadmin;
/*@author Rajiv*/

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BranchBean {

    private String branch_id;
    private String branch_name;
    private String branch_abbrevation;
    private int department_id;
    private String department_name;
    private int state_id;
    private int dist_id;
    private String dist_name;
    private String address;
    private int pin;
    private String state_name;
    private String parent_id;
    private String parent_name;
    private String child_node;
    private java.sql.Date created_date;
    private java.sql.Timestamp modified_date;

    public void BranchBean() {
        branch_id = null;
        branch_name = null;
        branch_abbrevation = null;
        department_id = 0;
        department_name = null;
        state_id = 0;
        state_name = null;
        dist_id = 0;
        dist_name = null;
        address = null;
        pin = 0;
        parent_id = null;
        parent_name = null;
        child_node=null;
        created_date = null;
        modified_date = null;
    }

    public String getBranch_id() {
        return branch_id;
    }

    public void setBranch_id(String branch_id) {
        this.branch_id = branch_id;
    }

    public String getBranch_name() {
        return branch_name;
    }

    public void setBranch_name(String branch_name) {
        this.branch_name = branch_name;
    }

    public String getBranch_abbrevation() {
        return branch_abbrevation;
    }

    public void setBranch_abbrevation(String branch_abbrevation) {
        this.branch_abbrevation = branch_abbrevation;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public int getState_id() {
        return state_id;
    }

    public void setState_id(int state_id) {
        this.state_id = state_id;
    }

    public String getState_name() {
        return state_name;
    }

    public void setState_name(String state_name) {
        this.state_name = state_name;
    }

    public int getDist_id() {
        return dist_id;
    }

    public void setDist_id(int dist_id) {
        this.dist_id = dist_id;
    }

    public String getDist_name() {
        return dist_name;
    }

    public void setDist_name(String dist_name) {
        this.dist_name = dist_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPin() {
        return pin;
    }

    public void setPin(int pin) {
        this.pin = pin;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    public String getParent_name() {
        return parent_name;
    }

    public void setParent_name(String parent_name) {
        this.parent_name = parent_name;
    }

    public String getChild_node() {
        return child_node;
    }

    public void setChild_node(String child_node) {
        this.child_node = child_node;
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

    public boolean updateParent(Connection connection) throws Exception {
        boolean flag = false;
        String isChild_node = null;
        PreparedStatement ps = null;
        String query = "select child_node from branch_location where id = ? ";
        String query1 = "update branch_location set child_node=? where id = ? ";
        ResultSet rs = null;
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, this.parent_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                isChild_node = rs.getString("child_node");
            }
            if (isChild_node.equalsIgnoreCase("N")) {
                rs.close();
                ps.close();
                ps = connection.prepareStatement(query1);
                ps.setString(1, "Y");
                ps.setString(2, this.parent_id);
                ps.execute();
                flag = true;
            }
        } catch (Exception e) {
            System.err.println("" + e.getMessage());
            throw e;
        }
        return flag;
    }

    public void addBranch (Connection connection) throws Exception {
        PreparedStatement ps = null;
        boolean flag = true;
        String query = "insert into branch_location (id, branch_name, abbrevation, department_id, state_id, "
                + " district_id, address, pincode, parent_id, created_date ) values (upper(uuid()),?,?,?,?,?,?,?,?,now())";

        try {
            if (!this.parent_id.equals("0")) {
                flag = this.updateParent(connection);
            }
            ps = connection.prepareStatement(query);
            ps.setString(1, this.branch_name);
            ps.setString(2, this.branch_abbrevation);
            ps.setInt(3, this.department_id);
            ps.setInt(4, this.state_id);                
            ps.setInt(5, this.dist_id);
            ps.setString(6, this.address);
            ps.setInt(7, this.pin);
            ps.setString(8, this.parent_id);
            ps.execute();            
        } catch (Exception exception) {
            System.err.println("Error Code :: addBranch :: " + exception.getMessage());
            throw exception;
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception exception) {
                System.err.println("Error Code :: Prepared Statement not closed :: " + exception.getMessage());
            }
        }

    }

   /* public List getBranchList(Connection connection){
        PreparedStatement ps = null;
        List list = null;
        ResultSet rs = null;
        String query = "select id, branch_name, abbrevation, department_id, (select d.dept_name from generic_dept d where "
                + " d.dept_id=b.department_id) as department_name, state_id, (select s.state_name from states s where "
                + " s.state_code=b.state_id) as state_name, district_id, (select d.district_name from districts d"
                + " where d.district_code=b.district_id and d.state_code=b.state_id) as district_name, address, "
                + " pincode, parent_id, (select a.branch_name from branch_location a where a.id=b.parent_id) "
                + " as parent_name, child_node, created_date, modified_date from branch_location b where "
                + " b.state_id=? and b.department_id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, this.state_id);
            ps.setInt(2, this.department_id);
            rs = ps.executeQuery();
            list = new ArrayList();
            while (rs.next()) {
                BranchBean bean = new BranchBean();
                bean.setBranch_id(rs.getString("id"));
                bean.setBranch_name(rs.getString("branch_name"));
                bean.setBranch_abbrevation(rs.getString("abbrevation"));
                bean.setDepartment_id(rs.getInt("department_id"));
                bean.setDepartment_name(rs.getString("department_name"));
                bean.setState_id(rs.getInt("state_id"));
                bean.setState_name(rs.getString("state_name"));
                bean.setDist_id(rs.getInt("district_id"));
                bean.setDist_name(rs.getString("district_name"));
                bean.setAddress(rs.getString("address"));
                bean.setPin(rs.getInt("pincode"));                
                bean.setParent_id(rs.getString("parent_id"));
                bean.setParent_name(rs.getString("parent_name")!=null?rs.getString("parent_name"):"");
                bean.setChild_node(rs.getString("child_node"));
                bean.setCreated_date(rs.getDate("created_date"));
                list.add(bean);
            }
        } catch (Exception exception) {
            System.err.println("Error Code :: addBranch :: " + exception.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception exception) {
                System.err.println("Error Code :: Prepared Statement not closed :: " + exception.getMessage());
            }
        }
        return list;
    }*/
    
     public List getBranchList(Connection connection){
        PreparedStatement ps = null;
        List list = null;
        ResultSet rs = null;
       /*String query = " select id, branch_name, abbrevation, department_id, (select d.dept_name from generic_dept d where "
                + " d.dept_id=b.department_id) as department_name, state_id, (select s.state_name from states s where "
                + " s.state_code=b.state_id) as state_name, district_id, (select d.district_name from districts "
                + " d where d.district_code=b.district_id and d.state_code=b.state_id) as district_name, address, "
                + " pincode, parent_id, (select a.branch_name from branch_location a where a.id=b.parent_id) "
                + " as parent_name, child_node, created_date, modified_date from branch_location b where "
                + " b.state_id=? and b.department_id=?"; */
        
        String query="select A.id,A.branch_name,A.abbrevation,A.parent_id,A.pincode,B.dept_name,C.state_name,D.district_name from branch_location as A LEFT join generic_dept as B on A.department_id = B.dept_id LEFT join states as C on A.state_id = C.state_code LEFT join districts as D on A.district_id = D.district_code where A.state_id = ? and A.department_id = ? and A.status='A' group by A.branch_name" ; 
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, this.state_id);
            ps.setInt(2, this.department_id);
            rs = ps.executeQuery();
            list = new ArrayList();
            while (rs.next()) {
                BranchBean bean = new BranchBean();
                bean.setBranch_id(rs.getString("id"));
                bean.setBranch_name(rs.getString("branch_name"));
                bean.setBranch_abbrevation(rs.getString("abbrevation"));
               // bean.setDepartment_id(rs.getInt("department_id"));
                bean.setDepartment_name(rs.getString("dept_name"));
               // bean.setState_id(rs.getInt("state_id"));
                bean.setState_name(rs.getString("state_name"));
              //  bean.setDist_id(rs.getInt("district_id"));
                bean.setDist_name(rs.getString("district_name"));
                //bean.setAddress(rs.getString("address"));
                bean.setPin(rs.getInt("pincode"));                
                bean.setParent_id(rs.getString("parent_id"));
               // bean.setParent_name(rs.getString("parent_name")!=null?rs.getString("parent_name"):"");
               // bean.setChild_node(rs.getString("child_node"));
               // bean.setCreated_date(rs.getDate("created_date"));
                list.add(bean);
            }
        } catch (Exception exception) {
            System.err.println("Error Code :: addBranch :: " + exception.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception exception) {
                System.err.println("Error Code :: Prepared Statement not closed :: " + exception.getMessage());
            }
        }
        return list;
    }


    public static List getParentList(Connection connection, int state_id, String department_id) {
        PreparedStatement ps = null;
        List list = null;
        ResultSet rs = null;
        String query = "select id, branch_name from branch_location b where b.state_id=? and b.department_id=? and b.status='A'";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, state_id);
            ps.setString(2, department_id);
            rs = ps.executeQuery();
            list = new ArrayList();
            while (rs.next()) {
                BranchBean bean = new BranchBean();
                bean.setParent_id(rs.getString("id"));
                bean.setParent_name(rs.getString("branch_name"));
                list.add(bean);
            }
        } catch (Exception exception) {
            System.err.println("Error Code :: addBranch :: " + exception.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception exception) {
                System.err.println("Error Code :: Prepared Statement not closed :: " + exception.getMessage());
            }
        }
        return list;
    }
    
    
    public static List getBranch(Connection connection, String department_id) {
        PreparedStatement ps = null;
        List list = null;
        ResultSet rs = null;
        String query = "select id, branch_name from branch_location b where b.state_id=34 and "
                + " b.department_id=? and b.child_node='N' and b.parent_id !='0' and b.status='A'";
        try{
            ps = connection.prepareStatement(query);            
            ps.setString(1, department_id);
            rs = ps.executeQuery();
            list = new ArrayList();
            while (rs.next()) {
                BranchBean bean = new BranchBean();
                bean.setBranch_id(rs.getString("id"));
                bean.setBranch_name(rs.getString("branch_name"));
                list.add(bean);
            }
        } catch (Exception exception) {
            System.err.println("Error Code :: addBranch :: " + exception.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception exception) {
                System.err.println("Error Code :: Prepared Statement not closed :: " + exception.getMessage());
            }
        }
        return list;
    }
    
    public static List getAllBranch(Connection connection, /*int state_id,*/ int department_id) {
        PreparedStatement ps = null;
        List list = null;
        ResultSet rs = null;
        String query = "select id, branch_name from branch_location b where b.state_id=34 and b.department_id=? and b.status='A'";
        try{
            ps = connection.prepareStatement(query);            
            ps.setInt(1, department_id);
            rs = ps.executeQuery();
            list = new ArrayList();
            while (rs.next()) {
                BranchBean bean = new BranchBean();
                bean.setBranch_id(rs.getString("id"));
                bean.setBranch_name(rs.getString("branch_name"));
                list.add(bean);
            }
        } catch (Exception exception) {
            System.err.println("Error Code :: addBranch :: " + exception.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception exception) {
                System.err.println("Error Code :: Prepared Statement not closed :: " + exception.getMessage());
            }
        }
        return list;
    }
    
}
