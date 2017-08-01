/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.dao.BaseDAO;
import nz.ac.edenz.ResearchBank.entity.Profile;
import nz.ac.edenz.ResearchBank.rowmapper.ProfileRowMapper;
import org.springframework.stereotype.Service;

@Service
public class ProfileServiceImpl extends BaseDAO implements IProfileService{

    @Override
    public List<Profile> findAllProfile() {
        String query = "SELECT * FROM profile";
        return getJdbcTemplate().query(query, new ProfileRowMapper());
    }
    
}
