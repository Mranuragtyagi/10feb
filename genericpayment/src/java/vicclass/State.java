package vicclass;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;

import java.util.ArrayList;

public class State {
    public String STATE_CODE;
    public String STATE_NAME;

    public State() {
    }


    public static ArrayList getStateList(Connection conn, 
                                         boolean ex_jharkhand) {
        ArrayList ar = new ArrayList();
        try {
            Statement st = conn.createStatement();

            String sql = "select * from states";
            if (ex_jharkhand)
                sql += " where trim(state_code)<>'34'";
            sql += " order by STATE_NAME asc";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                State s = new State();
                s.STATE_CODE = rs.getString("STATE_CODE");
                s.STATE_NAME = rs.getString("STATE_NAME");

                ar.add(s);
            }


        } catch (Exception ex) {
        }
        return ar;
    }

    public static String getState(Connection conn, String state_code) {
        String name = null;
        try {
            Statement st = conn.createStatement();
            String sql = 
                "select * from states where STATE_CODE='" + state_code + "'";
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                name = rs.getString("STATE_NAME");
            }


        } catch (Exception ex) {
        }
        return name;
    }
}
