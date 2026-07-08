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

import java.io.IOException;
import java.util.List;

@WebServlet("/trainer/dashboard")
public class TrainerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User trainer = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        List<Course> myCourses = store.getCoursesByTrainer(trainer.getId());
        int totalStudents = myCourses.stream()
                .mapToInt(c -> store.getStudentsEnrolledInCourse(c.getId()).size())
                .sum();

        request.setAttribute("myCourses", myCourses);
        request.setAttribute("myCourseCount", myCourses.size());
        request.setAttribute("totalStudents", totalStudents);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/trainer/dashboard.jsp");
        rd.forward(request, response);
    }
}
