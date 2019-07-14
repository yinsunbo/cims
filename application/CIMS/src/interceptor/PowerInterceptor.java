package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import entity.User;

public class PowerInterceptor implements org.springframework.web.servlet.HandlerInterceptor{

    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        // TODO Auto-generated method stub
        
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        // TODO Auto-generated method stub
        
    }

    @Override
    public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
        // TODO Auto-generated method stub
        HttpSession session=arg0.getSession();
        String url=arg0.getRequestURI();
        int power = 0;
        if(session.getAttribute("user")!=null) {
            User user = (User) session.getAttribute("user");
            power = user.getPower();
        }
        
        if(url.indexOf("user")>=0||url.indexOf("User")>=0) {//用户相关请求权限拦截
            if(power == 1) {
                arg1.sendRedirect(arg0.getContextPath()+"/homepage");
                return false;
            }
        }
        if(url.indexOf("cinema")>=0||url.indexOf("Cinema")>=0) {//影院相关请求权限拦截
            if(power == 1) {
                arg1.sendRedirect(arg0.getContextPath()+"/homepage");
                return false;
            }
        }
        if(url.indexOf("movie")>=0||url.indexOf("Movie")>=0) {//电影相关请求权限拦截
            if(power == 1) {
                arg1.sendRedirect(arg0.getContextPath()+"/homepage");
                return false;
            }
        }
        if(url.indexOf("type")>=0||url.indexOf("Type")>=0) {//电影类型相关请求权限拦截
            if(power == 1) {
                arg1.sendRedirect(arg0.getContextPath()+"/homepage");
                return false;
            }
        }
        return true;
    }

}
