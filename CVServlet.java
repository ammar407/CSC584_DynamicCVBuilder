package com.cvbuilder.controller;

import com.cvbuilder.model.CVBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class CVServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        String action = request.getParameter("action");

        if ("sample".equals(action)) {
            
            CVBean sample = new CVBean();
            sample.setFullName("Muhamad Ammar Bin Mat Nasli");
            sample.setProfessionalTitle("Software Engineering");
            sample.setEmail("ammar123@gmail.com");
            sample.setPhone("+60 12-345 6789");
            sample.setProfileUrl("https://github.com/ammar407");
            sample.setProfileSummary("Motivated computer science graduate with strong skills in Java "
                    + "enterprise development and web applications. Eager to build clean, "
                    + "maintainable software and learn from experienced teams.");
            sample.setDegree("Bachelor of Computer Science (Hons.)");
            sample.setInstitution("Universiti Teknologi MARA (UiTM)");
            sample.setGraduationYear("2026");
            sample.setMajor("Computer Science");
            sample.setJobTitle("Software Developer Intern");
            sample.setCompany("TechNova Sdn. Bhd.");
            sample.setDuration("Jun 2025 - Dec 2025");
            sample.setResponsibilities("Developed REST APIs using Java Servlet and JSP\n"
                    + "Designed MySQL database tables and wrote SQL queries\n"
                    + "Fixed 30+ bugs and improved page load time by 20%");
            sample.setTechnicalSkills("Java, JSP, Servlet, MySQL, HTML, CSS, Git");
            sample.setSoftSkills("Teamwork, Communication, Problem Solving, Time Management");

           
            forwardTo(request, response, sample, "cvView.jsp");
        } else {
            response.sendRedirect("cvForm.jsp");
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

       
        CVBean cvBean = new CVBean();
        cvBean.setFullName(request.getParameter("fullName"));
        cvBean.setProfessionalTitle(request.getParameter("professionalTitle"));
        cvBean.setEmail(request.getParameter("email"));
        cvBean.setPhone(request.getParameter("phone"));
        cvBean.setProfileUrl(request.getParameter("profileUrl"));
        cvBean.setProfileSummary(request.getParameter("profileSummary"));
        cvBean.setDegree(request.getParameter("degree"));
        cvBean.setInstitution(request.getParameter("institution"));
        cvBean.setGraduationYear(request.getParameter("graduationYear"));
        cvBean.setMajor(request.getParameter("major"));
        cvBean.setJobTitle(request.getParameter("jobTitle"));
        cvBean.setCompany(request.getParameter("company"));
        cvBean.setDuration(request.getParameter("duration"));
        cvBean.setResponsibilities(request.getParameter("responsibilities"));
        cvBean.setTechnicalSkills(request.getParameter("technicalSkills"));
        cvBean.setSoftSkills(request.getParameter("softSkills"));

       
        if (cvBean.validate()) {
            forwardTo(request, response, cvBean, "cvView.jsp");
        } else {
            request.setAttribute("errorMessage", "Please fix the following problems:");
            forwardTo(request, response, cvBean, "cvError.jsp");
        }
    }

   
    private void forwardTo(HttpServletRequest request, HttpServletResponse response,
                           CVBean bean, String page) throws ServletException, IOException {
        request.setAttribute("cvData", bean);
        RequestDispatcher dispatcher = request.getRequestDispatcher(page);
        dispatcher.forward(request, response);
    }
}