
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Students - SkillHub Academy</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-gray-50 min-h-screen">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900">My Students</h1>
        <p class="text-sm text-gray-600 mt-1">View all students enrolled in your courses</p>
    </div>

    <c:choose>
        <c:when test="${empty courseStudentMap}">
            <div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden">
                <div class="p-6 text-center py-12">
                    <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
                    </svg>
                    <p class="text-gray-500 mt-2">You have no assigned courses yet.</p>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <c:forEach var="entry" items="${courseStudentMap}">
                <div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden mb-6">
                    <div class="p-6">
                        <div class="flex items-center justify-between mb-4">
                            <div>
                                <h2 class="text-xl font-bold text-gray-900">${entry.key.code} - ${entry.key.name}</h2>
                                <p class="text-sm text-gray-500">${entry.value.size()} students enrolled</p>
                            </div>
                            <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                Active
                            </span>
                        </div>

                        <c:choose>
                            <c:when test="${empty entry.value}">
                                <div class="text-center py-6">
                                    <p class="text-gray-500">No students enrolled on this course yet.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="overflow-x-auto">
                                    <table class="w-full">
                                        <thead>
                                        <tr class="border-b border-gray-200 bg-gray-50">
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Full Name</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider hidden sm:table-cell">Username</th>
                                            <th class="px-4 py-3 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider hidden md:table-cell">Email</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="s" items="${entry.value}">
                                            <tr class="border-b border-gray-100 hover:bg-gray-50 transition">
                                                <td class="px-4 py-3 text-sm font-medium text-gray-900">${s.fullName}</td>
                                                <td class="px-4 py-3 text-sm text-gray-700 hidden sm:table-cell">${s.username}</td>
                                                <td class="px-4 py-3 text-sm text-gray-700 hidden md:table-cell">${s.email}</td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>