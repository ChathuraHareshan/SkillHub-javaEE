package com.skillhub.model;

import java.io.Serializable;
import java.time.LocalDate;


public class Attendance implements Serializable {

    private int id;
    private int studentId;
    private int courseId;
    private LocalDate date = LocalDate.now();
    private String status;
    private String markedBy;

    public Attendance() { }

    public Attendance(int id, int studentId, int courseId, LocalDate date, String status, String markedBy) {
        this.id = id;
        this.studentId = studentId;
        this.courseId = courseId;
        this.date = date;
        this.status = status;
        this.markedBy = markedBy;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getCourseId() { return courseId; }
    public void setCourseId(int courseId) { this.courseId = courseId; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getMarkedBy() { return markedBy; }
    public void setMarkedBy(String markedBy) { this.markedBy = markedBy; }
}
