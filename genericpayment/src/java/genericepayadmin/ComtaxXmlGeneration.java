package genericepayadmin;
import java.io.File;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class ComtaxXmlGeneration {
    public ComtaxXmlGeneration() {
    }
    public static void xmlGenerateAndMailAttach(java.sql.Date enterdate,String dept,Connection con,String xmlemail) {
    
           try {
            
           java.sql.Date pdate=enterdate;
           System.out.println("entry date : "+pdate);
           DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
           DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
           // root elements
           Document doc = docBuilder.newDocument();
           Element results = doc.createElement("escroll");
           doc.appendChild(results);
          // String path="/opt/comtax_files";
           
           String path="D:\\genr" ;
               try{
                   PreparedStatement ps=null;
                   PreparedStatement pss=null;
              // String sql="select IFSCODE,TRANSID,TRANS_DATE,PURPOSE,TREASURY_HEAD,CIRCLE,IDENTITY_NO,DLRNAME,ADDRESS,PERIOD_FROM,PERIOD_TO,ADMITTED,ADVANCED,ASSESSED,INTEREST,PENALTY,MISC,AMOUNT from GENERIC_EPAYMENT where PAYMENT_DATE between '18-JUL-2013' and '23-JUL-2013' and cin is not null" ;
                      String strr="select TRANS_DATE,PERIOD_FROM ,PERIOD_TO from generic_epayment where department=? and trunc(PAYMENT_DATE)=trunc(?) and CIN is not null"  ;
                  // String strr="select TRANS_DATE,PERIOD_FROM ,PERIOD_TO from GENERIC_EPAYMENT where PAYMENT_DATE between '15-JUL-2014' and '19-JUL-2014' and CIN is not null and department=3"  ;
                    ps=con.prepareStatement(strr);
                    ps.setString(1, dept);
                    ps.setDate(2,pdate);
                   ResultSet rss = ps.executeQuery();
                   String sts="select IFSCODE,TRANSID,TRANS_DATE,PURPOSE,TREASURY_HEAD,CIRCLE,IDENTITY_NO,DLRNAME,ADDRESS,PERIOD_FROM,PERIOD_TO,ADMITTED,ADVANCED,ASSESSED,INTEREST,PENALTY,MISC,AMOUNT from generic_epayment where department=? and trunc(PAYMENT_DATE)=trunc(?) and CIN is not null" ;
                    // ResultSet rs = con.createStatement().executeQuery("select IFSCODE,TRANSID,TRANS_DATE,PURPOSE,TREASURY_HEAD,CIRCLE,IDENTITY_NO,DLRNAME,ADDRESS,PERIOD_FROM,PERIOD_TO,ADMITTED,ADVANCED,ASSESSED,INTEREST,PENALTY,MISC,AMOUNT from GENERIC_EPAYMENT where department='3' and trunc(PAYMENT_DATE)=trunc("+pdate+") and CIN is not null");
                  // ResultSet rs = con.createStatement().executeQuery("select IFSCODE,TRANSID,TRANS_DATE,PURPOSE,TREASURY_HEAD,CIRCLE,IDENTITY_NO,DLRNAME,ADDRESS,PERIOD_FROM,PERIOD_TO,ADMITTED,ADVANCED,ASSESSED,INTEREST,PENALTY,MISC,AMOUNT from GENERIC_EPAYMENT where PAYMENT_DATE between '15-JUL-2014' and '19-JUL-2014' and cin is not null and department=3");
                   pss=con.prepareStatement(sts);
                   pss.setString(1, dept);
                   pss.setDate(2,pdate);
                   ResultSet rs = pss.executeQuery();
                   ResultSetMetaData rsmd = rs.getMetaData();
                   int colCount = rsmd.getColumnCount();
                       while (rs.next() & rss.next()){
                           SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy ");
                           SimpleDateFormat sdff= new SimpleDateFormat("h:mm:ss a") ;
                           String dat =sdf.format(rss.getTimestamp("TRANS_DATE")) ; 
                           String datt =sdff.format(rss.getTimestamp("TRANS_DATE")) ;    
                           String prdfrom= sdf.format(rss.getDate("PERIOD_FROM")) ;
                           String prdto=sdf.format(rss.getDate("PERIOD_TO"));
                           Element row = doc.createElement("ROW");
                           results.appendChild(row);       
                               for (int i = 1; i <= colCount; i++) {
                                   if(i==1){
                                     Element firstname = doc.createElement("IFS_Code");
                                    // firstname.appendChild(doc.createTextNode("PAYONLINE"+rs.getObject(i)));
                                     firstname.appendChild(doc.createTextNode("PAYONLINE"));
                                     row.appendChild(firstname);
                                   }if(i==2){   
                                           Element fname = doc.createElement("Transaction_ID");
                                           fname.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fname);
                                   }if(i==3){
                                           Element fnamee = doc.createElement("Transaction_date");
                                           fnamee.appendChild(doc.createTextNode(dat));
                                           row.appendChild(fnamee);
                                   }if(i==4){
                                           Element fnamee = doc.createElement("Transaction_time");
                                           fnamee.appendChild(doc.createTextNode(datt));
                                           row.appendChild(fnamee);
                                           
                                           if(rs.getObject(i).equals("Jharkhand Sales Tax")){
                                                Element firstname = doc.createElement("Act");
                                                firstname.appendChild(doc.createTextNode("JST"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Professional Tax")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("JPT"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Electricity Duty")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("ED"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Advertisement Tax")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("ADV"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Entertainment Tax")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("ENT"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Luxury Tax")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("LT"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Value Added Tax Unregistered")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("VAU"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Value Added Tax Regular")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("VAT"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Value Added Tax Composition")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("VAC"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Value Added Tax Presumptive")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("VAP"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Value Added Tax Works Contract")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("TDS"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Entry Tax")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("ET"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Jharkhand Professional Tax")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("JPT"));
                                                   row.appendChild(firstname);
                                               }else if(rs.getObject(i).equals("Central Sales Tax")){
                                                   Element firstname = doc.createElement("Act");
                                                   firstname.appendChild(doc.createTextNode("CST"));
                                                   row.appendChild(firstname);
                                               }
                                   }
                                  if(i==5){
                                           Element fnamee = doc.createElement("Treasury_Head_code");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==6){
                                           Element fnamee = doc.createElement("circle_code");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==7){
                                           Element fnamee = doc.createElement("TIN_Of_the_Party");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==8){
                                             Element pf = doc.createElement("Name_Of_the_Party");
                                             pf.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                             row.appendChild(pf);
                                   }if(i==9){
                                             Element pt = doc.createElement("Address_Of_the_Party");
                                             pt.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                             row.appendChild(pt);

                                   }if(i==10){
                                           Element fnamee = doc.createElement("payment_from_date");
                                           fnamee.appendChild(doc.createTextNode(prdfrom));
                                           row.appendChild(fnamee);
                                   }if(i==11){
                                           Element fnamee = doc.createElement("payment_to_date");
                                           fnamee.appendChild(doc.createTextNode(prdto));
                                           row.appendChild(fnamee);
                                   }
                                   if(i==12){
                                           Element fnamee = doc.createElement("Admitted_Tax");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==13){
                                           Element fnamee = doc.createElement("Advanced_Tax");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==14){
                                           Element fnamee = doc.createElement("Assessed_Tax");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }
                                   if(i==15){
                                           Element fnamee = doc.createElement("Interest");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==16){
                                           Element fnamee = doc.createElement("Penalty");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==17){
                                           Element fnamee = doc.createElement("Misc");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }if(i==18){
                                           Element fnamee = doc.createElement("Total");
                                           fnamee.appendChild(doc.createTextNode(rs.getObject(i).toString()));
                                           row.appendChild(fnamee);
                                   }

                                   
                               }
                       }
               }catch(Exception e){
                   System.out.println(e.getMessage());
               }
                   DOMSource domSource = new DOMSource(doc);
                   TransformerFactory tf = TransformerFactory.newInstance();
                   Transformer transformer = tf.newTransformer();
                   transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
                   transformer.setOutputProperty(OutputKeys.METHOD, "xml");
                   transformer.setOutputProperty(OutputKeys.ENCODING, "ISO-8859-1");
                  // StringWriter sw = new StringWriter();
                   SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd");
                   //static final long MILLIS_IN_A_DAY =1000*60*60*24 ;  
                   //java.util.Date date=new java.util.Date(new java.util.Date().getTime() - 1000*60*60*24);
                   String date1=sdf.format(pdate);
                  // StreamResult sr =new StreamResult(new File("C:\\JHRKHDCTAX_Settlement_"+date1+".xml")); 
                    StreamResult sr =new StreamResult(new File(path+"/genericpayxml/JHRKHDCTAX_Settlement_"+date1+".xml").toString().trim()); 
                   String filname="JHRKHDCTAX_Settlement_"+date1+".xml";
                    System.out.println("filename in xml: "+filname);                        
                   transformer.transform(domSource, sr);
                 //  System.out.println(sw.toString());  
                   System.out.println("File saved!");
                  
                     genericepayadmin.MailAttachment cls=new genericepayadmin.MailAttachment();
                              try{
                             // cls.doSendMail("I am testing body message, check Class1.java open in jdeveloper", "zephain@gmail.com","Test Mails",filname);
                          //   cls.doSendMail("Commercial Tax Xml, sent by generic Portal", xmlemail,"Comtax Xml from GenericPortal",filname);     
                                  
                             cls.doSendMail("Commercial Tax Xml, sent by generic Portal", "jhrpayonline@gmail.com","Comtax Xml from GenericPortal",filname);
                               
                               
                                //  cls.doSendMail("Commercial Tax Xml, sent by generic Portal", "anuragtyagi009@gmail.com","Comtax Xml from GenericPortal",filname);
                              }catch(Exception e){
                              System.out.println(e.getMessage());
                              }
           }catch (ParserConfigurationException pce) {
               pce.printStackTrace();
           }catch (TransformerException tfe) {
               tfe.printStackTrace();
           }
       }
    
    
}
