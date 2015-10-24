package vicclas;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class F_Download {
    public static void download(HttpServletRequest request,HttpServletResponse response,String url,String filename){
        try
        {
        FileInputStream fis = new FileInputStream(url);
        BufferedInputStream bis = new BufferedInputStream(fis);
        response.setContentLength(fis.available());
        response.setContentType("application/octet-stream");
        response.setHeader("Content-disposition","attachment; filename=" + filename );
        BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
        byte[] buff = new byte[1024*100];
        int bytesRead;
        // Simple read/write loop.
        while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) 
        {
        bos.write(buff, 0, bytesRead);
        }
        bos.flush();
        bos.close();
        bis.close();
        response.flushBuffer(); 
        fis.close();
        }catch(Exception e) {
            System.out.println("Error at vicclas.F_Download@download : "+e);
        }
    }
   
}
