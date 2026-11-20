<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CV Builder - Form</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-slate-200 min-h-screen py-8 px-3">
<div class="max-w-3xl mx-auto bg-white rounded-xl shadow-xl overflow-hidden">

    
    <div class="px-8 py-8" style="background:linear-gradient(135deg,#0f172a,#1e293b)">
        <p class="text-xs font-semibold uppercase" style="letter-spacing:.3em;color:#b8935a">CV Builder</p>
        <h1 class="font-display text-3xl font-bold text-white mt-1">Create Your Professional CV</h1>
        <p class="text-slate-300 text-sm mt-1">Fields marked <span class="text-red-400">*</span> are required.</p>
    </div>

    <div class="p-8">
        
        <a href="CVServlet?action=sample" class="btn btn-gold mb-8">Preview Sample CV</a>

        
        <form action="CVServlet" method="post" class="space-y-9">

            <section>
                <h2 class="section-title">Personal Information</h2>
                <div class="grid md:grid-cols-2 gap-4">
                    <label class="field-label">Full Name <span class="text-red-500">*</span>
                        <input type="text" name="fullName" class="field"></label>
                    <label class="field-label">Professional Title
                        <input type="text" name="professionalTitle" class="field"></label>
                    <label class="field-label">Email <span class="text-red-500">*</span>
                        <input type="text" name="email" class="field"></label>
                    <label class="field-label">Phone Number
                        <input type="text" name="phone" class="field"></label>
                    <label class="field-label md:col-span-2">LinkedIn / GitHub URL
                        <input type="text" name="profileUrl" class="field"></label>
                    <label class="field-label md:col-span-2">Profile Summary
                        <textarea name="profileSummary" rows="3" class="field"></textarea></label>
                </div>
            </section>

            <section>
                <h2 class="section-title">Education</h2>
                <div class="grid md:grid-cols-2 gap-4">
                    <label class="field-label">Highest Degree <span class="text-red-500">*</span>
                        <input type="text" name="degree" class="field"></label>
                    <label class="field-label">Institution Name
                        <input type="text" name="institution" class="field"></label>
                    <label class="field-label">Year of Graduation
                        <input type="text" name="graduationYear" placeholder="2026" class="field"></label>
                    <label class="field-label">Major / Field
                        <input type="text" name="major" class="field"></label>
                </div>
            </section>

            <section>
                <h2 class="section-title">Experience</h2>
                <div class="grid md:grid-cols-2 gap-4">
                    <label class="field-label">Most Recent Job Title
                        <input type="text" name="jobTitle" class="field"></label>
                    <label class="field-label">Company Name
                        <input type="text" name="company" class="field"></label>
                    <label class="field-label md:col-span-2">Duration
                        <input type="text" name="duration" placeholder="Jun 2025 - Dec 2025" class="field"></label>
                    <label class="field-label md:col-span-2">Key Responsibilities / Achievements (one per line)
                        <textarea name="responsibilities" rows="4" class="field"></textarea></label>
                </div>
            </section>

            <section>
                <h2 class="section-title">Skills</h2>
                <div class="grid gap-4">
                    <label class="field-label">Technical Skills (comma-separated)
                        <input type="text" name="technicalSkills" placeholder="Java, SQL, HTML" class="field"></label>
                    <label class="field-label">Soft Skills (comma-separated)
                        <input type="text" name="softSkills" placeholder="Teamwork, Communication" class="field"></label>
                </div>
            </section>

            <button type="submit" class="btn btn-primary w-full" style="padding:0.85rem">Generate My CV</button>
        </form>
    </div>
</div>
</body>
</html>