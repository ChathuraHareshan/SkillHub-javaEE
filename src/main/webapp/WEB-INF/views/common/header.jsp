
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<c:set var="user" value="${sessionScope.user}" />

<nav class="relative bg-gradient-to-r from-[#0f0c29] via-[#302b63] to-[#24243e] shadow-2xl sticky top-0 z-50 border-b border-white/10 backdrop-blur-sm">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-20">

            <div class="flex items-center gap-3 group">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="flex items-center gap-3 relative">

                    <div class="relative">
                        <div class="absolute inset-0 rounded-xl bg-gradient-to-r from-blue-500 to-purple-600 blur-md opacity-75 group-hover:opacity-100 transition duration-500 animate-pulse"></div>
                        <div class="relative bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl p-2.5 shadow-lg">
                            <svg class="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                            </svg>
                        </div>
                    </div>


                    <div class="hidden sm:block">
                        <span class="text-2xl font-extrabold bg-gradient-to-r from-blue-400 via-purple-400 to-pink-400 bg-clip-text text-transparent tracking-tight">
                            SkillHub
                        </span>
                        <span class="text-2xl font-extrabold text-white/90 tracking-tight">Academy</span>
                    </div>
                </a>
            </div>


            <div class="hidden lg:flex lg:items-center lg:gap-1">
                <c:if test="${user.role == 'ADMIN'}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Dashboard</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/courses"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Courses</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/attendance"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Attendance</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/enrolments"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Enrolments</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/users"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Users</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>

                    <div class="flex items-center gap-3 ml-4 pl-4 border-l border-white/20">

                        <div class="relative group">
                            <div class="absolute inset-0 rounded-full bg-gradient-to-r from-blue-500 to-purple-600 blur-md opacity-0 group-hover:opacity-75 transition-all duration-500"></div>
                            <a href="${pageContext.request.contextPath}/admin/profile" class="relative flex items-center gap-2">
                                <div class="w-10 h-10 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-bold text-sm shadow-lg ring-2 ring-white/20 ring-offset-2 ring-offset-transparent">
                                    <c:choose>
                                        <c:when test="${not empty user.fullName}">
                                            ${fn:substring(user.fullName, 0, 1)}
                                        </c:when>
                                        <c:otherwise>
                                            U
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <span class="text-white/90 text-sm font-medium hidden xl:block">${user.fullName}</span>
                            </a>
                        </div>


                        <a href="${pageContext.request.contextPath}/logout"
                           class="relative group inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-red-500/10 hover:bg-red-500/20 text-red-400 hover:text-red-300 text-sm font-medium transition-all duration-300 border border-red-500/20 hover:border-red-500/40">
                            <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                            </svg>
                            <span class="hidden sm:inline">Logout</span>
                        </a>
                    </div>
                </c:if>

                <c:if test="${user.role == 'TRAINER'}">
                    <a href="${pageContext.request.contextPath}/trainer/dashboard"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Dashboard</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/trainer/courses"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">My Courses</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/trainer/students"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">My Students</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/trainer/attendance"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Mark Attendance</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>

                    <div class="flex items-center gap-3 ml-4 pl-4 border-l border-white/20">

                        <div class="relative group">
                            <div class="absolute inset-0 rounded-full bg-gradient-to-r from-blue-500 to-purple-600 blur-md opacity-0 group-hover:opacity-75 transition-all duration-500"></div>
                            <a href="${pageContext.request.contextPath}/admin/profile" class="relative flex items-center gap-2">
                                <div class="w-10 h-10 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-bold text-sm shadow-lg ring-2 ring-white/20 ring-offset-2 ring-offset-transparent">
                                    <c:choose>
                                        <c:when test="${not empty user.fullName}">
                                            ${fn:substring(user.fullName, 0, 1)}
                                        </c:when>
                                        <c:otherwise>
                                            U
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <span class="text-white/90 text-sm font-medium hidden xl:block">${user.fullName}</span>
                            </a>
                        </div>


                        <a href="${pageContext.request.contextPath}/logout"
                           class="relative group inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-red-500/10 hover:bg-red-500/20 text-red-400 hover:text-red-300 text-sm font-medium transition-all duration-300 border border-red-500/20 hover:border-red-500/40">
                            <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                            </svg>
                            <span class="hidden sm:inline">Logout</span>
                        </a>
                    </div>
                </c:if>


                <c:if test="${user.role == 'STUDENT'}">
                    <a href="${pageContext.request.contextPath}/student/dashboard"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Dashboard</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/student/courses"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">My Courses</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/student/enrol"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">Enrol</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>
                    <a href="${pageContext.request.contextPath}/student/attendance"
                       class="relative px-4 py-2.5 text-gray-300 hover:text-white text-sm font-medium transition-all duration-300 group">
                        <span class="relative z-10">My Attendance</span>
                        <span class="absolute inset-0 rounded-lg bg-white/0 group-hover:bg-white/10 transition-all duration-300"></span>
                        <span class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-0.5 bg-gradient-to-r from-blue-400 to-purple-400 group-hover:w-full transition-all duration-300"></span>
                    </a>

                    <div class="flex items-center gap-3 ml-4 pl-4 border-l border-white/20">

                        <div class="relative group">
                            <div class="absolute inset-0 rounded-full bg-gradient-to-r from-blue-500 to-purple-600 blur-md opacity-0 group-hover:opacity-75 transition-all duration-500"></div>
                            <a href="${pageContext.request.contextPath}/student/profile" class="relative flex items-center gap-2">
                                <div class="w-10 h-10 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-bold text-sm shadow-lg ring-2 ring-white/20 ring-offset-2 ring-offset-transparent">
                                    <c:choose>
                                        <c:when test="${not empty user.fullName}">
                                            ${fn:substring(user.fullName, 0, 1)}
                                        </c:when>
                                        <c:otherwise>
                                            U
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <span class="text-white/90 text-sm font-medium hidden xl:block">${user.fullName}</span>
                            </a>
                        </div>


                        <a href="${pageContext.request.contextPath}/logout"
                           class="relative group inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-red-500/10 hover:bg-red-500/20 text-red-400 hover:text-red-300 text-sm font-medium transition-all duration-300 border border-red-500/20 hover:border-red-500/40">
                            <svg class="w-4 h-4 group-hover:translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                            </svg>
                            <span class="hidden sm:inline">Logout</span>
                        </a>
                    </div>
                </c:if>



            </div>


            <div class="flex items-center gap-3 lg:hidden">

                <a href="${pageContext.request.contextPath}/admin/profile" class="flex items-center gap-2">
                    <div class="w-8 h-8 rounded-full bg-gradient-to-br from-blue-500 to-purple-600 flex items-center justify-center text-white font-bold text-xs shadow-lg">
                        <c:choose>
                            <c:when test="${not empty user.fullName}">
                                ${fn:substring(user.fullName, 0, 1)}
                            </c:when>
                            <c:otherwise>
                                U
                            </c:otherwise>
                        </c:choose>
                    </div>
                </a>
                <button id="mobile-menu-button" class="text-gray-300 hover:text-white focus:outline-none p-2 rounded-lg hover:bg-white/10 transition-all duration-300">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <div id="mobile-menu" class="lg:hidden hidden bg-[#1a1738] border-t border-white/10 shadow-2xl">
        <div class="px-4 py-3 space-y-1">
            <c:if test="${user.role == 'ADMIN'}">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Dashboard</a>
                <a href="${pageContext.request.contextPath}/admin/courses" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Courses</a>
                <a href="${pageContext.request.contextPath}/admin/attendance" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Attendance</a>
                <a href="${pageContext.request.contextPath}/admin/enrolments" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Enrolments</a>
                <a href="${pageContext.request.contextPath}/admin/users" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Users</a>
                <a href="${pageContext.request.contextPath}/admin/profile" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Profile</a>
            </c:if>
            <c:if test="${user.role == 'TRAINER'}">
                <a href="${pageContext.request.contextPath}/trainer/dashboard" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Dashboard</a>
                <a href="${pageContext.request.contextPath}/trainer/courses" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">My Courses</a>
                <a href="${pageContext.request.contextPath}/trainer/students" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">My Students</a>
                <a href="${pageContext.request.contextPath}/trainer/attendance" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Mark Attendance</a>
            </c:if>
            <c:if test="${user.role == 'STUDENT'}">
                <a href="${pageContext.request.contextPath}/student/dashboard" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Dashboard</a>
                <a href="${pageContext.request.contextPath}/student/courses" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">My Courses</a>
                <a href="${pageContext.request.contextPath}/student/enrol" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Enrol</a>
                <a href="${pageContext.request.contextPath}/student/attendance" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">My Attendance</a>
                <a href="${pageContext.request.contextPath}/student/profile" class="block px-4 py-3 rounded-lg text-gray-300 hover:text-white hover:bg-white/10 text-sm font-medium transition-all duration-300">Profile</a>
            </c:if>
            <div class="border-t border-white/10 my-2"></div>
            <a href="${pageContext.request.contextPath}/logout"
               class="block px-4 py-3 rounded-lg text-red-400 hover:text-red-300 hover:bg-red-500/10 text-sm font-medium transition-all duration-300">
                Logout
            </a>
        </div>
    </div>

    <div class="absolute bottom-0 left-0 right-0 h-0.5 bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 animate-gradient-x"></div>
</nav>

<style>
    @keyframes gradient-x {
        0%, 100% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
    }
    .animate-gradient-x {
        background-size: 200% 200%;
        animation: gradient-x 3s ease infinite;
    }
</style>

<script>

    document.getElementById('mobile-menu-button').addEventListener('click', function() {
        const menu = document.getElementById('mobile-menu');
        menu.classList.toggle('hidden');
    });


    document.querySelectorAll('#mobile-menu a').forEach(link => {
        link.addEventListener('click', function() {
            document.getElementById('mobile-menu').classList.add('hidden');
        });
    });
</script>