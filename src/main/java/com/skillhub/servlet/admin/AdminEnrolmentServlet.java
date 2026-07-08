package com.skillhub.servlet.admin;

import com.skillhub.data.DataStore;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/enrolments")
public class AdminEnrolmentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DataStore store = DataStore.getInstance();
        request.setAttribute("enrolments", store.getAllEnrolments());
        request.setAttribute("dataStore", store);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/admin/enrolments.jsp");
        rd.forward(request, response);
    }
}
