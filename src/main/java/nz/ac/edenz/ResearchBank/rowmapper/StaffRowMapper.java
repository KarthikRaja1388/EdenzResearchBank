
package nz.ac.edenz.ResearchBank.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import nz.ac.edenz.ResearchBank.entity.Staff;
import org.springframework.jdbc.core.RowMapper;


public class StaffRowMapper implements RowMapper<Staff>{

    @Override
    public Staff mapRow(ResultSet rs, int i) throws SQLException {
       Staff staff = new Staff();
        
        staff.setStaff_id(rs.getInt("staff_id"));
        staff.setFirst_name(rs.getString("first_name"));
        staff.setLast_name(rs.getString("last_name"));
        staff.setDepartment(rs.getString("department"));
        staff.setDesignation(rs.getString("designation"));
        staff.setProfile_url(rs.getString("profile_url"));
        staff.setProfile_img(rs.getBlob("profile_img"));
        staff.setStaff_status(rs.getString("staff_status"));
        
        return staff;
    }


}
