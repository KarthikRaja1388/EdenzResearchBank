
package nz.ac.edenz.ResearchBank.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nz.ac.edenz.ResearchBank.dao.BaseDAO;
import nz.ac.edenz.ResearchBank.dao.IUserDAO;
import nz.ac.edenz.ResearchBank.entity.User;
import nz.ac.edenz.ResearchBank.exception.UserDiabledException;
import nz.ac.edenz.ResearchBank.rowmapper.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends BaseDAO implements IUserService{

    @Autowired
    private IUserDAO userDAO;
    
    @Override
    public User login(String email, String password) throws UserDiabledException {
        String query = "SELECT user_id,first_name,last_name,department,email,role,account_status FROM user_info WHERE email =:email AND password =:password";
        
        Map loginMap = new HashMap();
        loginMap.put("email", email);
        loginMap.put("password", password);

        try{
            User user = getNamedParameterJdbcTemplate().queryForObject(query, loginMap, new UserRowMapper());
            if(user.getAccount_status().equals(IUserService.USER_STATUS_DISABLED)){
                 throw new UserDiabledException("Account is disabled. Contact Admin");
            }else{
                return user;
            }
        }catch(EmptyResultDataAccessException e){
            return null;
        }  
    }

    @Override
    public void addUser(User user) {
        userDAO.addUser(user);
    }

    @Override
    public void deleteUserById(Integer userId) {
        userDAO.deleteUserById(userId);
    }

    @Override
    public void changeUserStatus(String email, String status) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public User findUserById(Integer userId) {
      String query = "SELECT user_id,first_name,last_name,department,email,role,account_status FROM user_info WHERE user_id = ?";
      User user = getJdbcTemplate().queryForObject(query, new UserRowMapper(),userId);
      return user;   
    }

    @Override
    public List<User> findAllUsers() {
        String query = "SELECT * FROM user_info";   
        return getJdbcTemplate().query(query,new UserRowMapper());
    }

    @Override
    public void updateUser(User user) {
        String query = "UPDATE user_info "
                + "SET  first_name = ?,"
                + "last_name = ?, "
                + "department = ?,"
                + " email = ?,"
                + "role = ?,"
                + "account_status = ? "
                + "WHERE user_id = ?";
           
        
       
       getJdbcTemplate().update(query, user.getFirst_name(),user.getLast_name(),user.getDepartment(),user.getEmail(),
              user.getRole(),user.getAccount_status(),user.getUser_id() );
    }

    @Override
    public User findUserByEmail(String email) {
        String query = "SELECT * FROM user_info WHERE email = ?";
        return getJdbcTemplate().queryForObject(query, new UserRowMapper(),email);
    }

    @Override
    public Integer findNumberOfAdmins(String accountStatus) {
        String query = "SELECT COUNT(*) FROM user_info WHERE account_status = '"+accountStatus+"'";
        Integer rows = getJdbcTemplate().queryForObject(query,Integer.class);
        return rows;    
    }
    
    
    
}
