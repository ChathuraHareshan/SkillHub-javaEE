package com.skillhub.servlet.trainer;

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

@WebServlet("/trainer/courses")
public class TrainerCoursesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User trainer = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        request.setAttribute("myCourses", store.getCoursesByTrainer(trainer.getId()));
        request.setAttribute("dataStore", store);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/trainer/courses.jsp");
        rd.forward(request, response);
    }
}
