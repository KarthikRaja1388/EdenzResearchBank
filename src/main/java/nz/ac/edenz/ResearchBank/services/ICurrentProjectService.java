
package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.entity.CurrentProjects;


public interface ICurrentProjectService {
    
    /**
     * Method to find all the current projects
     * @return List of current Projects
     */
    public List<CurrentProjects> findCurrentProjects();
}
