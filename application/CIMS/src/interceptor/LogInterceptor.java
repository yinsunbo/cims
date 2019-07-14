package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

public class LogInterceptor implements org.springframework.web.servlet.HandlerInterceptor{

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
		if(url.indexOf("log")>=0) {
			return true;
		}
		if(url.indexOf("home")>=0&&url.indexOf("homepage")== -1) {
		    
            return true;
        }
		if(session.getAttribute("user")==null) {
		    arg1.sendRedirect(arg0.getContextPath()+"/login");
			return false;
		}
		return true;
		
	}

}
