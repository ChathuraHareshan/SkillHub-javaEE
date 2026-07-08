
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${mode == 'edit' ? 'Edit' : 'Add'} Course - SkillHub Academy</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-gray-50 min-h-screen">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

    <div class="mb-8">
        <h1 class="text-3xl font-bold text-gray-900">${mode == 'edit' ? 'Edit Course' : 'Add New Course'}</h1>
        <p class="text-sm text-gray-600 mt-1">${mode == 'edit' ? 'Update course information' : 'Create a new course in the system'}</p>
    </div>

    <div class="bg-white rounded-xl shadow-sm border border-gray-100 overflow-hidden max-w-2xl">
        <div class="p-6">
            <form action="${pageContext.request.contextPath}/admin/courses" method="post" class="space-y-5">
                <input type="hidden" name="action" value="${mode == 'edit' ? 'update' : 'add'}">
                <c:if test="${mode == 'edit'}">
                    <input type="hidden" name="id" value="${course.id}">
                </c:if>

                <div>
                    <label for="code" class="block text-sm font-semibold text-gray-700 mb-1">Course Code</label>
                    <input type="text" id="code" name="code" value="${course.code}" required
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition"
                           placeholder="e.g., CS101">
                </div>

                <div>
                    <label for="name" class="block text-sm font-semibold text-gray-700 mb-1">Course Name</label>
                    <input type="text" id="name" name="name" value="${course.name}" required
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition"
                           placeholder="e.g., Introduction to Computer Science">
                </div>

                <div>
                    <label for="description" class="block text-sm font-semibold text-gray-700 mb-1">Description</label>
                    <textarea id="description" name="description" required rows="3"
                              class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition resize-y"
                              placeholder="Brief description of the course">${course.description}</textarea>
                </div>

                <div>
                    <label for="durationWeeks" class="block text-sm font-semibold text-gray-700 mb-1">Duration (weeks)</label>
                    <input type="number" id="durationWeeks" name="durationWeeks" min="1" value="${course.durationWeeks}" required
                           class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition">
                </div>

                <div>
                    <label for="trainerId" class="block text-sm font-semibold text-gray-700 mb-1">Assigned Trainer</label>
                    <select id="trainerId" name="trainerId"
                            class="w-full px-4 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-transparent outline-none transition">
                        <option value="">-- Unassigned --</option>
                        <c:forEach var="t" items="${trainers}">
                            <option value="${t.id}" ${course.trainerId == t.id ? 'selected' : ''}>${t.fullName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="flex items-center gap-3 pt-4 border-t border-gray-200">
                    <button type="submit"
                            class="bg-gradient-to-r from-blue-600 to-blue-700 hover:from-blue-700 hover:to-blue-800 text-white font-semibold py-2.5 px-6 rounded-lg transition shadow-sm hover:shadow-md">
                        ${mode == 'edit' ? 'Save Changes' : 'Add Course'}
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/courses"
                       class="inline-block bg-gray-200 hover:bg-gray-300 text-gray-700 font-medium py-2.5 px-6 rounded-lg transition">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>