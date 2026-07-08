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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/student/courses")
public class StudentCoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User student = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        List<Enrolment> myEnrolments = store.getEnrolmentsByStudent(student.getId());
        List<Course> myCourses = new ArrayList<>();
        for (Enrolment e : myEnrolments) {
            Course c = store.findCourseById(e.getCourseId());
            if (c != null) myCourses.add(c);
        }

        request.setAttribute("myCourses", myCourses);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/student/courses.jsp");
        rd.forward(request, response);
    }
}
