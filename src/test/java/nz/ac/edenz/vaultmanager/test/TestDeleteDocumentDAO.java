
package nz.ac.edenz.vaultmanager.test;

import nz.ac.edenz.ResearchBank.config.SpringRootConfig;
import nz.ac.edenz.ResearchBank.dao.IDocumentDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class TestDeleteDocumentDAO {
   
    public static void main(String [] args)throws Exception{
        ApplicationContext context = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        IDocumentDAO documentDAO = context.getBean(IDocumentDAO.class);
        
        documentDAO.deleteDocument(2);
        System.out.println("-------DOCUMENT DELETED-----");
    }
}
