package genericepayment;

import java.util.regex.*;
public class UserValidation {
    public UserValidation() {
    }
    public String  taxInfoMatching(GenericBean gb) throws Exception {
    String msg="Please fill the appropriate";
           // get Value from bean
    String description=gb.getDescription();
    String amount=String.valueOf(gb.getAmount());
    String interest=String.valueOf(gb.getInterest());
    String penalty=String.valueOf(gb.getPenalty());
    String others=String.valueOf(gb.getMisc());
    
    //regex
    String descriptionRegex="^[a-zA-Z0-9 ]+$";
    String curRegExp ="^[.0-9]+$";
    
    //validation
    if(!description.matches(descriptionRegex)){
        msg=msg+"Description,";
    }else if(!amount.matches(curRegExp)){
        msg=msg+"Amount,";
    }else if(!interest.matches(curRegExp)){
        msg=msg+"interest,";
    }else if(!penalty.matches(curRegExp)){
        msg=msg+"penalty,";
    }else if(!others.matches(curRegExp)){
        msg=msg+"Others Fee";
    }
           return msg;
       }
       
    public String  userDetailsMatching(GenericBean gb) throws Exception {
    String usermsg="Please fill the appropriate";
    // get Value from bean
    String idval=gb.getIdproofval();
    String name=gb.getDlrname();
    String mobile=gb.getMobile();
    String pwd=gb.getPassword();
    String repwd=gb.getRepassword();
    String email=gb.getEmail();
    String pincode=gb.getPincode();
    String address=gb.getAddress();
    String answer=gb.getAnswer();
    
    //regex
    String idvalRegex="^[0-9A-Za-z-/ ]+$" ;
    String nameRegex="^[a-zA-Z/ ]+$";
    String phoneno="^[0-9]+$";
    int atpos = email.indexOf("@");
    int dotpos = email.lastIndexOf(".");
    String pincodeRegex="^[0-9]+$";
    String addressRegex="^[0-9a-zA-Z-/, ]+$";
    String answerRegex="^[0-9A-Za-z ]+$" ; 
    String pwdRegex="^[0-9A-Za-z!@#$%&* ]+$" ;
   // validation
    
    try{
    //if(!idval.matches(idvalRegex)){
      //  usermsg=usermsg+"Id Proof,";
   // }else 
    if(!name.matches(nameRegex)){
        usermsg=usermsg+" Name.";
    }else if(atpos < 1 || ( dotpos - atpos < 2 )){
        usermsg=usermsg+" email id.";
    }else if(!mobile.matches(phoneno)){
        usermsg=usermsg+" Mobile No.";
    }else if(!pwd.matches(pwdRegex)){
        usermsg=usermsg+" Password.";
    }else if(!repwd.matches(pwdRegex)){
        usermsg=usermsg+" Confirm Password.";
    }else if(!address.matches(addressRegex)){
        usermsg=usermsg+" Address.";
    }else if(!pincode.matches(pincodeRegex)){
        usermsg=usermsg+" Pincode.";
    }else if(!answer.matches(answerRegex)){
        usermsg=usermsg+" Answer.";
    }
    }catch(Exception e){
        System.out.println("error in userValidation : " + e.getMessage());
    }
           return usermsg;
    }
    
    
    
