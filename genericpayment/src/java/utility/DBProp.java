package utility;

import java.sql.*;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;

import java.util.Properties;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.lang.StringEscapeUtils;



public class DBProp extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    String appPath =null,sqlpath=null;
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        appPath= config.getServletContext().getRealPath("");
        sqlpath= appPath + "/WEB-INF/jhrpayonline.sql";
        appPath= appPath + "/WEB-INF/bdb.properties";
    }

    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        Connection conn =null;
        String step=request.getParameter("step");
        String flag="Y";
        Properties prop=(Properties)  request.getSession().getAttribute("prop");
        
        SystemGlobals.copyProperties(prop);
      
        
            //globals.enabled = props.getProperty("enabled");
        if(step.equals("conn")) {
         try {
                Class.forName(SystemGlobals.getDriver()) ;
              //   Class.forName("com.mysql.jdbc.Driver");    
                conn= DriverManager.getConnection("jdbc:mysql://"+ SystemGlobals.getHost()+"/", SystemGlobals.getUsername(), SystemGlobals.getPassword());
                // conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbname+"", "root", "");
               // conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jhrpayonline", "root", ""); 
                // conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/", "root", ""); 
               // dbname=SystemGlobals.getDbname();
              //String dbname=prop.getProperty("jdbc.dbname");
                request.getSession().setAttribute("conn",conn);
                out.print("OK");
            }
            catch(Exception ex) {
                flag="N";
                request.getSession().removeAttribute("prop");
                System.out.print(ex.getMessage());
            }
        }
        else
        if(step.equals("dbs")) {
            conn=(Connection) request.getSession().getAttribute("conn");
             
            try{
            Statement st=conn.createStatement();
              String sql="CREATE DATABASE "+SystemGlobals.getDbname();
           System.out.println("SQL "+sql);
                st.executeUpdate(sql);
                out.print("OK");
                st.close();
                conn.close();
            }catch(Exception ex) {
                flag="N";
                request.getSession().removeAttribute("prop");
                System.out.println("Error Creating DB :"+ex);
                out.print(ex.getMessage());
            }
        }
        else
        if(step.equals("tabs")) {
            conn=(Connection) request.getSession().getAttribute("conn");
          
            try{
               // sqlpath="C:/Users/zephaniah/Documents/NetBeansProjects/10feb/genericpayment/web/WEB-INF/jhrpayonline.sql";
                RunSqlScript.doImportTables(sqlpath);
                //save properties to project root folder
                OutputStream output = null;
                 output = new FileOutputStream(appPath);
                 prop.store(output, null);
                SystemGlobals.initGlobals(appPath); 
                SystemGlobals.initGlobalsGeneric();
                
              
              //insertion finish
                request.getSession().removeAttribute("prop");
              out.print("OK");
            }catch(Exception ex) {
                flag="N";
                request.getSession().removeAttribute("prop");
                out.print(ex.getMessage());
            }
        }
        
       
        
        out.close();
    }

    public void doPost(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
                Properties prop  = new Properties();
                
                
               
                String msg="OK";
           if( !SystemGlobals.getStatus(appPath)){
                String driver=StringEscapeUtils.escapeHtml(request.getParameter("driver"));
                String uname=StringEscapeUtils.escapeHtml(request.getParameter("username"));
                String pass=StringEscapeUtils.escapeHtml(request.getParameter("passw"));
                String dbname=StringEscapeUtils.escapeHtml(request.getParameter("dbname"));
                String dburl=StringEscapeUtils.escapeHtml(request.getParameter("durl"));
                String port=StringEscapeUtils.escapeHtml(request.getParameter("port"));
                String maxactive=StringEscapeUtils.escapeHtml(request.getParameter("maxactive"));
                String maxidle=StringEscapeUtils.escapeHtml(request.getParameter("maxidle"));
              
                    try {
                    String url="jdbc:mysql://";
                    url= url+dburl+":"+port+"/"+dbname;
                    //System.out.println("URL "+url);
                        // set the properties value
                        
                         prop.setProperty("enabled","true");
                         prop.setProperty("jdbc.driver", driver);
                         prop.setProperty("jdbc.url",url);
                         prop.setProperty("jdbc.username",uname);
                         prop.setProperty("jdbc.password", pass);
                         prop.setProperty("jdbc.dbname",dbname);
                         prop.setProperty("jdbc.host",dburl);
                         prop.setProperty("maxactive",maxactive);
                         prop.setProperty("maxidle",maxidle);
                         
                         
                         request.getSession().setAttribute("prop",prop);
                        //RunSqlScript.doImportTables(sqlpath);
                }catch(Exception e){
                
                msg="NO";
             
                }
                
               RequestDispatcher rd=request.getRequestDispatcher("db_result.jsp?msg="+msg);
               rd.forward(request,response);
                  
           
           }else{
               msg="Database is already configured.";
               RequestDispatcher rd=request.getRequestDispatcher("db.jsp?msg="+msg);
               rd.forward(request,response);
               
           }
           
    }
}
