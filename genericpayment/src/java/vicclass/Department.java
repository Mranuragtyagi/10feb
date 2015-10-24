/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package vicclass;

/**
 *
 * @author Rajiv
 */

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class Department{
    public int did;
    public String dname;
    private String dept_id;
    private String dept_name;
    public Department(){
    }

    public void setDept_id(String dept_id) {
        this.dept_id = dept_id;
    }

    public String getDept_id() {
        return dept_id;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public String getDept_name() {
        return dept_name;
    }

    public static ArrayList getDeptList(Connection conn) {
        ArrayList ar = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select dept_id, dept_name from generic_dept where status='A' order by dept_id");
            while (rs.next()) {
                Department dept = new Department();
                dept.setDept_id(rs.getString("dept_id"));
                dept.setDept_name(rs.getString("dept_name"));
                ar.add(dept);
            }
        } catch (Exception ex) {
            System.out.println("error @Department list " + ex.getMessage());
        }
        return ar;
    }
}

    
    

