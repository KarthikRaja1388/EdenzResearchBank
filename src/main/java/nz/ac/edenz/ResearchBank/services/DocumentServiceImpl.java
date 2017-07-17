
package nz.ac.edenz.ResearchBank.services;

import java.util.Date;
import java.util.List;
import nz.ac.edenz.ResearchBank.dao.BaseDAO;
import nz.ac.edenz.ResearchBank.dao.IDocumentDAO;
import nz.ac.edenz.ResearchBank.entity.Document;
import nz.ac.edenz.ResearchBank.rowmapper.DocumentRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DocumentServiceImpl extends BaseDAO implements IDocumentService{
    
    @Autowired
    private IDocumentDAO documentDAO;
    
    @Override
    public void addDocument(Document document) {
        documentDAO.addDocument(document);
    }

    @Override
    public void editDocument(Document document) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteDocumentById(Integer documentId) {
        documentDAO.deleteDocument(documentId);
    }

    @Override
    public List<Document> findDocumentByDepartment(String department) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Document> findDocumentByPublishedDate(Date date) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Document> findAllDocuments() {
        String query = "SELECT * FROM documents";   
        return getJdbcTemplate().query(query,new DocumentRowMapper());
    }

    @Override
    public Document findDocumentById(Integer documentId) {
        String query = "SELECT * FROM documents WHERE document_id = ?";
        return getJdbcTemplate().queryForObject(query, new DocumentRowMapper(),documentId);
    }

    @Override
    public void updateDocument(Document document) {
        String query = "UPDATE documents"
                + "SET title = ?,"
                + "description = ?,"
                + "department = ?,"
                + "published_on = ?,"
                + "published_by = ?,"
                + "document = ?,"
                + "WHERE document_id = ?";
        
        getJdbcTemplate().update(query, document.getTitle(),document.getDescription(),document.getDepartment(),
                                    document.getPublished_on(),document.getAuthors(),document.getDocument(),
                                    document.getDocument_id());
    }

    @Override
    public Document findDocumentByUserId(Integer userId) {
            String query = "SELECT * FROM documents WHERE user_id = ?";
            return getJdbcTemplate().queryForObject(query, new DocumentRowMapper(),userId);
    }

    @Override
    public List<Document> findRecentDocuments() {
        String query = "SELECT * FROM documents ORDER BY published_on DESC LIMIT 10";
        return getJdbcTemplate().query(query, new DocumentRowMapper());
    }
    
}
