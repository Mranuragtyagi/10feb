package genericechartreport;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.text.SimpleDateFormat;

import java.util.ArrayList;

public class GetGenericReport {

    private double excisetotal;
    private double miningtotal;
    private double comtaxtotal;
    private double registration;
    private double transport;
    private double trafficpolice;
    private String monthstring;
    private int monthint;
    private int yearint;
    private String fromdate;
    private String todate;
    private String paydate;
    private double combinepaymenttotal;
    private java.sql.Date caldate;
    private String LastMonthAmount;
    private String LastMonthDepartment;
    private String LastMonthMonth;

    public GetGenericReport() {
        excisetotal = 0.0;
        miningtotal = 0.0;
        comtaxtotal = 0.0;
        registration = 0.0;
        transport = 0.0;
        trafficpolice = 0.0;
        monthstring = "";
        monthint = 0;
        yearint = 0;
        fromdate = "";
        todate = "";
        paydate = "";
        combinepaymenttotal = 0.0;
        caldate = null;
        LastMonthAmount="";
        LastMonthDepartment="";
        LastMonthMonth="";
    }

    public void setExcisetotal(double excisetotal) {
        this.excisetotal = excisetotal;
    }

    public double getExcisetotal() {
        return excisetotal;
    }

    public void setMiningtotal(double miningtotal) {
        this.miningtotal = miningtotal;
    }

    public double getMiningtotal() {
        return miningtotal;
    }

    public void setComtaxtotal(double comtaxtotal) {
        this.comtaxtotal = comtaxtotal;
    }

    public double getComtaxtotal() {
        return comtaxtotal;
    }

    public void setRegistration(double registration) {
        this.registration = registration;
    }

    public double getRegistration() {
        return registration;
    }

    public void setMonthstring(String monthstring) {
        this.monthstring = monthstring;
    }

    public String getMonthstring() {
        return monthstring;
    }

    public void setMonthint(int monthint) {
        this.monthint = monthint;
    }

    public int getMonthint() {
        return monthint;
    }

    public void setYearint(int yearint) {
        this.yearint = yearint;
    }

    public int getYearint() {
        return yearint;
    }

    public void setFromdate(String fromdate) {
        this.fromdate = fromdate;
    }

    public String getFromdate() {
        return fromdate;
    }

    public void setTodate(String todate) {
        this.todate = todate;
    }

    public String getTodate() {
        return todate;
    }

    public void setPaydate(String paydate) {
        this.paydate = paydate;
    }

    public String getPaydate() {
        return paydate;
    }

    public void setCombinepaymenttotal(double combinepaymenttotal) {
        this.combinepaymenttotal = combinepaymenttotal;
    }

    public double getCombinepaymenttotal() {
        return combinepaymenttotal;
    }

    public void setCaldate(Date caldate) {
        this.caldate = caldate;
    }

    public Date getCaldate() {
        return caldate;
    }
    public void setLastMonthAmount(String LastMonthAmount) {
        this.LastMonthAmount = LastMonthAmount;
    }

    public String getLastMonthAmount() {
        return LastMonthAmount;
    }
    public void setLastMonthDepartment(String LastMonthDepartment) {
        this.LastMonthDepartment = LastMonthDepartment;
    }

    public String getLastMonthDepartment() {
        return LastMonthDepartment;
    }
    public void setLastMonthMonth(String LastMonthMonth) {
        this.LastMonthMonth = LastMonthMonth;
    }

    public String getLastMonthMonth() {
        return LastMonthMonth;
    }
    public void setTransport(double transport) {
        this.transport = transport;
    }

    public double getTransport() {
        return transport;
    }

    public void setTrafficpolice(double trafficpolice) {
        this.trafficpolice = trafficpolice;
    }

    public double getTrafficpolice() {
        return trafficpolice;
    }

