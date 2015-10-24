package vicclass;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import java.text.*;

import java.util.Date;

public class Utility {
    public static String nvl(String value, String alt) {
        if (value == null) {
            return alt;
        } else {
            return value;
        }
    }

    public static String commaFormat(double d) {
        String s, f;
        String t;
        int l, i;
        if (d != 0) {
            f = "000,00,00,000.00";
        } else {
            f = "00.00";
        }
        DecimalFormat df = new DecimalFormat(f);
        s = df.format(d);
        if (d != 0) {
            l = s.length();
            i = 0;
            while (i < l) {
                if (s.substring(i, i + 1).equals("0") || 
                    s.substring(i, i + 1).equals(","))
                    i++;
                else
                    break;
            }
            t = s.substring(i, l);
        } else {
            t = s;
        }
        return t;
    }

    public static Period getPeriodMonth(Connection conn, int month, int year) {
        Period p = new Period();
        try {
            Statement stmt = conn.createStatement();
           // ResultSet rs =stmt.executeQuery("select last_day(to_date('1/" + month + "/" +year+"','dd/mm/yyyy')) period_to from dual");
           String sql="SELECT last_day(str_to_date('1,"+month+","+year+"','%d,%m,%Y')) as period_to";
            ResultSet rs =stmt.executeQuery(sql);
            p.period_from =new java.sql.Date((new Date(year - 1900, month - 1, 1)).getTime());
            rs.next();
            p.period_to = rs.getDate("period_to");
            rs.close();
            stmt.close();
            //   conn.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return p;
    }

    public static Period getPeriodQuarter(Connection conn, int qtr, int year) {
        Period p = new Period();
        try {
            int month1, month2;
            month1 = (3 * qtr + 1);
            month2 = (3 * qtr + 3);
            Statement stmt = conn.createStatement();
            ResultSet rs = 
                stmt.executeQuery("SELECT last_day(str_to_date('1,"+month2+","+year+"','%d,%m,%Y')) as period_to ");
              //  "select last_day(to_date('1/" + month2 + 
                            //      "/" + year + 
                              //    "','dd/mm/yyyy')) period_to from dual
                             
            p.period_from = 
                    new java.sql.Date((new Date(year - 1900, month1 - 1, 
                                                1)).getTime());
            System.out.println(p.period_from);
            rs.next();
            p.period_to = rs.getDate("period_to");
            System.out.println(p.period_to);
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return p;
    }

    public static Period getPeriodAnnual(int year1, int year2) {
        Period p = new Period();

        p.period_from = 
                new java.sql.Date((new Date(year1 - 1900, 3, 1)).getTime());
        p.period_to = 
                new java.sql.Date((new Date(year2 - 1900, 2, 31)).getTime());
        return p;
    }

    public static String getMonth(int month) {
        String m1 = "";
        switch (month) {
        case 1:
            m1 = "January";
            break;
        case 2:
            m1 = "February";
            break;
        case 3:
            m1 = "March";
            break;
        case 4:
            m1 = "April";
            break;
        case 5:
            m1 = "May";
            break;
        case 6:
            m1 = "June";
            break;
        case 7:
            m1 = "July";
            break;
        case 8:
            m1 = "August";
            break;
        case 9:
            m1 = "September";
            break;
        case 10:
            m1 = "October";
            break;
        case 11:
            m1 = "November";
            break;
        case 12:
            m1 = "December";
            break;
        }
        return m1;
    }

    public static void main(String[] ars) {
        User u = new User();
        u.createConnection();
        int i = 1;
        while (i < 5) {
            Period p = getPeriodQuarter(u.getConnection(), i % 4, 2011);
            i = i + 1;
        }

    }
}
