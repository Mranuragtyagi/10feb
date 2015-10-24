package genericsettlement;

import com.oreilly.servlet.MultipartRequest;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import vicclass.User;

public class Settle extends HttpServlet {
    private static final String CONTENT_TYPE = "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>Settle</title></head>");
        out.println("<body>");
        out.println("<p>The servlet has received a GET. This is the reply.</p>");
        out.println("</body></html>");
        out.close();
    }

    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) throws ServletException, IOException {response.setContentType(CONTENT_TYPE);
        try{ 
                     //   String path=(String)getServletContext().getAttribute("path");
                     String path="/opt/txt";
                      //String path="F:/anurag" ;
                      //path=path+"/txt";
                     // User u =(User) request.getSession().getAttribute("user");
                          User u=new User();
                          java.sql.Connection conn = u.getConnection();
                          RequestDispatcher rd = null;
                          SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
                          SimpleDateFormat sdf1=new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
                          String step=request.getParameter("step");
                          SettleBean settlementbean=null;
                      if(step.equals("1")){// this step is used to insert data from text file to database
                          System.out.println("Inside Step 1");
                          boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                          int count=0;
                          String filename="";
                          String original="";
                          String line = null;
                          //int  linecount=0;
                          File f=null;
                          long size=0;
                          BufferedReader reader=null;
                         // SettlementBean settlementbean=null;
                          String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12="",s13="",s14="";
                          FileReader fr = null;
                          if(isMultipart){
                              try{
                              System.out.println("inside multipart..");
                                  MultipartRequest multi =
                                  new MultipartRequest(request,path, 500 *1024 * 1024, new com.oreilly.servlet.multipart.DefaultFileRenamePolicy());
                                  Enumeration files = multi.getFileNames();
                                  while (files.hasMoreElements()) {
                                     String name= (String)files.nextElement();
                                     filename = ""+multi.getFilesystemName(name);
                                      if(filename.equals("null")){
                                          throw new Exception("File is missing");
                                      }
                                      if(!(filename.substring(filename.length()-3).toUpperCase().equals("TXT"))){
                                          throw new Exception("Invalid File");
                                      }
                                     original = multi.getOriginalFileName(name);
                                     //String type = multi.getContentType(name);
                                     f = multi.getFile(name);
                                    if (filename != null && !filename.equals(original)) {
                                    }
                                    if (f != null) {
                                      size=f.length();
                                    }
                                  }
                                        File filer = new File(path+"/"+filename);
                                      try{
                                          reader = new BufferedReader(new FileReader(filer));
                                          //String currentLine;
                                          /* Scanner file = new Scanner(new FileReader(filer));
                                           while (file.hasNextLine()) {
                                             linecount++;
                                             file.nextLine();
                                           }*/
                                         while(reader.read()!=-1){
                                           // while((currentLine = reader.readLine()) != null){
                                             line=reader.readLine();
                                           
                                             String[] array =line.split("\\|");
                                             s1=array[0];   //HRKHDCTAX
                                             s2=array[1];  //MBOI3297253499
                                             s3=array[2];  //201119051172503201407572635
                                             s4=array[3];  //004000102010101
                                             s5=array[4];  // jhctd
                                             s6=array[5];  //NA
                                             s7=array[6];  //NA
                                             s8=array[7];  //NA
                                             s9=array[8];  //02200172603201450007
                                             s10=array[9]; //25/03/2014
                                             s11=array[10]; //19:57:45
                                             s12=array[11];  //60933.42
                                             s13=array[12];   //60933.42
                                             s14=array[13];  //393005288

                                            // System.out.println(s1+" "+s2+" "+s3+" "+s4+" "+s5+" "+s6+" "+s7+" "+s8+" "+s9+" "+s10+" "+s11+" "+s12+" "+s13+" "+s14);
                                             
                                             //storing value to the bean
                                              settlementbean = new SettleBean();
                                              settlementbean.setTransid(s2);
                                              settlementbean.setChallan_No(s3);
                                              settlementbean.setTreasury_code(s4);
                                              settlementbean.setCin(s9);
                                              String datetime=s10+" "+s11;
                                              Timestamp dtime = new Timestamp (sdf1.parse(datetime).getTime());
                                              settlementbean.setTransdate(dtime);
                                              settlementbean.setTotal1(Double.parseDouble(s12));
                                              settlementbean.setTotal2(Double.parseDouble(s13));
                                              settlementbean.setAddInfo(s14);
                                              settlementbean.setPos6(s6);
                                              settlementbean.setPos7(s7);
                                              settlementbean.setPos8(s8);
                                             //inserting data to database.
                                            int status=settlementbean.doInsertSettlement(conn);
                                              if(status==1){
                                                  String msg="Successfully Updated ";
                                                 // System.out.println(msg);
                                              }else{
                                                  String msg="Internal Error Occured.";
                                                 // System.out.println(msg);
                                              }
                                              
                                              count++;
                                            
                                          }
                                          String msg="Successfully Updated ";
                                          request.setAttribute("msg1",msg);
                                          request.setAttribute("count",count);
                                          rd =  request.getRequestDispatcher("genricsettle/uploadSettleTxt.jsp");
                                          rd.forward(request,response);
                                      }catch(SQLException sqle){
                                        System.out.println(sqle.getMessage());
                                            request.setAttribute("msg1",sqle.getMessage());
                                            rd =  request.getRequestDispatcher("genricsettle/uploadSettleTxt.jsp");
                                            rd.forward(request,response);
                                        }
                                      catch(Exception e){
                                        System.out.println(e.getMessage());
                                            request.setAttribute("msg1",e.getMessage());
                                            String msg="Successfully Updated ";
                                            request.setAttribute("msg1",msg);
                                            request.setAttribute("count",count);
                                            rd =  request.getRequestDispatcher("genricsettle/uploadSettleTxt.jsp");
                                            rd.forward(request,response);
                                        }
                                 
                              }catch(Exception e){
                                  System.out.println(e.getMessage());
                              }
                          }
                      }
                      if(step.equals("2")){//this step is used to get the settlement list.
                          System.out.println("Inside Step 2");
                          ArrayList<SettleBean> settleList=null;
                          settlementbean=new SettleBean();
                          //java.sql.Date pf=null,pt=null;
                          Date entry_date=request.getParameter("date").equals("") ? null : new Date(sdf.parse(request.getParameter("date")).getTime());
                          System.out.println(entry_date);
                          settleList=settlementbean.doSelectSettlementListByPeriod(conn,entry_date);
                          request.setAttribute("entry_date",request.getParameter("date"));
                          request.setAttribute("settlement",settleList);
                          request.getSession().setAttribute("settlement",settleList);
                          rd =  request.getRequestDispatcher("genricsettle/settleList.jsp");
                          rd.forward(request,response);
                          System.out.println(settleList.size());
                      }
                      
                    if(step.equals("3")){// this step is used to do forced settlement
                     System.out.println("Hurrey inside step 3");
                     ArrayList<SettleBean> settlement= (ArrayList<SettleBean>)request.getSession().getAttribute("settlement");
                     System.out.println(settlement.size());
                     settlementbean=new SettleBean();
                   int flag=settlementbean.doInsertForcedSettlement(conn,settlement);
                     if(flag==1){
                     System.out.println("Successfully Updated...");
                         String msg="Forced Settlement Successed";
                         request.setAttribute("msg1",msg);
                         rd =  request.getRequestDispatcher("genricsettle/settleList.jsp");
                         rd.forward(request,response);
                     }else{
                         System.out.println("failed");
                         String msg="Settlement Process Failed";
                         request.setAttribute("msg1",msg);
                         rd =  request.getRequestDispatcher("genricsettle/settleList.jsp");
                         rd.forward(request,response);
                     }
                     request.getSession().removeAttribute("settlement");
                    }
                    
                    if(step.equals("4")){//this step is used to settle all pending
                        System.out.println("Inside step 4");
                        ArrayList<SettleBean> settleList=null;
                        settlementbean=new SettleBean();
                        settleList=settlementbean.doSelectAllSettlementList(conn);
                        request.setAttribute("settlement",settleList);
                        request.getSession().setAttribute("settlement",settleList);
                        rd =  request.getRequestDispatcher("genricsettle/settleList.jsp");
                        rd.forward(request,response);
                    }
                      
                  }
                  catch(Exception e) {
                      System.out.println(e.getMessage());
                  }
    }
}
