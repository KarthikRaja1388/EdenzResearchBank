package nz.ac.edenz.ResearchBank.entity;



public class Document {
    
    private Integer document_id;
    private Integer user_id;
    private String title;  
    private String citation;
    private String description;
    private String department;
    private String published_on;
    private String author_one;
    private String author_two;
    private String author_three;
    private String author_four;
    private String keywords;

    public String getAuthor_one() {
        return author_one;
    }

    public void setAuthor_one(String author_one) {
        this.author_one = author_one;
    }

    public String getAuthor_two() {
        return author_two;
    }

    public void setAuthor_two(String author_two) {
        this.author_two = author_two;
    }

    public String getAuthor_three() {
        return author_three;
    }

    public void setAuthor_three(String author_three) {
        this.author_three = author_three;
    }

    public String getAuthor_four() {
        return author_four;
    }

    public void setAuthor_four(String author_four) {
        this.author_four = author_four;
    }
  
    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getDocument_id() {
        return document_id;
    }

    public void setDocument_id(Integer document_id) {
        this.document_id = document_id;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublished_on() {
        return published_on;
    }

    public void setPublished_on(String published_on) {
        this.published_on = published_on;
    }
    
    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getCitation() {
        return citation;
    }

    public void setCitation(String citation) {
        this.citation = citation;
    }

    public String getKeywords() {
        return keywords;
    }

    
    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }
   
    
}
