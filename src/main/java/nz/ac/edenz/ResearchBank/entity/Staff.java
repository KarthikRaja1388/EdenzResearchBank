
package nz.ac.edenz.ResearchBank.entity;

import java.sql.Blob;

public class Staff {

    private Integer staff_id;
    private String first_name;
    private String last_name;
    private String department;
    private String designation;
    private String profile_url;
    private Blob profile_img;  
    private String staff_status;

    public Integer getStaff_id() {
        return staff_id;
    }

    public void setStaff_id(Integer staff_id) {
        this.staff_id = staff_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getProfile_url() {
        return profile_url;
    }

    public void setProfile_url(String profile_url) {
        this.profile_url = profile_url;
    }

    public Blob getProfile_img() {
        return profile_img;
    }

    public void setProfile_img(Blob profile_img) {
        this.profile_img = profile_img;
    }


    public String getStaff_status() {
        return staff_status;
    }

    public void setStaff_status(String staff_status) {
        this.staff_status = staff_status;
    }
  
}
