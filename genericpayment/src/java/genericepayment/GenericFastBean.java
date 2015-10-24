package genericepayment;

public class GenericFastBean {
    private String name;
    private String email;
    private String phone;
    private String pwd;
    private String confirmpwd;
    public GenericFastBean() {
    name="" ;
    email="" ;
    phone="";
    pwd="";
    confirmpwd="";
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPwd() {
        return pwd;
    }

    public void setConfirmpwd(String confirmpwd) {
        this.confirmpwd = confirmpwd;
    }

    public String getConfirmpwd() {
        return confirmpwd;
    }
}
