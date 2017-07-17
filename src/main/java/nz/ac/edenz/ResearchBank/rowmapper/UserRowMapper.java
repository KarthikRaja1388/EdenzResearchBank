
package nz.ac.edenz.ResearchBank.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import nz.ac.edenz.ResearchBank.entity.User;
import org.springframework.jdbc.core.RowMapper;


public class UserRowMapper implements RowMapper<User>{

    @Override
    public User mapRow(ResultSet rs, int i) throws SQLException {
        User user = new User();
        user.setUser_id(rs.getInt("user_id"));
        user.setFirst_name(rs.getString("first_name"));
        user.setLast_name(rs.getString("last_name"));
        user.setDepartment(rs.getString("department"));
        user.setEmail(rs.getString("email"));
        user.setRole(rs.getString("role"));
        user.setAccount_status(rs.getString("account_status"));
        
        return user;
    }
    
}
