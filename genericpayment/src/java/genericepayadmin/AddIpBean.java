/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package genericepayadmin;
import genericepayadmin.AddIpBean;
import genericepayadmin.ValidateIpAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.apache.commons.validator.UrlValidator;

/**
 *
 * @author santosh
 */
public class AddIpBean {

    private String id;//id,ipaddress,deptid,checksum
    private String ipaddress;
    private String deptid;
    private String dept_name;
    private String checksum;
    private String status;

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the ipaddress
     */
    public String getIpaddress() {
        return ipaddress;
    }

    /**
     * @param ipaddress the ipaddress to set
     */
    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    /**
     * @return the deptid
     */
    public String getDeptid() {
        return deptid;
    }

    /**
     * @param deptid the deptid to set
     */
    public void setDeptid(String deptid) {
        this.deptid = deptid;
    }

    /**
     * @return the checksum
     */
    public String getChecksum() {
        return checksum;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    /**
     * @param checksum the checksum to set
     */
    public void setChecksum(String checksum) {
        this.checksum = checksum;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    //////////
    
    public String deptValidation(Connection con, AddIpBean aip) throws Exception {
       // String flag = "";
        
        String deptname = aip.getDeptid();
        String ipadrs = aip.getIpaddress();
         String msg1 = "Please Fill The Appropriate";
       ValidateIpAddress ipv=new ValidateIpAddress();
              if(!ipv.validate(ipadrs)){
                  msg1 = msg1 + " IP Address" +"\n";
             }
             
        return msg1;

    } public String deptValidationEdit(Connection con, AddIpBean aip) throws Exception {
        
        String ipadrs = aip.getIpaddress();
         String msg1 = "Please Fill The Appropriate";
        String nameEx = "^[a-zA-Z0-9]+$";
              
       ValidateIpAddress ipv=new ValidateIpAddress();
              if(!ipv.validate(ipadrs)){
                  msg1 = msg1 + " IP Address" +"\n";
             }
             
        return msg1;

    }
    
    ///////////deptValidationEdit

    public void doInsertTax(Connection con, AddIpBean aip) throws Exception {
        PreparedStatement ps = null;
        String sql = "insert into webservice_validator(id,ipaddress,deptid,checksum) values(upper(uuid()),?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, aip.ipaddress);
            ps.setString(2, aip.deptid);
            ps.setString(3, aip.checksum);
            ps.execute();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }finally{
           if(ps!=null) ps.close();
        }
    }

    public String doEdit(Connection con, AddIpBean aip) throws Exception {
        PreparedStatement ps = null;
        String flag = "false";
        String sql = "update webservice_validator set ipaddress=?,checksum=?,active=? where id=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, aip.ipaddress);
            ps.setString(2, aip.checksum);
            ps.setString(3, aip.status);
            ps.setString(4, aip.id);
            ps.executeUpdate();
            flag = "true";
        } catch (Exception e) {
            flag = "false";
            System.out.println(e.getMessage());
            throw e;
        }finally{
        if(ps!=null)ps.close();
        }
        return flag;
    }

    public static ArrayList getTreasury(Connection con) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();

        try {
            String sql = "select wbser.active, wbser.id, gdep.dept_name, wbser.ipaddress,wbser.checksum from webservice_validator wbser,generic_dept gdep "
                    + " where gdep.DEPT_ID=wbser.deptid ";
            ps = con.prepareStatement(sql);
           
            rs = ps.executeQuery();
            while (rs.next()) {
                AddIpBean tbean = new AddIpBean();
                tbean.setId(rs.getString("id"));
                tbean.setDept_name(rs.getString("dept_name"));
                tbean.setIpaddress(rs.getString("ipaddress"));
                tbean.setChecksum(rs.getString("checksum"));
                tbean.setStatus(rs.getString("active"));
                al.add(tbean);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally{
        if(ps!=null)ps.close();
        if(rs!=null)rs.close();
        }
        return al;
    }

    public static int getPages(Connection con) throws Exception {
        int totalcount = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select ceil(count(*)/10) as totalpage from webservice_validator";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalcount = rs.getInt("totalpage");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        finally {
            try{
                if(ps!=null)ps.close();
                if(rs!=null)rs.close();
            }catch(Exception e ){
                System.out.println(e.getMessage());
            }
        }
        return totalcount;
    }
}
