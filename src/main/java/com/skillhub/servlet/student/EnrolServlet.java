package com.skillhub.servlet.student;

import com.skillhub.data.DataStore;
import com.skillhub.model.Course;
import com.skillhub.model.Enrolment;
import com.skillhub.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/student/enrol")
public class EnrolServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User student = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        List<Course> availableCourses = store.getAllCourses().stream()
                .filter(c -> "ACTIVE".equalsIgnoreCase(c.getStatus()))
                .filter(c -> !store.isEnrolled(student.getId(), c.getId()))
                .collect(Collectors.toList());

        request.setAttribute("availableCourses", availableCourses);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/student/enrol.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User student = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        int courseId = Integer.parseInt(request.getParameter("courseId"));

        if (!store.isEnrolled(student.getId(), courseId) && store.findCourseById(courseId) != null) {
            store.addEnrolment(new Enrolment(0, student.getId(), courseId));
        }

        response.sendRedirect(request.getContextPath() + "/student/courses?msg=enrolled");
    }
}
