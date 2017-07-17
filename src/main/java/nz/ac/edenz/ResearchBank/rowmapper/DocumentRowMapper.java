
package nz.ac.edenz.ResearchBank.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import nz.ac.edenz.ResearchBank.entity.Document;
import org.springframework.jdbc.core.RowMapper;


public class DocumentRowMapper implements RowMapper<Document>{

    @Override
    public Document mapRow(ResultSet rs, int i) throws SQLException {
        Document document = new Document();
        
        document.setDocument_id(rs.getInt("document_id"));
        document.setUser_id(rs.getInt("user_id"));
        document.setTitle(rs.getString("title"));
        document.setDescription(rs.getString("description"));
        document.setDepartment(rs.getString("department"));
        document.setPublished_on(rs.getString("published_on"));
        document.setAuthors(rs.getString("authors"));
        document.setDocument(rs.getBytes("document"));
        
        
        return document;
    }
    
}
