/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.vaultmanager.test;

import nz.ac.edenz.ResearchBank.config.SpringRootConfig;
import nz.ac.edenz.ResearchBank.dao.IUserDAO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 *
 * @author Saranya Karthik
 */
public class TestUserDAODelete {
    public static void main(String[]args)throws Exception{
        ApplicationContext context = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        IUserDAO userDAO = context.getBean(IUserDAO.class);
        userDAO.deleteUserById(0);
        
        System.out.println("------DELETED------");
    }
}
