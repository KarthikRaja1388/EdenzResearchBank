
package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.entity.Projects;


public interface IProjectsService {
    
    /**
     * Method to find all the current projects
     * @return List of current Projects
     */
    public List<Projects> findAllProjects();
    public List<Projects> findCurrentProjects();
    public List<Projects>findPastProjects();
    public void saveProjects(Projects projects);
    public Projects findProjectById(Integer id);
    public List<Projects> findProjectsByString(String searchString);
    public void updateProjects(Projects project);
    public void deleteProject(Integer projectId);
}
