
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - SkillHub Academy</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-gray-50 min-h-screen">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900">Welcome back, ${sessionScope.user.fullName}! 👋</h1>
        <p class="text-sm text-gray-600 mt-1">Here's an overview of your learning journey</p>
    </div>


    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-8">
        <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-5 hover:shadow-md transition">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Enrolled Courses</p>
                    <p class="text-2xl font-bold text-gray-900">${enrolledCount}</p>
                </div>
                <div class="bg-blue-50 rounded-lg p-3">
                    <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                    </svg>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-xl shadow-sm border border-gray-100 p-5 hover:shadow-md transition">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm text-gray-500">Attendance Records</p>
                    <p class="text-2xl font-bold text-gray-900">${attendanceCount}</p>
                </div>
                <div class="bg-green-50 rounded-lg p-3">
                    <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </div>
            </div>
        </div>
    </div>


    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <a href="${pageContext.request.contextPath}/student/enrol"
           class="bg-white rounded-xl shadow-sm border border-gray-100 p-5 hover:shadow-md transition group">
            <div class="flex items-center gap-3">
                <div class="bg-purple-50 rounded-lg p-2.5 group-hover:bg-purple-100 transition">
                    <svg class="w-5 h-5 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                    </svg>
                </div>
                <div>
                    <p class="font-semibold text-gray-900">Browse Courses</p>
                    <p class="text-xs text-gray-500">Enrol in new courses</p>
                </div>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/student/courses"
           class="bg-white rounded-xl shadow-sm border border-gray-100 p-5 hover:shadow-md transition group">
            <div class="flex items-center gap-3">
                <div class="bg-blue-50 rounded-lg p-2.5 group-hover:bg-blue-100 transition">
                    <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                    </svg>
                </div>
                <div>
                    <p class="font-semibold text-gray-900">My Courses</p>
                    <p class="text-xs text-gray-500">View enrolled courses</p>
                </div>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/student/attendance"
           class="bg-white rounded-xl shadow-sm border border-gray-100 p-5 hover:shadow-md transition group">
            <div class="flex items-center gap-3">
                <div class="bg-green-50 rounded-lg p-2.5 group-hover:bg-green-100 transition">
                    <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                </div>
                <div>
                    <p class="font-semibold text-gray-900">Attendance</p>
                    <p class="text-xs text-gray-500">View attendance history</p>
                </div>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/student/profile"
           class="bg-white rounded-xl shadow-sm border border-gray-100 p-5 hover:shadow-md transition group">
            <div class="flex items-center gap-3">
                <div class="bg-orange-50 rounded-lg p-2.5 group-hover:bg-orange-100 transition">
                    <svg class="w-5 h-5 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                </div>
                <div>
                    <p class="font-semibold text-gray-900">Profile</p>
                    <p class="text-xs text-gray-500">Update your information</p>
                </div>
            </div>
        </a>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>