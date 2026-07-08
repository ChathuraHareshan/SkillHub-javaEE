package com.skillhub.data;

import com.skillhub.model.*;

import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;


public class DataStore {

    private static volatile DataStore instance;

    private final Map<Integer, User> users = new ConcurrentHashMap<>();
    private final Map<Integer, Course> courses = new ConcurrentHashMap<>();
    private final Map<Integer, Enrolment> enrolments = new ConcurrentHashMap<>();
    private final Map<Integer, Attendance> attendanceRecords = new ConcurrentHashMap<>();

    private final AtomicInteger userIdGen = new AtomicInteger(0);
    private final AtomicInteger courseIdGen = new AtomicInteger(0);
    private final AtomicInteger enrolIdGen = new AtomicInteger(0);
    private final AtomicInteger attendanceIdGen = new AtomicInteger(0);

    private DataStore() {
        seedDemoData();
    }

    public static DataStore getInstance() {
        if (instance == null) {
            synchronized (DataStore.class) {
                if (instance == null) {
                    instance = new DataStore();
                }
            }
        }
        return instance;
    }

    private void seedDemoData() {

        addUser(new User(0, "admin", "admin@123", "System Administrator", "admin@skillhub.lk", Role.ADMIN));
        User trainer1 = addUser(new User(0, "kasun", "kasun@123", "Mr. Kasun Perera", "kasun@skillhub.lk", Role.TRAINER));
        addUser(new User(0, "sahan", "sahan@123", "Ms. Sahan Perera", "sahan@skillhub.lk", Role.TRAINER));
        User student1 = addUser(new User(0, "amal", "amal@123", "Amal Fernando", "amal@gmail.com", Role.STUDENT));
        addUser(new User(0, "chathura", "chathura@123", "Chathura Hareshan", "chathura@gmail.com", Role.STUDENT));

        Course c1 = addCourse(new Course(0, "JAVA101", "Java Programming Fundamentals",
                "Introductory course covering Java SE syntax, OOP and collections.", 8, trainer1.getId()));
        addCourse(new Course(0, "WEB201", "Java EE Web Development",
                "Servlets, JSP, session management and security for enterprise web apps.", 10, trainer1.getId()));
        addCourse(new Course(0, "DS301", "Data Structures & Algorithms",
                "Core data structures, complexity analysis and algorithm design.", 6, null));

        addEnrolment(new Enrolment(0, student1.getId(), c1.getId()));
    }


    public User addUser(User user) {
        int id = userIdGen.incrementAndGet();
        user.setId(id);
        users.put(id, user);
        return user;
    }

    public User findUserByUsername(String username) {
        return users.values().stream()
                .filter(u -> u.getUsername().equalsIgnoreCase(username))
                .findFirst().orElse(null);
    }

    public User findUserById(int id) {
        return users.get(id);
    }

    public List<User> getAllUsers() {
        return users.values().stream()
                .sorted(Comparator.comparingInt(User::getId))
                .collect(Collectors.toList());
    }

    public List<User> getUsersByRole(Role role) {
        return users.values().stream()
                .filter(u -> u.getRole() == role)
                .sorted(Comparator.comparingInt(User::getId))
                .collect(Collectors.toList());
    }

    public boolean usernameExists(String username) {
        return findUserByUsername(username) != null;
    }

    public long countActiveStudents() {
        return users.values().stream()
                .filter(u -> u.getRole() == Role.STUDENT && "ACTIVE".equalsIgnoreCase(u.getStatus()))
                .count();
    }

    public int countRegisteredUsers() {
        return users.size();
    }



    public Course addCourse(Course course) {
        int id = courseIdGen.incrementAndGet();
        course.setId(id);
        courses.put(id, course);
        return course;
    }

    public void updateCourse(Course course) {
        courses.put(course.getId(), course);
    }

    public void deleteCourse(int courseId) {
        courses.remove(courseId);
    }

    public Course findCourseById(int id) {
        return courses.get(id);
    }

    public List<Course> getAllCourses() {
        return courses.values().stream()
                .sorted(Comparator.comparingInt(Course::getId))
                .collect(Collectors.toList());
    }

    public List<Course> getCoursesByTrainer(int trainerId) {
        return courses.values().stream()
                .filter(c -> c.getTrainerId() != null && c.getTrainerId() == trainerId)
                .collect(Collectors.toList());
    }

    public int countCourses() {
        return courses.size();
    }



    public Enrolment addEnrolment(Enrolment enrolment) {
        int id = enrolIdGen.incrementAndGet();
        enrolment.setId(id);
        enrolments.put(id, enrolment);
        return enrolment;
    }

    public boolean isEnrolled(int studentId, int courseId) {
        return enrolments.values().stream()
                .anyMatch(e -> e.getStudentId() == studentId && e.getCourseId() == courseId);
    }

    public List<Enrolment> getEnrolmentsByStudent(int studentId) {
        return enrolments.values().stream()
                .filter(e -> e.getStudentId() == studentId)
                .collect(Collectors.toList());
    }

    public List<Enrolment> getEnrolmentsByCourse(int courseId) {
        return enrolments.values().stream()
                .filter(e -> e.getCourseId() == courseId)
                .collect(Collectors.toList());
    }

    public List<Enrolment> getAllEnrolments() {
        return enrolments.values().stream()
                .sorted(Comparator.comparingInt(Enrolment::getId))
                .collect(Collectors.toList());
    }

    public int countEnrolments() {
        return enrolments.size();
    }




    public Attendance addAttendance(Attendance attendance) {
        int id = attendanceIdGen.incrementAndGet();
        attendance.setId(id);
        attendanceRecords.put(id, attendance);
        return attendance;
    }

    public List<Attendance> getAttendanceByStudent(int studentId) {
        return attendanceRecords.values().stream()
                .filter(a -> a.getStudentId() == studentId)
                .sorted(Comparator.comparing(Attendance::getDate).reversed())
                .collect(Collectors.toList());
    }

    public List<Attendance> getAttendanceByCourse(int courseId) {
        return attendanceRecords.values().stream()
                .filter(a -> a.getCourseId() == courseId)
                .sorted(Comparator.comparing(Attendance::getDate).reversed())
                .collect(Collectors.toList());
    }

    public List<Attendance> getAllAttendance() {
        return attendanceRecords.values().stream()
                .sorted(Comparator.comparing(Attendance::getDate).reversed())
                .collect(Collectors.toList());
    }

    public List<User> getStudentsEnrolledInCourse(int courseId) {
        return getEnrolmentsByCourse(courseId).stream()
                .map(e -> findUserById(e.getStudentId()))
                .filter(Objects::nonNull)
                .collect(Collectors.toList());
    }
}
