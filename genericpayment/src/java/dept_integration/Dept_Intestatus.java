/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dept_integration;

/**
 *
 * @author santosh
 */
import java.io.IOException;

import java.sql.Connection;
import java.sql.Statement;


import javax.servlet.*;
import javax.servlet.http.*;

import vicclass.User;
import dept_integration.Dept_Integbean;
public class Dept_Intestatus extends HttpServlet {
    
    
     private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType(CONTENT_TYPE);
        doPost(request,response);
    }
     public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
         try
        {
           
            User u=new User();
            u.createConnection();
            Connection conn=null;
            Statement st=null;
            conn=u.getConnection();//
            st= conn.createStatement();
            String[] sno=request.getParameterValues("chk");
            String[] sts=request.getParameterValues("sts");
            for(int i=0;i<sts.length;i++)
            {
                 if(sts[i].equals("Active")){
                     st.executeUpdate("update department_integration set status='Active' where sno='"+sno[i]+"'");	
                     if(i>0)
                     {
                     System.out.println("Data Updated");
                     }
            //int i=Integer.parseInt(sts);
           /* TreasuryBean tbean=new TreasuryBean();
            tbean.setSno(i);
            tbean.setStatus(sts[i]);
           
           // tbean.doInsertTax(conn,tbean);
            tbean.doUpdate(conn,tbean);*/
            }
            }
      // String 
        }
         catch(Exception e)
         {
         System.out.println("Exception is......"+e);
         }
    }
}
