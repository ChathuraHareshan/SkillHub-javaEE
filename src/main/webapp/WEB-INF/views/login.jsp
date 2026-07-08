
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - SkillHub Academy</title>
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
        <p class="text-white/60 text-sm">Training Management Portal</p>
    </div>


    <div class="bg-white/5 backdrop-blur-lg rounded-2xl border border-white/10 shadow-2xl p-8">
        <div class="mb-6">
            <h2 class="text-2xl font-bold text-white">Welcome Back</h2>
            <p class="text-white/50 text-sm mt-1">Sign in to your account</p>
        </div>

        <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-5">
            <div>
                <label class="block text-white/80 text-sm font-medium mb-1.5">Username</label>
                <input type="text" name="username" required
                       class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg text-white placeholder-white/30 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                       placeholder="Enter your username">
            </div>

            <div>
                <label class="block text-white/80 text-sm font-medium mb-1.5">Password</label>
                <input type="password" name="password" required
                       class="w-full px-4 py-3 bg-white/5 border border-white/10 rounded-lg text-white placeholder-white/30 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent transition"
                       placeholder="Enter your password">
            </div>

            <button type="submit"
                    class="w-full bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700 text-white font-semibold py-3 rounded-lg transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                Sign In
            </button>

            <div class="mt-6 text-center">
                <p class="text-white/50 text-sm">
                    Create a new account?
                    <a href="${pageContext.request.contextPath}/register" class="text-blue-400 hover:text-blue-300 font-medium transition">Register</a>
                </p>
            </div>
        </form>


        <div class="mt-6 p-4 bg-white/5 rounded-lg border border-white/5">
            <p class="text-white/40 text-xs text-center">Demo Credentials</p>
            <div class="grid grid-cols-2 gap-2 mt-2 text-xs">
                <div class="text-white/30">
                    <span class="text-white/50">Admin:</span> admin / admin@123
                </div>
                <div class="text-white/30">
                    <span class="text-white/50">Trainer:</span> sahan / sahan@123
                </div>
                <div class="text-white/30 col-span-2 text-center">
                    <span class="text-white/50">Student:</span> chathura / chathura@123
                </div>

                <div class="text-white/30 col-span-2 text-center">
                    <span class="text-white/50">Student:</span> amal / amal@123
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>