package com.skillhub.servlet.trainer;

import com.skillhub.data.DataStore;
import com.skillhub.model.Attendance;
import com.skillhub.model.Course;
import com.skillhub.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;


@WebServlet("/trainer/attendance")
public class TrainerAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User trainer = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        List<Course> myCourses = store.getCoursesByTrainer(trainer.getId());
        request.setAttribute("myCourses", myCourses);

        String courseIdParam = request.getParameter("courseId");
        if (courseIdParam != null && !courseIdParam.isBlank()) {
            int courseId = Integer.parseInt(courseIdParam);
            request.setAttribute("selectedCourseId", courseId);
            request.setAttribute("studentsInCourse", store.getStudentsEnrolledInCourse(courseId));
        }

        request.setAttribute("dataStore", store);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/trainer/attendance.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User trainer = (User) session.getAttribute("user");

        int courseId = Integer.parseInt(request.getParameter("courseId"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String status = request.getParameter("status");

        DataStore store = DataStore.getInstance();
        store.addAttendance(new Attendance(0, studentId, courseId, LocalDate.now(), status, trainer.getUsername()));

        response.sendRedirect(request.getContextPath() + "/trainer/attendance?msg=marked&courseId=" + courseId);
    }
}
