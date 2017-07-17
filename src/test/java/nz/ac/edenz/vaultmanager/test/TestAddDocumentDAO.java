
package nz.ac.edenz.vaultmanager.test;

import nz.ac.edenz.ResearchBank.config.SpringRootConfig;
import nz.ac.edenz.ResearchBank.dao.IDocumentDAO;
import nz.ac.edenz.ResearchBank.entity.Document;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class TestAddDocumentDAO {
    
    public static void main(String [] args)throws Exception{
        ApplicationContext context = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        IDocumentDAO documentDAO = context.getBean(IDocumentDAO.class);
        
        Document document = new Document();
        document.setTitle("Emerging Technology");
        document.setDescription("Test DEsc");
        document.setPublished_on("25/06/2017");
        document.setAuthors("authors");
        document.setDepartment("IT");
        
        documentDAO.addDocument(document);
        System.out.println("-----DOCUMENT ADDED-----");
    }
}
