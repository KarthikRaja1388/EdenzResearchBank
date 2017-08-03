
package nz.ac.edenz.ResearchBank.rowmapper;

import com.mysql.jdbc.Blob;
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
        document.setCitation(rs.getString("citation"));
        document.setDescription(rs.getString("description"));
        document.setDepartment(rs.getString("department"));
        document.setPublished_on(rs.getString("published_on"));
        document.setAuthor_one(rs.getString("author_one"));
        document.setAuthor_two(rs.getString("author_two"));
        document.setAuthor_three(rs.getString("author_three"));
        document.setAuthor_four(rs.getString("author_four"));
        //document.setDocument_path(rs.getString("document_path"));
        //document.setFile((Blob) rs.getBlob("file"));
        document.setKeywords(rs.getString("keywords"));
        
        
        return document;
    }
    
}
