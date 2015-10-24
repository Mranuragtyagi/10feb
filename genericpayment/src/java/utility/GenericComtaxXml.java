package utility;

import java.io.File;
import java.io.StringWriter;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import java.text.SimpleDateFormat;

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

import vicclass.User;

public class GenericComtaxXml {
    public GenericComtaxXml() {
    }
  
    public static void main(String[] args) {
        GenericComtaxXml genericComtaxXml = new GenericComtaxXml();
        try { 
            Connection con=null;
            User u = new User();
            u.createConnection();
            con = u.getConnection();
        DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
        // root elements
        Document doc = docBuilder.newDocument();
        Element results = doc.createElement("escroll");
        doc.appendChild(results);
            try{
           // String sql="select IFSCODE,TRANSID,TRANS_DATE,PURPOSE,TREASURY_HEAD,CIRCLE,IDENTITY_NO,DLRNAME,ADDRESS,PERIOD_FROM,PERIOD_TO,ADMITTED,ADVANCED,ASSESSED,INTEREST,PENALTY,MISC,AMOUNT from generic_epayment where PAYMENT_DATE between '18-JUL-2013' and '23-JUL-2013' and cin is not null" ;
                String strr="select TRANS_DATE,PERIOD_FROM ,PERIOD_TO from generic_epayment where department='3' and trunc(PAYMENT_DATE)=trunc(sysdate) and CIN is not null"  ;
                ResultSet rss = con.createStatement().executeQuery(strr);
                ResultSet rs = con.createStatement().executeQuery("select IFSCODE as IFS_Code,TRANSID as Transaction_ID,PURPOSE as Act,TREASURY_HEAD as Treasury_Head_code,CIRCLE as circle_code,IDENTITY_NO as TIN_Of_the_Party,DLRNAME as Name_Of_the_Party,ADDRESS as Address_Of_the_Party,ADMITTED as Admitted_Tax,ADVANCED as Advanced_Tax,ASSESSED as Assessed_Tax,INTEREST as Interest,PENALTY as Penalty,MISC as Misc,AMOUNT as Total from generic_epayment where department='3' and trunc(PAYMENT_DATE)=trunc(sysdate) and CIN is not null");
                ResultSetMetaData rsmd = rs.getMetaData();
                int colCount = rsmd.getColumnCount();
                    while (rs.next() & rss.next()){
                        SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yyyy ") ;
                        SimpleDateFormat sdff= new SimpleDateFormat("h:mm:ss a") ;
                        String dat =sdf.format(rss.getTimestamp("TRANS_DATE")) ; 
                        String datt =sdff.format(rss.getTimestamp("TRANS_DATE")) ;    
                        String prdfrom= sdf.format(rss.getDate("PERIOD_FROM")) ;
                        String prdto=sdf.format(rss.getDate("PERIOD_TO"));
                        Element row = doc.createElement("ROW");
                        results.appendChild(row);       
                            for (int i = 1; i <= colCount; i++) {
                                if(i==1)
                                { 
                                  Element firstname = doc.createElement("IFS_CODE");
                                  firstname.appendChild(doc.createTextNode("GPAY"+rs.getObject(i)));
                                  row.appendChild(firstname);
                                }
                                
                               if(i==3){ 
                                         if(rs.getObject(i).equals("Jharkhand Sales Tax")){
                                             Element firstname = doc.createElement("ACT");
                                             firstname.appendChild(doc.createTextNode("JST"));
                                             row.appendChild(firstname);
                                         }else if(rs.getObject(i).equals("Professional Tax")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("PT"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Electricity Duty")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("ED"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Advertisement Tax")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("ADV"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Entertainment Tax")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("ENT"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Luxury Tax")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("LT"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Value Added Tax Unregistered")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("VAU"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Value Added Tax Regular")){
                                                Element firstname = doc.createElement("VAT");
                                                firstname.appendChild(doc.createTextNode("LT"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Value Added Tax Composition")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("VAC"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Value Added Tax Presumptive")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("VAP"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Value Added Tax Works Contract")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("TDS"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Entry Tax")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("ET"));
                                                row.appendChild(firstname);
                                            }else if(rs.getObject(i).equals("Jharkhand Professional Tax")){
                                                Element firstname = doc.createElement("ACT");
                                                firstname.appendChild(doc.createTextNode("JPT"));
                                                row.appendChild(firstname);
                                            }
                                            
                                        }
                                if(i==9){
                                          Element pf = doc.createElement("payment_from_date");
                                          pf.appendChild(doc.createTextNode(prdfrom));
                                          row.appendChild(pf);
                                          Element pt = doc.createElement("payment_to_date");
                                          pt.appendChild(doc.createTextNode(prdto));
                                          row.appendChild(pt);
                                } 
                                if(i!=1 & i!=3){
                                String columnName = rsmd.getColumnName(i);
                                Object value = rs.getObject(i);
                                Element node = doc.createElement(columnName);
                                node.appendChild(doc.createTextNode(value==null?"":value.toString()));
                                row.appendChild(node);
                                }
                                if(i==2){   
                                        Element fname = doc.createElement("Transaction_date");
                                        fname.appendChild(doc.createTextNode(dat));
                                        row.appendChild(fname);
                                        Element fnamee = doc.createElement("Transaction_time");
                                        fnamee.appendChild(doc.createTextNode(datt));
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
                StringWriter sw = new StringWriter();
                SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd ") ;
                java.util.Date date=new java.util.Date();
                String date1=sdf.format(date);
                StreamResult sr =new StreamResult(new File("C:\\JHRKHDCTAX_Settlement_"+date1+".xml")); 
                String filname="JHRKHDCTAX_Settlement_"+date1+".xml";
                transformer.transform(domSource, sr);
                System.out.println(sw.toString());  
                System.out.println("File saved!");
                MailAttachment cls=new MailAttachment();
                try{
                cls.doSendMail("I am testing body message, check Class1.java open in jdeveloper", "zephain@gmail.com","Test Mails",filname);
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
