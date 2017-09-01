/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.ResearchBank.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import nz.ac.edenz.ResearchBank.entity.Projects;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Saranya Karthik
 */
public class ProjectsRowMapper implements RowMapper<Projects>{

    @Override
    public Projects mapRow(ResultSet rs, int i) throws SQLException {
        Projects project = new Projects();
        
        project.setProject_id(rs.getInt("project_id"));
        project.setTitle(rs.getString("title"));
        project.setCitation(rs.getString("citation"));
        project.setDescription(rs.getString("description"));
        project.setDepartment(rs.getString("department"));
        project.setAuthor_one(rs.getString("author_one"));
        project.setAuthor_two(rs.getString("author_two"));
        project.setAuthor_three(rs.getString("author_three"));
        project.setAuthor_four(rs.getString("author_four"));
        project.setProject_status(rs.getString("project_status"));
        
        return project;
        
    }
    
}
