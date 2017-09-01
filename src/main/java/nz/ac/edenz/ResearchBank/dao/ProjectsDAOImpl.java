
package nz.ac.edenz.ResearchBank.dao;

import java.util.HashMap;
import java.util.Map;
import nz.ac.edenz.ResearchBank.entity.Projects;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectsDAOImpl extends BaseDAO implements IProjectsDAO{

    @Override
    public void save(Projects project) {
        String query = "INSERT INTO current_projects (project_id,title,citation,description,department,author_one,author_two,"
                + "author_three,author_four,project_status) "
                + "VALUES (:project_id,:title,:citation,:description,:department,:author_one,:author_two,"
                + ":author_three,:author_four,:project_status)";
        
        Map projectMap = new HashMap();
        
        projectMap.put("project_id", project.getProject_id());
        projectMap.put("title", project.getTitle());
        projectMap.put("citation", project.getCitation());
        projectMap.put("description", project.getDescription());
        projectMap.put("department", project.getDepartment());
        projectMap.put("author_one", project.getAuthor_one());
        projectMap.put("author_two", project.getAuthor_two());
        projectMap.put("author_three", project.getAuthor_three());
        projectMap.put("author_four", project.getAuthor_four());
        projectMap.put("project_status", project.getProject_status());
        
        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource(projectMap);
        getNamedParameterJdbcTemplate().update(query, parameterSource,keyHolder);
    }

    @Override
    public void update(Projects project) {
        String query = "UPDATE current_projects"
                + " SET title = ?,"
                + "citation = ?,"
                + "description = ?,"
                + "department = ?,"
                + "author_one = ?,"
                + "author_two = ?,"
                + "author_three = ?,"
                + "author_four = ?,"
                + "project_status = ?"
                + "WHERE project_id = ?";
        
        getJdbcTemplate().update(query,project.getTitle(),project.getCitation(),project.getDescription(),
                project.getDepartment(),project.getAuthor_one(),project.getAuthor_two(),project.getAuthor_three(),
                project.getAuthor_four(),project.getProject_status(),project.getProject_id());
    }

    @Override
    public void delete(Integer projectId) {
        String query = "DELETE FROM current_projects WHERE project_id = ?";
        getJdbcTemplate().update(query,projectId);
    }


    
}
