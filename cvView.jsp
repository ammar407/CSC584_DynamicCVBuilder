<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My CV</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-slate-200 py-8 px-3">

<c:if test="${empty cvData}">
    <div class="max-w-xl mx-auto bg-white p-8 rounded-xl shadow text-center">
        <p class="mb-4">No CV data found.</p>
        <a href="cvForm.jsp" class="btn btn-primary">Go to the form</a>
    </div>
</c:if>

<c:if test="${not empty cvData}">
  
    <div class="no-print mx-auto mb-4 flex gap-3" style="max-width:210mm">
        <a href="cvForm.jsp" class="btn btn-ghost">&larr; Back to Form</a>
        <button type="button" onclick="window.print()" class="btn btn-primary">Print / Save PDF</button>
    </div>

    <article class="cv-paper">

        
        <aside class="cv-side">
            <div class="cv-avatar font-display">
                <c:out value="${fn:toUpperCase(fn:substring(fn:trim(cvData.fullName), 0, 1))}"/>
            </div>

            <section class="mb-7">
                <h2 class="section-title">Contact</h2>
                <span class="cv-label">Email</span>
                <span class="cv-value"><c:out value="${cvData.email}"/></span>

                <c:if test="${not empty cvData.phone}">
                    <span class="cv-label">Phone</span>
                    <span class="cv-value"><c:out value="${cvData.phone}"/></span>
                </c:if>

                <c:if test="${not empty cvData.profileUrl}">
                    <span class="cv-label">Profile</span>
                    <span class="cv-value"><c:out value="${cvData.profileUrl}"/></span>
                </c:if>
            </section>

            <c:if test="${not empty cvData.technicalSkillsList}">
                <section class="mb-7">
                    <h2 class="section-title">Technical Skills</h2>
                    <div>
                        <c:forEach var="skill" items="${cvData.technicalSkillsList}">
                            <span class="chip"><c:out value="${skill}"/></span>
                        </c:forEach>
                    </div>
                </section>
            </c:if>

            <c:if test="${not empty cvData.softSkillsList}">
                <section>
                    <h2 class="section-title">Soft Skills</h2>
                    <ul class="cv-list text-sm">
                        <c:forEach var="skill" items="${cvData.softSkillsList}">
                            <li><c:out value="${skill}"/></li>
                        </c:forEach>
                    </ul>
                </section>
            </c:if>
        </aside>

       
        <div class="cv-main">

            <header class="mb-8">
                <h1 class="font-display text-4xl font-bold text-slate-900 leading-tight">
                    <c:out value="${cvData.fullName}"/>
                </h1>
                <c:if test="${not empty cvData.professionalTitle}">
                    <p class="cv-title"><c:out value="${cvData.professionalTitle}"/></p>
                </c:if>
            </header>

            <c:if test="${not empty cvData.profileSummary}">
                <section class="mb-7">
                    <h2 class="section-title">Profile</h2>
                    <p class="text-slate-700"><c:out value="${cvData.profileSummary}"/></p>
                </section>
            </c:if>

            <c:if test="${not empty cvData.jobTitle}">
                <section class="mb-7">
                    <h2 class="section-title">Experience</h2>
                    <div class="flex flex-wrap items-baseline justify-between gap-x-4">
                        <h3 class="font-semibold text-slate-900"><c:out value="${cvData.jobTitle}"/></h3>
                        <span class="text-xs font-medium tracking-wide text-slate-500"><c:out value="${cvData.duration}"/></span>
                    </div>
                    <p class="text-sm font-medium text-gold mb-2"><c:out value="${cvData.company}"/></p>
                    <ul class="cv-list text-slate-700">
                        <c:forEach var="item" items="${cvData.responsibilitiesList}">
                            <li><c:out value="${item}"/></li>
                        </c:forEach>
                    </ul>
                </section>
            </c:if>

            <section>
                <h2 class="section-title">Education</h2>
                <h3 class="font-semibold text-slate-900"><c:out value="${cvData.degree}"/></h3>
                <c:if test="${not empty cvData.major}">
                    <p class="text-sm text-slate-600"><c:out value="${cvData.major}"/></p>
                </c:if>
                <p class="text-sm text-gold font-medium">
                    <c:out value="${cvData.institution}"/>
                    <c:if test="${not empty cvData.graduationYear}"> &middot; <c:out value="${cvData.graduationYear}"/></c:if>
                </p>
            </section>
        </div>
    </article>
</c:if>
</body>
</html>