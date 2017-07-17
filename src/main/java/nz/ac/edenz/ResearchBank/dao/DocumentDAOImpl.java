package nz.ac.edenz.ResearchBank.dao;

import java.util.HashMap;
import java.util.Map;
import nz.ac.edenz.ResearchBank.entity.Document;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class DocumentDAOImpl extends BaseDAO implements IDocumentDAO{

    @Override
    public void addDocument(Document document) {
        String query = "INSERT INTO documents (user_id,title,description,department,published_on,authors,document) "
                + "VALUES (:user_id,:title,:description,:department,:published_on,:authors,:document)";
        
        Map documentMap = new HashMap();
        documentMap.put("user_id", document.getUser_id());
        documentMap.put("title", document.getTitle());
        documentMap.put("description",document.getDescription());
        documentMap.put("department",document.getDepartment());        
        documentMap.put("published_on",document.getPublished_on());
        documentMap.put("authors",document.getAuthors());
        documentMap.put("document", document.getDocument());
        
        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource(documentMap);
        getNamedParameterJdbcTemplate().update(query, parameterSource,keyHolder);
    }

    @Override
    public void editDocument(Document document) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteDocument(Integer documentId) {
        String query = "DELETE FROM documents WHERE document_id=?";
        getJdbcTemplate().update(query, documentId);
    }

    @Override
    public void updateDocument(Document document) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
