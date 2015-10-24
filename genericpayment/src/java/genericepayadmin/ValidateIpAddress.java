/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package genericepayadmin;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author zephaniah
 */
public class ValidateIpAddress {
    
     private Pattern pattern;
    private Matcher matcher;
 
    private static final String IPADDRESS_PATTERN = 
		"^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
		"([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
		"([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
		"([01]?\\d\\d?|2[0-4]\\d|25[0-5])$";
 public ValidateIpAddress(){
	  pattern = Pattern.compile(IPADDRESS_PATTERN);
    } 
 public boolean validate(final String ip){		  
	  matcher = pattern.matcher(ip);
	  return matcher.matches();	    	    
    }
}
