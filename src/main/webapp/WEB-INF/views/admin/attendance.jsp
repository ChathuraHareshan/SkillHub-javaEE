
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

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900">Mark Attendance</h1>
        <p class="text-sm text-gray-600 mt-1">Record and manage student attendance for courses</p>
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


    <div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden max-w-2xl mb-8">
        <div class="p-6">

            <form action="${pageContext.request.contextPath}/admin/attendance" method="get" class="space-y-4">
                <div>
                    <label for="courseId" class="block text-sm font-semibold text-gray-700 mb-1">Select Course</label>
                    <select id="courseId" name="courseId" onchange="this.form.submit()"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition">
                        <option value="">-- Select a course --</option>
                        <c:forEach var="c" items="${courses}">
                            <option value="${c.id}" ${selectedCourseId == c.id ? 'selected' : ''}>${c.code} - ${c.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </form>


            <c:if test="${not empty selectedCourseId}">
                <form action="${pageContext.request.contextPath}/admin/attendance" method="post" class="space-y-4 mt-6 pt-6 border-t border-gray-200">
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
        </div>
    </div>


    <div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
        <div class="p-6">
            <div class="flex items-center justify-between mb-4">
                <h2 class="text-xl font-bold text-gray-900">Recent Attendance Records</h2>
                <span class="text-sm text-gray-500">Last 20 records</span>
            </div>

            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead>
                    <tr class="border-b border-gray-200 bg-gray-50">
                        <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Date</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Student</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Course</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Status</th>
                        <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Marked By</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="a" items="${recentAttendance}" varStatus="loop" begin="0" end="19">
                        <tr class="border-b border-gray-100 hover:bg-gray-50 transition">
                            <td class="px-4 py-3 text-sm text-gray-700">${a.date}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">${dataStore.findUserById(a.studentId).fullName}</td>
                            <td class="px-4 py-3 text-sm text-gray-700">${dataStore.findCourseById(a.courseId).code}</td>
                            <td class="px-4 py-3">
                                <c:choose>
                                    <c:when test="${a.status == 'PRESENT'}">
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                                    <span class="w-1.5 h-1.5 bg-green-500 rounded-full mr-1.5"></span>
                                                    Present
                                                </span>
                                    </c:when>
                                    <c:otherwise>
                                                <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                                    <span class="w-1.5 h-1.5 bg-red-500 rounded-full mr-1.5"></span>
                                                    Absent
                                                </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="px-4 py-3 text-sm text-gray-700">${a.markedBy}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>