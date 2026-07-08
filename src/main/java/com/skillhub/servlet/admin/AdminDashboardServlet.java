package com.skillhub.servlet.admin;

import com.skillhub.data.DataStore;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DataStore store = DataStore.getInstance();

        request.setAttribute("activeStudentCount", store.countActiveStudents());
        request.setAttribute("courseCount", store.countCourses());
        request.setAttribute("enrolmentCount", store.countEnrolments());
        request.setAttribute("registeredUserCount", store.countRegisteredUsers());
        request.setAttribute("courses", store.getAllCourses());
        request.setAttribute("activeSessionCount",
                getServletContext().getAttribute("activeSessionCount"));

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/dashboard.jsp");
        rd.forward(request, response);
    }
}
