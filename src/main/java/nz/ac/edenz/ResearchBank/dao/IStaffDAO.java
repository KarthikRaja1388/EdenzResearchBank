
package nz.ac.edenz.ResearchBank.dao;

import java.io.File;
import nz.ac.edenz.ResearchBank.entity.Staff;


public interface IStaffDAO {
    
    /**
     * Method to add staff 
     * @param staff holds the value of staff passed
     */
    public void addStaff(Staff staff);
    
    /**
     * Method to update the staff passed
     * @param staff holds the value of staff passed
     */
    public void upadteStaff(Staff staff);
    /**
     * Method to delete staff
     * @param user holds the value of user passed
     */
    public void deleteStaff(Staff staff);
    
    /**
     * Method to delete staff based on the user ID
     * @param user_id holds the value of user_id passed
     */
    public void deleteStaffById(Integer staff_id);
    
}
