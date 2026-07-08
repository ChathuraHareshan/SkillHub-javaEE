package com.skillhub.servlet.student;

import com.skillhub.data.DataStore;
import com.skillhub.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/student/dashboard")
public class StudentDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User student = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        request.setAttribute("enrolledCount", store.getEnrolmentsByStudent(student.getId()).size());
        request.setAttribute("attendanceCount", store.getAttendanceByStudent(student.getId()).size());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/student/dashboard.jsp");
        rd.forward(request, response);
    }
}
