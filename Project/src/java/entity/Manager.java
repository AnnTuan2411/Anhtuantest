package entity;

public class Manager {
    private int managerId;
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String phone;

    public Manager(int managerId, String username, String password, String fullName, String email, String phone) {
        this.managerId = managerId;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
    }

    // Getters and setters

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
