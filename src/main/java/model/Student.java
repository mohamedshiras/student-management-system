package model;

public class Student {
    private int id;
    private String fullName;
    private String address;
    private String email;
    private String contact;
    private String dob;
    private String department;
    private String course;

    public Student() {
    }

    public Student(int id, String fullName, String address, String email,
            String contact, String dob, String department, String course) {
        this.id = id;
        this.fullName = fullName;
        this.address = address;
        this.email = email;
        this.contact = contact;
        this.dob = dob;
        this.department = department;
        this.course = course;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getContact() {
        return contact;
    }

    public String getDob() {
        return dob;
    }

    public String getDepartment() {
        return department;
    }

    public String getCourse() {
        return course;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setCourse(String course) {
        this.course = course;
    }
}
