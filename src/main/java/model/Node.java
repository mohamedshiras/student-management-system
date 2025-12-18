package model;

// Node class for the Singly Linked List
public class Node {
    private Student student;
    private Node next;

    public Node(Student student) {
        this.student = student;
        this.next = null;
    }

    // Accessors needed for JSP scriptlets and manual traversal
    public Student getStudent() {
        return student;
    }

    public Node getNext() {
        return next;
    }

    public void setNext(Node next) {
        this.next = next;
    }

    // Helper to expose Student class to other packages if needed via casting or
    // specific getters
    // For simplicity in this structure, we expose the internal Student object
    public int getStudentId() {
        return student.getId();
    }

    public String getStudentName() {
        return student.getFullName();
    }

    public String getStudentAddress() {
        return student.getAddress();
    }

    public String getStudentEmail() {
        return student.getEmail();
    }

    public String getStudentContact() {
        return student.getContact();
    }

    public String getStudentDob() {
        return student.getDob();
    }

    public String getStudentDept() {
        return student.getDepartment();
    }

    public String getStudentCourse() {
        return student.getCourse();
    }
}