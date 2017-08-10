
package nz.ac.edenz.ResearchBank.dao;

import java.util.HashMap;
import java.util.Map;
import nz.ac.edenz.ResearchBank.entity.CurrentProjects;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class CurrentProjectsDAOImpl extends BaseDAO implements ICurrentProjectDAO{

    @Override
    public void addProject(CurrentProjects project) {
        String query = "INSERT INTO documents (project_id,staff_id,title,citation,description,department,author_one,author_two,"
                + "author_three,author_four,project_status) "
                + "VALUES (:project_id,:staff_id,:title,:citation,:description,:department,:author_one,:author_two,"
                + ":author_three,:author_four,:project_status)";
        
        Map projectMap = new HashMap();
        
        projectMap.put("project_id", project.getProject_id());
        projectMap.put("staff_id",project.getStaff_id());
        projectMap.put("title", project.getTitle());
        projectMap.put("citation", project.getCitation());
        projectMap.put("description", project.getDescription());
        projectMap.put("departmetn", project.getDepartment());
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
    public void editProject(CurrentProjects project) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteProject(CurrentProjects project) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


    
}
