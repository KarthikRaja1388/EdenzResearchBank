
package nz.ac.edenz.ResearchBank.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"nz.ac.edenz.ResearchBank.dao,nz.ac.edenz.ResearchBank.services"})
public class SpringRootConfig {
    @Bean
    public BasicDataSource dataSource(){
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        //dataSource.setUrl("jdbc:mysql://mysql3000.mochahost.com/karthik_researchbank");
        //dataSource.setUsername("karthik_root");
        //dataSource.setPassword("Ed3nz2017");
        dataSource.setUrl("jdbc:mysql://mysql004.mochahost.com/ganeshan_researchbank");
        dataSource.setUsername("karthik_ganesha");
        dataSource.setPassword("sQ7az934");
        dataSource.setValidationQuery("SELECT 1");
        
        return dataSource;
    }
}
