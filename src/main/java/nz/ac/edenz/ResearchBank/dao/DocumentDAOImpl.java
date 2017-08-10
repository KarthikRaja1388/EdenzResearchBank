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
        String query = "INSERT INTO documents (user_id,title,citation,description,department,published_on,author_one,author_two,"
                + "author_three,author_four,keywords) "
                + "VALUES (:user_id,:title,:citation,:description,:department,:published_on,:author_one,:author_two,"
                + ":author_three,:author_four,:keywords)";
        
        Map documentMap = new HashMap();
        documentMap.put("user_id", document.getUser_id());
        documentMap.put("title", document.getTitle());
        documentMap.put("citation", document.getCitation());
        documentMap.put("description",document.getDescription());
        documentMap.put("department",document.getDepartment());        
        documentMap.put("published_on",document.getPublished_on());
        documentMap.put("author_one",document.getAuthor_one());
        documentMap.put("author_two",document.getAuthor_two());
        documentMap.put("author_three",document.getAuthor_three());
        documentMap.put("author_four",document.getAuthor_four());
        //documentMap.put("file", document.getFile());
        documentMap.put("keywords", document.getKeywords());
        
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
