
package nz.ac.edenz.ResearchBank.dao;

import java.util.HashMap;
import java.util.Map;
import nz.ac.edenz.ResearchBank.entity.Staff;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class StaffDAOImpl extends BaseDAO implements IStaffDAO{
    


   @Override
    public void addStaff(Staff staff) {
        String query = "INSERT INTO staffs (first_name,last_name,department,designation,profile_url,profile_img)"
                + "VALUES (:first_name,:last_name,:department,:designation,:profile_url,:profile_img)";
        
        Map staffMap = new HashMap();
        
        staffMap.put("first_name", staff.getFirst_name());
        staffMap.put("last_name", staff.getLast_name());
        staffMap.put("department", staff.getDepartment());
        staffMap.put("designation", staff.getDesignation());
        staffMap.put("profile_url", staff.getProfile_url());
        staffMap.put("profile_img", staff.getProfile_img());
        
         KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource(staffMap);
        getNamedParameterJdbcTemplate().update(query,parameterSource,keyHolder);
    }
    
    

    @Override
    public void upadteStaff(Staff staff) {
        String query = "UPDATE staffs "
                + "SET first_name= ?,"
                + "last_name=?,"
                + "department=?,"
                + "designation=?,"
                + "profile_url=?,"
                + "profile_img=?,"
                + "staff_status = ?"
                + " WHERE staff_id=?";
        
      
        getJdbcTemplate().update(query,staff.getFirst_name(),staff.getLast_name(),staff.getDepartment(),
                staff.getDesignation(),staff.getProfile_url(),staff.getProfile_img(),staff.getStaff_status(),staff.getStaff_id());
    }

    @Override
    public void deleteStaff(Staff staff) {
        this.deleteStaffById(staff.getStaff_id());
    }

    @Override
    public void deleteStaffById(Integer staff_id) {
        String query = "DELETE FROM staffs WHERE staff_id = ?";
        getJdbcTemplate().update(query, staff_id);
    }

    
}
