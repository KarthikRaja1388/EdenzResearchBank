
package nz.ac.edenz.ResearchBank.dao;

import nz.ac.edenz.ResearchBank.entity.Projects;


public interface IProjectsDAO {

    /**
     * Method to add current Projects
     * @param project holds the value of project passed 
     */
    public void save(Projects project);
    /**
     * Method to edit project
     * @param project holds the value of project passed 
     */
    public void update(Projects project);
    
    /**
     * Method to delete the project
     * @param project holds the value of project passed
     */
    public void delete(Integer projectId);
}
