package vicclas;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class PasswordService {
    private int minlength;
    private int maxlength;
    private int days;
    private String pwd;
    private String spe_char;
    private String num_char;
    private String rowid;
    private int no_attempts;

    public PasswordService() {
        minlength = 0;
        days = 0;
        maxlength = 0;
        pwd = "";
        spe_char = "N";
        num_char = "N";
        rowid = null;
        no_attempts = 0;
    }

    public void setNoAttempts(int a) {
        this.no_attempts = a;
    }

    public int getNoAttempts() {
        return this.no_attempts;
    }

    public String getRowid() {
        return this.rowid;
    }

    public void setSpeChar(String a) {
        this.spe_char = a;
    }

    public String getSpeChar() {
        return this.spe_char;
    }

    public void setNumChar(String a) {
        this.num_char = a;
    }

    public String getNumChar() {
        return this.num_char;
    }

    public void setPwd(String a) {
        this.pwd = a;
    }

    public String getPwd() {
        return this.pwd;
    }

    public void setMinLength(int len) {
        this.minlength = len;
    }

    public int getMinLength() {
        return this.minlength;
    }

    public void setMaxLength(int len) {
        this.maxlength = len;
    }

    public int getMaxLength() {
        return this.maxlength;
    }

    public void setDays(int d) {
        this.days = d;
    }

    public int getDays() {
        return this.days;
    }

  

   

   

    public char doCheckLength() {
        char bool = 'N';
        if (this.pwd.length() < this.minlength)
            bool = 'm';
        else if (this.pwd.length() > this.maxlength)
            bool = 'M';
        else
            bool = 'N';
        return bool;
    }

    public boolean doCheckNumeric() {
        for (int i = 0; i < this.pwd.length(); i++) {
            //If we find a digit character we return true.
            if (Character.isDigit(this.pwd.charAt(i))) {
                return true;
            }
        }
        return false;

    }

    public boolean doCheckSpecialCharacter() {
        Pattern p = 
            Pattern.compile("^\\~|^\\!|^\\@|^\\#|^\\$|^\\%|^\\^|^\\&|^\\*|^\\`|^\\_|^\\-|^\\+|^\\=|^\\`|^\\||^\\(|^\\)");
        for (int i = 0; i < this.pwd.length(); i++) {
            Matcher m = p.matcher("" + this.pwd.charAt(i));
            if (m.find()) {
                return true;
            }
        }
        return false;

    }

    public boolean doCheckPeriod(java.sql.Date pdate) {
        boolean bool = false;
        DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        try {
            String pa = sdf.format(pdate);
            java.util.Date d = new Date();
            java.sql.Date newd = addDaysToDate(pa, this.days);
            java.sql.Date presentdate = new java.sql.Date(d.getTime());
            if (presentdate.before(newd)) {
                bool = false;
            } else {
                bool = true; //expired
            }
        } catch (Exception e) {
        }
        return bool;
    }

    private java.sql.Date addDaysToDate(String date, 
                                        int daysToAdd) throws Exception {
        // Date todayDate = new Date();
        DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        //String strDate = sdf.format(todayDate);
        Date parsedDate = sdf.parse(date);

        Calendar now = Calendar.getInstance();
        now.setTime(parsedDate);
        now.add(Calendar.DAY_OF_MONTH, daysToAdd);
        String d = sdf.format(now.getTime());
        java.util.Date dd = sdf.parse(d);
        java.sql.Date ddd = new java.sql.Date(dd.getTime());
        return ddd;
    }

    public boolean doCheckSpecialCharacter(String pwd) {
        Pattern p = 
            Pattern.compile("^\\~|^\\!|^\\@|^\\#|^\\$|^\\%|^\\^|^\\&|^\\*|^\\`|^\\_|^\\-|^\\+|^\\=|^\\`|^\\||^\\(|^\\)");
        for (int i = 0; i < pwd.length(); i++) {
            Matcher m = p.matcher("" + pwd.charAt(i));
            if (m.find()) {
                return true;
            }
        }
        return false;

    }

    public boolean doCheckNumeric(String pwd) {
        for (int i = 0; i < pwd.length(); i++) {
            //If we find a digit character we return true.
            if (Character.isDigit(pwd.charAt(i))) {
                return true;
            }
        }
        return false;

    }

    public void doAllotPasswordToDealers(Connection conn) {
        try {
            MD5 md = new MD5();
            PreparedStatement ps = 
                conn.prepareStatement("select code from tt_five");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String code = rs.getString("code");
                try {
                    PreparedStatement pp = 
                        conn.prepareStatement("update TT_2ND_DEALERS set pwd=?,code=? where code is null and rownum=1");
                    pp.setString(1, md.calcMD5(code));
                    pp.setString(2, code);
                    pp.execute();
                    pp.close();
                } catch (Exception e) {
                }
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
