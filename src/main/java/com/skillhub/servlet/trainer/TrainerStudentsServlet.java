package com.skillhub.servlet.trainer;

import com.skillhub.data.DataStore;
import com.skillhub.model.Course;
import com.skillhub.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.*;
import java.io.IOException;

@WebServlet("/trainer/students")
public class TrainerStudentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User trainer = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        List<Course> myCourses = store.getCoursesByTrainer(trainer.getId());

        Map<Course, List<User>> courseStudentMap = new LinkedHashMap<>();
        for (Course c : myCourses) {
            courseStudentMap.put(c, store.getStudentsEnrolledInCourse(c.getId()));
        }

        request.setAttribute("courseStudentMap", courseStudentMap);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/trainer/students.jsp");
        rd.forward(request, response);
    }
}
