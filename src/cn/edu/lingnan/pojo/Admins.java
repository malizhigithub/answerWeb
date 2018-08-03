package cn.edu.lingnan.pojo;

public class Admins {
    private Integer adminid;

    private String adminname;

    private String password;

    private Integer adminflag;

    public Integer getAdminid() {
        return adminid;
    }

    public void setAdminid(Integer adminid) {
        this.adminid = adminid;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname == null ? null : adminname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getAdminflag() {
        return adminflag;
    }

    public void setAdminflag(Integer adminflag) {
        this.adminflag = adminflag;
    }
}