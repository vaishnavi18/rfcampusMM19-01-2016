package com.iitms.rfcampusdomain.authentication.serviceimpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.iitms.rfcampuscommon.ConstantUtil;
import com.iitms.rfcampusdata.authentication.entity.CustomLoginUser;
import com.iitms.rfcampusdata.authentication.entity.SessionUser;
import com.iitms.rfcampusdata.authentication.entity.UserMasterEntity;
import com.iitms.rfcampusdomain.authentication.service.LoginService;
import com.iitms.rfcampusdomain.authentication.service.UserDetailsCustomService;

@Component("authenticationSuccessHandler")
public class AuthenticationSuccessHandlerImpl implements AuthenticationSuccessHandler, AuthenticationFailureHandler {

    private static final Logger LOG = LoggerFactory.getLogger(AuthenticationSuccessHandlerImpl.class);

    @Autowired
    private SessionUser sessionUser;

    @Autowired
    private UserDetailsCustomService userDetailsCustomService;

    @Autowired
    private LoginService loginService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
        throws IOException, ServletException {
        // request.getSession().setAttribute("roleId", 1);
        User user = (User) auth.getPrincipal();
        UserMasterEntity usermaster = userDetailsCustomService.getuserInformation(user.getUsername());

        if (usermaster.isTemporaryUser() == false) {
            setPermenentUsers(user, usermaster, response);
        } else {
            setTemporaryUsers(user, usermaster, response);
        }

        // sessionUser.setUsername();
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
        AuthenticationException exception) throws IOException, ServletException {
        LOG.info("Error : " + exception.getMessage());
        LOG.info("username : " + request.getParameter("username"));
        
        String redirectUrl = null;
        String referrer = request.getHeader("referer");
        if (referrer.contains("student-login")) {
            redirectUrl = "./student-login";
        } else {
            redirectUrl = "./login";
        }
        
        if (exception.getMessage() == null) {
            LOG.info("INVALID USERNAME OR PASSWORD");
            response.sendRedirect(redirectUrl+"?error=5");
        } else if (exception instanceof BadCredentialsException) {
            LOG.info("BadCredentialsException");
            loginService.updateFailAttempts(request.getParameter("username"));
            response.sendRedirect(redirectUrl+"?error=1");
        } else if (exception instanceof CredentialsExpiredException) {
            LOG.info("CredentialsExpiredException" );
            response.sendRedirect(redirectUrl+"?error=2");
        } else if (exception instanceof DisabledException) {
            LOG.info("DisabledException" );
            response.sendRedirect(redirectUrl+"?error=3");
        } else if (exception instanceof LockedException) {
            LOG.info("LockedException" );
            response.sendRedirect(redirectUrl+"?error=4");
        } else
            response.sendRedirect(redirectUrl);

    }

    private void setPermenentUsers(User user, UserMasterEntity usermaster, HttpServletResponse response) {
        try {
            CustomLoginUser customLoginUser = new CustomLoginUser();
            customLoginUser.setUsername(user.getUsername());
            customLoginUser.setAllocatedRoleIds(userDetailsCustomService.getRoleIdsByUser(user.getUsername()));
            customLoginUser.setUserId(usermaster.getUserId());
            customLoginUser.setActive(usermaster.getActive());
            customLoginUser.setCollegeId(usermaster.getCollege_id());
            customLoginUser.setLoginType(ConstantUtil.STAFF_LOGIN);
            sessionUser.setCustomLoginUser(customLoginUser);
            sessionUser.setAuthorisedMenu(setAuthorisedMenu(customLoginUser.getAllocatedRoleIds()));
            LOG.info("Allocated Roles : " + sessionUser.getCustomLoginUser().getAllocatedRoleIds());
            loginService.resetFailAttempts(user.getUsername());
            if (customLoginUser.getActive() == 0) {
                response.sendRedirect("./change-password");
            } else
                response.sendRedirect("./success");
        } catch (Exception e) {
            // e.printStackTrace();
            LOG.error("Error : ", e);
        }

    }

    private Map<Integer, Integer> setAuthorisedMenu(List<Integer> allocatedRoleIds) {

        Map<Integer, Integer> authorisedMenu = new HashMap<Integer, Integer>();

        for (int menuId : allocatedRoleIds) {
            authorisedMenu.put(menuId, menuId);
        }

        return authorisedMenu;
    }

    private void setTemporaryUsers(User user, UserMasterEntity usermaster, HttpServletResponse response) {
        try {
            CustomLoginUser customLoginUser = new CustomLoginUser();
            customLoginUser.setUsername(user.getUsername());
            customLoginUser.setStudentId(usermaster.getStudentSerialNumber());
            customLoginUser.setLoginType(ConstantUtil.STUDENT_LOGIN);
            sessionUser.setCustomLoginUser(customLoginUser);
            response.sendRedirect("./academic/student-registration");
        } catch (Exception e) {
            // e.printStackTrace();
            LOG.error("Error : ", e);
        }
    }
}
