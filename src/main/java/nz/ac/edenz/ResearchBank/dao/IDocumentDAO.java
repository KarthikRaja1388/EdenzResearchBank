package nz.ac.edenz.ResearchBank.dao;

import nz.ac.edenz.ResearchBank.entity.Document;


public interface IDocumentDAO {
    /**
     * Method to addDocument
     * @param document holds the value of document passed
     */
    public void addDocument(Document document);
    /**
     * Method to edit the document
     * @param document holds the document passed
     */
    public void editDocument(Document document);
    /**
     * Method to delete document based on the document_id
     * @param document_id holds the value of the document_id
     */
    public void deleteDocument(Integer document_id);  
    /**
     * Method to update document
     * @param document holds the document passed
     */
    public void updateDocument(Document document);
    
    /**
     * Method to upload document
     * @param document holds the value of document passed
     */
}
