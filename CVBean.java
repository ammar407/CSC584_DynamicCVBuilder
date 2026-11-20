package com.cvbuilder.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class CVBean implements Serializable {

    // Personal Info
    private String fullName;
    private String professionalTitle;
    private String email;
    private String phone;
    private String profileUrl;
    private String profileSummary;

    // Education
    private String degree;
    private String institution;
    private String graduationYear;
    private String major;

    // Experience
    private String jobTitle;
    private String company;
    private String duration;
    private String responsibilities;   

    // Skills
    private String technicalSkills;   
    private String softSkills;         

   
    private List<String> errors = new ArrayList<>();

    
    public CVBean() {
    }

   
    public CVBean(String fullName, String professionalTitle, String email, String phone,
                  String profileUrl, String profileSummary,
                  String degree, String institution, String graduationYear, String major,
                  String jobTitle, String company, String duration, String responsibilities,
                  String technicalSkills, String softSkills) {
        this.fullName = fullName;
        this.professionalTitle = professionalTitle;
        this.email = email;
        this.phone = phone;
        this.profileUrl = profileUrl;
        this.profileSummary = profileSummary;
        this.degree = degree;
        this.institution = institution;
        this.graduationYear = graduationYear;
        this.major = major;
        this.jobTitle = jobTitle;
        this.company = company;
        this.duration = duration;
        this.responsibilities = responsibilities;
        this.technicalSkills = technicalSkills;
        this.softSkills = softSkills;
    }

    
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getProfessionalTitle() { return professionalTitle; }
    public void setProfessionalTitle(String professionalTitle) { this.professionalTitle = professionalTitle; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getProfileUrl() { return profileUrl; }
    public void setProfileUrl(String profileUrl) { this.profileUrl = profileUrl; }

    public String getProfileSummary() { return profileSummary; }
    public void setProfileSummary(String profileSummary) { this.profileSummary = profileSummary; }

    public String getDegree() { return degree; }
    public void setDegree(String degree) { this.degree = degree; }

    public String getInstitution() { return institution; }
    public void setInstitution(String institution) { this.institution = institution; }

    public String getGraduationYear() { return graduationYear; }
    public void setGraduationYear(String graduationYear) { this.graduationYear = graduationYear; }

    public String getMajor() { return major; }
    public void setMajor(String major) { this.major = major; }

    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }

    public String getCompany() { return company; }
    public void setCompany(String company) { this.company = company; }

    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }

    public String getResponsibilities() { return responsibilities; }
    public void setResponsibilities(String responsibilities) { this.responsibilities = responsibilities; }

    public String getTechnicalSkills() { return technicalSkills; }
    public void setTechnicalSkills(String technicalSkills) { this.technicalSkills = technicalSkills; }

    public String getSoftSkills() { return softSkills; }
    public void setSoftSkills(String softSkills) { this.softSkills = softSkills; }

    public List<String> getErrors() { return errors; }

    
    public List<String> getTechnicalSkillsList() {
        return splitBy(technicalSkills, ",");
    }

    public List<String> getSoftSkillsList() {
        return splitBy(softSkills, ",");
    }

    public List<String> getResponsibilitiesList() {
        return splitBy(responsibilities, "\\r?\\n");
    }

    private List<String> splitBy(String text, String regex) {
        List<String> result = new ArrayList<>();
        if (text == null) {
            return result;
        }
        for (String part : text.split(regex)) {
            if (!part.trim().isEmpty()) {
                result.add(part.trim());
            }
        }
        return result;
    }

    private boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    
    public boolean validate() {
        errors.clear();

        if (isEmpty(fullName)) {
            errors.add("Full Name is required.");
        }

        if (isEmpty(email)) {
            errors.add("Email is required.");
        } else if (!email.trim().matches("^[\\w.+-]+@[\\w-]+(\\.[\\w-]+)+$")) {
            errors.add("Email format is not valid (example: name@example.com).");
        }

        if (isEmpty(degree)) {
            errors.add("Highest Degree is required.");
        }

        if (getTechnicalSkillsList().isEmpty() && getSoftSkillsList().isEmpty()) {
            errors.add("Please enter at least one skill (technical or soft).");
        }

        if (!isEmpty(graduationYear) && !graduationYear.trim().matches("^\\d{4}$")) {
            errors.add("Year of Graduation must be 4 digits (example: 2026).");
        }

        return errors.isEmpty();
    }
}