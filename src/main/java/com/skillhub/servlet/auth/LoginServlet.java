package com.skillhub.servlet.auth;

import com.skillhub.data.DataStore;
import com.skillhub.model.Role;
import com.skillhub.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            redirectToDashboard(request, response, (User) session.getAttribute("user"));
            return;
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DataStore store = DataStore.getInstance();
        User user = store.findUserByUsername(username);

        if (user == null || !user.getPassword().equals(password)) {
            request.setAttribute("errorMessage", "Invalid username or password.");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
            rd.forward(request, response);
            return;
        }

        if (!"ACTIVE".equalsIgnoreCase(user.getStatus())) {
            request.setAttribute("errorMessage", "This account has been deactivated. Contact the administrator.");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
            rd.forward(request, response);
            return;
        }


        HttpSession session = request.getSession(true);
        session.setAttribute("user", user);
        session.setMaxInactiveInterval(30 * 60);

        redirectToDashboard(request, response, user);
    }

    private void redirectToDashboard(HttpServletRequest request, HttpServletResponse response, User user)
            throws IOException {
        String ctx = request.getContextPath();
        if (user.getRole() == Role.ADMIN) {
            response.sendRedirect(ctx + "/admin/dashboard");
        } else if (user.getRole() == Role.TRAINER) {
            response.sendRedirect(ctx + "/trainer/dashboard");
        } else {
            response.sendRedirect(ctx + "/student/dashboard");
        }
    }
}
