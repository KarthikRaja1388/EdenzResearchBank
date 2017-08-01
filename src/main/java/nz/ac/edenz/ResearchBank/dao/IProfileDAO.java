
package nz.ac.edenz.ResearchBank.dao;

import java.util.List;
import nz.ac.edenz.ResearchBank.entity.Profile;


public interface IProfileDAO {
    
     public void addProfile(Profile profile);
     public void editProfile(Profile profile);
     public void deleteProfile(Profile profile);
     
    
}
