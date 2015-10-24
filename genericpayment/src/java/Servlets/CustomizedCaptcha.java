package Servlets;

import java.awt.Color;
import java.awt.Font;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;

import nl.captcha.Captcha;
import nl.captcha.backgrounds.FlatColorBackgroundProducer;
import nl.captcha.backgrounds.GradiatedBackgroundProducer;
import nl.captcha.backgrounds.SquigglesBackgroundProducer;
import nl.captcha.backgrounds.TransparentBackgroundProducer;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.servlet.SimpleCaptchaServlet;
import nl.captcha.text.producer.DefaultTextProducer;
import nl.captcha.text.renderer.ColoredEdgesWordRenderer;
import nl.captcha.text.renderer.DefaultWordRenderer;


public class CustomizedCaptcha extends SimpleCaptchaServlet {
    private static final String CONTENT_TYPE = 
        "text/html; charset=windows-1252";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response) throws ServletException, 
                                                           IOException {
        response.setContentType(CONTENT_TYPE);
        char[] srcChars = 
        { '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 
          'f', 'g', 'h', 'i', 'j', 'k', 'L', 'm', 'n', 'p', 'q', 'r', 's', 't', 
          'u', 'v', 'w', 'x', 'y', 'z' };
        java.awt.Color color = new java.awt.Color(10, 100, 200);
        List<java.awt.Font> fonts = new ArrayList<java.awt.Font>();
        fonts.add(new Font("Verdana", 1, 1));
        fonts.add(new Font("Tahoma", 1, 1));
        fonts.add(new Font("Helvetica", 1, 1));
       // Captcha captcha =
            //.addBorder().build(); 
           // new Captcha.Builder(125,50).addText(new DefaultTextProducer(4, srcChars)).addBackground(new TransparentBackgroundProducer()).build();
        //new TransparentBackgroundProducer()
        Captcha captcha = new Captcha.Builder(125,70).addText(new DefaultTextProducer(4, srcChars)).addBackground(new GradiatedBackgroundProducer()).addNoise().addBorder().build(); 
        CaptchaServletUtil.writeImage(response, captcha.getImage());
        request.getSession().setAttribute("Acaptcha", captcha);
    }

    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response) throws ServletException, 
                                                            IOException {
        response.setContentType(CONTENT_TYPE);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head><title>CustomizedCaptcha</title></head>");
        out.println("<body>");
        out.println("<p>The servlet has received a POST. This is the reply.</p>");
        out.println("</body></html>");
        out.close();
    }
}
