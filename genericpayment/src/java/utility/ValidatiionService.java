package utility;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidatiionService {
    public ValidatiionService() {
    }
    public char doCheckLength(String  pwd, int minlength, int maxlength){
        char bool='N';
        if(pwd.length()<minlength)
            bool='m';
        else if(pwd.length()>maxlength)
            bool='M';
        else
            bool='N';
        return bool;
    }
    public boolean doCheckNumeric(String pwd){
        for (int i = 0; i < pwd.length(); i++) {
                    //If we find a digit character we return true.
                    if (Character.isDigit(pwd.charAt(i))){
                        return true;
                    }
        }
                return false;  
    }
    public boolean doCheckSpecialCharacter(String pwd){
        Pattern p = Pattern.compile("^\\~|^\\!|^\\@|^\\#|^\\$|^\\%|^\\^|^\\&|^\\*|^\\`|^\\_|^\\-|^\\+|^\\=|^\\`|^\\||^\\(|^\\)");
        for(int i=0;i<pwd.length();i++){
        Matcher m = p.matcher(""+pwd.charAt(i));
        if (m.find()){
           return true;
        }
        }
        return false;
    }
}
