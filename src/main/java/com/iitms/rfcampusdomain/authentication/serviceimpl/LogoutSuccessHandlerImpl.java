package com.iitms.rfcampusdomain.authentication.serviceimpl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.stereotype.Component;

import com.iitms.rfcampuscommon.ConstantUtil;

@Component("logoutSuccessHandler")
public class LogoutSuccessHandlerImpl implements LogoutSuccessHandler {

    @Override
    public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
        throws IOException, ServletException {
        
        String loginType = request.getParameter("loginType");
        if (ConstantUtil.STUDENT_LOGIN.equals(loginType)) {
            response.sendRedirect("./student-login");
            return;
        } else if(ConstantUtil.STAFF_LOGIN.equals(loginType)) {
            response.sendRedirect("./login");
            return;
        }
    }

}
