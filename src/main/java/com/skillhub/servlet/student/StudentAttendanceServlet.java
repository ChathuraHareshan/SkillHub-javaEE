package com.skillhub.servlet.student;

import com.skillhub.data.DataStore;
import com.skillhub.model.Attendance;
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

@WebServlet("/student/attendance")
public class StudentAttendanceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User student = (User) session.getAttribute("user");
        DataStore store = DataStore.getInstance();

        List<Attendance> records = store.getAttendanceByStudent(student.getId());
        request.setAttribute("attendanceRecords", records);
        request.setAttribute("dataStore", store);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/student/attendance.jsp");
        rd.forward(request, response);
    }
}
