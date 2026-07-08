
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mark Attendance - SkillHub Academy</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-gray-50 min-h-screen">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900">Mark Attendance</h1>
        <p class="text-sm text-gray-600 mt-1">Record attendance for students in your courses</p>
    </div>


    <c:if test="${param.msg == 'marked'}">
        <div class="mb-6 bg-green-50 border-l-4 border-green-500 p-4 rounded-lg shadow-sm">
            <div class="flex items-center">
                <svg class="w-5 h-5 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
                </svg>
                <p class="text-green-700">Attendance recorded successfully.</p>
            </div>
        </div>
    </c:if>


    <div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
        <div class="p-6">

            <form action="${pageContext.request.contextPath}/trainer/attendance" method="get" class="space-y-4">
                <div>
                    <label for="courseId" class="block text-sm font-semibold text-gray-700 mb-1">Select Course</label>
                    <select id="courseId" name="courseId" onchange="this.form.submit()"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition">
                        <option value="">-- Select one of your courses --</option>
                        <c:forEach var="c" items="${myCourses}">
                            <option value="${c.id}" ${selectedCourseId == c.id ? 'selected' : ''}>${c.code} - ${c.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </form>


            <c:if test="${not empty selectedCourseId}">
                <form action="${pageContext.request.contextPath}/trainer/attendance" method="post" class="space-y-4 mt-6 pt-6 border-t border-gray-200">
                    <input type="hidden" name="courseId" value="${selectedCourseId}">

                    <div>
                        <label for="studentId" class="block text-sm font-semibold text-gray-700 mb-1">Student</label>
                        <select id="studentId" name="studentId" required
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition">
                            <c:forEach var="s" items="${studentsInCourse}">
                                <option value="${s.id}">${s.fullName} (${s.username})</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <label for="status" class="block text-sm font-semibold text-gray-700 mb-1">Status</label>
                        <select id="status" name="status" required
                                class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition">
                            <option value="PRESENT">✓ Present</option>
                            <option value="ABSENT">✗ Absent</option>
                        </select>
                    </div>

                    <button type="submit"
                            class="w-full bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white font-semibold py-2.5 px-6 rounded-lg transition shadow-sm hover:shadow-md">
                        Mark Attendance
                    </button>
                </form>
            </c:if>

            <c:if test="${empty selectedCourseId}">
                <div class="text-center py-8 text-gray-500">
                    <svg class="mx-auto h-12 w-12 text-gray-400 mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    <p>Please select a course to mark attendance</p>
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>