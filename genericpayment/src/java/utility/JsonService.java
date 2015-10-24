/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vicclass.*;
import java.util.*;
import java.sql.*;
import genericepayadmin.*;
import genericepayment.GenericBean;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.lang.StringEscapeUtils;
/**
 *
 * @author NIC
 */
public class JsonService extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet JsonService</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JsonService at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String step=request.getParameter("step");
        System.out.println("step"+step);
        
        if(step.equalsIgnoreCase("departList")){
      out.println("{\"list\":["); 
     User u=(User)request.getSession().getAttribute("user");
      Connection con=null ;
      con=u.getConnection();
      ArrayList ar=vicclass.Department.getDeptList(con);
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext()){ 
        Department d=(Department) it.next();
        if(i==0){
            i=1;
        }else{
            out.println(","); 
        }
        out.println("{\"val\":\"" + d.getDept_id() +"\",\"txt\":\""+ d.getDept_name()+"\"}");
    }  
 
out.println("]}"); 
            }
        else if (step.equalsIgnoreCase("majortaxtype")){
              out.println("{\"list\":[");
              ArrayList ar=null;
            User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
           Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("state_code"));
      GenericAdminDao gad=new GenericAdminDao();
      try{
       ar=gad.getMajorTaxTypeByDeptid(con,dept);
      }catch(Exception e){
          System.out.println(e.getMessage());
      }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getMajortaxid() +"\",\"txt\":\""+ ds.getMajortax() +"\"}");
    }  
        out.println("]}");     
        
        }
        
        else if(step.equalsIgnoreCase("getmajortaxtypeanther")){
             out.println("{\"list\":[");
             User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("state_code"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=null;
            try {
                ar = gad.getMajorTaxTypeByDeptid(con,dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getMajortax() +"\",\"txt\":\""+ ds.getMajortax() +"\"}");
    }  out.println("]}");     
         
        
        }
        
        
        else if(step.equalsIgnoreCase("getLockMajorTax"))
        {
              out.println("{\"list\":[");
        User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User();
      Connection con=null ;
      //u.createConnection();
    //  if(u!=null){
        con=u.getConnection();
        String dept=StringEscapeUtils.escapeHtml(request.getParameter("state_code"));
        GenericAdminDao gad=new GenericAdminDao();
        ArrayList ar=null;
            try {
                ar = gad.getLockMajorTaxTypeByDeptid(con,dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
        Iterator it=ar.iterator();
        int i=0;
        while(it.hasNext())
            {
            GenericAdminBean ds=(GenericAdminBean) it.next();
            if(i==0)
                i=1;
            else
                out.println(","); 
                out.println("{\"val\":\"" + ds.getMajortax() +"\",\"txt\":\""+ ds.getMajortax() +"\"}");
            }
        out.println("]}");
        }
        else if(step.equalsIgnoreCase("getMajorTaxType"))
        {
               out.println("{\"list\":[");
         User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("state_code"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=null;
            try {
                ar = gad.getMajorTaxTypeByDeptid(con,dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getMajortaxid() +"\",\"txt\":\""+ ds.getMajortax() +"\"}");
    }  
       out.println("]}");
        }
        
        else if(step.equalsIgnoreCase("getTaxTypeDept"))
        {
             out.println("{\"list\":[");
          User u=(User)request.getSession().getAttribute("user");
      Connection con=u.getConnection();
      String mjtax=StringEscapeUtils.escapeHtml(request.getParameter("majrtax"));
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("dept"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=null;
            try {
                ar = gad.getTaxTypeByDeptid(con,dept,mjtax);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getTax() +"\",\"txt\":\""+ ds.getTax() +"\"}");
    }
       out.println("]}");
        }
        
        else if(step.equalsIgnoreCase("getLockText"))
        {
             out.println("{\"list\":[");
             User u=(User)request.getSession().getAttribute("user");
            Connection con=u.getConnection();
            String mjtax=request.getParameter("majrtax");
            String dept=request.getParameter("dept");
            GenericAdminDao gad=new GenericAdminDao();
            ArrayList ar=null;
            try {
                ar = gad.getLockTaxTypeByDeptid(con,dept,mjtax);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getTax() +"\",\"txt\":\""+ ds.getTax() +"\"}");
    }
     out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getIdProofByDepartment"))
        {
            out.println("{\"list\":[");
         User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("depart"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=null;
            try {
                ar = gad.getIdProofByDeptid(con,dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getIdproof() +"\",\"txt\":\""+ ds.getIdproof() +"\"}");
    }  
       out.println("]}"); 
        }
        if(step.equalsIgnoreCase("getLockIdProve"))
        {
             out.println("{\"list\":[");
              User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("depart"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=null;
            try {
                ar = gad.getLockedIdProofByDeptid(con,dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getIdproof() +"\",\"txt\":\""+ ds.getIdproof() +"\"}");
    }  
       out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getDepartment"))
        {
             out.println("{\"list\":[");
        User u=(User)request.getSession().getAttribute("user");
      Connection con=null ;
      con=u.getConnection();
      ArrayList ar=vicclass.Department.getDeptList(con);
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext()){ 
        Department d=(Department) it.next();
        if(i==0){
            i=1;
        }else{
            out.println(","); 
        }
        out.println("{\"val\":\"" + d.getDept_id() +"\",\"txt\":\""+ d.getDept_name()+"\"}");
    }
      out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getAllBranch"))
        {
             out.println("{\"list\":[");
          User u = (User) request.getSession().getAttribute("user") != null ? (User) request.getSession().getAttribute("user") : new User();
    Connection con = null;
    con = u.getConnection();
    String dept = StringEscapeUtils.escapeHtml(request.getParameter("dept"));
    GenericBean gb = new GenericBean();
            try {
                String departmentid = gb.getDeptIdByDeptName(con, dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
    List ar = BranchBean.getAllBranch(con, Integer.parseInt(dept));    
    Iterator itr = ar.iterator();
    int i = 0;
    while (itr.hasNext()){
        BranchBean dss = (BranchBean) itr.next();
        if (i == 0){
            i = 1;
        } else {
            out.println(",");
        }
        //System.out.println(dss.getBranch_id()+" and "+dss.getBranch_name());
        out.println("{\"val\":\"" + dss.getBranch_id() +"\",\"txt\":\""+ dss.getBranch_name() +"\"}");
    }
      out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getMajorTaxTypecode"))
        {
              out.println("{\"list\":[");
           User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("state_code"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=null;
            try {
                ar = gad.getMajorTaxTypeByDeptid(con,dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getMajortaxcode() +"\",\"txt\":\""+ ds.getMajortaxcode() +"\"}");
    }  
            out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("states"))
        {
             out.println("{\"list\":[{\"state_code\":\"01\",\"state_name\":\"ANDAMAN AND NICOBAR\"},{\"state_code\":\"02\",\"state_name\":\"ANDHRA PRADESH\"},{\"state_code\":\"03\",\"state_name\":\"ARUNACHAL PRADESH\"},{\"state_code\":\"04\",\"state_name\":\"ASSAM\"},{\"state_code\":\"05\",\"state_name\":\"BIHAR\"},{\"state_code\":\"37\",\"state_name\":\"CHANDIGARH\"},{\"state_code\":\"33\",\"state_name\":\"CHATTISGARH\"},{\"state_code\":\"07\",\"state_name\":\"DADRA & NAGAR HAVELI\"},{\"state_code\":\"08\",\"state_name\":\"DAMAN & DIU\"},{\"state_code\":\"36\",\"state_name\":\"DELHI\"},{\"state_code\":\"10\",\"state_name\":\"GOA\"},{\"state_code\":\"11\",\"state_name\":\"GUJARAT\"},{\"state_code\":\"12\",\"state_name\":\"HARYANA\"},{\"state_code\":\"13\",\"state_name\":\"HIMACHAL PRADESH\"},{\"state_code\":\"14\",\"state_name\":\"JAMMU AND KASHMIR\"},{\"state_code\":\"34\",\"state_name\":\"JHARKHAND\"},{\"state_code\":\"15\",\"state_name\":\"KARNATAKA\"},{\"state_code\":\"16\",\"state_name\":\"KERALA\"},{\"state_code\":\"19\",\"state_name\":\"LAKSHADWEEP\"},{\"state_code\":\"17\",\"state_name\":\"MADHYA PRADESH\"},{\"state_code\":\"18\",\"state_name\":\"MAHARASHTRA\"},{\"state_code\":\"20\",\"state_name\":\"MANIPUR\"},{\"state_code\":\"21\",\"state_name\":\"MEGHALAYA\"},{\"state_code\":\"22\",\"state_name\":\"MIZORAM\"},{\"state_code\":\"23\",\"state_name\":\"NAGALAND\"},{\"state_code\":\"24\",\"state_name\":\"ORISSA\"},{\"state_code\":\"25\",\"state_name\":\"PONDICHERRY\"},{\"state_code\":\"26\",\"state_name\":\"PUNJAB\"},{\"state_code\":\"27\",\"state_name\":\"RAJASTHAN\"},{\"state_code\":\"28\",\"state_name\":\"SIKKIM\"},{\"state_code\":\"29\",\"state_name\":\"TAMIL NADU\"},{\"state_code\":\"30\",\"state_name\":\"TRIPURA\"},{\"state_code\":\"31\",\"state_name\":\"UTTAR PRADESH\"},{\"state_code\":\"38\",\"state_name\":\"UTTARAKHAND\"},{\"state_code\":\"35\",\"state_name\":\"UTTRANCHAL\"},{\"state_code\":\"32\",\"state_name\":\"WEST BENGAL\"}");
             out.println("]}"); 

        }
        if(step.equalsIgnoreCase("dist"))
        {
              out.println("{\"list\":[{\"state_code\":\"01\",\"district_code\":\"0102\",\"district_name\":\"NICOBARS\"} , {\"state_code\":\"01\",\"district_code\":\"0103\",\"district_name\":\"NORTH AND MIDDLE ANDAMAN\"} , {\"state_code\":\"01\",\"district_code\":\"0101\",\"district_name\":\"SOUTH ANDMAN\"} , {\"state_code\":\"02\",\"district_code\":\"0219\",\"district_name\":\"ADILABAD\"} , {\"state_code\":\"02\",\"district_code\":\"0212\",\"district_name\":\"ANANTAPUR\"} , {\"state_code\":\"02\",\"district_code\":\"0210\",\"district_name\":\"CHITTOOR\"} , {\"state_code\":\"02\",\"district_code\":\"0211\",\"district_name\":\"CUDDAPAH\"} , {\"state_code\":\"02\",\"district_code\":\"0204\",\"district_name\":\"EAST GODAVARI\"} , {\"state_code\":\"02\",\"district_code\":\"0207\",\"district_name\":\"GUNTUR\"} , {\"state_code\":\"02\",\"district_code\":\"0216\",\"district_name\":\"HYDERABAD\"} , {\"state_code\":\"02\",\"district_code\":\"0220\",\"district_name\":\"KARIMNAGAR\"} , {\"state_code\":\"02\",\"district_code\":\"0222\",\"district_name\":\"KHAMMAM\"} , {\"state_code\":\"02\",\"district_code\":\"0206\",\"district_name\":\"KRISHNA\"} , {\"state_code\":\"02\",\"district_code\":\"0213\",\"district_name\":\"KURNOOL\"} , {\"state_code\":\"02\",\"district_code\":\"0214\",\"district_name\":\"MAHBUBNAGAR\"} , {\"state_code\":\"02\",\"district_code\":\"0217\",\"district_name\":\"MEDAK\"} , {\"state_code\":\"02\",\"district_code\":\"0223\",\"district_name\":\"NALGONDA\"} , {\"state_code\":\"02\",\"district_code\":\"0209\",\"district_name\":\"NELLORE\"} , {\"state_code\":\"02\",\"district_code\":\"0218\",\"district_name\":\"NIZAMABAD\"} , {\"state_code\":\"02\",\"district_code\":\"0208\",\"district_name\":\"PRAKASAM\"} , {\"state_code\":\"02\",\"district_code\":\"0215\",\"district_name\":\"RANGAREDDI\"} , {\"state_code\":\"02\",\"district_code\":\"0201\",\"district_name\":\"SRIKAKULAM\"} , {\"state_code\":\"02\",\"district_code\":\"0203\",\"district_name\":\"VISAKHAPATANAM\"} , {\"state_code\":\"02\",\"district_code\":\"0202\",\"district_name\":\"VIZIANAGARAM\"} , {\"state_code\":\"02\",\"district_code\":\"0221\",\"district_name\":\"WARANGAL\"} , {\"state_code\":\"02\",\"district_code\":\"0205\",\"district_name\":\"WEST GODAVARI\"} , {\"state_code\":\"03\",\"district_code\":\"0310\",\"district_name\":\"CHANGLANG\"} , {\"state_code\":\"03\",\"district_code\":\"0303\",\"district_name\":\"EAST KAMENG\"} , {\"state_code\":\"03\",\"district_code\":\"0307\",\"district_name\":\"EAST SIANG\"} , {\"state_code\":\"03\",\"district_code\":\"0316\",\"district_name\":\"KURUNG KUMEY\"} , {\"state_code\":\"03\",\"district_code\":\"0309\",\"district_name\":\"LOHIT\"} , {\"state_code\":\"03\",\"district_code\":\"0314\",\"district_name\":\"LOWER DIBANG VALLEY\"} , {\"state_code\":\"03\",\"district_code\":\"0304\",\"district_name\":\"LOWER SUBANSIRI\"} , {\"state_code\":\"03\",\"district_code\":\"0312\",\"district_name\":\"PAPUM PARE\"} , {\"state_code\":\"03\",\"district_code\":\"0301\",\"district_name\":\"TAWANG\"} , {\"state_code\":\"03\",\"district_code\":\"0311\",\"district_name\":\"TIRAP\"} , {\"state_code\":\"03\",\"district_code\":\"0315\",\"district_name\":\"UPPER DIBANG VALLEY\"} , {\"state_code\":\"03\",\"district_code\":\"0313\",\"district_name\":\"UPPER SIANG\"} , {\"state_code\":\"03\",\"district_code\":\"0305\",\"district_name\":\"UPPER SUBANSIRI\"} , {\"state_code\":\"03\",\"district_code\":\"0302\",\"district_name\":\"WEST KAMENG\"} , {\"state_code\":\"03\",\"district_code\":\"0306\",\"district_name\":\"WEST SIANG\"} , {\"state_code\":\"04\",\"district_code\":\"0424\",\"district_name\":\"BAKSA\"} , {\"state_code\":\"04\",\"district_code\":\"0405\",\"district_name\":\"BARPETA\"} , {\"state_code\":\"04\",\"district_code\":\"0403\",\"district_name\":\"BONGAIGAON\"} , {\"state_code\":\"04\",\"district_code\":\"0423\",\"district_name\":\"CACHAR\"} , {\"state_code\":\"04\",\"district_code\":\"0408\",\"district_name\":\"DARRANG\"} , {\"state_code\":\"04\",\"district_code\":\"0411\",\"district_name\":\"DHEMAJI\"} , {\"state_code\":\"04\",\"district_code\":\"0401\",\"district_name\":\"DHUBRI\"} , {\"state_code\":\"04\",\"district_code\":\"0417\",\"district_name\":\"DIBRUGARH\"} , {\"state_code\":\"04\",\"district_code\":\"0404\",\"district_name\":\"GOALPARA\"} , {\"state_code\":\"04\",\"district_code\":\"0414\",\"district_name\":\"GOLAGHAT\"} , {\"state_code\":\"04\",\"district_code\":\"0422\",\"district_name\":\"HAILAKANDI\"} , {\"state_code\":\"04\",\"district_code\":\"0415\",\"district_name\":\"JORHAT\"} , {\"state_code\":\"04\",\"district_code\":\"0407\",\"district_name\":\"KAMRUP\"} , {\"state_code\":\"04\",\"district_code\":\"0426\",\"district_name\":\"KAMRUP METRO\"} , {\"state_code\":\"04\",\"district_code\":\"0419\",\"district_name\":\"KARBI ANGLONG\"} , {\"state_code\":\"04\",\"district_code\":\"0421\",\"district_name\":\"KARIMGANJ\"} , {\"state_code\":\"04\",\"district_code\":\"0402\",\"district_name\":\"KOKRAJHAR\"} , {\"state_code\":\"04\",\"district_code\":\"0410\",\"district_name\":\"LAKHIMPUR\"} , {\"state_code\":\"04\",\"district_code\":\"0412\",\"district_name\":\"MORIGAON\"} , {\"state_code\":\"04\",\"district_code\":\"0413\",\"district_name\":\"NAGAON\"} , {\"state_code\":\"04\",\"district_code\":\"0406\",\"district_name\":\"NALBARI\"} , {\"state_code\":\"04\",\"district_code\":\"0420\",\"district_name\":\"NORTH CACHAR HILLS\"} , {\"state_code\":\"04\",\"district_code\":\"0416\",\"district_name\":\"SIVASAGAR\"} , {\"state_code\":\"04\",\"district_code\":\"0409\",\"district_name\":\"SONITPUR\"} , {\"state_code\":\"04\",\"district_code\":\"0418\",\"district_name\":\"TINSUKIA\"} , {\"state_code\":\"04\",\"district_code\":\"0427\",\"district_name\":\"Udalguri\"} , {\"state_code\":\"05\",\"district_code\":\"0541\",\"district_name\":\"ARARIA\"} , {\"state_code\":\"05\",\"district_code\":\"0551\",\"district_name\":\"ARWAL\"} , {\"state_code\":\"05\",\"district_code\":\"0505\",\"district_name\":\"AURANAGABAD\"} , {\"state_code\":\"05\",\"district_code\":\"0545\",\"district_name\":\"BANKA \"} , {\"state_code\":\"05\",\"district_code\":\"0517\",\"district_name\":\"BEGUSARAI\"} , {\"state_code\":\"05\",\"district_code\":\"0527\",\"district_name\":\"BHAGALPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0503\",\"district_name\":\"BHOJPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0548\",\"district_name\":\"BUXAR \"} , {\"state_code\":\"05\",\"district_code\":\"0519\",\"district_name\":\"DARBHANGA\"} , {\"state_code\":\"05\",\"district_code\":\"0507\",\"district_name\":\"GAYA\"} , {\"state_code\":\"05\",\"district_code\":\"0511\",\"district_name\":\"GOPALGANJ\"} , {\"state_code\":\"05\",\"district_code\":\"0550\",\"district_name\":\"JAMUI\"} , {\"state_code\":\"05\",\"district_code\":\"0506\",\"district_name\":\"JEHANABAD\"} , {\"state_code\":\"05\",\"district_code\":\"0549\",\"district_name\":\"KAIMUR (BHABUA)\"} , {\"state_code\":\"05\",\"district_code\":\"0524\",\"district_name\":\"KATIHAR\"} , {\"state_code\":\"05\",\"district_code\":\"0525\",\"district_name\":\"KHAGARIA\"} , {\"state_code\":\"05\",\"district_code\":\"0542\",\"district_name\":\"KISHANGANJ\"} , {\"state_code\":\"05\",\"district_code\":\"0546\",\"district_name\":\"LAKHISARAI\"} , {\"state_code\":\"05\",\"district_code\":\"0522\",\"district_name\":\"MADHEPURA\"} , {\"state_code\":\"05\",\"district_code\":\"0520\",\"district_name\":\"MADHUBANI\"} , {\"state_code\":\"05\",\"district_code\":\"0526\",\"district_name\":\"MUNGER\"} , {\"state_code\":\"05\",\"district_code\":\"0515\",\"district_name\":\"MUZAFFARPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0502\",\"district_name\":\"NALANDA\"} , {\"state_code\":\"05\",\"district_code\":\"0508\",\"district_name\":\"NAWADA\"} , {\"state_code\":\"05\",\"district_code\":\"0512\",\"district_name\":\"PASHCHIM CHAMPARAN\"} , {\"state_code\":\"05\",\"district_code\":\"0501\",\"district_name\":\"PATNA\"} , {\"state_code\":\"05\",\"district_code\":\"0513\",\"district_name\":\"PURBI CHAMPARAN\"} , {\"state_code\":\"05\",\"district_code\":\"0523\",\"district_name\":\"PURNIA\"} , {\"state_code\":\"05\",\"district_code\":\"0504\",\"district_name\":\"ROHTAS\"} , {\"state_code\":\"05\",\"district_code\":\"0521\",\"district_name\":\"SAHARSA\"} , {\"state_code\":\"05\",\"district_code\":\"0518\",\"district_name\":\"SAMASTIPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0509\",\"district_name\":\"SARAN\"} , {\"state_code\":\"05\",\"district_code\":\"0543\",\"district_name\":\"SHEOHAR\"} , {\"state_code\":\"05\",\"district_code\":\"0514\",\"district_name\":\"SITAMARHI\"} , {\"state_code\":\"05\",\"district_code\":\"0510\",\"district_name\":\"SIWAN\"} , {\"state_code\":\"05\",\"district_code\":\"0544\",\"district_name\":\"SUPAUL\"} , {\"state_code\":\"05\",\"district_code\":\"0547\",\"district_name\":\"Sheikhpura \"} , {\"state_code\":\"05\",\"district_code\":\"0516\",\"district_name\":\"VAISHALI\"} , {\"state_code\":\"06\",\"district_code\":\"0601\",\"district_name\":\"CHANDIGARH\"} , {\"state_code\":\"07\",\"district_code\":\"0701\",\"district_name\":\"DADRA AND NAGAR HAVELI\"} , {\"state_code\":\"08\",\"district_code\":\"0801\",\"district_name\":\"DAMAN\"} , {\"state_code\":\"08\",\"district_code\":\"0802\",\"district_name\":\"DIU\"} , {\"state_code\":\"09\",\"district_code\":\"0907\",\"district_name\":\"Central\"} , {\"state_code\":\"09\",\"district_code\":\"0905\",\"district_name\":\"East\"} , {\"state_code\":\"09\",\"district_code\":\"0906\",\"district_name\":\"New Delhi\"} , {\"state_code\":\"09\",\"district_code\":\"0903\",\"district_name\":\"North\"} , {\"state_code\":\"09\",\"district_code\":\"0904\",\"district_name\":\"North East\"} , {\"state_code\":\"09\",\"district_code\":\"0902\",\"district_name\":\"North West\"} , {\"state_code\":\"09\",\"district_code\":\"0910\",\"district_name\":\"South\"} , {\"state_code\":\"09\",\"district_code\":\"0909\",\"district_name\":\"South West\"} , {\"state_code\":\"09\",\"district_code\":\"0908\",\"district_name\":\"West\"} , {\"state_code\":\"10\",\"district_code\":\"1001\",\"district_name\":\"NORTH GOA\"} , {\"state_code\":\"10\",\"district_code\":\"1002\",\"district_name\":\"SOUTH GOA\"} , {\"state_code\":\"11\",\"district_code\":\"1112\",\"district_name\":\"AHMADABAD\"} , {\"state_code\":\"11\",\"district_code\":\"1105\",\"district_name\":\"AMRELI\"} , {\"state_code\":\"11\",\"district_code\":\"1122\",\"district_name\":\"ANAND\"} , {\"state_code\":\"11\",\"district_code\":\"1108\",\"district_name\":\"BANAS KANTHA\"} , {\"state_code\":\"11\",\"district_code\":\"1116\",\"district_name\":\"BHARUCH\"} , {\"state_code\":\"11\",\"district_code\":\"1104\",\"district_name\":\"BHAVNAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1119\",\"district_name\":\"DANG\"} , {\"state_code\":\"11\",\"district_code\":\"1123\",\"district_name\":\"DOHAD\"} , {\"state_code\":\"11\",\"district_code\":\"1111\",\"district_name\":\"GANDHINAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1101\",\"district_name\":\"JAMNAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1106\",\"district_name\":\"JUNAGADH\"} , {\"state_code\":\"11\",\"district_code\":\"1107\",\"district_name\":\"KACHCHH\"} , {\"state_code\":\"11\",\"district_code\":\"1113\",\"district_name\":\"KHEDA\"} , {\"state_code\":\"11\",\"district_code\":\"1110\",\"district_name\":\"MAHESANA\"} , {\"state_code\":\"11\",\"district_code\":\"1124\",\"district_name\":\"NARMADA\"} , {\"state_code\":\"11\",\"district_code\":\"1125\",\"district_name\":\"NAVSARI \"} , {\"state_code\":\"11\",\"district_code\":\"1114\",\"district_name\":\"PANCH MAHALS\"} , {\"state_code\":\"11\",\"district_code\":\"1120\",\"district_name\":\"PATAN\"} , {\"state_code\":\"11\",\"district_code\":\"1121\",\"district_name\":\"PORBANDAR\"} , {\"state_code\":\"11\",\"district_code\":\"1102\",\"district_name\":\"RAJKOT\"} , {\"state_code\":\"11\",\"district_code\":\"1109\",\"district_name\":\"SABAR KANTHA\"} , {\"state_code\":\"11\",\"district_code\":\"1117\",\"district_name\":\"SURAT\"} , {\"state_code\":\"11\",\"district_code\":\"1103\",\"district_name\":\"SURENDRANAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1115\",\"district_name\":\"VADODARA\"} , {\"state_code\":\"11\",\"district_code\":\"1118\",\"district_name\":\"VALSAD\"} , {\"state_code\":\"12\",\"district_code\":\"1201\",\"district_name\":\"AMBALA\"} , {\"state_code\":\"12\",\"district_code\":\"1213\",\"district_name\":\"BHIWANI\"} , {\"state_code\":\"12\",\"district_code\":\"1209\",\"district_name\":\"FARIDABAD\"} , {\"state_code\":\"12\",\"district_code\":\"1218\",\"district_name\":\"FATEHABAD\"} , {\"state_code\":\"12\",\"district_code\":\"1210\",\"district_name\":\"GURGAON\"} , {\"state_code\":\"12\",\"district_code\":\"1215\",\"district_name\":\"HISAR\"} , {\"state_code\":\"12\",\"district_code\":\"1220\",\"district_name\":\"JHAJJAR\"} , {\"state_code\":\"12\",\"district_code\":\"1214\",\"district_name\":\"JIND\"} , {\"state_code\":\"12\",\"district_code\":\"1204\",\"district_name\":\"KAITHAL\"} , {\"state_code\":\"12\",\"district_code\":\"1205\",\"district_name\":\"KARNAL\"} , {\"state_code\":\"12\",\"district_code\":\"1203\",\"district_name\":\"KURUKSHETRA\"} , {\"state_code\":\"12\",\"district_code\":\"1212\",\"district_name\":\"MAHENDRAGARH\"} , {\"state_code\":\"12\",\"district_code\":\"1219\",\"district_name\":\"MEWAT\"} , {\"state_code\":\"12\",\"district_code\":\"1221\",\"district_name\":\"PALWAL\"} , {\"state_code\":\"12\",\"district_code\":\"1217\",\"district_name\":\"PANCHKULA\"} , {\"state_code\":\"12\",\"district_code\":\"1206\",\"district_name\":\"PANIPAT\"} , {\"state_code\":\"12\",\"district_code\":\"1211\",\"district_name\":\"REWARI\"} , {\"state_code\":\"12\",\"district_code\":\"1208\",\"district_name\":\"ROHTAK\"} , {\"state_code\":\"12\",\"district_code\":\"1216\",\"district_name\":\"SIRSA\"} , {\"state_code\":\"12\",\"district_code\":\"1207\",\"district_name\":\"SONIPAT\"} , {\"state_code\":\"12\",\"district_code\":\"1202\",\"district_name\":\"YAMUNANAGAR\"} , {\"state_code\":\"13\",\"district_code\":\"1301\",\"district_name\":\"Bilaspur\"} , {\"state_code\":\"13\",\"district_code\":\"1302\",\"district_name\":\"Chamba\"} , {\"state_code\":\"13\",\"district_code\":\"1303\",\"district_name\":\"Hamirpur\"} , {\"state_code\":\"13\",\"district_code\":\"1304\",\"district_name\":\"Kangra\"} , {\"state_code\":\"13\",\"district_code\":\"1305\",\"district_name\":\"Kinnaur\"} , {\"state_code\":\"13\",\"district_code\":\"1306\",\"district_name\":\"Kullu\"} , {\"state_code\":\"13\",\"district_code\":\"1307\",\"district_name\":\"LAHAUL & SPITI\"} , {\"state_code\":\"13\",\"district_code\":\"1308\",\"district_name\":\"MANDI\"} , {\"state_code\":\"13\",\"district_code\":\"1311\",\"district_name\":\"SOLAN\"} , {\"state_code\":\"13\",\"district_code\":\"1309\",\"district_name\":\"Shimla\"} , {\"state_code\":\"13\",\"district_code\":\"1310\",\"district_name\":\"Sirmaur\"} , {\"state_code\":\"13\",\"district_code\":\"1312\",\"district_name\":\"Una\"} , {\"state_code\":\"14\",\"district_code\":\"1406\",\"district_name\":\"ANANTNAG\"} , {\"state_code\":\"14\",\"district_code\":\"1404\",\"district_name\":\"BADGAM\"} , {\"state_code\":\"14\",\"district_code\":\"1419\",\"district_name\":\"BANDIPORA\"} , {\"state_code\":\"14\",\"district_code\":\"1402\",\"district_name\":\"BARAMULLA\"} , {\"state_code\":\"14\",\"district_code\":\"1409\",\"district_name\":\"DODA\"} , {\"state_code\":\"14\",\"district_code\":\"1420\",\"district_name\":\"GANDERWAL\"} , {\"state_code\":\"14\",\"district_code\":\"1413\",\"district_name\":\"JAMMU\"} , {\"state_code\":\"14\",\"district_code\":\"1408\",\"district_name\":\"KARGIL\"} , {\"state_code\":\"14\",\"district_code\":\"1414\",\"district_name\":\"KATHUA\"} , {\"state_code\":\"14\",\"district_code\":\"1415\",\"district_name\":\"KISHTWAR\"} , {\"state_code\":\"14\",\"district_code\":\"1421\",\"district_name\":\"KULGAM\"} , {\"state_code\":\"14\",\"district_code\":\"1401\",\"district_name\":\"KUPWARA\"} , {\"state_code\":\"14\",\"district_code\":\"1407\",\"district_name\":\"LEH (LADAKH)\"} , {\"state_code\":\"14\",\"district_code\":\"1411\",\"district_name\":\"POONCH\"} , {\"state_code\":\"14\",\"district_code\":\"1405\",\"district_name\":\"PULWAMA\"} , {\"state_code\":\"14\",\"district_code\":\"1412\",\"district_name\":\"RAJAURI\"} , {\"state_code\":\"14\",\"district_code\":\"1416\",\"district_name\":\"RAMBAN\"} , {\"state_code\":\"14\",\"district_code\":\"1417\",\"district_name\":\"REASI\"} , {\"state_code\":\"14\",\"district_code\":\"1418\",\"district_name\":\"SAMBA\"} , {\"state_code\":\"14\",\"district_code\":\"1422\",\"district_name\":\"SHOPIAN\"} , {\"state_code\":\"14\",\"district_code\":\"1403\",\"district_name\":\"SRINAGAR\"} , {\"state_code\":\"14\",\"district_code\":\"1410\",\"district_name\":\"UDHAMPUR\"} , {\"state_code\":\"15\",\"district_code\":\"1501\",\"district_name\":\"BAGALKOTE\"} , {\"state_code\":\"15\",\"district_code\":\"1502\",\"district_name\":\"BANGALORE\"} , {\"state_code\":\"15\",\"district_code\":\"1503\",\"district_name\":\"BANGALORE RURAL\"} , {\"state_code\":\"15\",\"district_code\":\"1504\",\"district_name\":\"BELGAUM\"} , {\"state_code\":\"15\",\"district_code\":\"1505\",\"district_name\":\"BELLARY\"} , {\"state_code\":\"15\",\"district_code\":\"1506\",\"district_name\":\"BIDAR\"} , {\"state_code\":\"15\",\"district_code\":\"1507\",\"district_name\":\"BIJAPUR\"} , {\"state_code\":\"15\",\"district_code\":\"1508\",\"district_name\":\"CHAMARAJA NAGARA\"} , {\"state_code\":\"15\",\"district_code\":\"1528\",\"district_name\":\"CHIKKABALLAPURA\"} , {\"state_code\":\"15\",\"district_code\":\"1509\",\"district_name\":\"CHIKMAGALUR\"} , {\"state_code\":\"15\",\"district_code\":\"1510\",\"district_name\":\"CHITRADURGA\"} , {\"state_code\":\"15\",\"district_code\":\"1511\",\"district_name\":\"DAKSHINA KANNADA\"} , {\"state_code\":\"15\",\"district_code\":\"1512\",\"district_name\":\"DAVANAGERE\"} , {\"state_code\":\"15\",\"district_code\":\"1513\",\"district_name\":\"DHARWAR\"} , {\"state_code\":\"15\",\"district_code\":\"1514\",\"district_name\":\"GADAG\"} , {\"state_code\":\"15\",\"district_code\":\"1515\",\"district_name\":\"GULBARGA\"} , {\"state_code\":\"15\",\"district_code\":\"1516\",\"district_name\":\"HASSAN\"} , {\"state_code\":\"15\",\"district_code\":\"1517\",\"district_name\":\"HAVERI\"} , {\"state_code\":\"15\",\"district_code\":\"1518\",\"district_name\":\"KODAGU\"} , {\"state_code\":\"15\",\"district_code\":\"1519\",\"district_name\":\"KOLAR\"} , {\"state_code\":\"15\",\"district_code\":\"1520\",\"district_name\":\"KOPPAL\"} , {\"state_code\":\"15\",\"district_code\":\"1521\",\"district_name\":\"MANDYA\"} , {\"state_code\":\"15\",\"district_code\":\"1522\",\"district_name\":\"MYSORE\"} , {\"state_code\":\"15\",\"district_code\":\"1523\",\"district_name\":\"RAICHUR\"} , {\"state_code\":\"15\",\"district_code\":\"1529\",\"district_name\":\"RAMANAGARA\"} , {\"state_code\":\"15\",\"district_code\":\"1524\",\"district_name\":\"SHIMOGA\"} , {\"state_code\":\"15\",\"district_code\":\"1525\",\"district_name\":\"TUMKUR\"} , {\"state_code\":\"15\",\"district_code\":\"1526\",\"district_name\":\"UDUPI\"} , {\"state_code\":\"15\",\"district_code\":\"1527\",\"district_name\":\"UTTARA KANNADA\"} , {\"state_code\":\"16\",\"district_code\":\"1611\",\"district_name\":\"ALAPPUZHA\"} , {\"state_code\":\"16\",\"district_code\":\"1608\",\"district_name\":\"ERNAKULAM\"} , {\"state_code\":\"16\",\"district_code\":\"1609\",\"district_name\":\"IDUKKI\"} , {\"state_code\":\"16\",\"district_code\":\"1602\",\"district_name\":\"KANNUR\"} , {\"state_code\":\"16\",\"district_code\":\"1601\",\"district_name\":\"KASARGOD\"} , {\"state_code\":\"16\",\"district_code\":\"1613\",\"district_name\":\"KOLLAM\"} , {\"state_code\":\"16\",\"district_code\":\"1610\",\"district_name\":\"KOTTAYAM\"} , {\"state_code\":\"16\",\"district_code\":\"1604\",\"district_name\":\"KOZHIKODE\"} , {\"state_code\":\"16\",\"district_code\":\"1605\",\"district_name\":\"MALAPPURAM\"} , {\"state_code\":\"16\",\"district_code\":\"1606\",\"district_name\":\"PALAKKAD\"} , {\"state_code\":\"16\",\"district_code\":\"1612\",\"district_name\":\"PATHANAMTHITTA\"} , {\"state_code\":\"16\",\"district_code\":\"1614\",\"district_name\":\"THIRUVANANTHAPURAM\"} , {\"state_code\":\"16\",\"district_code\":\"1607\",\"district_name\":\"THRISSUR\"} , {\"state_code\":\"16\",\"district_code\":\"1603\",\"district_name\":\"WAYANAD\"} , {\"state_code\":\"17\",\"district_code\":\"1746\",\"district_name\":\"ANUPPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1748\",\"district_name\":\"ASHOK NAGAR\"} , {\"state_code\":\"17\",\"district_code\":\"1738\",\"district_name\":\"BALAGHAT\"} , {\"state_code\":\"17\",\"district_code\":\"1742\",\"district_name\":\"BARWANI\"} , {\"state_code\":\"17\",\"district_code\":\"1731\",\"district_name\":\"BETUL\"} , {\"state_code\":\"17\",\"district_code\":\"1702\",\"district_name\":\"BHIND\"} , {\"state_code\":\"17\",\"district_code\":\"1728\",\"district_name\":\"BHOPAL\"} , {\"state_code\":\"17\",\"district_code\":\"1747\",\"district_name\":\"BURHANPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1708\",\"district_name\":\"CHHATARPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1736\",\"district_name\":\"CHHINDWARA\"} , {\"state_code\":\"17\",\"district_code\":\"1711\",\"district_name\":\"DAMOH\"} , {\"state_code\":\"17\",\"district_code\":\"1704\",\"district_name\":\"DATIA\"} , {\"state_code\":\"17\",\"district_code\":\"1720\",\"district_name\":\"DEWAS\"} , {\"state_code\":\"17\",\"district_code\":\"1722\",\"district_name\":\"DHAR\"} , {\"state_code\":\"17\",\"district_code\":\"1745\",\"district_name\":\"DINDORI\"} , {\"state_code\":\"17\",\"district_code\":\"1725\",\"district_name\":\"EAST NIMAR\"} , {\"state_code\":\"17\",\"district_code\":\"1706\",\"district_name\":\"GUNA\"} , {\"state_code\":\"17\",\"district_code\":\"1703\",\"district_name\":\"GWALIOR\"} , {\"state_code\":\"17\",\"district_code\":\"1743\",\"district_name\":\"HARDA \"} , {\"state_code\":\"17\",\"district_code\":\"1732\",\"district_name\":\"HOSHANGABAD\"} , {\"state_code\":\"17\",\"district_code\":\"1723\",\"district_name\":\"INDORE\"} , {\"state_code\":\"17\",\"district_code\":\"1733\",\"district_name\":\"JABALPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1721\",\"district_name\":\"JHABUA\"} , {\"state_code\":\"17\",\"district_code\":\"1744\",\"district_name\":\"KATNI \"} , {\"state_code\":\"17\",\"district_code\":\"1724\",\"district_name\":\"KHARGONE\"} , {\"state_code\":\"17\",\"district_code\":\"1735\",\"district_name\":\"MANDLA\"} , {\"state_code\":\"17\",\"district_code\":\"1716\",\"district_name\":\"MANDSAUR\"} , {\"state_code\":\"17\",\"district_code\":\"1701\",\"district_name\":\"MORENA\"} , {\"state_code\":\"17\",\"district_code\":\"1734\",\"district_name\":\"NARSINGHPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1741\",\"district_name\":\"NEEMUCH\"} , {\"state_code\":\"17\",\"district_code\":\"1709\",\"district_name\":\"PANNA\"} , {\"state_code\":\"17\",\"district_code\":\"1730\",\"district_name\":\"RAISEN\"} , {\"state_code\":\"17\",\"district_code\":\"1726\",\"district_name\":\"RAJGARH\"} , {\"state_code\":\"17\",\"district_code\":\"1717\",\"district_name\":\"RATLAM\"} , {\"state_code\":\"17\",\"district_code\":\"1713\",\"district_name\":\"REWA\"} , {\"state_code\":\"17\",\"district_code\":\"1710\",\"district_name\":\"SAGAR\"} , {\"state_code\":\"17\",\"district_code\":\"1712\",\"district_name\":\"SATNA\"} , {\"state_code\":\"17\",\"district_code\":\"1729\",\"district_name\":\"SEHORE\"} , {\"state_code\":\"17\",\"district_code\":\"1737\",\"district_name\":\"SEONI\"} , {\"state_code\":\"17\",\"district_code\":\"1714\",\"district_name\":\"SHAHDOL\"} , {\"state_code\":\"17\",\"district_code\":\"1719\",\"district_name\":\"SHAJAPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1739\",\"district_name\":\"SHEOPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1705\",\"district_name\":\"SHIVPURI\"} , {\"state_code\":\"17\",\"district_code\":\"1715\",\"district_name\":\"SIDHI\"} , {\"state_code\":\"17\",\"district_code\":\"1707\",\"district_name\":\"TIKAMGARH\"} , {\"state_code\":\"17\",\"district_code\":\"1718\",\"district_name\":\"UJJAIN\"} , {\"state_code\":\"17\",\"district_code\":\"1740\",\"district_name\":\"UMARIA\"} , {\"state_code\":\"17\",\"district_code\":\"1727\",\"district_name\":\"VIDISHA\"} , {\"state_code\":\"18\",\"district_code\":\"1809\",\"district_name\":\"AHMEDNAGAR\"} , {\"state_code\":\"18\",\"district_code\":\"1823\",\"district_name\":\"AKOLA\"} , {\"state_code\":\"18\",\"district_code\":\"1824\",\"district_name\":\"AMRAVATI\"} , {\"state_code\":\"18\",\"district_code\":\"1815\",\"district_name\":\"AURANGABAD\"} , {\"state_code\":\"18\",\"district_code\":\"1818\",\"district_name\":\"BEED\"} , {\"state_code\":\"18\",\"district_code\":\"1828\",\"district_name\":\"BHANDARA\"} , {\"state_code\":\"18\",\"district_code\":\"1822\",\"district_name\":\"BULDHANA\"} , {\"state_code\":\"18\",\"district_code\":\"1829\",\"district_name\":\"CHANDRAPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1807\",\"district_name\":\"DHULE\"} , {\"state_code\":\"18\",\"district_code\":\"1830\",\"district_name\":\"GADCHIROLI\"} , {\"state_code\":\"18\",\"district_code\":\"1833\",\"district_name\":\"GONDIA\"} , {\"state_code\":\"18\",\"district_code\":\"1834\",\"district_name\":\"HINGOLI\"} , {\"state_code\":\"18\",\"district_code\":\"1808\",\"district_name\":\"JALGAON\"} , {\"state_code\":\"18\",\"district_code\":\"1816\",\"district_name\":\"JALNA\"} , {\"state_code\":\"18\",\"district_code\":\"1814\",\"district_name\":\"KOLHAPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1821\",\"district_name\":\"LATUR\"} , {\"state_code\":\"18\",\"district_code\":\"1801\",\"district_name\":\"MUMBAI\"} , {\"state_code\":\"18\",\"district_code\":\"1835\",\"district_name\":\"MUMBAI (SUBURBAN)\"} , {\"state_code\":\"18\",\"district_code\":\"1827\",\"district_name\":\"NAGPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1819\",\"district_name\":\"NANDED\"} , {\"state_code\":\"18\",\"district_code\":\"1831\",\"district_name\":\"NANDURBAR\"} , {\"state_code\":\"18\",\"district_code\":\"1806\",\"district_name\":\"NASHIK\"} , {\"state_code\":\"18\",\"district_code\":\"1820\",\"district_name\":\"OSMANABAD\"} , {\"state_code\":\"18\",\"district_code\":\"1817\",\"district_name\":\"PARBHANI\"} , {\"state_code\":\"18\",\"district_code\":\"1810\",\"district_name\":\"PUNE\"} , {\"state_code\":\"18\",\"district_code\":\"1803\",\"district_name\":\"RAIGAD\"} , {\"state_code\":\"18\",\"district_code\":\"1804\",\"district_name\":\"RATNAGIRI\"} , {\"state_code\":\"18\",\"district_code\":\"1812\",\"district_name\":\"SANGLI\"} , {\"state_code\":\"18\",\"district_code\":\"1811\",\"district_name\":\"SATARA\"} , {\"state_code\":\"18\",\"district_code\":\"1805\",\"district_name\":\"SINDHUDURG\"} , {\"state_code\":\"18\",\"district_code\":\"1813\",\"district_name\":\"SOLAPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1802\",\"district_name\":\"THANE\"} , {\"state_code\":\"18\",\"district_code\":\"1826\",\"district_name\":\"WARDHA\"} , {\"state_code\":\"18\",\"district_code\":\"1832\",\"district_name\":\"WASHIM \"} , {\"state_code\":\"18\",\"district_code\":\"1825\",\"district_name\":\"YAVATMAL\"} , {\"state_code\":\"19\",\"district_code\":\"1901\",\"district_name\":\"LAKSHADWEEP DISTRICT\"} , {\"state_code\":\"20\",\"district_code\":\"2006\",\"district_name\":\"BISHNUPUR\"} , {\"state_code\":\"20\",\"district_code\":\"2004\",\"district_name\":\"CHANDEL\"} , {\"state_code\":\"20\",\"district_code\":\"2003\",\"district_name\":\"CHURACHANDPUR\"} , {\"state_code\":\"20\",\"district_code\":\"2009\",\"district_name\":\"IMPHAL EAST\"} , {\"state_code\":\"20\",\"district_code\":\"2007\",\"district_name\":\"IMPHAL WEST\"} , {\"state_code\":\"20\",\"district_code\":\"2001\",\"district_name\":\"SENAPATI\"} , {\"state_code\":\"20\",\"district_code\":\"2002\",\"district_name\":\"TAMENGLONG\"} , {\"state_code\":\"20\",\"district_code\":\"2005\",\"district_name\":\"THOUBAL\"} , {\"state_code\":\"20\",\"district_code\":\"2008\",\"district_name\":\"UKHRUL\"} , {\"state_code\":\"21\",\"district_code\":\"2104\",\"district_name\":\"EAST GARO HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2102\",\"district_name\":\"EAST KHASI HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2101\",\"district_name\":\"JAINTIA HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2107\",\"district_name\":\"RI BHOI \"} , {\"state_code\":\"21\",\"district_code\":\"2106\",\"district_name\":\"SOUTH GARO HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2105\",\"district_name\":\"WEST GARO HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2103\",\"district_name\":\"WEST KHASI HILLS\"} , {\"state_code\":\"22\",\"district_code\":\"2201\",\"district_name\":\"AIZAWL\"} , {\"state_code\":\"22\",\"district_code\":\"2206\",\"district_name\":\"CHAMPHAI \"} , {\"state_code\":\"22\",\"district_code\":\"2205\",\"district_name\":\"KOLASIB\"} , {\"state_code\":\"22\",\"district_code\":\"2208\",\"district_name\":\"LAWNGTLAI\"} , {\"state_code\":\"22\",\"district_code\":\"2202\",\"district_name\":\"LUNGLEI\"} , {\"state_code\":\"22\",\"district_code\":\"2204\",\"district_name\":\"MAMIT\"} , {\"state_code\":\"22\",\"district_code\":\"2203\",\"district_name\":\"SAIHA\"} , {\"state_code\":\"22\",\"district_code\":\"2207\",\"district_name\":\"SERCHHIP\"} , {\"state_code\":\"23\",\"district_code\":\"2308\",\"district_name\":\"Dimapur\"} , {\"state_code\":\"23\",\"district_code\":\"2301\",\"district_name\":\"KOHIMA\"} , {\"state_code\":\"23\",\"district_code\":\"2305\",\"district_name\":\"MOKOKCHUNG\"} , {\"state_code\":\"23\",\"district_code\":\"2307\",\"district_name\":\"MON\"} , {\"state_code\":\"23\",\"district_code\":\"2302\",\"district_name\":\"PHEK\"} , {\"state_code\":\"23\",\"district_code\":\"2306\",\"district_name\":\"TUENSANG\"} , {\"state_code\":\"23\",\"district_code\":\"2304\",\"district_name\":\"WOKHA\"} , {\"state_code\":\"23\",\"district_code\":\"2303\",\"district_name\":\"ZUNHEBOTO\"} , {\"state_code\":\"24\",\"district_code\":\"2421\",\"district_name\":\"ANGUL\"} , {\"state_code\":\"24\",\"district_code\":\"2405\",\"district_name\":\"BALESHWAR\"} , {\"state_code\":\"24\",\"district_code\":\"2414\",\"district_name\":\"BARGARH \"} , {\"state_code\":\"24\",\"district_code\":\"2417\",\"district_name\":\"BHADRAK \"} , {\"state_code\":\"24\",\"district_code\":\"2409\",\"district_name\":\"BOLANGIR\"} , {\"state_code\":\"24\",\"district_code\":\"2426\",\"district_name\":\"BOUDH\"} , {\"state_code\":\"24\",\"district_code\":\"2406\",\"district_name\":\"CUTTACK\"} , {\"state_code\":\"24\",\"district_code\":\"2416\",\"district_name\":\"DEOGARH\"} , {\"state_code\":\"24\",\"district_code\":\"2407\",\"district_name\":\"DHENKANAL\"} , {\"state_code\":\"24\",\"district_code\":\"2424\",\"district_name\":\"GAJAPATI\"} , {\"state_code\":\"24\",\"district_code\":\"2412\",\"district_name\":\"GANJAM\"} , {\"state_code\":\"24\",\"district_code\":\"2419\",\"district_name\":\"JAGATSINGHAPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2420\",\"district_name\":\"JAJPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2415\",\"district_name\":\"JHARSUGUDA\"} , {\"state_code\":\"24\",\"district_code\":\"2410\",\"district_name\":\"KALAHANDI\"} , {\"state_code\":\"24\",\"district_code\":\"2408\",\"district_name\":\"KANDHAMAL\"} , {\"state_code\":\"24\",\"district_code\":\"2418\",\"district_name\":\"KENDRAPARA\"} , {\"state_code\":\"24\",\"district_code\":\"2403\",\"district_name\":\"KENDUJHAR\"} , {\"state_code\":\"24\",\"district_code\":\"2423\",\"district_name\":\"KHORDHA(BHUBANESWAR)\"} , {\"state_code\":\"24\",\"district_code\":\"2411\",\"district_name\":\"KORAPUT\"} , {\"state_code\":\"24\",\"district_code\":\"2431\",\"district_name\":\"MALKANGIRI\"} , {\"state_code\":\"24\",\"district_code\":\"2404\",\"district_name\":\"MAYURBHANJ\"} , {\"state_code\":\"24\",\"district_code\":\"2430\",\"district_name\":\"NABARANGAPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2422\",\"district_name\":\"NAYAGARH\"} , {\"state_code\":\"24\",\"district_code\":\"2428\",\"district_name\":\"NUAPADA\"} , {\"state_code\":\"24\",\"district_code\":\"2413\",\"district_name\":\"PURI\"} , {\"state_code\":\"24\",\"district_code\":\"2429\",\"district_name\":\"RAYAGADA\"} , {\"state_code\":\"24\",\"district_code\":\"2401\",\"district_name\":\"SAMBALPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2427\",\"district_name\":\"SONEPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2402\",\"district_name\":\"SUNDARGARH\"} , {\"state_code\":\"25\",\"district_code\":\"2502\",\"district_name\":\"KARAIKAL\"} , {\"state_code\":\"25\",\"district_code\":\"2503\",\"district_name\":\"MAHE\"} , {\"state_code\":\"25\",\"district_code\":\"2501\",\"district_name\":\"PONDICHERRY\"} , {\"state_code\":\"25\",\"district_code\":\"2504\",\"district_name\":\"YANAM\"} , {\"state_code\":\"26\",\"district_code\":\"2602\",\"district_name\":\"AMRITSAR\"} , {\"state_code\":\"26\",\"district_code\":\"2621\",\"district_name\":\"BARNALA\"} , {\"state_code\":\"26\",\"district_code\":\"2611\",\"district_name\":\"Bathinda\"} , {\"state_code\":\"26\",\"district_code\":\"2618\",\"district_name\":\"FATEHGARH SAHIB\"} , {\"state_code\":\"26\",\"district_code\":\"2603\",\"district_name\":\"FIROZEPUR\"} , {\"state_code\":\"26\",\"district_code\":\"2612\",\"district_name\":\"Faridkot\"} , {\"state_code\":\"26\",\"district_code\":\"2601\",\"district_name\":\"GURDASPUR\"} , {\"state_code\":\"26\",\"district_code\":\"2607\",\"district_name\":\"HOSHIARPUR\"} , {\"state_code\":\"26\",\"district_code\":\"2605\",\"district_name\":\"JALANDHAR\"} , {\"state_code\":\"26\",\"district_code\":\"2606\",\"district_name\":\"KAPURTHALA\"} , {\"state_code\":\"26\",\"district_code\":\"2604\",\"district_name\":\"LUDHIANA\"} , {\"state_code\":\"26\",\"district_code\":\"2617\",\"district_name\":\"MANSA\"} , {\"state_code\":\"26\",\"district_code\":\"2615\",\"district_name\":\"MOGA\"} , {\"state_code\":\"26\",\"district_code\":\"2616\",\"district_name\":\"MUKTSAR *\"} , {\"state_code\":\"26\",\"district_code\":\"2622\",\"district_name\":\"Mohali\"} , {\"state_code\":\"26\",\"district_code\":\"2614\",\"district_name\":\"NAWANSHAHR \"} , {\"state_code\":\"26\",\"district_code\":\"2609\",\"district_name\":\"PATIALA\"} , {\"state_code\":\"26\",\"district_code\":\"2608\",\"district_name\":\"RUPNAGAR\"} , {\"state_code\":\"26\",\"district_code\":\"2619\",\"district_name\":\"SAS NAGAR\"} , {\"state_code\":\"26\",\"district_code\":\"2610\",\"district_name\":\"Sangrur\"} , {\"state_code\":\"26\",\"district_code\":\"2620\",\"district_name\":\"TARAN TARAN\"} , {\"state_code\":\"27\",\"district_code\":\"2701\",\"district_name\":\"Ajmer\"} , {\"state_code\":\"27\",\"district_code\":\"2702\",\"district_name\":\"Alwar\"} , {\"state_code\":\"27\",\"district_code\":\"2728\",\"district_name\":\"BANSWARA\"} , {\"state_code\":\"27\",\"district_code\":\"2717\",\"district_name\":\"BARMER\"} , {\"state_code\":\"27\",\"district_code\":\"2703\",\"district_name\":\"Baran\"} , {\"state_code\":\"27\",\"district_code\":\"2704\",\"district_name\":\"Bharatpur\"} , {\"state_code\":\"27\",\"district_code\":\"2705\",\"district_name\":\"Bhilwara\"} , {\"state_code\":\"27\",\"district_code\":\"2706\",\"district_name\":\"Bikaner\"} , {\"state_code\":\"27\",\"district_code\":\"2707\",\"district_name\":\"Bundi\"} , {\"state_code\":\"27\",\"district_code\":\"2729\",\"district_name\":\"CHITTORGARH\"} , {\"state_code\":\"27\",\"district_code\":\"2708\",\"district_name\":\"Churu\"} , {\"state_code\":\"27\",\"district_code\":\"2727\",\"district_name\":\"DUNGARPUR\"} , {\"state_code\":\"27\",\"district_code\":\"2711\",\"district_name\":\"Dausa\"} , {\"state_code\":\"27\",\"district_code\":\"2712\",\"district_name\":\"Dholpur\"} , {\"state_code\":\"27\",\"district_code\":\"2713\",\"district_name\":\"Hanumangarh\"} , {\"state_code\":\"27\",\"district_code\":\"2716\",\"district_name\":\"JAISALMER\"} , {\"state_code\":\"27\",\"district_code\":\"2718\",\"district_name\":\"JALORE\"} , {\"state_code\":\"27\",\"district_code\":\"2732\",\"district_name\":\"JHALAWAR\"} , {\"state_code\":\"27\",\"district_code\":\"2714\",\"district_name\":\"Jaipur\"} , {\"state_code\":\"27\",\"district_code\":\"2715\",\"district_name\":\"Jhunjhunu\"} , {\"state_code\":\"27\",\"district_code\":\"2720\",\"district_name\":\"Jodhpur\"} , {\"state_code\":\"27\",\"district_code\":\"2709\",\"district_name\":\"KARAULI\"} , {\"state_code\":\"27\",\"district_code\":\"2721\",\"district_name\":\"Kota\"} , {\"state_code\":\"27\",\"district_code\":\"2723\",\"district_name\":\"Nagaur\"} , {\"state_code\":\"27\",\"district_code\":\"2724\",\"district_name\":\"Pali\"} , {\"state_code\":\"27\",\"district_code\":\"2725\",\"district_name\":\"Pratapgarh\"} , {\"state_code\":\"27\",\"district_code\":\"2730\",\"district_name\":\"Rajsamand\"} , {\"state_code\":\"27\",\"district_code\":\"2710\",\"district_name\":\"SAWAI MADHOPUR\"} , {\"state_code\":\"27\",\"district_code\":\"2719\",\"district_name\":\"SIROHI\"} , {\"state_code\":\"27\",\"district_code\":\"2731\",\"district_name\":\"Sikar\"} , {\"state_code\":\"27\",\"district_code\":\"2733\",\"district_name\":\"Sri Ganganagar\"} , {\"state_code\":\"27\",\"district_code\":\"2722\",\"district_name\":\"TONK\"} , {\"state_code\":\"27\",\"district_code\":\"2726\",\"district_name\":\"UDAIPUR\"} , {\"state_code\":\"28\",\"district_code\":\"2802\",\"district_name\":\"EAST DISTRICT\"} , {\"state_code\":\"28\",\"district_code\":\"2801\",\"district_name\":\"NORTH DISTRICT\"} , {\"state_code\":\"28\",\"district_code\":\"2803\",\"district_name\":\"SOUTH DISTRICT\"} , {\"state_code\":\"28\",\"district_code\":\"2804\",\"district_name\":\"WEST DISTRICT\"} , {\"state_code\":\"29\",\"district_code\":\"2931\",\"district_name\":\"ARIYALUR\"} , {\"state_code\":\"29\",\"district_code\":\"2933\",\"district_name\":\"CHENNAI\"} , {\"state_code\":\"29\",\"district_code\":\"2911\",\"district_name\":\"COIMBATORE\"} , {\"state_code\":\"29\",\"district_code\":\"2903\",\"district_name\":\"CUDDALORE\"} , {\"state_code\":\"29\",\"district_code\":\"2909\",\"district_name\":\"DHARMAPURI\"} , {\"state_code\":\"29\",\"district_code\":\"2922\",\"district_name\":\"DINDIGUL\"} , {\"state_code\":\"29\",\"district_code\":\"2910\",\"district_name\":\"ERODE\"} , {\"state_code\":\"29\",\"district_code\":\"2901\",\"district_name\":\"KANCHIPURAM\"} , {\"state_code\":\"29\",\"district_code\":\"2928\",\"district_name\":\"KANNIYAKUMARI\"} , {\"state_code\":\"29\",\"district_code\":\"2917\",\"district_name\":\"KARUR\"} , {\"state_code\":\"29\",\"district_code\":\"2930\",\"district_name\":\"KRISHNAGIRI\"} , {\"state_code\":\"29\",\"district_code\":\"2920\",\"district_name\":\"MADURAI\"} , {\"state_code\":\"29\",\"district_code\":\"2914\",\"district_name\":\"NAGAPATTINAM\"} , {\"state_code\":\"29\",\"district_code\":\"2908\",\"district_name\":\"NAMAKKAL\"} , {\"state_code\":\"29\",\"district_code\":\"2918\",\"district_name\":\"PERAMBALUR\"} , {\"state_code\":\"29\",\"district_code\":\"2919\",\"district_name\":\"PUDUKKOTTAI\"} , {\"state_code\":\"29\",\"district_code\":\"2923\",\"district_name\":\"RAMANATHAPURAM\"} , {\"state_code\":\"29\",\"district_code\":\"2907\",\"district_name\":\"SALEM\"} , {\"state_code\":\"29\",\"district_code\":\"2925\",\"district_name\":\"SIVAGANGAI\"} , {\"state_code\":\"29\",\"district_code\":\"2913\",\"district_name\":\"THANJAVUR\"} , {\"state_code\":\"29\",\"district_code\":\"2912\",\"district_name\":\"THE NILGIRIS\"} , {\"state_code\":\"29\",\"district_code\":\"2921\",\"district_name\":\"THENI\"} , {\"state_code\":\"29\",\"district_code\":\"2927\",\"district_name\":\"THOOTHUKKUDI\"} , {\"state_code\":\"29\",\"district_code\":\"2916\",\"district_name\":\"TIRUCHIRAPPALLI\"} , {\"state_code\":\"29\",\"district_code\":\"2926\",\"district_name\":\"TIRUNELVELI\"} , {\"state_code\":\"29\",\"district_code\":\"2932\",\"district_name\":\"TIRUPUR\"} , {\"state_code\":\"29\",\"district_code\":\"2902\",\"district_name\":\"TIRUVALLUR\"} , {\"state_code\":\"29\",\"district_code\":\"2906\",\"district_name\":\"TIRUVANNAMALAI\"} , {\"state_code\":\"29\",\"district_code\":\"2915\",\"district_name\":\"TIRUVARUR\"} , {\"state_code\":\"29\",\"district_code\":\"2905\",\"district_name\":\"VELLORE\"} , {\"state_code\":\"29\",\"district_code\":\"2904\",\"district_name\":\"VILLUPURAM\"} , {\"state_code\":\"29\",\"district_code\":\"2924\",\"district_name\":\"VIRUDHUNAGAR\"} , {\"state_code\":\"30\",\"district_code\":\"3004\",\"district_name\":\"DHALAI\"} , {\"state_code\":\"30\",\"district_code\":\"3002\",\"district_name\":\"SOUTH TRIPURA\"} , {\"state_code\":\"30\",\"district_code\":\"3003\",\"district_name\":\"SOUTH TRIPURA\"} , {\"state_code\":\"30\",\"district_code\":\"3001\",\"district_name\":\"WEST TRIPURA\"} , {\"state_code\":\"31\",\"district_code\":\"3120\",\"district_name\":\"AGRA\"} , {\"state_code\":\"31\",\"district_code\":\"3118\",\"district_name\":\"ALIGARH\"} , {\"state_code\":\"31\",\"district_code\":\"3145\",\"district_name\":\"ALLAHABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3178\",\"district_name\":\"AMBEDKAR NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3169\",\"district_name\":\"AURAIYA\"} , {\"state_code\":\"31\",\"district_code\":\"3157\",\"district_name\":\"AZAMGARH\"} , {\"state_code\":\"31\",\"district_code\":\"3165\",\"district_name\":\"BAGHPAT\"} , {\"state_code\":\"31\",\"district_code\":\"3146\",\"district_name\":\"BAHRAICH\"} , {\"state_code\":\"31\",\"district_code\":\"3159\",\"district_name\":\"BALLIA\"} , {\"state_code\":\"31\",\"district_code\":\"3175\",\"district_name\":\"BALRAMPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3142\",\"district_name\":\"BANDA\"} , {\"state_code\":\"31\",\"district_code\":\"3148\",\"district_name\":\"BARABANKI\"} , {\"state_code\":\"31\",\"district_code\":\"3125\",\"district_name\":\"BAREILLY\"} , {\"state_code\":\"31\",\"district_code\":\"3153\",\"district_name\":\"BASTI\"} , {\"state_code\":\"31\",\"district_code\":\"3109\",\"district_name\":\"BIJNOR\"} , {\"state_code\":\"31\",\"district_code\":\"3124\",\"district_name\":\"BUDAUN\"} , {\"state_code\":\"31\",\"district_code\":\"3117\",\"district_name\":\"BULANDSHAHR\"} , {\"state_code\":\"31\",\"district_code\":\"3171\",\"district_name\":\"CHANDAULI\"} , {\"state_code\":\"31\",\"district_code\":\"3177\",\"district_name\":\"CHITRAKOOT\"} , {\"state_code\":\"31\",\"district_code\":\"3155\",\"district_name\":\"DEORIA\"} , {\"state_code\":\"31\",\"district_code\":\"3122\",\"district_name\":\"ETAH\"} , {\"state_code\":\"31\",\"district_code\":\"3135\",\"district_name\":\"ETAWAH\"} , {\"state_code\":\"31\",\"district_code\":\"3149\",\"district_name\":\"FAIZABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3134\",\"district_name\":\"FARRUKHABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3143\",\"district_name\":\"FATEHPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3121\",\"district_name\":\"FIROZABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3164\",\"district_name\":\"GAUTAM BUDDHA NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3116\",\"district_name\":\"GHAZIABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3160\",\"district_name\":\"GHAZIPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3147\",\"district_name\":\"GONDA\"} , {\"state_code\":\"31\",\"district_code\":\"3154\",\"district_name\":\"GORAKHPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3141\",\"district_name\":\"HAMIRPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3130\",\"district_name\":\"HARDOI\"} , {\"state_code\":\"31\",\"district_code\":\"3138\",\"district_name\":\"JALAUN\"} , {\"state_code\":\"31\",\"district_code\":\"3158\",\"district_name\":\"JAUNPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3139\",\"district_name\":\"JHANSI\"} , {\"state_code\":\"31\",\"district_code\":\"3167\",\"district_name\":\"JYOTIBA PHOOLE NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3168\",\"district_name\":\"KANNAUJ\"} , {\"state_code\":\"31\",\"district_code\":\"3136\",\"district_name\":\"KANPUR DEHAT\"} , {\"state_code\":\"31\",\"district_code\":\"3137\",\"district_name\":\"KANPUR NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3170\",\"district_name\":\"KAUSHAMBI\"} , {\"state_code\":\"31\",\"district_code\":\"3128\",\"district_name\":\"KHERI\"} , {\"state_code\":\"31\",\"district_code\":\"3172\",\"district_name\":\"KUSHI NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3140\",\"district_name\":\"LALITPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3132\",\"district_name\":\"LUCKNOW\"} , {\"state_code\":\"31\",\"district_code\":\"3166\",\"district_name\":\"MAHAMAYA NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3152\",\"district_name\":\"MAHARAJGANJ\"} , {\"state_code\":\"31\",\"district_code\":\"3179\",\"district_name\":\"MAHOBA\"} , {\"state_code\":\"31\",\"district_code\":\"3123\",\"district_name\":\"MAINPURI\"} , {\"state_code\":\"31\",\"district_code\":\"3119\",\"district_name\":\"MATHURA\"} , {\"state_code\":\"31\",\"district_code\":\"3156\",\"district_name\":\"MAU\"} , {\"state_code\":\"31\",\"district_code\":\"3115\",\"district_name\":\"MEERUT\"} , {\"state_code\":\"31\",\"district_code\":\"3162\",\"district_name\":\"MIRZAPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3110\",\"district_name\":\"MORADABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3114\",\"district_name\":\"MUZAFFARNAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3126\",\"district_name\":\"PILIBHIT\"} , {\"state_code\":\"31\",\"district_code\":\"3144\",\"district_name\":\"PRATAPGARH\"} , {\"state_code\":\"31\",\"district_code\":\"3133\",\"district_name\":\"RAE BARELI\"} , {\"state_code\":\"31\",\"district_code\":\"3111\",\"district_name\":\"RAMPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3112\",\"district_name\":\"SAHARANPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3174\",\"district_name\":\"SANT KABEER NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3173\",\"district_name\":\"SANT RAVIDAS NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3127\",\"district_name\":\"SHAHJAHANPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3176\",\"district_name\":\"SHRAVASTI\"} , {\"state_code\":\"31\",\"district_code\":\"3151\",\"district_name\":\"SIDDHARTH NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3129\",\"district_name\":\"SITAPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3163\",\"district_name\":\"SONBHADRA\"} , {\"state_code\":\"31\",\"district_code\":\"3150\",\"district_name\":\"SULTANPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3131\",\"district_name\":\"UNNAO\"} , {\"state_code\":\"31\",\"district_code\":\"3161\",\"district_name\":\"VARANASI\"} , {\"state_code\":\"32\",\"district_code\":\"3215\",\"district_name\":\"24 PARGANAS (NORTH)\"} , {\"state_code\":\"32\",\"district_code\":\"3216\",\"district_name\":\"24 PARGANAS SOUTH\"} , {\"state_code\":\"32\",\"district_code\":\"3213\",\"district_name\":\"BANKURA\"} , {\"state_code\":\"32\",\"district_code\":\"3203\",\"district_name\":\"BIRBHUM\"} , {\"state_code\":\"32\",\"district_code\":\"3202\",\"district_name\":\"BURDWAN\"} , {\"state_code\":\"32\",\"district_code\":\"3208\",\"district_name\":\"COOCHBEHAR\"} , {\"state_code\":\"32\",\"district_code\":\"3204\",\"district_name\":\"DARJEELING\"} , {\"state_code\":\"32\",\"district_code\":\"3217\",\"district_name\":\"DINAJPUR DAKSHIN\"} , {\"state_code\":\"32\",\"district_code\":\"3218\",\"district_name\":\"DINAJPUR UTTAR\"} , {\"state_code\":\"32\",\"district_code\":\"3206\",\"district_name\":\"HOOGHLY\"} , {\"state_code\":\"32\",\"district_code\":\"3205\",\"district_name\":\"HOWRAH\"} , {\"state_code\":\"32\",\"district_code\":\"3207\",\"district_name\":\"JALPAIGURI\"} , {\"state_code\":\"32\",\"district_code\":\"3219\",\"district_name\":\"Kolkata\"} , {\"state_code\":\"32\",\"district_code\":\"3209\",\"district_name\":\"MALDAH\"} , {\"state_code\":\"32\",\"district_code\":\"3212\",\"district_name\":\"MURSHIDABAD\"} , {\"state_code\":\"32\",\"district_code\":\"3201\",\"district_name\":\"NADIA\"} , {\"state_code\":\"32\",\"district_code\":\"3210\",\"district_name\":\"PASCHIM MEDINIPUR\"} , {\"state_code\":\"32\",\"district_code\":\"3211\",\"district_name\":\"PURBA MEDINIPUR\"} , {\"state_code\":\"32\",\"district_code\":\"3214\",\"district_name\":\"PURULIA\"} , {\"state_code\":\"33\",\"district_code\":\"3311\",\"district_name\":\"BASTAR\"} , {\"state_code\":\"33\",\"district_code\":\"3301\",\"district_name\":\"BILASPUR\"} , {\"state_code\":\"33\",\"district_code\":\"3312\",\"district_name\":\"DANTEWADA\"} , {\"state_code\":\"33\",\"district_code\":\"3309\",\"district_name\":\"DHAMTARI\"} , {\"state_code\":\"33\",\"district_code\":\"3303\",\"district_name\":\"DURG\"} , {\"state_code\":\"33\",\"district_code\":\"3314\",\"district_name\":\"JANJGIR-CHAMPA\"} , {\"state_code\":\"33\",\"district_code\":\"3307\",\"district_name\":\"JASHPUR\"} , {\"state_code\":\"33\",\"district_code\":\"3310\",\"district_name\":\"KANKER\"} , {\"state_code\":\"33\",\"district_code\":\"3302\",\"district_name\":\"KAWARDHA\"} , {\"state_code\":\"33\",\"district_code\":\"3308\",\"district_name\":\"KORBA\"} , {\"state_code\":\"33\",\"district_code\":\"3306\",\"district_name\":\"KOREA\"} , {\"state_code\":\"33\",\"district_code\":\"3315\",\"district_name\":\"MAHASAMUND\"} , {\"state_code\":\"33\",\"district_code\":\"3313\",\"district_name\":\"RAIGARH\"} , {\"state_code\":\"33\",\"district_code\":\"3316\",\"district_name\":\"RAIPUR\"} , {\"state_code\":\"33\",\"district_code\":\"3304\",\"district_name\":\"RAJNANDAGON\"} , {\"state_code\":\"33\",\"district_code\":\"3305\",\"district_name\":\"SURGUJA\"} , {\"state_code\":\"34\",\"district_code\":\"3420\",\"district_name\":\"BOKARO\"} , {\"state_code\":\"34\",\"district_code\":\"3417\",\"district_name\":\"CHATRA\"} , {\"state_code\":\"34\",\"district_code\":\"3422\",\"district_name\":\"DEOGHAR\"} , {\"state_code\":\"34\",\"district_code\":\"3421\",\"district_name\":\"DHANBAD\"} , {\"state_code\":\"34\",\"district_code\":\"3411\",\"district_name\":\"DUMKA\"} , {\"state_code\":\"34\",\"district_code\":\"3410\",\"district_name\":\"EAST SINGHBHUM\"} , {\"state_code\":\"34\",\"district_code\":\"3407\",\"district_name\":\"GARHWA\"} , {\"state_code\":\"34\",\"district_code\":\"3419\",\"district_name\":\"GIRIDIH\"} , {\"state_code\":\"34\",\"district_code\":\"3415\",\"district_name\":\"GODDA\"} , {\"state_code\":\"34\",\"district_code\":\"3403\",\"district_name\":\"GUMLA\"} , {\"state_code\":\"34\",\"district_code\":\"3416\",\"district_name\":\"HAZARIBAGH\"} , {\"state_code\":\"34\",\"district_code\":\"3412\",\"district_name\":\"JAMTARA\"} , {\"state_code\":\"34\",\"district_code\":\"3423\",\"district_name\":\"KHUNTI\"} , {\"state_code\":\"34\",\"district_code\":\"3418\",\"district_name\":\"KODERMA\"} , {\"state_code\":\"34\",\"district_code\":\"3406\",\"district_name\":\"LATEHAR\"} , {\"state_code\":\"34\",\"district_code\":\"3402\",\"district_name\":\"LOHARDAGA\"} , {\"state_code\":\"34\",\"district_code\":\"3414\",\"district_name\":\"PAKUR\"} , {\"state_code\":\"34\",\"district_code\":\"3405\",\"district_name\":\"PALAMU\"} , {\"state_code\":\"34\",\"district_code\":\"3424\",\"district_name\":\"RAMGARH\"} , {\"state_code\":\"34\",\"district_code\":\"3401\",\"district_name\":\"RANCHI\"} , {\"state_code\":\"34\",\"district_code\":\"3413\",\"district_name\":\"SAHEBGANJ\"} , {\"state_code\":\"34\",\"district_code\":\"3409\",\"district_name\":\"SARAIKELA KHARSAWAN\"} , {\"state_code\":\"34\",\"district_code\":\"3404\",\"district_name\":\"SIMDEGA\"} , {\"state_code\":\"34\",\"district_code\":\"3408\",\"district_name\":\"WEST SINGHBHUM\"} , {\"state_code\":\"35\",\"district_code\":\"3507\",\"district_name\":\"ALMORA\"} , {\"state_code\":\"35\",\"district_code\":\"3512\",\"district_name\":\"BAGESHWAR\"} , {\"state_code\":\"35\",\"district_code\":\"3504\",\"district_name\":\"CHAMOLI\"} , {\"state_code\":\"35\",\"district_code\":\"3510\",\"district_name\":\"CHAMPAWAT\"} , {\"state_code\":\"35\",\"district_code\":\"3502\",\"district_name\":\"DEHRADUN\"} , {\"state_code\":\"35\",\"district_code\":\"3503\",\"district_name\":\"HARIDWAR\"} , {\"state_code\":\"35\",\"district_code\":\"3508\",\"district_name\":\"NAINITAL\"} , {\"state_code\":\"35\",\"district_code\":\"3505\",\"district_name\":\"PAURI GARHWAL\"} , {\"state_code\":\"35\",\"district_code\":\"3511\",\"district_name\":\"PITHORAGARH\"} , {\"state_code\":\"35\",\"district_code\":\"3506\",\"district_name\":\"RUDRA PRAYAG\"} , {\"state_code\":\"35\",\"district_code\":\"3513\",\"district_name\":\"TEHRI GARHWAL\"} , {\"state_code\":\"35\",\"district_code\":\"3509\",\"district_name\":\"UDAM SINGH NAGAR\"} , {\"state_code\":\"35\",\"district_code\":\"3501\",\"district_name\":\"UTTAR KASHI\"} , {\"state_code\":\"36\",\"district_code\":\"3601\",\"district_name\":\"CENTRAL DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3604\",\"district_name\":\"EAST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3607\",\"district_name\":\"NEW DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3602\",\"district_name\":\"NORTH DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3605\",\"district_name\":\"NORTH EAST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3608\",\"district_name\":\"NORTH WEST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3603\",\"district_name\":\"SOUTH DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3606\",\"district_name\":\"SOUTH WEST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3609\",\"district_name\":\"WEST DELHI\"} , {\"state_code\":\"37\",\"district_code\":\"3701\",\"district_name\":\"CHANDIGARH\"} , {\"state_code\":\"38\",\"district_code\":\"3801\",\"district_name\":\"Almora\"} , {\"state_code\":\"38\",\"district_code\":\"3802\",\"district_name\":\"Bageshwar\"} , {\"state_code\":\"38\",\"district_code\":\"3803\",\"district_name\":\"Chamoli\"} , {\"state_code\":\"38\",\"district_code\":\"3804\",\"district_name\":\"Champawat\"} , {\"state_code\":\"38\",\"district_code\":\"3805\",\"district_name\":\"Dehradun\"} , {\"state_code\":\"38\",\"district_code\":\"3806\",\"district_name\":\"Haridwar\"} , {\"state_code\":\"38\",\"district_code\":\"3807\",\"district_name\":\"Nainital\"} , {\"state_code\":\"38\",\"district_code\":\"3808\",\"district_name\":\"Pauri Garhwal\"} , {\"state_code\":\"38\",\"district_code\":\"3809\",\"district_name\":\"Pithoragarh\"} , {\"state_code\":\"38\",\"district_code\":\"3810\",\"district_name\":\"Rudra Prayag\"} , {\"state_code\":\"38\",\"district_code\":\"3811\",\"district_name\":\"Tehri Garhwal\"} , {\"state_code\":\"38\",\"district_code\":\"3812\",\"district_name\":\"Udham Singh Nagar\"} , {\"state_code\":\"38\",\"district_code\":\"3813\",\"district_name\":\"Uttarkashi\"}");
               out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("distonchng"))
        {
              out.println("{\"list\":[{\"state_code\":\"01\",\"district_code\":\"0102\",\"district_name\":\"NICOBARS\"} , {\"state_code\":\"01\",\"district_code\":\"0103\",\"district_name\":\"NORTH AND MIDDLE ANDAMAN\"} , {\"state_code\":\"01\",\"district_code\":\"0101\",\"district_name\":\"SOUTH ANDMAN\"} , {\"state_code\":\"02\",\"district_code\":\"0219\",\"district_name\":\"ADILABAD\"} , {\"state_code\":\"02\",\"district_code\":\"0212\",\"district_name\":\"ANANTAPUR\"} , {\"state_code\":\"02\",\"district_code\":\"0210\",\"district_name\":\"CHITTOOR\"} , {\"state_code\":\"02\",\"district_code\":\"0211\",\"district_name\":\"CUDDAPAH\"} , {\"state_code\":\"02\",\"district_code\":\"0204\",\"district_name\":\"EAST GODAVARI\"} , {\"state_code\":\"02\",\"district_code\":\"0207\",\"district_name\":\"GUNTUR\"} , {\"state_code\":\"02\",\"district_code\":\"0216\",\"district_name\":\"HYDERABAD\"} , {\"state_code\":\"02\",\"district_code\":\"0220\",\"district_name\":\"KARIMNAGAR\"} , {\"state_code\":\"02\",\"district_code\":\"0222\",\"district_name\":\"KHAMMAM\"} , {\"state_code\":\"02\",\"district_code\":\"0206\",\"district_name\":\"KRISHNA\"} , {\"state_code\":\"02\",\"district_code\":\"0213\",\"district_name\":\"KURNOOL\"} , {\"state_code\":\"02\",\"district_code\":\"0214\",\"district_name\":\"MAHBUBNAGAR\"} , {\"state_code\":\"02\",\"district_code\":\"0217\",\"district_name\":\"MEDAK\"} , {\"state_code\":\"02\",\"district_code\":\"0223\",\"district_name\":\"NALGONDA\"} , {\"state_code\":\"02\",\"district_code\":\"0209\",\"district_name\":\"NELLORE\"} , {\"state_code\":\"02\",\"district_code\":\"0218\",\"district_name\":\"NIZAMABAD\"} , {\"state_code\":\"02\",\"district_code\":\"0208\",\"district_name\":\"PRAKASAM\"} , {\"state_code\":\"02\",\"district_code\":\"0215\",\"district_name\":\"RANGAREDDI\"} , {\"state_code\":\"02\",\"district_code\":\"0201\",\"district_name\":\"SRIKAKULAM\"} , {\"state_code\":\"02\",\"district_code\":\"0203\",\"district_name\":\"VISAKHAPATANAM\"} , {\"state_code\":\"02\",\"district_code\":\"0202\",\"district_name\":\"VIZIANAGARAM\"} , {\"state_code\":\"02\",\"district_code\":\"0221\",\"district_name\":\"WARANGAL\"} , {\"state_code\":\"02\",\"district_code\":\"0205\",\"district_name\":\"WEST GODAVARI\"} , {\"state_code\":\"03\",\"district_code\":\"0310\",\"district_name\":\"CHANGLANG\"} , {\"state_code\":\"03\",\"district_code\":\"0303\",\"district_name\":\"EAST KAMENG\"} , {\"state_code\":\"03\",\"district_code\":\"0307\",\"district_name\":\"EAST SIANG\"} , {\"state_code\":\"03\",\"district_code\":\"0316\",\"district_name\":\"KURUNG KUMEY\"} , {\"state_code\":\"03\",\"district_code\":\"0309\",\"district_name\":\"LOHIT\"} , {\"state_code\":\"03\",\"district_code\":\"0314\",\"district_name\":\"LOWER DIBANG VALLEY\"} , {\"state_code\":\"03\",\"district_code\":\"0304\",\"district_name\":\"LOWER SUBANSIRI\"} , {\"state_code\":\"03\",\"district_code\":\"0312\",\"district_name\":\"PAPUM PARE\"} , {\"state_code\":\"03\",\"district_code\":\"0301\",\"district_name\":\"TAWANG\"} , {\"state_code\":\"03\",\"district_code\":\"0311\",\"district_name\":\"TIRAP\"} , {\"state_code\":\"03\",\"district_code\":\"0315\",\"district_name\":\"UPPER DIBANG VALLEY\"} , {\"state_code\":\"03\",\"district_code\":\"0313\",\"district_name\":\"UPPER SIANG\"} , {\"state_code\":\"03\",\"district_code\":\"0305\",\"district_name\":\"UPPER SUBANSIRI\"} , {\"state_code\":\"03\",\"district_code\":\"0302\",\"district_name\":\"WEST KAMENG\"} , {\"state_code\":\"03\",\"district_code\":\"0306\",\"district_name\":\"WEST SIANG\"} , {\"state_code\":\"04\",\"district_code\":\"0424\",\"district_name\":\"BAKSA\"} , {\"state_code\":\"04\",\"district_code\":\"0405\",\"district_name\":\"BARPETA\"} , {\"state_code\":\"04\",\"district_code\":\"0403\",\"district_name\":\"BONGAIGAON\"} , {\"state_code\":\"04\",\"district_code\":\"0423\",\"district_name\":\"CACHAR\"} , {\"state_code\":\"04\",\"district_code\":\"0408\",\"district_name\":\"DARRANG\"} , {\"state_code\":\"04\",\"district_code\":\"0411\",\"district_name\":\"DHEMAJI\"} , {\"state_code\":\"04\",\"district_code\":\"0401\",\"district_name\":\"DHUBRI\"} , {\"state_code\":\"04\",\"district_code\":\"0417\",\"district_name\":\"DIBRUGARH\"} , {\"state_code\":\"04\",\"district_code\":\"0404\",\"district_name\":\"GOALPARA\"} , {\"state_code\":\"04\",\"district_code\":\"0414\",\"district_name\":\"GOLAGHAT\"} , {\"state_code\":\"04\",\"district_code\":\"0422\",\"district_name\":\"HAILAKANDI\"} , {\"state_code\":\"04\",\"district_code\":\"0415\",\"district_name\":\"JORHAT\"} , {\"state_code\":\"04\",\"district_code\":\"0407\",\"district_name\":\"KAMRUP\"} , {\"state_code\":\"04\",\"district_code\":\"0426\",\"district_name\":\"KAMRUP METRO\"} , {\"state_code\":\"04\",\"district_code\":\"0419\",\"district_name\":\"KARBI ANGLONG\"} , {\"state_code\":\"04\",\"district_code\":\"0421\",\"district_name\":\"KARIMGANJ\"} , {\"state_code\":\"04\",\"district_code\":\"0402\",\"district_name\":\"KOKRAJHAR\"} , {\"state_code\":\"04\",\"district_code\":\"0410\",\"district_name\":\"LAKHIMPUR\"} , {\"state_code\":\"04\",\"district_code\":\"0412\",\"district_name\":\"MORIGAON\"} , {\"state_code\":\"04\",\"district_code\":\"0413\",\"district_name\":\"NAGAON\"} , {\"state_code\":\"04\",\"district_code\":\"0406\",\"district_name\":\"NALBARI\"} , {\"state_code\":\"04\",\"district_code\":\"0420\",\"district_name\":\"NORTH CACHAR HILLS\"} , {\"state_code\":\"04\",\"district_code\":\"0416\",\"district_name\":\"SIVASAGAR\"} , {\"state_code\":\"04\",\"district_code\":\"0409\",\"district_name\":\"SONITPUR\"} , {\"state_code\":\"04\",\"district_code\":\"0418\",\"district_name\":\"TINSUKIA\"} , {\"state_code\":\"04\",\"district_code\":\"0427\",\"district_name\":\"Udalguri\"} , {\"state_code\":\"05\",\"district_code\":\"0541\",\"district_name\":\"ARARIA\"} , {\"state_code\":\"05\",\"district_code\":\"0551\",\"district_name\":\"ARWAL\"} , {\"state_code\":\"05\",\"district_code\":\"0505\",\"district_name\":\"AURANAGABAD\"} , {\"state_code\":\"05\",\"district_code\":\"0545\",\"district_name\":\"BANKA \"} , {\"state_code\":\"05\",\"district_code\":\"0517\",\"district_name\":\"BEGUSARAI\"} , {\"state_code\":\"05\",\"district_code\":\"0527\",\"district_name\":\"BHAGALPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0503\",\"district_name\":\"BHOJPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0548\",\"district_name\":\"BUXAR \"} , {\"state_code\":\"05\",\"district_code\":\"0519\",\"district_name\":\"DARBHANGA\"} , {\"state_code\":\"05\",\"district_code\":\"0507\",\"district_name\":\"GAYA\"} , {\"state_code\":\"05\",\"district_code\":\"0511\",\"district_name\":\"GOPALGANJ\"} , {\"state_code\":\"05\",\"district_code\":\"0550\",\"district_name\":\"JAMUI\"} , {\"state_code\":\"05\",\"district_code\":\"0506\",\"district_name\":\"JEHANABAD\"} , {\"state_code\":\"05\",\"district_code\":\"0549\",\"district_name\":\"KAIMUR (BHABUA)\"} , {\"state_code\":\"05\",\"district_code\":\"0524\",\"district_name\":\"KATIHAR\"} , {\"state_code\":\"05\",\"district_code\":\"0525\",\"district_name\":\"KHAGARIA\"} , {\"state_code\":\"05\",\"district_code\":\"0542\",\"district_name\":\"KISHANGANJ\"} , {\"state_code\":\"05\",\"district_code\":\"0546\",\"district_name\":\"LAKHISARAI\"} , {\"state_code\":\"05\",\"district_code\":\"0522\",\"district_name\":\"MADHEPURA\"} , {\"state_code\":\"05\",\"district_code\":\"0520\",\"district_name\":\"MADHUBANI\"} , {\"state_code\":\"05\",\"district_code\":\"0526\",\"district_name\":\"MUNGER\"} , {\"state_code\":\"05\",\"district_code\":\"0515\",\"district_name\":\"MUZAFFARPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0502\",\"district_name\":\"NALANDA\"} , {\"state_code\":\"05\",\"district_code\":\"0508\",\"district_name\":\"NAWADA\"} , {\"state_code\":\"05\",\"district_code\":\"0512\",\"district_name\":\"PASHCHIM CHAMPARAN\"} , {\"state_code\":\"05\",\"district_code\":\"0501\",\"district_name\":\"PATNA\"} , {\"state_code\":\"05\",\"district_code\":\"0513\",\"district_name\":\"PURBI CHAMPARAN\"} , {\"state_code\":\"05\",\"district_code\":\"0523\",\"district_name\":\"PURNIA\"} , {\"state_code\":\"05\",\"district_code\":\"0504\",\"district_name\":\"ROHTAS\"} , {\"state_code\":\"05\",\"district_code\":\"0521\",\"district_name\":\"SAHARSA\"} , {\"state_code\":\"05\",\"district_code\":\"0518\",\"district_name\":\"SAMASTIPUR\"} , {\"state_code\":\"05\",\"district_code\":\"0509\",\"district_name\":\"SARAN\"} , {\"state_code\":\"05\",\"district_code\":\"0543\",\"district_name\":\"SHEOHAR\"} , {\"state_code\":\"05\",\"district_code\":\"0514\",\"district_name\":\"SITAMARHI\"} , {\"state_code\":\"05\",\"district_code\":\"0510\",\"district_name\":\"SIWAN\"} , {\"state_code\":\"05\",\"district_code\":\"0544\",\"district_name\":\"SUPAUL\"} , {\"state_code\":\"05\",\"district_code\":\"0547\",\"district_name\":\"Sheikhpura \"} , {\"state_code\":\"05\",\"district_code\":\"0516\",\"district_name\":\"VAISHALI\"} , {\"state_code\":\"06\",\"district_code\":\"0601\",\"district_name\":\"CHANDIGARH\"} , {\"state_code\":\"07\",\"district_code\":\"0701\",\"district_name\":\"DADRA AND NAGAR HAVELI\"} , {\"state_code\":\"08\",\"district_code\":\"0801\",\"district_name\":\"DAMAN\"} , {\"state_code\":\"08\",\"district_code\":\"0802\",\"district_name\":\"DIU\"} , {\"state_code\":\"09\",\"district_code\":\"0907\",\"district_name\":\"Central\"} , {\"state_code\":\"09\",\"district_code\":\"0905\",\"district_name\":\"East\"} , {\"state_code\":\"09\",\"district_code\":\"0906\",\"district_name\":\"New Delhi\"} , {\"state_code\":\"09\",\"district_code\":\"0903\",\"district_name\":\"North\"} , {\"state_code\":\"09\",\"district_code\":\"0904\",\"district_name\":\"North East\"} , {\"state_code\":\"09\",\"district_code\":\"0902\",\"district_name\":\"North West\"} , {\"state_code\":\"09\",\"district_code\":\"0910\",\"district_name\":\"South\"} , {\"state_code\":\"09\",\"district_code\":\"0909\",\"district_name\":\"South West\"} , {\"state_code\":\"09\",\"district_code\":\"0908\",\"district_name\":\"West\"} , {\"state_code\":\"10\",\"district_code\":\"1001\",\"district_name\":\"NORTH GOA\"} , {\"state_code\":\"10\",\"district_code\":\"1002\",\"district_name\":\"SOUTH GOA\"} , {\"state_code\":\"11\",\"district_code\":\"1112\",\"district_name\":\"AHMADABAD\"} , {\"state_code\":\"11\",\"district_code\":\"1105\",\"district_name\":\"AMRELI\"} , {\"state_code\":\"11\",\"district_code\":\"1122\",\"district_name\":\"ANAND\"} , {\"state_code\":\"11\",\"district_code\":\"1108\",\"district_name\":\"BANAS KANTHA\"} , {\"state_code\":\"11\",\"district_code\":\"1116\",\"district_name\":\"BHARUCH\"} , {\"state_code\":\"11\",\"district_code\":\"1104\",\"district_name\":\"BHAVNAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1119\",\"district_name\":\"DANG\"} , {\"state_code\":\"11\",\"district_code\":\"1123\",\"district_name\":\"DOHAD\"} , {\"state_code\":\"11\",\"district_code\":\"1111\",\"district_name\":\"GANDHINAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1101\",\"district_name\":\"JAMNAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1106\",\"district_name\":\"JUNAGADH\"} , {\"state_code\":\"11\",\"district_code\":\"1107\",\"district_name\":\"KACHCHH\"} , {\"state_code\":\"11\",\"district_code\":\"1113\",\"district_name\":\"KHEDA\"} , {\"state_code\":\"11\",\"district_code\":\"1110\",\"district_name\":\"MAHESANA\"} , {\"state_code\":\"11\",\"district_code\":\"1124\",\"district_name\":\"NARMADA\"} , {\"state_code\":\"11\",\"district_code\":\"1125\",\"district_name\":\"NAVSARI \"} , {\"state_code\":\"11\",\"district_code\":\"1114\",\"district_name\":\"PANCH MAHALS\"} , {\"state_code\":\"11\",\"district_code\":\"1120\",\"district_name\":\"PATAN\"} , {\"state_code\":\"11\",\"district_code\":\"1121\",\"district_name\":\"PORBANDAR\"} , {\"state_code\":\"11\",\"district_code\":\"1102\",\"district_name\":\"RAJKOT\"} , {\"state_code\":\"11\",\"district_code\":\"1109\",\"district_name\":\"SABAR KANTHA\"} , {\"state_code\":\"11\",\"district_code\":\"1117\",\"district_name\":\"SURAT\"} , {\"state_code\":\"11\",\"district_code\":\"1103\",\"district_name\":\"SURENDRANAGAR\"} , {\"state_code\":\"11\",\"district_code\":\"1115\",\"district_name\":\"VADODARA\"} , {\"state_code\":\"11\",\"district_code\":\"1118\",\"district_name\":\"VALSAD\"} , {\"state_code\":\"12\",\"district_code\":\"1201\",\"district_name\":\"AMBALA\"} , {\"state_code\":\"12\",\"district_code\":\"1213\",\"district_name\":\"BHIWANI\"} , {\"state_code\":\"12\",\"district_code\":\"1209\",\"district_name\":\"FARIDABAD\"} , {\"state_code\":\"12\",\"district_code\":\"1218\",\"district_name\":\"FATEHABAD\"} , {\"state_code\":\"12\",\"district_code\":\"1210\",\"district_name\":\"GURGAON\"} , {\"state_code\":\"12\",\"district_code\":\"1215\",\"district_name\":\"HISAR\"} , {\"state_code\":\"12\",\"district_code\":\"1220\",\"district_name\":\"JHAJJAR\"} , {\"state_code\":\"12\",\"district_code\":\"1214\",\"district_name\":\"JIND\"} , {\"state_code\":\"12\",\"district_code\":\"1204\",\"district_name\":\"KAITHAL\"} , {\"state_code\":\"12\",\"district_code\":\"1205\",\"district_name\":\"KARNAL\"} , {\"state_code\":\"12\",\"district_code\":\"1203\",\"district_name\":\"KURUKSHETRA\"} , {\"state_code\":\"12\",\"district_code\":\"1212\",\"district_name\":\"MAHENDRAGARH\"} , {\"state_code\":\"12\",\"district_code\":\"1219\",\"district_name\":\"MEWAT\"} , {\"state_code\":\"12\",\"district_code\":\"1221\",\"district_name\":\"PALWAL\"} , {\"state_code\":\"12\",\"district_code\":\"1217\",\"district_name\":\"PANCHKULA\"} , {\"state_code\":\"12\",\"district_code\":\"1206\",\"district_name\":\"PANIPAT\"} , {\"state_code\":\"12\",\"district_code\":\"1211\",\"district_name\":\"REWARI\"} , {\"state_code\":\"12\",\"district_code\":\"1208\",\"district_name\":\"ROHTAK\"} , {\"state_code\":\"12\",\"district_code\":\"1216\",\"district_name\":\"SIRSA\"} , {\"state_code\":\"12\",\"district_code\":\"1207\",\"district_name\":\"SONIPAT\"} , {\"state_code\":\"12\",\"district_code\":\"1202\",\"district_name\":\"YAMUNANAGAR\"} , {\"state_code\":\"13\",\"district_code\":\"1301\",\"district_name\":\"Bilaspur\"} , {\"state_code\":\"13\",\"district_code\":\"1302\",\"district_name\":\"Chamba\"} , {\"state_code\":\"13\",\"district_code\":\"1303\",\"district_name\":\"Hamirpur\"} , {\"state_code\":\"13\",\"district_code\":\"1304\",\"district_name\":\"Kangra\"} , {\"state_code\":\"13\",\"district_code\":\"1305\",\"district_name\":\"Kinnaur\"} , {\"state_code\":\"13\",\"district_code\":\"1306\",\"district_name\":\"Kullu\"} , {\"state_code\":\"13\",\"district_code\":\"1307\",\"district_name\":\"LAHAUL & SPITI\"} , {\"state_code\":\"13\",\"district_code\":\"1308\",\"district_name\":\"MANDI\"} , {\"state_code\":\"13\",\"district_code\":\"1311\",\"district_name\":\"SOLAN\"} , {\"state_code\":\"13\",\"district_code\":\"1309\",\"district_name\":\"Shimla\"} , {\"state_code\":\"13\",\"district_code\":\"1310\",\"district_name\":\"Sirmaur\"} , {\"state_code\":\"13\",\"district_code\":\"1312\",\"district_name\":\"Una\"} , {\"state_code\":\"14\",\"district_code\":\"1406\",\"district_name\":\"ANANTNAG\"} , {\"state_code\":\"14\",\"district_code\":\"1404\",\"district_name\":\"BADGAM\"} , {\"state_code\":\"14\",\"district_code\":\"1419\",\"district_name\":\"BANDIPORA\"} , {\"state_code\":\"14\",\"district_code\":\"1402\",\"district_name\":\"BARAMULLA\"} , {\"state_code\":\"14\",\"district_code\":\"1409\",\"district_name\":\"DODA\"} , {\"state_code\":\"14\",\"district_code\":\"1420\",\"district_name\":\"GANDERWAL\"} , {\"state_code\":\"14\",\"district_code\":\"1413\",\"district_name\":\"JAMMU\"} , {\"state_code\":\"14\",\"district_code\":\"1408\",\"district_name\":\"KARGIL\"} , {\"state_code\":\"14\",\"district_code\":\"1414\",\"district_name\":\"KATHUA\"} , {\"state_code\":\"14\",\"district_code\":\"1415\",\"district_name\":\"KISHTWAR\"} , {\"state_code\":\"14\",\"district_code\":\"1421\",\"district_name\":\"KULGAM\"} , {\"state_code\":\"14\",\"district_code\":\"1401\",\"district_name\":\"KUPWARA\"} , {\"state_code\":\"14\",\"district_code\":\"1407\",\"district_name\":\"LEH (LADAKH)\"} , {\"state_code\":\"14\",\"district_code\":\"1411\",\"district_name\":\"POONCH\"} , {\"state_code\":\"14\",\"district_code\":\"1405\",\"district_name\":\"PULWAMA\"} , {\"state_code\":\"14\",\"district_code\":\"1412\",\"district_name\":\"RAJAURI\"} , {\"state_code\":\"14\",\"district_code\":\"1416\",\"district_name\":\"RAMBAN\"} , {\"state_code\":\"14\",\"district_code\":\"1417\",\"district_name\":\"REASI\"} , {\"state_code\":\"14\",\"district_code\":\"1418\",\"district_name\":\"SAMBA\"} , {\"state_code\":\"14\",\"district_code\":\"1422\",\"district_name\":\"SHOPIAN\"} , {\"state_code\":\"14\",\"district_code\":\"1403\",\"district_name\":\"SRINAGAR\"} , {\"state_code\":\"14\",\"district_code\":\"1410\",\"district_name\":\"UDHAMPUR\"} , {\"state_code\":\"15\",\"district_code\":\"1501\",\"district_name\":\"BAGALKOTE\"} , {\"state_code\":\"15\",\"district_code\":\"1502\",\"district_name\":\"BANGALORE\"} , {\"state_code\":\"15\",\"district_code\":\"1503\",\"district_name\":\"BANGALORE RURAL\"} , {\"state_code\":\"15\",\"district_code\":\"1504\",\"district_name\":\"BELGAUM\"} , {\"state_code\":\"15\",\"district_code\":\"1505\",\"district_name\":\"BELLARY\"} , {\"state_code\":\"15\",\"district_code\":\"1506\",\"district_name\":\"BIDAR\"} , {\"state_code\":\"15\",\"district_code\":\"1507\",\"district_name\":\"BIJAPUR\"} , {\"state_code\":\"15\",\"district_code\":\"1508\",\"district_name\":\"CHAMARAJA NAGARA\"} , {\"state_code\":\"15\",\"district_code\":\"1528\",\"district_name\":\"CHIKKABALLAPURA\"} , {\"state_code\":\"15\",\"district_code\":\"1509\",\"district_name\":\"CHIKMAGALUR\"} , {\"state_code\":\"15\",\"district_code\":\"1510\",\"district_name\":\"CHITRADURGA\"} , {\"state_code\":\"15\",\"district_code\":\"1511\",\"district_name\":\"DAKSHINA KANNADA\"} , {\"state_code\":\"15\",\"district_code\":\"1512\",\"district_name\":\"DAVANAGERE\"} , {\"state_code\":\"15\",\"district_code\":\"1513\",\"district_name\":\"DHARWAR\"} , {\"state_code\":\"15\",\"district_code\":\"1514\",\"district_name\":\"GADAG\"} , {\"state_code\":\"15\",\"district_code\":\"1515\",\"district_name\":\"GULBARGA\"} , {\"state_code\":\"15\",\"district_code\":\"1516\",\"district_name\":\"HASSAN\"} , {\"state_code\":\"15\",\"district_code\":\"1517\",\"district_name\":\"HAVERI\"} , {\"state_code\":\"15\",\"district_code\":\"1518\",\"district_name\":\"KODAGU\"} , {\"state_code\":\"15\",\"district_code\":\"1519\",\"district_name\":\"KOLAR\"} , {\"state_code\":\"15\",\"district_code\":\"1520\",\"district_name\":\"KOPPAL\"} , {\"state_code\":\"15\",\"district_code\":\"1521\",\"district_name\":\"MANDYA\"} , {\"state_code\":\"15\",\"district_code\":\"1522\",\"district_name\":\"MYSORE\"} , {\"state_code\":\"15\",\"district_code\":\"1523\",\"district_name\":\"RAICHUR\"} , {\"state_code\":\"15\",\"district_code\":\"1529\",\"district_name\":\"RAMANAGARA\"} , {\"state_code\":\"15\",\"district_code\":\"1524\",\"district_name\":\"SHIMOGA\"} , {\"state_code\":\"15\",\"district_code\":\"1525\",\"district_name\":\"TUMKUR\"} , {\"state_code\":\"15\",\"district_code\":\"1526\",\"district_name\":\"UDUPI\"} , {\"state_code\":\"15\",\"district_code\":\"1527\",\"district_name\":\"UTTARA KANNADA\"} , {\"state_code\":\"16\",\"district_code\":\"1611\",\"district_name\":\"ALAPPUZHA\"} , {\"state_code\":\"16\",\"district_code\":\"1608\",\"district_name\":\"ERNAKULAM\"} , {\"state_code\":\"16\",\"district_code\":\"1609\",\"district_name\":\"IDUKKI\"} , {\"state_code\":\"16\",\"district_code\":\"1602\",\"district_name\":\"KANNUR\"} , {\"state_code\":\"16\",\"district_code\":\"1601\",\"district_name\":\"KASARGOD\"} , {\"state_code\":\"16\",\"district_code\":\"1613\",\"district_name\":\"KOLLAM\"} , {\"state_code\":\"16\",\"district_code\":\"1610\",\"district_name\":\"KOTTAYAM\"} , {\"state_code\":\"16\",\"district_code\":\"1604\",\"district_name\":\"KOZHIKODE\"} , {\"state_code\":\"16\",\"district_code\":\"1605\",\"district_name\":\"MALAPPURAM\"} , {\"state_code\":\"16\",\"district_code\":\"1606\",\"district_name\":\"PALAKKAD\"} , {\"state_code\":\"16\",\"district_code\":\"1612\",\"district_name\":\"PATHANAMTHITTA\"} , {\"state_code\":\"16\",\"district_code\":\"1614\",\"district_name\":\"THIRUVANANTHAPURAM\"} , {\"state_code\":\"16\",\"district_code\":\"1607\",\"district_name\":\"THRISSUR\"} , {\"state_code\":\"16\",\"district_code\":\"1603\",\"district_name\":\"WAYANAD\"} , {\"state_code\":\"17\",\"district_code\":\"1746\",\"district_name\":\"ANUPPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1748\",\"district_name\":\"ASHOK NAGAR\"} , {\"state_code\":\"17\",\"district_code\":\"1738\",\"district_name\":\"BALAGHAT\"} , {\"state_code\":\"17\",\"district_code\":\"1742\",\"district_name\":\"BARWANI\"} , {\"state_code\":\"17\",\"district_code\":\"1731\",\"district_name\":\"BETUL\"} , {\"state_code\":\"17\",\"district_code\":\"1702\",\"district_name\":\"BHIND\"} , {\"state_code\":\"17\",\"district_code\":\"1728\",\"district_name\":\"BHOPAL\"} , {\"state_code\":\"17\",\"district_code\":\"1747\",\"district_name\":\"BURHANPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1708\",\"district_name\":\"CHHATARPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1736\",\"district_name\":\"CHHINDWARA\"} , {\"state_code\":\"17\",\"district_code\":\"1711\",\"district_name\":\"DAMOH\"} , {\"state_code\":\"17\",\"district_code\":\"1704\",\"district_name\":\"DATIA\"} , {\"state_code\":\"17\",\"district_code\":\"1720\",\"district_name\":\"DEWAS\"} , {\"state_code\":\"17\",\"district_code\":\"1722\",\"district_name\":\"DHAR\"} , {\"state_code\":\"17\",\"district_code\":\"1745\",\"district_name\":\"DINDORI\"} , {\"state_code\":\"17\",\"district_code\":\"1725\",\"district_name\":\"EAST NIMAR\"} , {\"state_code\":\"17\",\"district_code\":\"1706\",\"district_name\":\"GUNA\"} , {\"state_code\":\"17\",\"district_code\":\"1703\",\"district_name\":\"GWALIOR\"} , {\"state_code\":\"17\",\"district_code\":\"1743\",\"district_name\":\"HARDA \"} , {\"state_code\":\"17\",\"district_code\":\"1732\",\"district_name\":\"HOSHANGABAD\"} , {\"state_code\":\"17\",\"district_code\":\"1723\",\"district_name\":\"INDORE\"} , {\"state_code\":\"17\",\"district_code\":\"1733\",\"district_name\":\"JABALPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1721\",\"district_name\":\"JHABUA\"} , {\"state_code\":\"17\",\"district_code\":\"1744\",\"district_name\":\"KATNI \"} , {\"state_code\":\"17\",\"district_code\":\"1724\",\"district_name\":\"KHARGONE\"} , {\"state_code\":\"17\",\"district_code\":\"1735\",\"district_name\":\"MANDLA\"} , {\"state_code\":\"17\",\"district_code\":\"1716\",\"district_name\":\"MANDSAUR\"} , {\"state_code\":\"17\",\"district_code\":\"1701\",\"district_name\":\"MORENA\"} , {\"state_code\":\"17\",\"district_code\":\"1734\",\"district_name\":\"NARSINGHPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1741\",\"district_name\":\"NEEMUCH\"} , {\"state_code\":\"17\",\"district_code\":\"1709\",\"district_name\":\"PANNA\"} , {\"state_code\":\"17\",\"district_code\":\"1730\",\"district_name\":\"RAISEN\"} , {\"state_code\":\"17\",\"district_code\":\"1726\",\"district_name\":\"RAJGARH\"} , {\"state_code\":\"17\",\"district_code\":\"1717\",\"district_name\":\"RATLAM\"} , {\"state_code\":\"17\",\"district_code\":\"1713\",\"district_name\":\"REWA\"} , {\"state_code\":\"17\",\"district_code\":\"1710\",\"district_name\":\"SAGAR\"} , {\"state_code\":\"17\",\"district_code\":\"1712\",\"district_name\":\"SATNA\"} , {\"state_code\":\"17\",\"district_code\":\"1729\",\"district_name\":\"SEHORE\"} , {\"state_code\":\"17\",\"district_code\":\"1737\",\"district_name\":\"SEONI\"} , {\"state_code\":\"17\",\"district_code\":\"1714\",\"district_name\":\"SHAHDOL\"} , {\"state_code\":\"17\",\"district_code\":\"1719\",\"district_name\":\"SHAJAPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1739\",\"district_name\":\"SHEOPUR\"} , {\"state_code\":\"17\",\"district_code\":\"1705\",\"district_name\":\"SHIVPURI\"} , {\"state_code\":\"17\",\"district_code\":\"1715\",\"district_name\":\"SIDHI\"} , {\"state_code\":\"17\",\"district_code\":\"1707\",\"district_name\":\"TIKAMGARH\"} , {\"state_code\":\"17\",\"district_code\":\"1718\",\"district_name\":\"UJJAIN\"} , {\"state_code\":\"17\",\"district_code\":\"1740\",\"district_name\":\"UMARIA\"} , {\"state_code\":\"17\",\"district_code\":\"1727\",\"district_name\":\"VIDISHA\"} , {\"state_code\":\"18\",\"district_code\":\"1809\",\"district_name\":\"AHMEDNAGAR\"} , {\"state_code\":\"18\",\"district_code\":\"1823\",\"district_name\":\"AKOLA\"} , {\"state_code\":\"18\",\"district_code\":\"1824\",\"district_name\":\"AMRAVATI\"} , {\"state_code\":\"18\",\"district_code\":\"1815\",\"district_name\":\"AURANGABAD\"} , {\"state_code\":\"18\",\"district_code\":\"1818\",\"district_name\":\"BEED\"} , {\"state_code\":\"18\",\"district_code\":\"1828\",\"district_name\":\"BHANDARA\"} , {\"state_code\":\"18\",\"district_code\":\"1822\",\"district_name\":\"BULDHANA\"} , {\"state_code\":\"18\",\"district_code\":\"1829\",\"district_name\":\"CHANDRAPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1807\",\"district_name\":\"DHULE\"} , {\"state_code\":\"18\",\"district_code\":\"1830\",\"district_name\":\"GADCHIROLI\"} , {\"state_code\":\"18\",\"district_code\":\"1833\",\"district_name\":\"GONDIA\"} , {\"state_code\":\"18\",\"district_code\":\"1834\",\"district_name\":\"HINGOLI\"} , {\"state_code\":\"18\",\"district_code\":\"1808\",\"district_name\":\"JALGAON\"} , {\"state_code\":\"18\",\"district_code\":\"1816\",\"district_name\":\"JALNA\"} , {\"state_code\":\"18\",\"district_code\":\"1814\",\"district_name\":\"KOLHAPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1821\",\"district_name\":\"LATUR\"} , {\"state_code\":\"18\",\"district_code\":\"1801\",\"district_name\":\"MUMBAI\"} , {\"state_code\":\"18\",\"district_code\":\"1835\",\"district_name\":\"MUMBAI (SUBURBAN)\"} , {\"state_code\":\"18\",\"district_code\":\"1827\",\"district_name\":\"NAGPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1819\",\"district_name\":\"NANDED\"} , {\"state_code\":\"18\",\"district_code\":\"1831\",\"district_name\":\"NANDURBAR\"} , {\"state_code\":\"18\",\"district_code\":\"1806\",\"district_name\":\"NASHIK\"} , {\"state_code\":\"18\",\"district_code\":\"1820\",\"district_name\":\"OSMANABAD\"} , {\"state_code\":\"18\",\"district_code\":\"1817\",\"district_name\":\"PARBHANI\"} , {\"state_code\":\"18\",\"district_code\":\"1810\",\"district_name\":\"PUNE\"} , {\"state_code\":\"18\",\"district_code\":\"1803\",\"district_name\":\"RAIGAD\"} , {\"state_code\":\"18\",\"district_code\":\"1804\",\"district_name\":\"RATNAGIRI\"} , {\"state_code\":\"18\",\"district_code\":\"1812\",\"district_name\":\"SANGLI\"} , {\"state_code\":\"18\",\"district_code\":\"1811\",\"district_name\":\"SATARA\"} , {\"state_code\":\"18\",\"district_code\":\"1805\",\"district_name\":\"SINDHUDURG\"} , {\"state_code\":\"18\",\"district_code\":\"1813\",\"district_name\":\"SOLAPUR\"} , {\"state_code\":\"18\",\"district_code\":\"1802\",\"district_name\":\"THANE\"} , {\"state_code\":\"18\",\"district_code\":\"1826\",\"district_name\":\"WARDHA\"} , {\"state_code\":\"18\",\"district_code\":\"1832\",\"district_name\":\"WASHIM \"} , {\"state_code\":\"18\",\"district_code\":\"1825\",\"district_name\":\"YAVATMAL\"} , {\"state_code\":\"19\",\"district_code\":\"1901\",\"district_name\":\"LAKSHADWEEP DISTRICT\"} , {\"state_code\":\"20\",\"district_code\":\"2006\",\"district_name\":\"BISHNUPUR\"} , {\"state_code\":\"20\",\"district_code\":\"2004\",\"district_name\":\"CHANDEL\"} , {\"state_code\":\"20\",\"district_code\":\"2003\",\"district_name\":\"CHURACHANDPUR\"} , {\"state_code\":\"20\",\"district_code\":\"2009\",\"district_name\":\"IMPHAL EAST\"} , {\"state_code\":\"20\",\"district_code\":\"2007\",\"district_name\":\"IMPHAL WEST\"} , {\"state_code\":\"20\",\"district_code\":\"2001\",\"district_name\":\"SENAPATI\"} , {\"state_code\":\"20\",\"district_code\":\"2002\",\"district_name\":\"TAMENGLONG\"} , {\"state_code\":\"20\",\"district_code\":\"2005\",\"district_name\":\"THOUBAL\"} , {\"state_code\":\"20\",\"district_code\":\"2008\",\"district_name\":\"UKHRUL\"} , {\"state_code\":\"21\",\"district_code\":\"2104\",\"district_name\":\"EAST GARO HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2102\",\"district_name\":\"EAST KHASI HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2101\",\"district_name\":\"JAINTIA HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2107\",\"district_name\":\"RI BHOI \"} , {\"state_code\":\"21\",\"district_code\":\"2106\",\"district_name\":\"SOUTH GARO HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2105\",\"district_name\":\"WEST GARO HILLS\"} , {\"state_code\":\"21\",\"district_code\":\"2103\",\"district_name\":\"WEST KHASI HILLS\"} , {\"state_code\":\"22\",\"district_code\":\"2201\",\"district_name\":\"AIZAWL\"} , {\"state_code\":\"22\",\"district_code\":\"2206\",\"district_name\":\"CHAMPHAI \"} , {\"state_code\":\"22\",\"district_code\":\"2205\",\"district_name\":\"KOLASIB\"} , {\"state_code\":\"22\",\"district_code\":\"2208\",\"district_name\":\"LAWNGTLAI\"} , {\"state_code\":\"22\",\"district_code\":\"2202\",\"district_name\":\"LUNGLEI\"} , {\"state_code\":\"22\",\"district_code\":\"2204\",\"district_name\":\"MAMIT\"} , {\"state_code\":\"22\",\"district_code\":\"2203\",\"district_name\":\"SAIHA\"} , {\"state_code\":\"22\",\"district_code\":\"2207\",\"district_name\":\"SERCHHIP\"} , {\"state_code\":\"23\",\"district_code\":\"2308\",\"district_name\":\"Dimapur\"} , {\"state_code\":\"23\",\"district_code\":\"2301\",\"district_name\":\"KOHIMA\"} , {\"state_code\":\"23\",\"district_code\":\"2305\",\"district_name\":\"MOKOKCHUNG\"} , {\"state_code\":\"23\",\"district_code\":\"2307\",\"district_name\":\"MON\"} , {\"state_code\":\"23\",\"district_code\":\"2302\",\"district_name\":\"PHEK\"} , {\"state_code\":\"23\",\"district_code\":\"2306\",\"district_name\":\"TUENSANG\"} , {\"state_code\":\"23\",\"district_code\":\"2304\",\"district_name\":\"WOKHA\"} , {\"state_code\":\"23\",\"district_code\":\"2303\",\"district_name\":\"ZUNHEBOTO\"} , {\"state_code\":\"24\",\"district_code\":\"2421\",\"district_name\":\"ANGUL\"} , {\"state_code\":\"24\",\"district_code\":\"2405\",\"district_name\":\"BALESHWAR\"} , {\"state_code\":\"24\",\"district_code\":\"2414\",\"district_name\":\"BARGARH \"} , {\"state_code\":\"24\",\"district_code\":\"2417\",\"district_name\":\"BHADRAK \"} , {\"state_code\":\"24\",\"district_code\":\"2409\",\"district_name\":\"BOLANGIR\"} , {\"state_code\":\"24\",\"district_code\":\"2426\",\"district_name\":\"BOUDH\"} , {\"state_code\":\"24\",\"district_code\":\"2406\",\"district_name\":\"CUTTACK\"} , {\"state_code\":\"24\",\"district_code\":\"2416\",\"district_name\":\"DEOGARH\"} , {\"state_code\":\"24\",\"district_code\":\"2407\",\"district_name\":\"DHENKANAL\"} , {\"state_code\":\"24\",\"district_code\":\"2424\",\"district_name\":\"GAJAPATI\"} , {\"state_code\":\"24\",\"district_code\":\"2412\",\"district_name\":\"GANJAM\"} , {\"state_code\":\"24\",\"district_code\":\"2419\",\"district_name\":\"JAGATSINGHAPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2420\",\"district_name\":\"JAJPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2415\",\"district_name\":\"JHARSUGUDA\"} , {\"state_code\":\"24\",\"district_code\":\"2410\",\"district_name\":\"KALAHANDI\"} , {\"state_code\":\"24\",\"district_code\":\"2408\",\"district_name\":\"KANDHAMAL\"} , {\"state_code\":\"24\",\"district_code\":\"2418\",\"district_name\":\"KENDRAPARA\"} , {\"state_code\":\"24\",\"district_code\":\"2403\",\"district_name\":\"KENDUJHAR\"} , {\"state_code\":\"24\",\"district_code\":\"2423\",\"district_name\":\"KHORDHA(BHUBANESWAR)\"} , {\"state_code\":\"24\",\"district_code\":\"2411\",\"district_name\":\"KORAPUT\"} , {\"state_code\":\"24\",\"district_code\":\"2431\",\"district_name\":\"MALKANGIRI\"} , {\"state_code\":\"24\",\"district_code\":\"2404\",\"district_name\":\"MAYURBHANJ\"} , {\"state_code\":\"24\",\"district_code\":\"2430\",\"district_name\":\"NABARANGAPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2422\",\"district_name\":\"NAYAGARH\"} , {\"state_code\":\"24\",\"district_code\":\"2428\",\"district_name\":\"NUAPADA\"} , {\"state_code\":\"24\",\"district_code\":\"2413\",\"district_name\":\"PURI\"} , {\"state_code\":\"24\",\"district_code\":\"2429\",\"district_name\":\"RAYAGADA\"} , {\"state_code\":\"24\",\"district_code\":\"2401\",\"district_name\":\"SAMBALPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2427\",\"district_name\":\"SONEPUR\"} , {\"state_code\":\"24\",\"district_code\":\"2402\",\"district_name\":\"SUNDARGARH\"} , {\"state_code\":\"25\",\"district_code\":\"2502\",\"district_name\":\"KARAIKAL\"} , {\"state_code\":\"25\",\"district_code\":\"2503\",\"district_name\":\"MAHE\"} , {\"state_code\":\"25\",\"district_code\":\"2501\",\"district_name\":\"PONDICHERRY\"} , {\"state_code\":\"25\",\"district_code\":\"2504\",\"district_name\":\"YANAM\"} , {\"state_code\":\"26\",\"district_code\":\"2602\",\"district_name\":\"AMRITSAR\"} , {\"state_code\":\"26\",\"district_code\":\"2621\",\"district_name\":\"BARNALA\"} , {\"state_code\":\"26\",\"district_code\":\"2611\",\"district_name\":\"Bathinda\"} , {\"state_code\":\"26\",\"district_code\":\"2618\",\"district_name\":\"FATEHGARH SAHIB\"} , {\"state_code\":\"26\",\"district_code\":\"2603\",\"district_name\":\"FIROZEPUR\"} , {\"state_code\":\"26\",\"district_code\":\"2612\",\"district_name\":\"Faridkot\"} , {\"state_code\":\"26\",\"district_code\":\"2601\",\"district_name\":\"GURDASPUR\"} , {\"state_code\":\"26\",\"district_code\":\"2607\",\"district_name\":\"HOSHIARPUR\"} , {\"state_code\":\"26\",\"district_code\":\"2605\",\"district_name\":\"JALANDHAR\"} , {\"state_code\":\"26\",\"district_code\":\"2606\",\"district_name\":\"KAPURTHALA\"} , {\"state_code\":\"26\",\"district_code\":\"2604\",\"district_name\":\"LUDHIANA\"} , {\"state_code\":\"26\",\"district_code\":\"2617\",\"district_name\":\"MANSA\"} , {\"state_code\":\"26\",\"district_code\":\"2615\",\"district_name\":\"MOGA\"} , {\"state_code\":\"26\",\"district_code\":\"2616\",\"district_name\":\"MUKTSAR *\"} , {\"state_code\":\"26\",\"district_code\":\"2622\",\"district_name\":\"Mohali\"} , {\"state_code\":\"26\",\"district_code\":\"2614\",\"district_name\":\"NAWANSHAHR \"} , {\"state_code\":\"26\",\"district_code\":\"2609\",\"district_name\":\"PATIALA\"} , {\"state_code\":\"26\",\"district_code\":\"2608\",\"district_name\":\"RUPNAGAR\"} , {\"state_code\":\"26\",\"district_code\":\"2619\",\"district_name\":\"SAS NAGAR\"} , {\"state_code\":\"26\",\"district_code\":\"2610\",\"district_name\":\"Sangrur\"} , {\"state_code\":\"26\",\"district_code\":\"2620\",\"district_name\":\"TARAN TARAN\"} , {\"state_code\":\"27\",\"district_code\":\"2701\",\"district_name\":\"Ajmer\"} , {\"state_code\":\"27\",\"district_code\":\"2702\",\"district_name\":\"Alwar\"} , {\"state_code\":\"27\",\"district_code\":\"2728\",\"district_name\":\"BANSWARA\"} , {\"state_code\":\"27\",\"district_code\":\"2717\",\"district_name\":\"BARMER\"} , {\"state_code\":\"27\",\"district_code\":\"2703\",\"district_name\":\"Baran\"} , {\"state_code\":\"27\",\"district_code\":\"2704\",\"district_name\":\"Bharatpur\"} , {\"state_code\":\"27\",\"district_code\":\"2705\",\"district_name\":\"Bhilwara\"} , {\"state_code\":\"27\",\"district_code\":\"2706\",\"district_name\":\"Bikaner\"} , {\"state_code\":\"27\",\"district_code\":\"2707\",\"district_name\":\"Bundi\"} , {\"state_code\":\"27\",\"district_code\":\"2729\",\"district_name\":\"CHITTORGARH\"} , {\"state_code\":\"27\",\"district_code\":\"2708\",\"district_name\":\"Churu\"} , {\"state_code\":\"27\",\"district_code\":\"2727\",\"district_name\":\"DUNGARPUR\"} , {\"state_code\":\"27\",\"district_code\":\"2711\",\"district_name\":\"Dausa\"} , {\"state_code\":\"27\",\"district_code\":\"2712\",\"district_name\":\"Dholpur\"} , {\"state_code\":\"27\",\"district_code\":\"2713\",\"district_name\":\"Hanumangarh\"} , {\"state_code\":\"27\",\"district_code\":\"2716\",\"district_name\":\"JAISALMER\"} , {\"state_code\":\"27\",\"district_code\":\"2718\",\"district_name\":\"JALORE\"} , {\"state_code\":\"27\",\"district_code\":\"2732\",\"district_name\":\"JHALAWAR\"} , {\"state_code\":\"27\",\"district_code\":\"2714\",\"district_name\":\"Jaipur\"} , {\"state_code\":\"27\",\"district_code\":\"2715\",\"district_name\":\"Jhunjhunu\"} , {\"state_code\":\"27\",\"district_code\":\"2720\",\"district_name\":\"Jodhpur\"} , {\"state_code\":\"27\",\"district_code\":\"2709\",\"district_name\":\"KARAULI\"} , {\"state_code\":\"27\",\"district_code\":\"2721\",\"district_name\":\"Kota\"} , {\"state_code\":\"27\",\"district_code\":\"2723\",\"district_name\":\"Nagaur\"} , {\"state_code\":\"27\",\"district_code\":\"2724\",\"district_name\":\"Pali\"} , {\"state_code\":\"27\",\"district_code\":\"2725\",\"district_name\":\"Pratapgarh\"} , {\"state_code\":\"27\",\"district_code\":\"2730\",\"district_name\":\"Rajsamand\"} , {\"state_code\":\"27\",\"district_code\":\"2710\",\"district_name\":\"SAWAI MADHOPUR\"} , {\"state_code\":\"27\",\"district_code\":\"2719\",\"district_name\":\"SIROHI\"} , {\"state_code\":\"27\",\"district_code\":\"2731\",\"district_name\":\"Sikar\"} , {\"state_code\":\"27\",\"district_code\":\"2733\",\"district_name\":\"Sri Ganganagar\"} , {\"state_code\":\"27\",\"district_code\":\"2722\",\"district_name\":\"TONK\"} , {\"state_code\":\"27\",\"district_code\":\"2726\",\"district_name\":\"UDAIPUR\"} , {\"state_code\":\"28\",\"district_code\":\"2802\",\"district_name\":\"EAST DISTRICT\"} , {\"state_code\":\"28\",\"district_code\":\"2801\",\"district_name\":\"NORTH DISTRICT\"} , {\"state_code\":\"28\",\"district_code\":\"2803\",\"district_name\":\"SOUTH DISTRICT\"} , {\"state_code\":\"28\",\"district_code\":\"2804\",\"district_name\":\"WEST DISTRICT\"} , {\"state_code\":\"29\",\"district_code\":\"2931\",\"district_name\":\"ARIYALUR\"} , {\"state_code\":\"29\",\"district_code\":\"2933\",\"district_name\":\"CHENNAI\"} , {\"state_code\":\"29\",\"district_code\":\"2911\",\"district_name\":\"COIMBATORE\"} , {\"state_code\":\"29\",\"district_code\":\"2903\",\"district_name\":\"CUDDALORE\"} , {\"state_code\":\"29\",\"district_code\":\"2909\",\"district_name\":\"DHARMAPURI\"} , {\"state_code\":\"29\",\"district_code\":\"2922\",\"district_name\":\"DINDIGUL\"} , {\"state_code\":\"29\",\"district_code\":\"2910\",\"district_name\":\"ERODE\"} , {\"state_code\":\"29\",\"district_code\":\"2901\",\"district_name\":\"KANCHIPURAM\"} , {\"state_code\":\"29\",\"district_code\":\"2928\",\"district_name\":\"KANNIYAKUMARI\"} , {\"state_code\":\"29\",\"district_code\":\"2917\",\"district_name\":\"KARUR\"} , {\"state_code\":\"29\",\"district_code\":\"2930\",\"district_name\":\"KRISHNAGIRI\"} , {\"state_code\":\"29\",\"district_code\":\"2920\",\"district_name\":\"MADURAI\"} , {\"state_code\":\"29\",\"district_code\":\"2914\",\"district_name\":\"NAGAPATTINAM\"} , {\"state_code\":\"29\",\"district_code\":\"2908\",\"district_name\":\"NAMAKKAL\"} , {\"state_code\":\"29\",\"district_code\":\"2918\",\"district_name\":\"PERAMBALUR\"} , {\"state_code\":\"29\",\"district_code\":\"2919\",\"district_name\":\"PUDUKKOTTAI\"} , {\"state_code\":\"29\",\"district_code\":\"2923\",\"district_name\":\"RAMANATHAPURAM\"} , {\"state_code\":\"29\",\"district_code\":\"2907\",\"district_name\":\"SALEM\"} , {\"state_code\":\"29\",\"district_code\":\"2925\",\"district_name\":\"SIVAGANGAI\"} , {\"state_code\":\"29\",\"district_code\":\"2913\",\"district_name\":\"THANJAVUR\"} , {\"state_code\":\"29\",\"district_code\":\"2912\",\"district_name\":\"THE NILGIRIS\"} , {\"state_code\":\"29\",\"district_code\":\"2921\",\"district_name\":\"THENI\"} , {\"state_code\":\"29\",\"district_code\":\"2927\",\"district_name\":\"THOOTHUKKUDI\"} , {\"state_code\":\"29\",\"district_code\":\"2916\",\"district_name\":\"TIRUCHIRAPPALLI\"} , {\"state_code\":\"29\",\"district_code\":\"2926\",\"district_name\":\"TIRUNELVELI\"} , {\"state_code\":\"29\",\"district_code\":\"2932\",\"district_name\":\"TIRUPUR\"} , {\"state_code\":\"29\",\"district_code\":\"2902\",\"district_name\":\"TIRUVALLUR\"} , {\"state_code\":\"29\",\"district_code\":\"2906\",\"district_name\":\"TIRUVANNAMALAI\"} , {\"state_code\":\"29\",\"district_code\":\"2915\",\"district_name\":\"TIRUVARUR\"} , {\"state_code\":\"29\",\"district_code\":\"2905\",\"district_name\":\"VELLORE\"} , {\"state_code\":\"29\",\"district_code\":\"2904\",\"district_name\":\"VILLUPURAM\"} , {\"state_code\":\"29\",\"district_code\":\"2924\",\"district_name\":\"VIRUDHUNAGAR\"} , {\"state_code\":\"30\",\"district_code\":\"3004\",\"district_name\":\"DHALAI\"} , {\"state_code\":\"30\",\"district_code\":\"3002\",\"district_name\":\"SOUTH TRIPURA\"} , {\"state_code\":\"30\",\"district_code\":\"3003\",\"district_name\":\"SOUTH TRIPURA\"} , {\"state_code\":\"30\",\"district_code\":\"3001\",\"district_name\":\"WEST TRIPURA\"} , {\"state_code\":\"31\",\"district_code\":\"3120\",\"district_name\":\"AGRA\"} , {\"state_code\":\"31\",\"district_code\":\"3118\",\"district_name\":\"ALIGARH\"} , {\"state_code\":\"31\",\"district_code\":\"3145\",\"district_name\":\"ALLAHABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3178\",\"district_name\":\"AMBEDKAR NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3169\",\"district_name\":\"AURAIYA\"} , {\"state_code\":\"31\",\"district_code\":\"3157\",\"district_name\":\"AZAMGARH\"} , {\"state_code\":\"31\",\"district_code\":\"3165\",\"district_name\":\"BAGHPAT\"} , {\"state_code\":\"31\",\"district_code\":\"3146\",\"district_name\":\"BAHRAICH\"} , {\"state_code\":\"31\",\"district_code\":\"3159\",\"district_name\":\"BALLIA\"} , {\"state_code\":\"31\",\"district_code\":\"3175\",\"district_name\":\"BALRAMPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3142\",\"district_name\":\"BANDA\"} , {\"state_code\":\"31\",\"district_code\":\"3148\",\"district_name\":\"BARABANKI\"} , {\"state_code\":\"31\",\"district_code\":\"3125\",\"district_name\":\"BAREILLY\"} , {\"state_code\":\"31\",\"district_code\":\"3153\",\"district_name\":\"BASTI\"} , {\"state_code\":\"31\",\"district_code\":\"3109\",\"district_name\":\"BIJNOR\"} , {\"state_code\":\"31\",\"district_code\":\"3124\",\"district_name\":\"BUDAUN\"} , {\"state_code\":\"31\",\"district_code\":\"3117\",\"district_name\":\"BULANDSHAHR\"} , {\"state_code\":\"31\",\"district_code\":\"3171\",\"district_name\":\"CHANDAULI\"} , {\"state_code\":\"31\",\"district_code\":\"3177\",\"district_name\":\"CHITRAKOOT\"} , {\"state_code\":\"31\",\"district_code\":\"3155\",\"district_name\":\"DEORIA\"} , {\"state_code\":\"31\",\"district_code\":\"3122\",\"district_name\":\"ETAH\"} , {\"state_code\":\"31\",\"district_code\":\"3135\",\"district_name\":\"ETAWAH\"} , {\"state_code\":\"31\",\"district_code\":\"3149\",\"district_name\":\"FAIZABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3134\",\"district_name\":\"FARRUKHABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3143\",\"district_name\":\"FATEHPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3121\",\"district_name\":\"FIROZABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3164\",\"district_name\":\"GAUTAM BUDDHA NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3116\",\"district_name\":\"GHAZIABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3160\",\"district_name\":\"GHAZIPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3147\",\"district_name\":\"GONDA\"} , {\"state_code\":\"31\",\"district_code\":\"3154\",\"district_name\":\"GORAKHPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3141\",\"district_name\":\"HAMIRPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3130\",\"district_name\":\"HARDOI\"} , {\"state_code\":\"31\",\"district_code\":\"3138\",\"district_name\":\"JALAUN\"} , {\"state_code\":\"31\",\"district_code\":\"3158\",\"district_name\":\"JAUNPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3139\",\"district_name\":\"JHANSI\"} , {\"state_code\":\"31\",\"district_code\":\"3167\",\"district_name\":\"JYOTIBA PHOOLE NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3168\",\"district_name\":\"KANNAUJ\"} , {\"state_code\":\"31\",\"district_code\":\"3136\",\"district_name\":\"KANPUR DEHAT\"} , {\"state_code\":\"31\",\"district_code\":\"3137\",\"district_name\":\"KANPUR NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3170\",\"district_name\":\"KAUSHAMBI\"} , {\"state_code\":\"31\",\"district_code\":\"3128\",\"district_name\":\"KHERI\"} , {\"state_code\":\"31\",\"district_code\":\"3172\",\"district_name\":\"KUSHI NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3140\",\"district_name\":\"LALITPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3132\",\"district_name\":\"LUCKNOW\"} , {\"state_code\":\"31\",\"district_code\":\"3166\",\"district_name\":\"MAHAMAYA NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3152\",\"district_name\":\"MAHARAJGANJ\"} , {\"state_code\":\"31\",\"district_code\":\"3179\",\"district_name\":\"MAHOBA\"} , {\"state_code\":\"31\",\"district_code\":\"3123\",\"district_name\":\"MAINPURI\"} , {\"state_code\":\"31\",\"district_code\":\"3119\",\"district_name\":\"MATHURA\"} , {\"state_code\":\"31\",\"district_code\":\"3156\",\"district_name\":\"MAU\"} , {\"state_code\":\"31\",\"district_code\":\"3115\",\"district_name\":\"MEERUT\"} , {\"state_code\":\"31\",\"district_code\":\"3162\",\"district_name\":\"MIRZAPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3110\",\"district_name\":\"MORADABAD\"} , {\"state_code\":\"31\",\"district_code\":\"3114\",\"district_name\":\"MUZAFFARNAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3126\",\"district_name\":\"PILIBHIT\"} , {\"state_code\":\"31\",\"district_code\":\"3144\",\"district_name\":\"PRATAPGARH\"} , {\"state_code\":\"31\",\"district_code\":\"3133\",\"district_name\":\"RAE BARELI\"} , {\"state_code\":\"31\",\"district_code\":\"3111\",\"district_name\":\"RAMPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3112\",\"district_name\":\"SAHARANPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3174\",\"district_name\":\"SANT KABEER NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3173\",\"district_name\":\"SANT RAVIDAS NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3127\",\"district_name\":\"SHAHJAHANPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3176\",\"district_name\":\"SHRAVASTI\"} , {\"state_code\":\"31\",\"district_code\":\"3151\",\"district_name\":\"SIDDHARTH NAGAR\"} , {\"state_code\":\"31\",\"district_code\":\"3129\",\"district_name\":\"SITAPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3163\",\"district_name\":\"SONBHADRA\"} , {\"state_code\":\"31\",\"district_code\":\"3150\",\"district_name\":\"SULTANPUR\"} , {\"state_code\":\"31\",\"district_code\":\"3131\",\"district_name\":\"UNNAO\"} , {\"state_code\":\"31\",\"district_code\":\"3161\",\"district_name\":\"VARANASI\"} , {\"state_code\":\"32\",\"district_code\":\"3215\",\"district_name\":\"24 PARGANAS (NORTH)\"} , {\"state_code\":\"32\",\"district_code\":\"3216\",\"district_name\":\"24 PARGANAS SOUTH\"} , {\"state_code\":\"32\",\"district_code\":\"3213\",\"district_name\":\"BANKURA\"} , {\"state_code\":\"32\",\"district_code\":\"3203\",\"district_name\":\"BIRBHUM\"} , {\"state_code\":\"32\",\"district_code\":\"3202\",\"district_name\":\"BURDWAN\"} , {\"state_code\":\"32\",\"district_code\":\"3208\",\"district_name\":\"COOCHBEHAR\"} , {\"state_code\":\"32\",\"district_code\":\"3204\",\"district_name\":\"DARJEELING\"} , {\"state_code\":\"32\",\"district_code\":\"3217\",\"district_name\":\"DINAJPUR DAKSHIN\"} , {\"state_code\":\"32\",\"district_code\":\"3218\",\"district_name\":\"DINAJPUR UTTAR\"} , {\"state_code\":\"32\",\"district_code\":\"3206\",\"district_name\":\"HOOGHLY\"} , {\"state_code\":\"32\",\"district_code\":\"3205\",\"district_name\":\"HOWRAH\"} , {\"state_code\":\"32\",\"district_code\":\"3207\",\"district_name\":\"JALPAIGURI\"} , {\"state_code\":\"32\",\"district_code\":\"3219\",\"district_name\":\"Kolkata\"} , {\"state_code\":\"32\",\"district_code\":\"3209\",\"district_name\":\"MALDAH\"} , {\"state_code\":\"32\",\"district_code\":\"3212\",\"district_name\":\"MURSHIDABAD\"} , {\"state_code\":\"32\",\"district_code\":\"3201\",\"district_name\":\"NADIA\"} , {\"state_code\":\"32\",\"district_code\":\"3210\",\"district_name\":\"PASCHIM MEDINIPUR\"} , {\"state_code\":\"32\",\"district_code\":\"3211\",\"district_name\":\"PURBA MEDINIPUR\"} , {\"state_code\":\"32\",\"district_code\":\"3214\",\"district_name\":\"PURULIA\"} , {\"state_code\":\"33\",\"district_code\":\"3311\",\"district_name\":\"BASTAR\"} , {\"state_code\":\"33\",\"district_code\":\"3301\",\"district_name\":\"BILASPUR\"} , {\"state_code\":\"33\",\"district_code\":\"3312\",\"district_name\":\"DANTEWADA\"} , {\"state_code\":\"33\",\"district_code\":\"3309\",\"district_name\":\"DHAMTARI\"} , {\"state_code\":\"33\",\"district_code\":\"3303\",\"district_name\":\"DURG\"} , {\"state_code\":\"33\",\"district_code\":\"3314\",\"district_name\":\"JANJGIR-CHAMPA\"} , {\"state_code\":\"33\",\"district_code\":\"3307\",\"district_name\":\"JASHPUR\"} , {\"state_code\":\"33\",\"district_code\":\"3310\",\"district_name\":\"KANKER\"} , {\"state_code\":\"33\",\"district_code\":\"3302\",\"district_name\":\"KAWARDHA\"} , {\"state_code\":\"33\",\"district_code\":\"3308\",\"district_name\":\"KORBA\"} , {\"state_code\":\"33\",\"district_code\":\"3306\",\"district_name\":\"KOREA\"} , {\"state_code\":\"33\",\"district_code\":\"3315\",\"district_name\":\"MAHASAMUND\"} , {\"state_code\":\"33\",\"district_code\":\"3313\",\"district_name\":\"RAIGARH\"} , {\"state_code\":\"33\",\"district_code\":\"3316\",\"district_name\":\"RAIPUR\"} , {\"state_code\":\"33\",\"district_code\":\"3304\",\"district_name\":\"RAJNANDAGON\"} , {\"state_code\":\"33\",\"district_code\":\"3305\",\"district_name\":\"SURGUJA\"} , {\"state_code\":\"34\",\"district_code\":\"3420\",\"district_name\":\"BOKARO\"} , {\"state_code\":\"34\",\"district_code\":\"3417\",\"district_name\":\"CHATRA\"} , {\"state_code\":\"34\",\"district_code\":\"3422\",\"district_name\":\"DEOGHAR\"} , {\"state_code\":\"34\",\"district_code\":\"3421\",\"district_name\":\"DHANBAD\"} , {\"state_code\":\"34\",\"district_code\":\"3411\",\"district_name\":\"DUMKA\"} , {\"state_code\":\"34\",\"district_code\":\"3410\",\"district_name\":\"EAST SINGHBHUM\"} , {\"state_code\":\"34\",\"district_code\":\"3407\",\"district_name\":\"GARHWA\"} , {\"state_code\":\"34\",\"district_code\":\"3419\",\"district_name\":\"GIRIDIH\"} , {\"state_code\":\"34\",\"district_code\":\"3415\",\"district_name\":\"GODDA\"} , {\"state_code\":\"34\",\"district_code\":\"3403\",\"district_name\":\"GUMLA\"} , {\"state_code\":\"34\",\"district_code\":\"3416\",\"district_name\":\"HAZARIBAGH\"} , {\"state_code\":\"34\",\"district_code\":\"3412\",\"district_name\":\"JAMTARA\"} , {\"state_code\":\"34\",\"district_code\":\"3423\",\"district_name\":\"KHUNTI\"} , {\"state_code\":\"34\",\"district_code\":\"3418\",\"district_name\":\"KODERMA\"} , {\"state_code\":\"34\",\"district_code\":\"3406\",\"district_name\":\"LATEHAR\"} , {\"state_code\":\"34\",\"district_code\":\"3402\",\"district_name\":\"LOHARDAGA\"} , {\"state_code\":\"34\",\"district_code\":\"3414\",\"district_name\":\"PAKUR\"} , {\"state_code\":\"34\",\"district_code\":\"3405\",\"district_name\":\"PALAMU\"} , {\"state_code\":\"34\",\"district_code\":\"3424\",\"district_name\":\"RAMGARH\"} , {\"state_code\":\"34\",\"district_code\":\"3401\",\"district_name\":\"RANCHI\"} , {\"state_code\":\"34\",\"district_code\":\"3413\",\"district_name\":\"SAHEBGANJ\"} , {\"state_code\":\"34\",\"district_code\":\"3409\",\"district_name\":\"SARAIKELA KHARSAWAN\"} , {\"state_code\":\"34\",\"district_code\":\"3404\",\"district_name\":\"SIMDEGA\"} , {\"state_code\":\"34\",\"district_code\":\"3408\",\"district_name\":\"WEST SINGHBHUM\"} , {\"state_code\":\"35\",\"district_code\":\"3507\",\"district_name\":\"ALMORA\"} , {\"state_code\":\"35\",\"district_code\":\"3512\",\"district_name\":\"BAGESHWAR\"} , {\"state_code\":\"35\",\"district_code\":\"3504\",\"district_name\":\"CHAMOLI\"} , {\"state_code\":\"35\",\"district_code\":\"3510\",\"district_name\":\"CHAMPAWAT\"} , {\"state_code\":\"35\",\"district_code\":\"3502\",\"district_name\":\"DEHRADUN\"} , {\"state_code\":\"35\",\"district_code\":\"3503\",\"district_name\":\"HARIDWAR\"} , {\"state_code\":\"35\",\"district_code\":\"3508\",\"district_name\":\"NAINITAL\"} , {\"state_code\":\"35\",\"district_code\":\"3505\",\"district_name\":\"PAURI GARHWAL\"} , {\"state_code\":\"35\",\"district_code\":\"3511\",\"district_name\":\"PITHORAGARH\"} , {\"state_code\":\"35\",\"district_code\":\"3506\",\"district_name\":\"RUDRA PRAYAG\"} , {\"state_code\":\"35\",\"district_code\":\"3513\",\"district_name\":\"TEHRI GARHWAL\"} , {\"state_code\":\"35\",\"district_code\":\"3509\",\"district_name\":\"UDAM SINGH NAGAR\"} , {\"state_code\":\"35\",\"district_code\":\"3501\",\"district_name\":\"UTTAR KASHI\"} , {\"state_code\":\"36\",\"district_code\":\"3601\",\"district_name\":\"CENTRAL DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3604\",\"district_name\":\"EAST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3607\",\"district_name\":\"NEW DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3602\",\"district_name\":\"NORTH DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3605\",\"district_name\":\"NORTH EAST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3608\",\"district_name\":\"NORTH WEST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3603\",\"district_name\":\"SOUTH DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3606\",\"district_name\":\"SOUTH WEST DELHI\"} , {\"state_code\":\"36\",\"district_code\":\"3609\",\"district_name\":\"WEST DELHI\"} , {\"state_code\":\"37\",\"district_code\":\"3701\",\"district_name\":\"CHANDIGARH\"} , {\"state_code\":\"38\",\"district_code\":\"3801\",\"district_name\":\"Almora\"} , {\"state_code\":\"38\",\"district_code\":\"3802\",\"district_name\":\"Bageshwar\"} , {\"state_code\":\"38\",\"district_code\":\"3803\",\"district_name\":\"Chamoli\"} , {\"state_code\":\"38\",\"district_code\":\"3804\",\"district_name\":\"Champawat\"} , {\"state_code\":\"38\",\"district_code\":\"3805\",\"district_name\":\"Dehradun\"} , {\"state_code\":\"38\",\"district_code\":\"3806\",\"district_name\":\"Haridwar\"} , {\"state_code\":\"38\",\"district_code\":\"3807\",\"district_name\":\"Nainital\"} , {\"state_code\":\"38\",\"district_code\":\"3808\",\"district_name\":\"Pauri Garhwal\"} , {\"state_code\":\"38\",\"district_code\":\"3809\",\"district_name\":\"Pithoragarh\"} , {\"state_code\":\"38\",\"district_code\":\"3810\",\"district_name\":\"Rudra Prayag\"} , {\"state_code\":\"38\",\"district_code\":\"3811\",\"district_name\":\"Tehri Garhwal\"} , {\"state_code\":\"38\",\"district_code\":\"3812\",\"district_name\":\"Udham Singh Nagar\"} , {\"state_code\":\"38\",\"district_code\":\"3813\",\"district_name\":\"Uttarkashi\"}");
               out.println("]}"); 
        
        }
        if(step.equalsIgnoreCase("getParent"))
        {
             out.println("{\"list\":[");
          User u=(User)request.getSession().getAttribute("user");
      Connection con=null ;
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("dept"));
      int dept_id=Integer.parseInt(dept);
      String state=StringEscapeUtils.escapeHtml(request.getParameter("state"));
      int state_id=Integer.parseInt(state);     
      BranchBean branchbean=new BranchBean();
      List ar=branchbean.getParentList(con, state_id, dept);
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext()){ 
        BranchBean ds=(BranchBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getParent_id()+"\",\"txt\":\""+ ds.getParent_name()+"\"}");
    }  
       out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getPurpose"))
        {
             out.println("{\"list\":[");
         User u=(User)request.getSession().getAttribute("user")!=null?(User)request.getSession().getAttribute("user"): new User() ;
    Connection con=u.getConnection();    
    String department=StringEscapeUtils.escapeHtml(request.getParameter("dept")!=null?request.getParameter("dept"):"");
    String taxtype=StringEscapeUtils.escapeHtml(request.getParameter("taxtype")==null ? "" : request.getParameter("taxtype")) ;
    //String reponseParts[] = department.split("@");
    //String  departmentid = reponseParts[0];
     GenericBean gb=new GenericBean();
     try{
    String departmentid=gb.getDeptIdByDeptName(con,department);
    GenericBean gad=new GenericBean();
    ArrayList ar=gad.getTaxTypeByDeptid(con,departmentid);
    Iterator it=ar.iterator();
    int i=0;
    while(it.hasNext()){ 
        GenericBean ds=(GenericBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getMajortax() +"\",\"txt\":\""+ ds.getMajortax() +"\"}");
    }
        }   catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
         out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getTaxId"))
        {
              out.println("{\"list\":[");
        User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("dept"));
       GenericBean gb=new GenericBean();
       try{
      String departmentid=gb.getDeptIdByDeptName(con,dept);
      GenericBean gad=new GenericBean();
      ArrayList ar=gad.getIdProofByDeptidUnRegistered(con,departmentid);
      Iterator itr=ar.iterator();
      int i=0;
      while(itr.hasNext())
      { 
        GenericBean dss=(GenericBean) itr.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + dss.getIdproof() +"\",\"txt\":\""+ dss.getIdproof() +"\"}");
    }}      catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getLocation"))
        {
            out.println("{\"list\":[");
          User u = (User) request.getSession().getAttribute("user") != null ? (User) request.getSession().getAttribute("user") : new User();
            Connection con = null;
            con = u.getConnection();
            String dept = StringEscapeUtils.escapeHtml(request.getParameter("dept"));
            GenericBean gb = new GenericBean();
            try{
            String departmentid = gb.getDeptIdByDeptName(con, dept);
            List ar = BranchBean.getBranch(con, departmentid);
            //ArrayList ar=gad.getBranchLocationByDepartment(con,Integer.parseInt(departmentid));
            Iterator itr = ar.iterator();
            int i = 0;
            while (itr.hasNext()){
                BranchBean dss = (BranchBean) itr.next();
                if (i == 0) {
                    i = 1;
                } else {
                    out.println(",");
                }
        //System.out.println(dss.getBranch_id()+" and "+dss.getBranch_name());
                out.println("{\"val\":\"" + dss.getBranch_id() +"\",\"txt\":\""+ dss.getBranch_name() +"\"}");
    }}      catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
     out.println("]}"); 
        }
        
        if(step.equalsIgnoreCase("getSubTax"))
        {out.println("{\"list\":[");
        User u=(User)request.getSession().getAttribute("user")!=null?(User)request.getSession().getAttribute("user"): new User() ;
    Connection con=u.getConnection();    
    String department=StringEscapeUtils.escapeHtml(request.getParameter("dept")!=null?request.getParameter("dept"):"");
    String taxtype=StringEscapeUtils.escapeHtml(request.getParameter("taxtype")==null ? "" : request.getParameter("taxtype")) ;
     GenericBean gb=new GenericBean();
     try{
     String departmentid=gb.getDeptIdByDeptName(con,department);
    GenericBean gad=new GenericBean();
    ArrayList ar=gad.getSubTaxTypeByDeptid(con,taxtype,departmentid);
    Iterator it=ar.iterator();
    int i=0;
    while(it.hasNext()){ 
        GenericBean ds=(GenericBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getTaxtype() +"\",\"txt\":\""+ ds.getTaxtype() +"\"}");
    } }   catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
        out.println("]}"); 
    }
        
        if(step.equalsIgnoreCase("getState"))
        {
        out.println("{\"list\":[");
         User u=new User();
       java.sql.Connection con=null;
        u.createConnection();
        con=u.getConnection();
      String state_code=request.getParameter("state_code");
      ArrayList ar=District.getDistrictList(con,state_code);
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      {
        District ds=(District) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"state_code\":\""+ds.STATE_CODE+"\",\"district_code\":\"" + ds.DISTRICT_CODE +"\",\"district_name\":\""+ ds.DISTRICT_NAME +"\"}");
      }
        out.println("]}"); 
        }
        
        
         if(step.equalsIgnoreCase("securityQ"))
        {
     //  out.println("{\"list\":[");
        User u=new User();
    u.createConnection();
    Connection con=u.getConnection();
    genericepayment.GenericBean gb=new genericepayment.GenericBean();
    
    String securityquestion="" ;
    String email=StringEscapeUtils.escapeHtml(request.getParameter("lemail")!=null?request.getParameter("lemail"):"");
    try{
     securityquestion=gb.getSecurityQuestionByEmail(con, email);
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
      if(securityquestion!="")
      {
       // out.println("{\"question\":\""+securityquestion+"\"}");
          out.println(securityquestion);
         
      }
      //  out.println("]}"); 
        }
         
         
            if(step.equalsIgnoreCase("getadrs"))
        {
     //  out.println("{\"list\":[");
        User u=new User();
    u.createConnection();
    Connection con=u.getConnection();
    genericepayment.GenericBean gb=new genericepayment.GenericBean();
    
    ArrayList ar=new ArrayList();
    String dept=StringEscapeUtils.escapeHtml(request.getParameter("dept")!=null?request.getParameter("dept"):"");
    String brnclcsn=StringEscapeUtils.escapeHtml(request.getParameter("brnclcsn")!=null?request.getParameter("brnclcsn"):"");
    try{
     ar=gb.getAdrsBranch(con, dept,brnclcsn);
     
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
     Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      {
        GenericBean genericbean=(GenericBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println(genericbean.getAddress());
      }
      //  out.println("]}"); 
        }
         
           if(step.equalsIgnoreCase("getpincode"))
        {
     //  out.println("{\"list\":[");
        User u=new User();
    u.createConnection();
    Connection con=u.getConnection();
    genericepayment.GenericBean gb=new genericepayment.GenericBean();
    
    ArrayList ar=new ArrayList();
    String dept=StringEscapeUtils.escapeHtml(request.getParameter("dept")!=null?request.getParameter("dept"):"");
    String brnclcsn=StringEscapeUtils.escapeHtml(request.getParameter("brnclcsn")!=null?request.getParameter("brnclcsn"):"");
    try{
     ar=gb.getPinBranch(con, dept,brnclcsn);
     
    }catch(Exception e){
        System.out.println(e.getMessage());
    }
     Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      {
        GenericBean genericbean=(GenericBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println(genericbean.getPincode());
      }
      //  out.println("]}"); 
        }
           
             else if(step.equalsIgnoreCase("branchlcsn")){
             out.println("{\"list\":[");
             User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      //u.createConnection();
      con=u.getConnection();
      String dept=StringEscapeUtils.escapeHtml(request.getParameter("state_code"));
      GenericAdminDao gad=new GenericAdminDao();
      ArrayList ar=new ArrayList();
            try {
                ar = gad.getBranchdata(con,dept);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericAdminBean ds=(GenericAdminBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getBranch_name() +"\",\"txt\":\""+ ds.getBranch_name() +"\"}");
    }  out.println("]}");     
         
        
        }
           
           else if(step.equalsIgnoreCase("getAnualYear")){//getqrteyear
             out.println("{\"list\":[");
             User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      con=u.getConnection();
      GenericBean gad=new GenericBean();
      ArrayList ar=new ArrayList();
            try {
                ar = gad.getFinclYr(con);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericBean ds=(GenericBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getQuarter()+"\",\"txt\":\""+ ds.getQuarter()+"\"}");
    }  out.println("]}");     
         
        
        }
           else if(step.equalsIgnoreCase("getqrteyear")){//getqrteyear
             out.println("{\"list\":[");
             User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      con=u.getConnection();
      GenericBean gad=new GenericBean();
      ArrayList ar=new ArrayList();
            try {
                ar = gad.getqrtYr(con);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericBean ds=(GenericBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getQuarter()+"\",\"txt\":\""+ ds.getQuarter()+"\"}");
    }  out.println("]}");     
         
        
        }
           
            else if(step.equalsIgnoreCase("departmnt")){//getqrteyear
             out.println("{\"list\":[");
             User u=(User)request.getSession().getAttribute("user")!=null? (User)request.getSession().getAttribute("user"): new User() ;
      Connection con=null ;
      con=u.getConnection();
      GenericBean gad=new GenericBean();
      ArrayList ar=new ArrayList();
            try {
                ar = gad.getdepartmnt(con);
            } catch (Exception ex) {
                Logger.getLogger(JsonService.class.getName()).log(Level.SEVERE, null, ex);
            }
      Iterator it=ar.iterator();
      int i=0;
      while(it.hasNext())
      { 
        GenericBean ds=(GenericBean) it.next();
        if(i==0)
            i=1;
        else
        out.println(","); 
        out.println("{\"val\":\"" + ds.getDepartmentid()+"\",\"txt\":\""+ ds.getDepartmentname()+"\"}");
        
    }  out.println("]}");     
         
        
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