    public String  preRegistrationValidation(GenericFastBean gb) throws Exception {
    String usermsg="Please fill the appropriate";
    // get Value from bean
  
    String name=gb.getName();
    String email=gb.getEmail();
    String mobile=gb.getPhone();
    String pwd=gb.getPwd();
    String repwd=gb.getConfirmpwd();
   
   
    
    
    //regex
  
    String nameRegex="^[a-zA-Z/ ]+$";
    String phoneno="^[0-9]+$";
    int atpos = email.indexOf("@");
    int dotpos = email.lastIndexOf(".");
    String pwdRegex="^[0-9A-Za-z!@#$%&* ]+$" ;
   // validation
    
    try{
    //if(!idval.matches(idvalRegex)){
      //  usermsg=usermsg+"Id Proof,";
   // }else 
    if(!name.matches(nameRegex)){
        usermsg=usermsg+" Name.";
    }else if(atpos < 1 || ( dotpos - atpos < 2 )){
        usermsg=usermsg+" email id.";
    }else if(!mobile.matches(phoneno)){
        usermsg=usermsg+" Mobile No.";
    }else if(!pwd.matches(pwdRegex)){
        usermsg=usermsg+" Password.";
    }else if(!repwd.matches(pwdRegex)){
        usermsg=usermsg+" Confirm Password.";
    }
    }catch(Exception e){
        System.out.println("error in userValidation : " + e.getMessage());
    }
           return usermsg;
    }
    
    
    public String  instantUserDetailsMatching(GenericBean gb) throws Exception {
    String usermsg="Please fill the appropriate";
    // get Value from bean
    String idval=gb.getIdproofval();
    String name=gb.getDlrname();
    String mobile=gb.getMobile();
   
    String email=gb.getEmail();
    String pincode=gb.getPincode();
    String address=gb.getAddress();
   
    
    //regex
    String idvalRegex="^[0-9A-Za-z-/ ]+$" ;
    String nameRegex="^[a-zA-Z/ ]+$";
    String phoneno="^[0-9]+$";
    int atpos = email.indexOf("@");
    int dotpos = email.lastIndexOf(".");
    String pincodeRegex="^[0-9]+$";
    String addressRegex="^[0-9a-zA-Z-/, ]+$";
   
   // validation
    
    try{
    //if(!idval.matches(idvalRegex)){
      //  usermsg=usermsg+"Id Proof,";
   // }else 
    if(!name.matches(nameRegex)){
        usermsg=usermsg+" Name.";
    }else if(atpos < 1 || ( dotpos - atpos < 2 )){
        usermsg=usermsg+" email id.";
    }else if(!mobile.matches(phoneno)){
        usermsg=usermsg+" Mobile No.";
    }else if(!address.matches(addressRegex)){
        usermsg=usermsg+" Address.";
    }else if(!pincode.matches(pincodeRegex)){
        usermsg=usermsg+" Pincode.";
    }
    }catch(Exception e){
        System.out.println("error in userValidation : " + e.getMessage());
    }
           return usermsg;
    }
    
    public String  registeredDealerMatching(GenericBean gb) throws Exception {
    String regusermsg="Please fill the appropriate";
    
    // get Value from bean
    String idval=gb.getIdproofval();
    String description=gb.getDescription();
    String amount=String.valueOf(gb.getAmount());
    String interest=String.valueOf(gb.getInterest());
    String penalty=String.valueOf(gb.getPenalty());
    String others=String.valueOf(gb.getMisc());
    
    //regex
    String idvalRegex="^[0-9A-Za-z-/ ]+$" ;
    String descriptionRegex="^[a-zA-Z0-9 ]+$";
    String curRegExp ="^[.0-9]+$";
    
    // validation
    if(!idval.matches(idvalRegex)){
        regusermsg=regusermsg+"Id Proof,";
    }else if(!description.matches(descriptionRegex)){
        regusermsg=regusermsg+"Description,";
    }else if(!amount.matches(curRegExp)){
        regusermsg=regusermsg+"Amount,";
    }else if(!interest.matches(curRegExp)){
        regusermsg=regusermsg+"interest,";
    }else if(!penalty.matches(curRegExp)){
        regusermsg=regusermsg+"penalty,";
    }else if(!others.matches(curRegExp)){
        regusermsg=regusermsg+"Others Fee";
    }
           return regusermsg;
    }
       
    public boolean isAlphaNumeric(String s){
        String descriptionRegex="^[a-zA-Z0-9 ]+$";
       // String pattern= "^[a-zA-Z0-9]*$";
            if(s.matches(descriptionRegex)){
                return true;
            }
            return false;   
    }
    
    
    public String  editProfileValidation(GenericBean gb) throws Exception {
        String usermsg="Please fill the appropriate";
        
        // get Value from bean
        String name=gb.getDlrname();
        String mobile=gb.getMobile();
        String pincode=gb.getPincode();
        String address=gb.getAddress();
        String answer=gb.getAnswer();
        
        //regex
        String nameRegex="^[a-zA-Z/ ]+$";
        String phoneno="^[0-9]+$";
        String pincodeRegex="^[0-9]+$";
        String addressRegex="^[0-9a-zA-Z-/, ]+$";
        String answerRegex="^[a-zA-Z ]+$";
        
        // validation
        if(!name.matches(nameRegex)){
            usermsg=usermsg+"Name,";
        }else if(!mobile.matches(phoneno)){
            usermsg=usermsg+"Mobile No,";
        }else if(!address.matches(addressRegex)){
            usermsg=usermsg+"address,";
        }else if(!pincode.matches(pincodeRegex)){
            usermsg=usermsg+"Pincode,";
        }else if(!answer.matches(answerRegex)){
            usermsg=usermsg+"Answer";
        }
               return usermsg;
    
}


  //  public String  changePwdValidation(String oldpwd,String password,String confirmpassword) throws Exception {
       // String usermsg="Please fill the appropriate";
  
    
  //  }

}
