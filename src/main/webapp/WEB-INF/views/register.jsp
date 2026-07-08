<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - SkillHub Academy</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-gradient-to-br from-[#0f0c29] via-[#302b63] to-[#24243e] min-h-screen flex items-center justify-center p-4">
<div class="w-full max-w-md">

    <div class="text-center mb-8">
        <div class="flex items-center justify-center gap-3 mb-4">
            <div class="relative">
                <div class="absolute inset-0 rounded-xl bg-gradient-to-r from-blue-500 to-purple-600 blur-xl opacity-75 animate-pulse"></div>
                <div class="relative bg-gradient-to-br from-blue-500 to-purple-600 rounded-xl p-3 shadow-2xl">
                    <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                    </svg>
                </div>
            </div>
            <div>
                <span class="text-3xl font-extrabold bg-gradient-to-r from-blue-400 via-purple-400 to-pink-400 bg-clip-text text-transparent">SkillHub</span>
                <span class="text-3xl font-extrabold text-white/90">Academy</span>
            </div>
        </div>
        <p class="text-white/60 text-sm">Create your student account</p>
    </div>


    <div class="bg-white/5 backdrop-blur-lg rounded-2xl border border-white/10 shadow-2xl p-8">
        <div class="mb-6">
            <h2 class="text-2xl font-bold text-white">Create Account</h2>
            <p class="text-white/50 text-sm mt-1">Register to enrol on SkillHub training courses</p>
        </div>


        <c:if test="${not empty errorMessage}">
            <div class="mb-4 bg-red-500/10 border border-red-500/20 rounded-lg p-3">
                <p class="text-red-400 text-sm">${errorMessage}</p>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post" class="space-y-4">
            <div>
                <label for="fullName" class="block text-white/80 text-sm font-medium mb-1.5">Full Name</label>
                <input type="text" id="fullName" name="fullName" required
                       class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg text-white placeholder-white/30 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                       placeholder="Enter your full name">
            </div>

            <div>
                <label for="email" class="block text-white/80 text-sm font-medium mb-1.5">Email</label>
                <input type="email" id="email" name="email" required
                       class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg text-white placeholder-white/30 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                       placeholder="Enter your email address">
            </div>

            <div>
                <label for="username" class="block text-white/80 text-sm font-medium mb-1.5">Username</label>
                <input type="text" id="username" name="username" required
                       class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg text-white placeholder-white/30 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                       placeholder="Choose a username">
            </div>

            <div>
                <label for="password" class="block text-white/80 text-sm font-medium mb-1.5">Password</label>
                <input type="password" id="password" name="password" required
                       class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg text-white placeholder-white/30 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                       placeholder="Create a password">
            </div>

            <button type="submit"
                    class="w-full bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white font-semibold py-3 rounded-lg transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                Create Account
            </button>
        </form>

        <div class="mt-6 text-center">
            <p class="text-white/50 text-sm">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login" class="text-blue-400 hover:text-blue-300 font-medium transition">Sign in</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>