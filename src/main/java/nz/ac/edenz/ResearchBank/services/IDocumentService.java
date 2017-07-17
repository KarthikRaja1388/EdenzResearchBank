
package nz.ac.edenz.ResearchBank.services;

import java.util.Date;
import java.util.List;
import nz.ac.edenz.ResearchBank.entity.Document;


public interface IDocumentService {
    
    /**
     * Method to add document
     * @param document holds the document passed
     */
    public void addDocument(Document document);
    /**
     * Method to edit document
     * @param document holds the document passed
     */
    public void editDocument(Document document);
    /**
     * Method to update Document
     * @param document holds the document passed
     */
    public void updateDocument(Document document);
    /**
     * Method to delete the document based on the ID passed
     * @param documentId holds the document ID
     */
    public void deleteDocumentById(Integer documentId);
    /**
     * Method to find document by department
     * @param department holds the value of the department passed
     * @return List of documents found based on the department passed
     */
    public List<Document> findDocumentByDepartment(String department);
    /**
     * Method to find the documents based on the date passed
     * @param date holds the value of the date passed
     * @return List of documents based on the date passed
     */
    public List<Document>findDocumentByPublishedDate(Date date);
    
    /**
     * Method to find all the documents in the Database
     * @return List of documents
     */
    public List<Document>findAllDocuments();
    
    /**
     * Method to find documents by Id
     * @param documentId holds the value of document Id passed
     * @return document based on the ID
     */
    public Document findDocumentById(Integer documentId);
    
    /**
     * Method to find documents based on the ID passed
     * @param userId
     * @return 
     */
    public Document findDocumentByUserId(Integer userId);
    /**
     * Method to find recently added documents
     * @return List of documents
     */
    public List<Document> findRecentDocuments();
}