    /* **************************************************** Weekly Payment Report ********************************************************************/
    public static ArrayList<GetGenericReport> getWeeklyReport(Connection conn) {
        ArrayList<GetGenericReport> ar1 = null;
        ResultSet rs1 = null;
        PreparedStatement ps1 = null;
        //String sql1 = "select nvl(sum(decode(department, 3, amount)), 0) as CTax, nvl(sum(decode(department, 1, amount)), 0) as Mining, nvl(sum(decode(department, 2, amount)), 0) as excise, nvl(sum(decode(department, 9, amount)), 0) as Registration, trunc(payment_date) as pdate from generic_epayment where cin is not null and trunc(payment_date) between trunc(sysdate-7) and  trunc(sysdate) group by trunc(payment_date) order by pdate";       
        ////String sql1 = "select nvl(sum(decode(department, 3, amount)), 0) as CTax, nvl(sum(decode(department, 1, amount)), 0) as Mining, nvl(sum(decode(department, 2, amount)), 0) as excise, nvl(sum(decode(department, 9, amount)), 0) as Registration, trunc(payment_date) as pdate, nvl(sum(decode(department, 10, amount)), 0) as Transport, nvl(sum(decode(department, 11, amount)), 0) as Traffic from generic_epayment where cin is not null and trunc(payment_date) between trunc(sysdate-7) and  trunc(sysdate) group by trunc(payment_date) order by pdate";       
        //not done decode

        /* String sql1="select ifnull(sum(decode(department, 3, amount)), 0) as ctax,"
         + " nvl(sum(decode(department, 1, amount)), 0) as mining,"
         + " ifnull(sum(decode(department, 2, amount)), 0) as excise,"
         + " nvl(sum(decode(department, 9, amount)), 0) as registration, trunc(payment_date) as pdate,"
         + " nvl(sum(decode(department, 10, amount)), 0) as Transport,"
         + " nvl(sum(decode(department, 11, amount)), 0) as Traffic from generic_epayment "
         + "where cin is not null and trunc(payment_date) between trunc(sysdate-7) and"
         + "  trunc(sysdate) group by trunc(payment_date) order by pdate";*/
        //done  1

        String sql1 = "select ifnull(sum(if(department= '3',amount,0 )),0) as ctax,ifnull(sum(if(department= '1',amount,0 )),0) as mining,"
                + "ifnull(sum(if(department= '2',amount,0) ),0) as excise,ifnull( sum(if(department= '9',amount,0 )),0) as registration,"
                + "date_format(payment_date,'%d-%b-%y') as pdate,  ifnull(sum( if(department= '10',amount,0 )),0) as Transport,"
                + "if(department= '11',amount,0 ) as Traffic from generic_epayment where cin is not null and "
                + "payment_date between date_sub(SYSDATE(), interval 7 day) and SYSDATE() group by pdate order by pdate";

        try {


            //SELECT sum(
//if(department= '3',amount,0 )),department as dddd


//FROM `generic_epayment` 
            ps1 = conn.prepareStatement(sql1);
            rs1 = ps1.executeQuery();
            ar1 = new ArrayList<GetGenericReport>();
            while (rs1.next()) {
                GetGenericReport grlist = new GetGenericReport();
                grlist.setExcisetotal(rs1.getDouble("excise"));
                grlist.setMiningtotal(rs1.getDouble("mining"));
                grlist.setComtaxtotal(rs1.getDouble("ctax"));
                grlist.setRegistration(rs1.getDouble("registration"));
                grlist.setTransport(rs1.getDouble("transport"));
                grlist.setTrafficpolice(rs1.getDouble("traffic"));
                grlist.setPaydate(rs1.getString("pdate"));
                ar1.add(grlist);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs1 != null) {
                    rs1.close();
                }
                if (ps1 != null) {
                    ps1.close();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return ar1;
    }

    /* **************************************************** Monthly Payment Report ********************************************************************/
    public static ArrayList<GetGenericReport> getMonthlyReport(Connection conn) {
        ArrayList<GetGenericReport> ar = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        /* String sql = "select sum(a.CTax) as Ctax, sum(a.Mining) as mining, sum(a.excise) as excise, sum(a.Registration) as Registration, a.month, " +
         " a.month1, a.year from (select nvl(sum(decode(department, 3, gp.amount)), 0) as CTax, nvl(sum(decode(department, 1, gp.amount)), 0) as Mining, " +
         " nvl(sum(decode(department, 2, gp.amount)), 0) as excise, nvl(sum(decode(department, 9, gp.amount)), 0) as Registration, trunc(gp.payment_date)" +
         " as pdate, to_char(gp.payment_date, 'MON') as month, to_char(gp.payment_date, 'MM') as month1, to_char(gp.payment_date, 'yyyy') as year" +
         " from generic_epayment gp where gp.cin is not null and trunc(gp.payment_date) between (trunc(add_months (sysdate, -5), 'mm')) and  trunc(sysdate)" +
         " group by (trunc(gp.payment_date), to_char(gp.payment_date, 'MON'), to_char(gp.payment_date, 'MM'), to_char(gp.payment_date, 'yyyy')) )a " +
         " group by (a.month, a.month1, a.year) order by a.year, a.month1"; */
        //done 2  

        String sql = "select sum(a.CTax) as Ctax, sum(a.Mining) as mining, sum(a.excise) as excise, sum(a.Registration) as Registration, sum(a.Transport) as Transport, sum(a.Traffic) as Traffic, a.month, a.month1, a.year from (select ifnull(sum(if(department='3',gp.amount,0)), 0) as CTax,\n" +
"ifnull(sum(if(department='1', gp.amount,0)), 0) as Mining,\n" +
" ifnull(sum(if(department='2', gp.amount,0)), 0) as Excise, \n" +
"ifnull(sum(if(department='9', gp.amount,0)), 0) as Registration, \n" +
"ifnull(sum(if(department= '10', gp.amount,0)), 0) as Transport,\n" +
"ifnull(sum(if(department= '11', gp.amount,0)), 0) as Traffic,\n" +
"date_format(gp.payment_date,'%d-%m-%Y') as pdate,\n" +
"date_format(gp.payment_date, '%b') as month, \n" +
"date_format(gp.payment_date, '%m') as month1, \n" +
"date_format(gp.payment_date, '%Y') as year\n" +
"from generic_epayment gp where gp.cin is not null \n" +
"        \n" +
"     group by (gp.payment_date), date_format(gp.payment_date, '%m'), \n" +
"date_format(gp.payment_date, '%b'), date_format(gp.payment_date, '%Y'))a \n" +
"       \n" +
"         group by a.month, a.month1, a.year order by a.year, a.month1";
//        String sql = "select sum(a.CTax) as Ctax, sum(a.Mining) as mining, sum(a.excise) as excise, sum(a.Registration) as Registration, sum(a.Transport) as Transport, sum(a.Traffic) as Traffic, a.month, " +
//        " a.month1, a.year from (select nvl(sum(decode(department, 3, gp.amount)), 0) as CTax, nvl(sum(decode(department, 1, gp.amount)), 0) as Mining, " +
//        " nvl(sum(decode(department, 2, gp.amount)), 0) as excise, nvl(sum(decode(department, 9, gp.amount)), 0) as Registration, nvl(sum(decode(department, 10, gp.amount)), 0) as Transport, nvl(sum(decode(department, 11, gp.amount)), 0) as Traffic, trunc(gp.payment_date)" +
//        " as pdate, to_char(gp.payment_date, 'MON') as month, to_char(gp.payment_date, 'MM') as month1, to_char(gp.payment_date, 'yyyy') as year" +
//        " from generic_epayment gp where gp.cin is not null and trunc(gp.payment_date) between (trunc(add_months (sysdate, -5), 'mm')) and  trunc(sysdate)" +
//        " group by (trunc(gp.payment_date), to_char(gp.payment_date, 'MON'), to_char(gp.payment_date, 'MM'), to_char(gp.payment_date, 'yyyy')) )a " +
//        " group by (a.month, a.month1, a.year) order by a.year, a.month1";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            ar = new ArrayList<GetGenericReport>();
            while (rs.next()) {
                GetGenericReport grlist = new GetGenericReport();
                grlist.setExcisetotal(rs.getDouble("excise"));
                grlist.setMiningtotal(rs.getDouble("mining"));
                grlist.setComtaxtotal(rs.getDouble("ctax"));
                grlist.setRegistration(rs.getDouble("registration"));
                grlist.setTransport(rs.getDouble("transport"));
                grlist.setTrafficpolice(rs.getDouble("traffic"));
                grlist.setMonthint(rs.getInt("month1"));
                grlist.setMonthstring(rs.getString("month"));
                grlist.setYearint(rs.getInt("year"));
                ar.add(grlist);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return ar;
    }

    /* **************************************************** Yearly Payment Report ********************************************************************/
    public static ArrayList<GetGenericReport> getAnuallyReport(Connection conn) {
        ArrayList<GetGenericReport> ar2 = null;
        ResultSet rs1 = null;
        PreparedStatement ps1 = null;
//        String sql1 = "select sum(a.CTax) as Ctax, sum(a.Mining) as mining, sum(a.excise) as excise, sum(a.Registration) as Registration, a.fromdate, " +
//        " a.todate from( select nvl(sum(decode(department, 3, gp.amount)), 0) as CTax, nvl(sum(decode(department, 1, gp.amount)), 0) as Mining, " +
//        " nvl(sum(decode(department, 2, gp.amount)), 0) as excise, nvl(sum(decode(department, 9, gp.amount)), 0) as Registration, (trunc(gp.payment_date))" +
//        " as pdate, (case when gp.payment_date >= (trunc(to_date('01-APR-'|| to_char(to_date(trunc(gp.payment_date, 'yyyy')-1), 'yyyy')))) and" +
//        " gp.payment_date <= (trunc(to_date('31-MAR-'||to_char(gp.payment_date,'YYYY')))) then to_char(to_char(gp.payment_date, 'yyyy')-1) else " +
//        " to_char(to_char(gp.payment_date, 'yyyy'))end) as fromdate, (case when gp.payment_date >= " +
//        " (trunc(to_date('01-APR-'|| to_char(to_date(trunc(gp.payment_date, 'yyyy')), 'yyyy')))) and gp.payment_date <= to_date('31-MAR-'|| " +
//        " to_char(to_char(gp.payment_date, 'yyyy')+1)) then to_char(to_char(gp.payment_date, 'yyyy')+1) else to_char(gp.payment_date, 'yyyy') end) " +
//        " as todate from generic_epayment gp where gp.cin is not null group by (trunc(gp.payment_date), (case when gp.payment_date >= " +
//        " (trunc(to_date('01-APR-'|| to_char(to_date(trunc(gp.payment_date, 'yyyy')-1), 'yyyy')))) and gp.payment_date <= (trunc(to_date('31-MAR-'|| " +
//        " to_char(gp.payment_date,'YYYY')))) then to_char(to_char(gp.payment_date, 'yyyy')-1) else to_char(to_char(gp.payment_date, 'yyyy'))end), " +
//        " (case when gp.payment_date >= (trunc(to_date('01-APR-'|| to_char(to_date(trunc(gp.payment_date, 'yyyy')), 'yyyy')))) and " +
//        " gp.payment_date <= to_date('31-MAR-'|| to_char(to_char(gp.payment_date, 'yyyy')+1)) then to_char(to_char(gp.payment_date, 'yyyy')+1) else " +
//        " to_char(gp.payment_date, 'yyyy') end)))a group by (a.fromdate, a.todate) order by a.fromdate ";    
//        
//         
        //done 3
        String sql1 = "select sum(a.CTax) as Ctax, sum(a.Mining) as mining, sum(a.excise) as excise, sum(a.Registration) as Registration, sum(a.Transport) as Transport, sum(a.Traffic) as Traffic, a.fromdate,"
                + " a.todate from (select ifnull(sum(if(department= '3', gp.amount,0)), 0) as CTax, ifnull(sum(if(department='1', gp.amount,0)), 0) as Mining, ifnull(sum(if(department='2', gp.amount,0)), 0) as Excise, "
                + " ifnull(sum(if(department= '9', gp.amount,0)), 0) as Registration,ifnull(sum(if(department= '10', gp.amount,0)), 0) as Transport, ifnull(sum(if(department= '11', gp.amount,0)), 0) as Traffic,"
                + " date_format(gp.payment_date,'%d-%m-%Y') as pdate, if(gp.payment_date >=str_to_date( concat( '01-APR-', str_to_date( gp.payment_date, '%Y' ) -1 ) , '%d-%M-%Y' ) and "
                + " str_to_date( concat( '31-MAR-', str_to_date( gp.payment_date, '%Y' ) -1 ) , '%d-%M-%Y' ) ,date_format( gp.payment_date, '%Y' ) -1,date_format(gp.payment_date, '%Y'))"
                + " as fromdate, if(gp.payment_date >= str_to_date( concat( '01-APR-', str_to_date( gp.payment_date, '%Y' )  ) , '%d-%M-%Y' ) and  gp.payment_date <= str_to_date( concat( '31-MAR-',"
                + " str_to_date( gp.payment_date, '%Y' ) +1 ) , '%d-%M-%Y' ) ,date_format( gp.payment_date, '%Y' ) -1,date_format(gp.payment_date, '%Y'))as todate from generic_epayment gp where gp.cin is not null group by gp.payment_date,"
                + " if(gp.payment_date >=str_to_date( concat( '01-APR-', str_to_date( gp.payment_date, '%Y' ) -1 ) , '%d-%M-%Y' ) and gp.payment_date <= str_to_date( concat( '31-MAR-', str_to_date( gp.payment_date, '%Y' ) -1 ) , '%d-%M-%Y' ) ,"
                + " date_format( gp.payment_date, '%Y' ) -1,date_format(gp.payment_date, '%Y')), if(gp.payment_date >= str_to_date( concat( '01-APR-', str_to_date( gp.payment_date, '%Y' )  ) , '%d-%M-%Y' ) and "
                + " gp.payment_date <= str_to_date( concat( '31-MAR-', str_to_date( gp.payment_date, '%Y' ) +1 ) , '%d-%M-%Y' ) ,date_format( gp.payment_date, '%Y' ) +1,date_format(gp.payment_date, '%Y'))"
                + " ) a group by a.fromdate, a.todate order by a.fromdate";




        try {
            ps1 = conn.prepareStatement(sql1);
            rs1 = ps1.executeQuery();
            ar2 = new ArrayList<GetGenericReport>();
            while (rs1.next()) {
                GetGenericReport grlist = new GetGenericReport();
                grlist.setExcisetotal(rs1.getDouble("excise"));
                grlist.setMiningtotal(rs1.getDouble("mining"));
                grlist.setComtaxtotal(rs1.getDouble("ctax"));
                grlist.setRegistration(rs1.getDouble("registration"));
                grlist.setTransport(rs1.getDouble("transport"));
                grlist.setTrafficpolice(rs1.getDouble("traffic"));
                grlist.setFromdate(rs1.getString("fromdate"));
                grlist.setTodate(rs1.getString("todate"));
                ar2.add(grlist);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (rs1 != null) {
                    rs1.close();
                }
                if (ps1 != null) {
                    ps1.close();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return ar2;
    }

    /* **************************************************** Payment Report in Calendar ******************************************************/
    public static ArrayList<GetGenericReport> getTotalForCalender(Connection con) {
        ArrayList<GetGenericReport> arrdasbord3 = null;
        java.sql.Statement stdasbord3 = null;
        java.sql.ResultSet rsdasbord3 = null;
        GetGenericReport gbmis3 = null;
        String sql4 = null;
        // sql4 = "select nvl(sum(amount),0) as total, trunc(payment_date) as pdate from generic_epayment "
        //      + "where cin is not null group by trunc(payment_date) order by pdate" ;

        //done 4
        sql4 = "select ifnull(sum(amount),0) as total, date_format(payment_date,'%Y-%m-%d') as pdate from generic_epayment "
                + "where cin is not null group by date_format(payment_date,'%Y-%m-%d') order by pdate";

        try {
            stdasbord3 = con.createStatement();
            rsdasbord3 = stdasbord3.executeQuery(sql4);
            arrdasbord3 = new ArrayList<GetGenericReport>();
            while (rsdasbord3.next()) {
                gbmis3 = new GetGenericReport();
                gbmis3.setCombinepaymenttotal(rsdasbord3.getDouble("total"));
                gbmis3.setCaldate(rsdasbord3.getDate("pdate"));
                arrdasbord3.add(gbmis3);
            }
        } catch (Exception ee) {
            System.out.println(ee.getMessage());
        } finally {
            try {
                if (rsdasbord3 != null) {
                    rsdasbord3.close();
                }
                if (stdasbord3 != null) {
                    stdasbord3.close();
                }
            } catch (Exception er) {
                System.out.println(er.getMessage());
            }
        }
        return arrdasbord3;
    }
/* **************************************************** Last Month Payment ******************************************************/
    public static ArrayList<GetGenericReport> getLastMonthPayment(Connection con) {
        ArrayList<GetGenericReport> arrdasbord4 = null;
        java.sql.Statement stdasbord4 = null;
        java.sql.ResultSet rsdasbord4 = null;
        GetGenericReport gbmis4 = null;
        String sql5 = null;
        // sql4 = "select nvl(sum(amount),0) as total, trunc(payment_date) as pdate from generic_epayment "
        //      + "where cin is not null group by trunc(payment_date) order by pdate" ;

        //done 4
        sql5="SELECT gd.DEPT_NAME as DEPARTMENT,IF(PAYMENT_DATE<=DATE_FORMAT(NOW() - INTERVAL 2 MONTH, '%Y-%m-31'),'1','2') as MONTH,"
                +"sum(ge.AMOUNT) as AMOUNT FROM generic_epayment as ge join generic_dept as gd on gd.DEPT_ID=ge.DEPARTMENT "
                +"where (ge.PAYMENT_DATE  between DATE_FORMAT(NOW() - INTERVAL 2 MONTH, '%Y-%m-01')AND DATE_FORMAT(NOW() - INTERVAL 1 MONTH,"
                +"'%Y-%m-31')) and ge.cin is not null group by DEPARTMENT,month order by month,max(AMOUNT) desc";
        try {
            stdasbord4 = con.createStatement();
            rsdasbord4 = stdasbord4.executeQuery(sql5);
            arrdasbord4 = new ArrayList<GetGenericReport>();
            while (rsdasbord4.next()) {
                gbmis4 = new GetGenericReport();
                gbmis4.setLastMonthAmount(rsdasbord4.getString("AMOUNT"));
                
                gbmis4.setLastMonthDepartment(rsdasbord4.getString("DEPARTMENT"));
                gbmis4.setLastMonthMonth(rsdasbord4.getString("MONTH"));
                arrdasbord4.add(gbmis4);
            }
        } catch (Exception ee) {
            System.out.println(ee.getMessage());
        } finally {
            try {
                if (rsdasbord4 != null) {
                    rsdasbord4.close();
                }
                if (stdasbord4 != null) {
                    stdasbord4.close();
                }
            } catch (Exception er) {
                System.out.println(er.getMessage());
            }
        }
        return arrdasbord4;
    }

}
