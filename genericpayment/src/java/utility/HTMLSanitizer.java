/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utility;

/**
 *
 * @author zephaniah
 */
import java.lang.reflect.*;
import org.apache.commons.lang.StringEscapeUtils;
/**
 *
 * @author Administrator
 */
public class HTMLSanitizer {
    
    public static void sanitizeString(Object obj){
        
       Field[] fields=  obj.getClass().getDeclaredFields();
       
       for(Field f:fields )
       {
           try{
               f.setAccessible(true);
           if(f.getType().toString().equals("class java.lang.String"))
           {
               
             // f.set(obj, ESAPI.encoder().encodeForHTML(  f.get(obj).toString()));
                f.set(obj, StringEscapeUtils.escapeHtml(  f.get(obj).toString()));
    //            System.out.println(""+ f.getName() +"=>"  + f.getType().toString() +"=>"+ f.get(obj).toString() );
           }
           
           }catch(Exception ee){System.out.println("error :"+ee);}
       }
        
    }
    
        public static String sanitizeString(String  str){
              return    StringEscapeUtils.escapeHtml( str);
        
        }

    
}