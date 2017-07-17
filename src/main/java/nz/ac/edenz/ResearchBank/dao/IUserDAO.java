
package nz.ac.edenz.ResearchBank.dao;

import nz.ac.edenz.ResearchBank.entity.User;

public interface IUserDAO {
    public void addUser(User user);
    public void updateUser(User user);
    public void deleteUser(User user);
    public void deleteUserById(Integer user_id);

}
