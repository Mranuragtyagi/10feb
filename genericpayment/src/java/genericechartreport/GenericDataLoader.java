package genericechartreport;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;

import java.text.SimpleDateFormat;

import java.util.ArrayList;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import org.json.simple.JSONObject;

import vicclass.User;

public class GenericDataLoader extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType(CONTENT_TYPE);
        doPost(request,response);
    }

    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        
        PrintWriter out=response.getWriter();
        User u=new User();
        u.createConnection();
        Connection conn=null;
        conn=u.getConnection();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
        ArrayList<GetGenericReport> ar = GetGenericReport.getMonthlyReport(conn);
        ArrayList<GetGenericReport> ar1=GetGenericReport.getWeeklyReport(conn);
        ArrayList<GetGenericReport> ar2=GetGenericReport.getAnuallyReport(conn);
        
        ArrayList<GetGenericReport> getcalendarreport=GetGenericReport.getTotalForCalender(conn);
        ArrayList<GetGenericReport> getLastMonthReport=GetGenericReport.getLastMonthPayment(conn);
        List<JSONObject> permitWeeklyDetails = new LinkedList<JSONObject>();
        List<JSONObject> permitMonthlyDetails = new LinkedList<JSONObject>();
        List<JSONObject> AnualyDetails = new LinkedList<JSONObject>();
        List<JSONObject> calendarDetails = new LinkedList<JSONObject>();
        List<JSONObject> lastMonthDetails1 = new LinkedList<JSONObject>();
        List<JSONObject> lastMonthDetails2 = new LinkedList<JSONObject>();
        JSONObject responseObj = new JSONObject();
        JSONObject permitObj = null;
        if(ar1!=null && ar1.size()!=0 ){/*Dept wise weekly payment report*/
            Iterator it=ar1.iterator();
            while(it.hasNext()){
                GetGenericReport grdata=(GetGenericReport) it.next();
                String pdate = grdata.getPaydate() ;
                double expermit = grdata.getExcisetotal();
                double mpermit =  grdata.getMiningtotal();
                double comtax = grdata.getComtaxtotal();
                double registration=grdata.getRegistration();
                double transport=grdata.getTransport();
                double traffic=grdata.getTrafficpolice();
                permitObj = new JSONObject();                
                permitObj.put("expermit", expermit);
                permitObj.put("mpermit", mpermit);
                permitObj.put("comtax", comtax);
                permitObj.put("registration", registration);
                permitObj.put("transport", transport);
                permitObj.put("traffic", traffic);
                permitWeeklyDetails.add(permitObj);
                permitObj.put("pdate", pdate);
            }
        }/*Dept wise weekly payment report*/
        
        if(ar!=null){/*Dept wise monthly payment report*/
            Iterator it=ar.iterator();
            while(it.hasNext()){
                GetGenericReport grdata=(GetGenericReport) it.next();
                String month = grdata.getMonthstring();
                int year_int =grdata.getYearint();
                double expermit = grdata.getExcisetotal();
                double mpermit =  grdata.getMiningtotal();
                double comtax = grdata.getComtaxtotal();
                double registration = grdata.getRegistration();
                 double transport=grdata.getTransport();
                 double traffic=grdata.getTrafficpolice();
                permitObj = new JSONObject();
                permitObj.put("month", month);
                permitObj.put("year_int", year_int);
                permitObj.put("expermit", expermit);
                permitObj.put("mpermit", mpermit);
                permitObj.put("comtax", comtax);
                permitObj.put("registration", registration);
                permitObj.put("transport", transport);
                permitObj.put("traffic", traffic);
                permitMonthlyDetails.add(permitObj);
             }
        }/*Dept wise monthly payment report*/
         
        if(ar2!=null){/*Dept wise annual payment report*/
            Iterator it=ar2.iterator();
            while(it.hasNext()){
                GetGenericReport grdata=(GetGenericReport) it.next();                
                double expermit = grdata.getExcisetotal();
                double mpermit =  grdata.getMiningtotal();
                double comtax = grdata.getComtaxtotal();
                double registration = grdata.getRegistration();
                double transport=grdata.getTransport();
                double traffic=grdata.getTrafficpolice();
                permitObj = new JSONObject();
                String from_year =grdata.getFromdate() ;
                String to_year = grdata.getTodate();
                permitObj.put("expermit", expermit);
                permitObj.put("mpermit", mpermit);
                permitObj.put("comtax", comtax);
                permitObj.put("registration", registration);
                permitObj.put("transport", transport);
                permitObj.put("traffic", traffic);
                permitObj.put("from_year", from_year);
                permitObj.put("to_year", to_year);
                AnualyDetails.add(permitObj);
            }
        }/*Dept wise annual payment report*/        
        
        if(getcalendarreport!=null && getcalendarreport.size()!=0 ){
            Iterator it=getcalendarreport.iterator();
            while(it.hasNext()){
                GetGenericReport grdata=(GetGenericReport) it.next();
                String paymentissueddate = sdf.format(grdata.getCaldate()) ;
                String myday=paymentissueddate.split("-")[0];   //0th index = 25
                String mymonth=paymentissueddate.split("-")[1]; //1st index = 11
                String myyear=paymentissueddate.split("-")[2];  //2nd index = 2013
                //2014,1,26
                double combinetotal = grdata.getCombinepaymenttotal();
                permitObj = new JSONObject();
                permitObj.put("issueddate", myyear+","+mymonth+","+myday);
                //System.out.println("issueddate:" +myyear+","+mymonth+","+myday);
                permitObj.put("combinetotal", combinetotal);
                calendarDetails.add(permitObj);
            }
        }
        if(getLastMonthReport!=null && getLastMonthReport.size()!=0 ){
            Iterator it=getLastMonthReport.iterator();
            while(it.hasNext()){
                GetGenericReport grdata=(GetGenericReport) it.next();
                String LastMonthAmount = grdata.getLastMonthAmount();
                String LastMonthDepartment = grdata.getLastMonthDepartment();
                String LastMonthMonth = grdata.getLastMonthMonth();                
                permitObj = new JSONObject();
                permitObj.put("month", LastMonthMonth);
                permitObj.put("amount", LastMonthAmount);
                permitObj.put("department", LastMonthDepartment);
                System.out.println(LastMonthMonth);
                if("1".equals(LastMonthMonth)){                
                lastMonthDetails1.add(permitObj);
                }
                if("2".equals(LastMonthMonth)){
                lastMonthDetails2.add(permitObj);
                }
                
            }
        }
        responseObj.put("weekly", permitWeeklyDetails);
        responseObj.put("monthly", permitMonthlyDetails);
        responseObj.put("caldata", calendarDetails);
        //System.out.println(calendarDetails);
        responseObj.put("anualy", AnualyDetails);
        responseObj.put("lastMonth1", lastMonthDetails1);
        responseObj.put("lastMonth2", lastMonthDetails2);
        out.write(responseObj.toString());
       
    }
}
