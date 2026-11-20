<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CV Builder - Error</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-slate-200 min-h-screen flex items-center justify-center p-4">
<div class="max-w-lg w-full bg-white rounded-xl shadow-xl p-8" style="border-top:4px solid #dc2626">
    <h1 class="font-display text-2xl font-bold text-slate-900 mb-1">Please check your details</h1>
    <p class="mb-4 text-slate-600 text-sm"><c:out value="${errorMessage}"/></p>

    <ul class="cv-list mb-6 text-red-600 text-sm">
        <c:forEach var="err" items="${cvData.errors}">
            <li><c:out value="${err}"/></li>
        </c:forEach>
    </ul>

    <a href="cvForm.jsp" class="btn btn-primary">&larr; Back to Form</a>
</div>
</body>
</html>