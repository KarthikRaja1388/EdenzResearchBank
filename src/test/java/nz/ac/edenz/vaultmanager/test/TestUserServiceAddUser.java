/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.vaultmanager.test;

import nz.ac.edenz.ResearchBank.config.SpringRootConfig;
import nz.ac.edenz.ResearchBank.entity.User;
import nz.ac.edenz.ResearchBank.services.IUserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

/**
 *
 * @author Saranya Karthik
 */
public class TestUserServiceAddUser {
        public static void main(String [] args)throws Exception{
        ApplicationContext context = new AnnotationConfigApplicationContext(SpringRootConfig.class);
            IUserService userService = context.getBean(IUserService.class);
        
        User user = new User();
        user.setFirst_name("Karthik124");
        user.setLast_name("Rajendran");
        user.setDepartment("IT12");
        user.setEmail("12345@mail.com");
        user.setPassword("password12");
        
        userService.addUser(user);
        System.out.println("-----Data Saved----");
     }
}
