package auth;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFilter implements Filter{
    javax.servlet.ServletContext servletContext;
    String whitelist_url_in;
    String whitelist_url_post;
    
    @Override
    public void init(FilterConfig filterConfig) {
        servletContext = filterConfig.getServletContext();
        whitelist_url_in = servletContext.getInitParameter("whitelist-url-in");
        whitelist_url_post = servletContext.getInitParameter("whitelist-url-post");
    }

    @Override
    public void doFilter(
        ServletRequest request, ServletResponse response, FilterChain chain)throws IOException, ServletException{
            HttpServletRequest req = (HttpServletRequest) request;
            HttpServletResponse resp = (HttpServletResponse) response;
            String url = req.getRequestURI();
            boolean auth = false;
            String[] wurls = whitelist_url_in.split(",");
            for(int i = 0; i < wurls.length; i++){
            if(url.indexOf(wurls[i]) != -1){
                auth = true;
            }
        }
        wurls = whitelist_url_post.split(",");
        for(int i = 0; i < wurls.length; i++){
            if (url.endsWith(wurls[i])){
                auth = true;
            }
        }
        System.out.println("URL :" + url + "=>" + auth);
        if(!auth){
            Session.Validate(req, resp);
        }
        chain.doFilter(request, response);
    }
    
    /**
     * logic to accept or reject access to the page, check log in status
     *
     * @return true when authentication is deemed valid
     */
    @Override
    public void destroy() {
    }
}
