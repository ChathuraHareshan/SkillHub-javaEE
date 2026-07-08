package com.skillhub.filter;

import com.skillhub.model.Role;
import com.skillhub.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebFilter(urlPatterns = {"/admin/*", "/trainer/*", "/student/*"})
public class AccessControlFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String contextPath = request.getContextPath();
        String path = request.getRequestURI().substring(contextPath.length());

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;


        if (user == null) {
            response.sendRedirect(contextPath + "/login?error=session_expired");
            return;
        }

        Role role = user.getRole();
        boolean authorised =
                (path.startsWith("/admin/") && role == Role.ADMIN) ||
                (path.startsWith("/trainer/") && role == Role.TRAINER) ||
                (path.startsWith("/student/") && role == Role.STUDENT);

        if (!authorised) {
            response.sendRedirect(contextPath + "/login?error=access_denied");
            return;
        }


        chain.doFilter(req, res);
    }
}
