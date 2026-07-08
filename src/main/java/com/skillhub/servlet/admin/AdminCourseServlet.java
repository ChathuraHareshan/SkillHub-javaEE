package com.skillhub.servlet.admin;

import com.skillhub.data.DataStore;
import com.skillhub.model.Course;
import com.skillhub.model.Role;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/admin/courses")
public class AdminCourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DataStore store = DataStore.getInstance();
        String action = request.getParameter("action");

        if ("new".equals(action)) {
            request.setAttribute("mode", "new");
            request.setAttribute("trainers", store.getUsersByRole(Role.TRAINER));
            request.getRequestDispatcher("/WEB-INF/views/admin/course-form.jsp").forward(request, response);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Course course = store.findCourseById(id);
            request.setAttribute("mode", "edit");
            request.setAttribute("course", course);
            request.setAttribute("trainers", store.getUsersByRole(Role.TRAINER));
            request.getRequestDispatcher("/WEB-INF/views/admin/course-form.jsp").forward(request, response);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            store.deleteCourse(id);
            response.sendRedirect(request.getContextPath() + "/admin/courses?msg=deleted");

        } else {

            request.setAttribute("courses", store.getAllCourses());
            request.getRequestDispatcher("/WEB-INF/views/admin/courses.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DataStore store = DataStore.getInstance();
        String action = request.getParameter("action");

        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        int duration = Integer.parseInt(request.getParameter("durationWeeks"));
        String trainerParam = request.getParameter("trainerId");
        Integer trainerId = (trainerParam == null || trainerParam.isBlank()) ? null : Integer.parseInt(trainerParam);

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Course course = store.findCourseById(id);
            if (course != null) {
                course.setCode(code);
                course.setName(name);
                course.setDescription(description);
                course.setDurationWeeks(duration);
                course.setTrainerId(trainerId);
                store.updateCourse(course);
            }
            response.sendRedirect(request.getContextPath() + "/admin/courses?msg=updated");

        } else {

            Course course = new Course(0, code, name, description, duration, trainerId);
            store.addCourse(course);
            response.sendRedirect(request.getContextPath() + "/admin/courses?msg=added");
        }
    }
}
