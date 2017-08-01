
package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.entity.Staff;


public interface IStaffService {
    
    public void addStaff(Staff staff);
    public void updateStaff(Staff staff);
    public void deleteStaffByID(Integer staff_id);
    public Staff findStaffById(Integer staff_id);
    public List<Staff> findAllStaff();
    public Staff findDesignation(String firstName,String lastName);
}
