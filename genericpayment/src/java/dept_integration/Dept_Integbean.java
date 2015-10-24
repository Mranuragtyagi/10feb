/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dept_integration;
import org.apache.commons.validator.UrlValidator;
import static java.lang.System.out;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vicclass.User;

/**
 *
 * @author santosh
 */
public class Dept_Integbean {

    private String sno;
    private String dept_name;//,,,,,
    private String dept_code;
    private String ip_adrs;
    private String secret_code;
    private String response_url;
    private String status;
    private String error_url;
    public Dept_Integbean() {
        sno = "";
        dept_name = "";
        dept_code = "";
        ip_adrs = "";
        secret_code = "";
        response_url = "";
        status = "";
        error_url="";
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSno() {
        return sno;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_code(String dept_code) {
        this.dept_code = dept_code;
    }

    public String getDept_code() {
        return dept_code;
    }

    public void setIp_adrs(String ip_adrs) {
        this.ip_adrs = ip_adrs;
    }

    public String getIp_adrs() {
        return ip_adrs;
    }

    public void setSecret_code(String secret_code) {
        this.secret_code = secret_code;
    }

    public String getSecret_code() {
        return secret_code;
    }

    public void setResponse_url(String response_url) {
        this.response_url = response_url;
    }

    public String getResponse_url() {
        return response_url;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void doInsertTax(Connection con, Dept_Integbean tbean) throws Exception {
        PreparedStatement ps = null;
        // String sql ="insert into echallan_tax_purposes(dept_id, TREASURY_HEAD_CODE,TAX_PURPOSE,DESCRIPTION,TAX_PURPOSE_ID,ISFIXED,FIXAMOUNT,TAX_PURPOSE_CODE,MAJOR_TAX,MAJOR_TAX_ID) values(?,?,upper(?),?,(select nvl(max(tax_purpose_id),0)+1 from echallan_tax_purposes),?,?,?,?,?)";
        String sql = "insert into department_integration(sno,dept_name,dept_code,ip_adrs,secret_code,response_url, error_url) values(upper(uuid()),?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, tbean.getDept_name());
            ps.setString(2, tbean.getDept_code());
            ps.setString(3, tbean.getIp_adrs());
            ps.setString(4, tbean.getSecret_code());
            ps.setString(5, tbean.getResponse_url());
            ps.setString(6, tbean.getError_url());
            ps.execute();
           
            ps.close();
          //  con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

    @SuppressWarnings("empty-statement")
    public String deptValidation(Connection con, Dept_Integbean tbeans) throws Exception {
       // String flag = "";
        
        String deptname = tbeans.getDept_name();
        System.out.println("Department Name is..."+deptname);
        String pattern = "[a-zA-Z]+(\\s[a-zA-Z]+)+";
        String nameEx = "/^[a-zA-Z]+$/";
        Boolean b = !deptname.matches(nameEx);
            System.out.println("boolean value is...."+b);
       // String nameEx = "/^[a-zA-Z]+$/";
        String nameEx1 = "/^[a-zA-Z0-9]+$/";
        String msg = "Please Fill The Appropriate";//(!deptname.matches(nameEx))
        
         if((b==false) || (deptname==null) || (deptname==""))
         {
          msg = msg +"Department Name\n";
            }
        String deptcod = tbeans.getDept_code();
         Boolean c = !deptcod.matches(nameEx1);
        if ((c==false) || (deptcod==null) || (deptcod==""))
        {
            msg = msg +"Department Code"+ "\n";
        }
        String ipadrs = tbeans.getIp_adrs();

       IPAddressValidator ipv=new IPAddressValidator();
             if(!ipv.validate(ipadrs)){
                  msg = msg + "Ip Address" +"\n";
             }
             String url = tbeans.getResponse_url();
         UrlValidator urlValidator = new UrlValidator();
            if (!urlValidator.isValid(url)) 
        {
         msg = msg + "Response Url" +"\n";
        }
             if (!urlValidator.isValid(tbeans.getError_url())) 
        {
         msg = msg + "Error Url" +"\n";
        }
        return msg;

    }
    

    public void doUpdate(Connection con, Dept_Integbean tbean) throws Exception {
        PreparedStatement ps = null;
        String sql="" ;
        System.out.println(tbean.getSno()   +tbean.getStatus() );
        if(tbean.getStatus().equalsIgnoreCase("A")){
             sql = "update department_integration set status='I' where sno=? ";
        }else if(tbean.getStatus().equalsIgnoreCase("I"))
        {
        sql = "update department_integration set status='A' where sno=? ";
            }
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1,tbean.getSno());
             ps.executeUpdate();
           
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;
        }
    }

     public static int getPages(Connection con) throws Exception {
        int totalcount = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select ceil(count(*)/10) as totalpage from department_integration";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                totalcount = rs.getInt("totalpage");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return totalcount;
    }
    
  /*  public ArrayList getTreasury(Connection con, int start, int last) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = "select sno,dept_name,dept_code,ip_adrs,secret_code,response_url,status from department_integration limit ?,? ";
            ps = con.prepareStatement(sql);
             ps.setInt(1, start);
            ps.setInt(2, last);
            rs = ps.executeQuery();
            while (rs.next()) {
                Dept_Integbean tbean = new Dept_Integbean();
                tbean.setSno(rs.getString("sno"));
                tbean.setDept_name(rs.getString("dept_name"));
                tbean.setDept_code(rs.getString("dept_code"));
                tbean.setIp_adrs(rs.getString("ip_adrs"));
                tbean.setSecret_code(rs.getString("secret_code"));
                tbean.setResponse_url(rs.getString("response_url"));
                tbean.setStatus(rs.getString("status"));
                //  rs = ps.executeQuery();
                al.add(tbean);
               
            }  rs.close();
            ps.close();
            //con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }*/
    
    
    
     public ArrayList getTreasury(Connection con) throws Exception {
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList al = new ArrayList();
        try {
            String sql = "select sno,dept_name,dept_code,ip_adrs,secret_code,response_url,status from department_integration ";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Dept_Integbean tbean = new Dept_Integbean();
                tbean.setSno(rs.getString("sno"));
                tbean.setDept_name(rs.getString("dept_name"));
                tbean.setDept_code(rs.getString("dept_code"));
                tbean.setIp_adrs(rs.getString("ip_adrs"));
                tbean.setSecret_code(rs.getString("secret_code"));
                tbean.setResponse_url(rs.getString("response_url"));
                tbean.setStatus(rs.getString("status"));
                //  rs = ps.executeQuery();
                al.add(tbean);
               
            }  rs.close();
            ps.close();
            //con.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return al;
    }

    

    /**
     * @return the error_url
     */
    public String getError_url() {
        return error_url;
    }

    /**
     * @param error_url the error_url to set
     */
    public void setError_url(String error_url) {
        this.error_url = error_url;
    }

}
