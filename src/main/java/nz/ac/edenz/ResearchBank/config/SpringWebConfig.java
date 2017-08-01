package nz.ac.edenz.ResearchBank.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@ComponentScan(basePackages = {"nz.ac.edenz.ResearchBank"})
@EnableWebMvc
public class SpringWebConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/Resources/**").addResourceLocations("/Resources/"); //To change body of generated methods, choose Tools | Templates.
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver vr = new InternalResourceViewResolver();
        vr.setViewClass(JstlView.class);
        vr.setPrefix("/WEB-INF/view/");
        vr.setSuffix(".jsp");
        return vr;
    }

    @Bean
    public CommonsMultipartResolver multiPartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(20971520);   // 20MB
        multipartResolver.setMaxInMemorySize(1048576);  // 1MB
        return multipartResolver;
    }
}
