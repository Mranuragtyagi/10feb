package jhpolice;

import genericepayment.GenericBean;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class JhPoliceChallan extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>JhPoliceChallan</title></head>");
        out.println("<body>");
        out.println("<p>The servlet has received a GET. This is the reply.</p>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
     RequestDispatcher dispatcher=null;
        String SCODE="ihSkaRaA";
        String challan_no=request.getParameter("challan_no");
        String amount=request.getParameter("amount");
        String treasurycode=request.getParameter("treasurycode");
        String secretcode=request.getParameter("secretcode");
        String name=request.getParameter("name");
        String vehicle_no=request.getParameter("vehicle_no");
          Challan ch=new Challan();
          ch.setChallan_no(challan_no);
          ch.setAmount(Double.valueOf(amount.equals("")?"0":amount).doubleValue());
          ch.setTreasurycode(treasurycode);
          ch.setSecretcode(secretcode);
          ch.setName(name);
          ch.setVehicle_no(vehicle_no);
     
        if(secretcode.equals("AaRakShi")){
        ch.doInsert();
       request.getSession().setAttribute("challan",ch);
       // response.sendRedirect("http://"+request.getHeader("HOST")+request.getContextPath()+"/jhpolice/pay_confirm.jsp");
      dispatcher= request.getRequestDispatcher("jhpolice/pay_confirm.jsp");
      dispatcher.forward(request,response); 
    }else{
        response.sendRedirect("http://wsdl.jhpolice.gov.in/smsresponse.php?STATUS=INVALID REQUEST&TRANS_DATE=INVALID REQUEST&TRANSID=INVALID REQUEST&BANK_REFNO=INVALID REQUEST&BANK_NAME=INVALID REQUEST&CIN=INVALID REQUEST&CHALLAN_NO=INVALID REQUEST&SCODE="+SCODE);
    }
 }
}
