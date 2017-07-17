
package nz.ac.edenz.vaultmanager.test;

import nz.ac.edenz.ResearchBank.config.SpringRootConfig;
import nz.ac.edenz.ResearchBank.dao.IUserDAO;
import nz.ac.edenz.ResearchBank.entity.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TestUserDAOSave {
    public static void main(String [] args)throws Exception{
        ApplicationContext context = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        IUserDAO userDAO = context.getBean(IUserDAO.class);
        
        User user = new User();
        user.setFirst_name("Karthik");
        user.setLast_name("Rajendran");
        user.setDepartment("IT");
        user.setEmail("123@mail.com");
        user.setPassword("password");
        
        userDAO.addUser(user);
        System.out.println("-----Data Saved----");
    }
}
