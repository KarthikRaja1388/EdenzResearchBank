/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.dao.BaseDAO;
import nz.ac.edenz.ResearchBank.dao.IProjectsDAO;
import nz.ac.edenz.ResearchBank.entity.Projects;
import nz.ac.edenz.ResearchBank.rowmapper.ProjectsRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectsServiceImpl extends BaseDAO implements IProjectsService{

    @Autowired
    IProjectsDAO projectsDAO;
    @Override
    public List<Projects> findCurrentProjects() {
        String query = "SELECT * FROM current_projects WHERE project_status = '"+"Current"+"'";
        return getJdbcTemplate().query(query, new ProjectsRowMapper());
    }

    @Override
    public List<Projects> findPastProjects() {
        String query = "SELECT * FROM current_projects WHERE project_status = '"+"Past"+"'";
        return getJdbcTemplate().query(query, new ProjectsRowMapper());
    }

    @Override
    public void saveProjects(Projects projects) {
        projectsDAO.save(projects);
    }

    @Override
    public List<Projects> findAllProjects() {
    String query = "SELECT * FROM current_projects";
    return getJdbcTemplate().query(query, new ProjectsRowMapper());
    }

    @Override
    public Projects findProjectById(Integer id) {
        String query = "SELECT * FROM current_projects WHERE project_id = ? ORDER BY project_id";
        return getJdbcTemplate().queryForObject(query, new ProjectsRowMapper(), id);
    }

    @Override
    public void updateProjects(Projects project) {
        projectsDAO.update(project);
    }

    @Override
    public void deleteProject(Integer projectId) {
        projectsDAO.delete(projectId);
    }

    @Override
    public List<Projects> findProjectsByString(String searchString) {
        String query = "SELECT * FROM current_projects WHERE match(title,citation,description,"
                + "department,author_one,author_two,author_three,author_four,project_status) against('"+searchString+"')";
        return getJdbcTemplate().query(query, new ProjectsRowMapper());
    }
    
}
