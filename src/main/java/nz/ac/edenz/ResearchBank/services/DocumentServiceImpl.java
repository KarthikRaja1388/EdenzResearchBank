
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
        String query = "SELECT * FROM documents WHERE department = ?";
        return getJdbcTemplate().query(query,new DocumentRowMapper(),department);
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
        String query = "UPDATE documents "
                + "SET title = ?,"
                + "citation = ?,"
                + "description = ?,"
                + "department = ?,"
                + "published_on = ?,"
                + "author_one = ?,"
                + "author_two = ?,"
                + "author_three = ?,"
                + "author_four = ?,"
                + "file = ?,"
                + "keywords = ?"
                + "WHERE document_id = ?";
        
        getJdbcTemplate().update(query, document.getTitle(),document.getCitation(),document.getDescription(),document.getDepartment(),
                                    document.getPublished_on(),document.getAuthor_one(),document.getAuthor_two(),
                                    document.getAuthor_three(),document.getAuthor_four(),document.getFile(),
                                    document.getKeywords(),document.getDocument_id());
    }

    @Override
    public List<Document> findDocumentByUserId(Integer userId) {
            String query = "SELECT * FROM documents WHERE user_id = ?";
            return getJdbcTemplate().query(query, new DocumentRowMapper(),userId);
    }

    @Override
    public List<Document> findRecentDocuments() {
        String query = "SELECT * FROM documents ORDER BY document_id DESC LIMIT 10";
        return getJdbcTemplate().query(query, new DocumentRowMapper());
    }

    @Override
    public List<Document> findDocumentByName(String name) {
        String query = "SELECT * FROM documents where (author_one = '"+name+"'  or author_two = '"+name+"'  or author_three = '"+name+"'  or author_four = '"+name+"' )";
        return getJdbcTemplate().query(query, new DocumentRowMapper());
    }

    @Override
    public Integer findNumberofDocument() {

        String query = "SELECT COUNT(*) FROM documents";
        Integer rows = getJdbcTemplate().queryForObject(query,Integer.class);
        return rows;
    }

    @Override
    public Integer findNumberofDocumentsByDepartment(String department) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
