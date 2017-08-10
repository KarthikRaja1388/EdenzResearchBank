
package nz.ac.edenz.ResearchBank.dao;

import nz.ac.edenz.ResearchBank.entity.CurrentProjects;


public interface ICurrentProjectDAO {

    /**
     * Method to add current Projects
     * @param project holds the value of project passed 
     */
    public void addProject(CurrentProjects project);
    /**
     * Method to edit project
     * @param project holds the value of project passed 
     */
    public void editProject(CurrentProjects project);
    
    /**
     * Method to delete the project
     * @param project holds the value of project passed
     */
    public void deleteProject(CurrentProjects project);
}
