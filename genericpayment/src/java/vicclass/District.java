package vicclass;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;

public class District {
    public String STATE_CODE;
    public String DISTRICT_CODE;
    public String DISTRICT_NAME;

    public District() {
    }

    public static ArrayList getDistrictList(Connection conn, 
                                            String state_code) {
        ArrayList ar = new ArrayList();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = 
                st.executeQuery("select STATE_CODE,DISTRICT_CODE,DISTRICT_NAME from districts order by STATE_CODE,DISTRICT_NAME asc");
            while (rs.next()) {
                District d = new District();
                d.STATE_CODE = rs.getString("STATE_CODE");
                d.DISTRICT_CODE = rs.getString("DISTRICT_CODE");
                d.DISTRICT_NAME = rs.getString("DISTRICT_NAME");

                ar.add(d);
            }
            
            rs.close();
            st.close();
        } catch (Exception ex) {
        }
        return ar;
    }


    public static String getDistrict(Connection conn, String dist_code) {
        String name = null;
        try {
            Statement st = conn.createStatement();

            String sql = 
                "select * from districts where DISTRICT_CODE='" + dist_code + 
                "'";
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                name = rs.getString("DISTRICT_NAME");
            }


        } catch (Exception ex) {
        }
        return name;
    }
    public static void main(String[] a){
        User u=new User();
        u.createConnection();
        District d=new District();
        d.getDistrictList(u.getConnection(),"");
    }
}
