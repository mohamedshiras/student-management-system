package model;

public class StudentLinkedList {

    // Static instance to act as a shared in-memory database
    public static final StudentLinkedList DB = new StudentLinkedList();

    private Node head;
    private static int idCounter = 1; // Auto-generation counter

    public StudentLinkedList() {
        this.head = null;
    }

    public synchronized void addStudent(String fullName, String address, String email, String contact, String dob, String department, String course) {
        // Create the student object (using the package-private class via Node)
        // We instantiate Node which instantiates Student internally
        Student s = new Student(idCounter++, fullName, address, email, contact, dob, department, course);
        Node newNode = new Node(s);

        if (head == null) {
            head = newNode;
        } else {
            Node current = head;
            while (current.getNext() != null) {
                current = current.getNext();
            }
            current.setNext(newNode);
        }
    }

    public synchronized void deleteStudentById(int id) {
        if (head == null) return;

        if (head.getStudentId() == id) {
            head = head.getNext();
            return;
        }

        Node current = head;
        while (current.getNext() != null) {
            if (current.getNext().getStudentId() == id) {
                current.setNext(current.getNext().getNext());
                return;
            }
            current = current.getNext();
        }
    }

    public Node searchStudentById(int id) {
        Node current = head;
        while (current != null) {
            if (current.getStudentId() == id) {
                return current;
            }
            current = current.getNext();
        }
        return null;
    }

    public Node getHead() {
        return head;
    }
}