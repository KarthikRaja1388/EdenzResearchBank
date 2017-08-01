/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.ResearchBank.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import nz.ac.edenz.ResearchBank.entity.Profile;
import org.springframework.jdbc.core.RowMapper;

public class ProfileRowMapper implements RowMapper<Profile>{

    @Override
    public Profile mapRow(ResultSet rs, int i) throws SQLException {
        Profile profile = new Profile();
        
        profile.setFirst_name(rs.getString("first_name"));
        profile.setLast_name(rs.getString("last_name"));
        profile.setProfile_url(rs.getString("profile_url"));
        
        return profile;
    }
    
}
