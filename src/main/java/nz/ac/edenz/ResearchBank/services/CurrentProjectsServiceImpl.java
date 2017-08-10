/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.dao.BaseDAO;
import nz.ac.edenz.ResearchBank.entity.CurrentProjects;
import nz.ac.edenz.ResearchBank.rowmapper.CurrentProjectsRowMapper;
import org.springframework.stereotype.Service;

@Service
public class CurrentProjectsServiceImpl extends BaseDAO implements ICurrentProjectService{

    @Override
    public List<CurrentProjects> findCurrentProjects() {
        String query = "SELECT * FROM current_projects";
        return getJdbcTemplate().query(query, new CurrentProjectsRowMapper());
    }
    
}
