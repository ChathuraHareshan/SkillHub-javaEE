package com.skillhub.servlet.admin;

import com.skillhub.data.DataStore;
import com.skillhub.model.Attendance;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;


@WebServlet("/admin/attendance")
public class AdminAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DataStore store = DataStore.getInstance();
        request.setAttribute("courses", store.getAllCourses());

        String courseIdParam = request.getParameter("courseId");
        if (courseIdParam != null && !courseIdParam.isBlank()) {
            int courseId = Integer.parseInt(courseIdParam);
            request.setAttribute("selectedCourseId", courseId);
            request.setAttribute("studentsInCourse", store.getStudentsEnrolledInCourse(courseId));
        }

        request.setAttribute("recentAttendance", store.getAllAttendance());
        request.setAttribute("dataStore", store);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/attendance.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        com.skillhub.model.User admin = (com.skillhub.model.User) session.getAttribute("user");

        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String status = request.getParameter("status"); // PRESENT / ABSENT

        DataStore store = DataStore.getInstance();
        store.addAttendance(new Attendance(0, studentId, courseId, LocalDate.now(), status, admin.getUsername()));

        response.sendRedirect(request.getContextPath() + "/admin/attendance?msg=marked&courseId=" + courseId);
    }
}
