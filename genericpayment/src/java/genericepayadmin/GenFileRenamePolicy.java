package genericepayadmin;

import com.oreilly.servlet.multipart.FileRenamePolicy;
import java.io.*;

public class GenFileRenamePolicy implements FileRenamePolicy {
    int count=0;
    public File rename(File file){
        File renamedFile=null;
        String parentdir = file.getParent();
        String fname =file.getName();
        String fileExt="";
        int i = -1;
        if((i=fname.indexOf("."))!=-1 ){
            fileExt = fname.substring(i);
            fname= fname.substring(0,i);
            if(count==0){
                fname= "leftheader5";                
            }else if(count==1){
                fname="banner10";
            }
            fname= parentdir+"/"+fname+fileExt;
            count=1;
        }    
        
        renamedFile = new File(fname);
        return renamedFile;
    }
    
}
