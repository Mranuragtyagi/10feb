package sms;
     import java.io.*;
import java.net.*;
import java.util.StringTokenizer;

import utility.SystemGlobals;

public class SMS_Sender1{
         
        //StartTime Format: YYYYMMDD hh:mm:ss
        static String scheduledTime = "20120620 13:44:00"; 
        static HttpURLConnection connection = null;
        
        // global sms setting
        
            static String sms_user=SystemGlobals.getSms_usernm();
            static String sms_password = SystemGlobals.getSms_pwd();
            static String sms_senderid =SystemGlobals.getSender_id();
            static String host_url =SystemGlobals.getHost_url();
            
        // Method for sending SMS.
        public static String doSendDND(String mobileNo, String message){
            String result=null;
            try {
                
                                //URL url = new URL("http://msdgweb.mgov.gov.in/esms/sendsmsrequest");
                                 URL url = new URL(host_url);
                                 
                                 
                                 
                            //      URL url = new URL("http://localhost:8080/SAPCdacSMSGW/sendsmsrequest");
                                    
                                    //URL url = new URL("http://localhost:8080/esms/sendsmsrequest");
                                    connection = (HttpURLConnection) url.openConnection();
                                    connection.setDoInput(true);
                                    connection.setDoOutput(true);
                                    connection.setRequestMethod("POST");
                                    connection.setFollowRedirects(true);
                               // connection = sendSingleSMS(username, password, senderid, mobileNo, message);
                                    connection = sendSingleSMS(sms_user, sms_password, sms_senderid, mobileNo, message);
                                    // connection = sendBulkSMS(username, password, senderid, mobileNos,
                                    // message);
                            

                                    System.out.println("Resp Code:" + connection.getResponseCode());
                                    System.out.println("Resp Message:"
                                                    + connection.getResponseMessage());
                                    if(connection.getResponseCode()!=0){
                                        result="Y";
                                    }else{result="N";}
                            } catch (MalformedURLException e) {
                                    // TODO Auto-generated catch block
                                    e.printStackTrace();
                            } catch (IOException e) {
                                    // TODO Auto-generated catch block
                                    e.printStackTrace();
                            }
                            return result;

        }
        
    // Method for sending single SMS.
    public static HttpURLConnection sendSingleSMS(String username,String password, String senderId,String mobileNo, String message) {
        try {
                //      String smsservicetype = "singlemsg"; // For single message.
                String smsservicetype = "singlemsg";
                                String query = "username=" + URLEncoder.encode(username)
                                        + "&password=" + URLEncoder.encode(password)
                                        + "&smsservicetype=" + URLEncoder.encode(smsservicetype)
                                        + "&content=" + URLEncoder.encode(message) + "&mobileno="
                                        + URLEncoder.encode(mobileNo) + "&senderid="
                                        + URLEncoder.encode(senderId);

                        connection.setRequestProperty("Content-length", String
                                .valueOf(query.length()));
                        connection.setRequestProperty("Content-Type",
                                "application/x-www-form-urlencoded");
                        connection.setRequestProperty("User-Agent",
                                "Mozilla/4.0 (compatible; MSIE 5.0; Windows 98; DigExt)");
                        // open up the output stream of the connection
                                DataOutputStream output = new DataOutputStream(connection
                                                .getOutputStream());

                        // write out the data
                        int queryLength = query.length();
                        output.writeBytes(query);
                        // output.close();

                        // get ready to read the response from the cgi script
                        DataInputStream input = new DataInputStream(connection
                                                .getInputStream());

                        // read in each character until end-of-stream is detected
                        for (int c = input.read(); c != -1; c = input.read())
                                System.out.print((char) c);
                        input.close();
                } catch (Exception e) {
                        System.out.println("Something bad just happened.");
                        System.out.println(e);
                        e.printStackTrace();
                }

                return connection;
    }
    }
            
      

