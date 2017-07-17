
package nz.ac.edenz.vaultmanager.test;

import javax.sql.DataSource;
import nz.ac.edenz.ResearchBank.config.SpringRootConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;


public class TestDataSource {
    public static void main(String[] args)throws Exception{
        ApplicationContext context = new AnnotationConfigApplicationContext(SpringRootConfig.class);
        DataSource dataSource = context.getBean(DataSource.class);
        JdbcTemplate template= new JdbcTemplate(dataSource);
        
        String query = "insert into user_info (`first_name`, `last_name`, `department`, `user_name`, `password`) values (?,?,?,?,?)";
        Object[] param = new Object[]{"saranya23","Karthik12","IT","sks12","1234"};
        
        template.update(query, param);
        System.out.println("----Updated---");
    }
}
