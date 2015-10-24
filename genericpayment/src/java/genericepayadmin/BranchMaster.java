package genericepayadmin;

import vicclass.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@author Rajiv*/
public class BranchMaster extends HttpServlet {
    protected void processGetRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        doPost(request, response);
    }
    
    protected void processPostRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd = null;
        String step = request.getParameter("step");
        Connection con=null;
        User u = (User)request.getSession().getAttribute("user"); 
        con=u.getConnection();
        try{
            if(step.equalsIgnoreCase("1")){
                String branch_name = request.getParameter("branchname");
                String branch_abbrevation = request.getParameter("abbrevation");
                int department=Integer.parseInt(request.getParameter("department"));
                int state=Integer.parseInt(request.getParameter("state"));
                int dist=Integer.parseInt(request.getParameter("city"));
                String address = request.getParameter("branchaddress");
                int pin = request.getParameter("pin")!=null ? Integer.parseInt(request.getParameter("pin")) : 0;
                String parent_id=request.getParameter("parent")!= null ? request.getParameter("parent"):"0";
                BranchBean getbranch =new BranchBean();
                getbranch.setBranch_name(branch_name);
                getbranch.setBranch_abbrevation(branch_abbrevation);                
                getbranch.setDepartment_id(department);
                getbranch.setState_id(state);
                getbranch.setDist_id(dist);
                getbranch.setAddress(address);
                getbranch.setPin(pin);
                getbranch.setParent_id(parent_id);
                try{
                getbranch.addBranch(con);
                }catch(Exception e){
                    System.out.println("Error in insertion of branch : " +e.getMessage());
                    if(rd==null)
                    rd=request.getRequestDispatcher("adminpayment/branchlocation.jsp?msg=Data Not Inserted! Please Try Again.");
                }
                if(rd==null)
                    rd=request.getRequestDispatcher("adminpayment/branchlocation.jsp?msg=Added Successfully!");
               
            }else if (step.equalsIgnoreCase("2")){
                int state=Integer.parseInt(request.getParameter("states"));
                int department=Integer.parseInt(request.getParameter("departments"));
                BranchBean getbranch =new BranchBean();                
                getbranch.setDepartment_id(department);
                getbranch.setState_id(state);
                List getbranchlist =  getbranch.getBranchList(con);
                request.setAttribute("getbranchlist", getbranchlist);
                if(rd==null)rd=request.getRequestDispatcher("adminpayment/listBranches.jsp");
               
            }
        }catch(Exception exception){
            System.err.println("Error Code :: BranchMaster :: " +exception.getMessage());
            if(step.equalsIgnoreCase("1")){
                if(rd==null)
                    rd=request.getRequestDispatcher("adminpayment/branchlocation.jsp");
              
            }else if(step.equalsIgnoreCase("2")){
                if(rd==null)
                    rd=request.getRequestDispatcher("adminpayment/listBranches.jsp");
            }
            
        }
         rd.forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processGetRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processPostRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
