/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dept_integration;
import org.apache.commons.validator.UrlValidator;
/**
 *
 * @author zephaniah
 */
public class NewClass {
    public static void main(String []args){
         
         UrlValidator urlValidator = new UrlValidator();
 
	    //valid URL
	    if (urlValidator.isValid("http://www.utilservices.com")) 
        {
        System.out.println("VALID");
        }
            else{
                 System.out.println("INVALID");
            }
    }
}
