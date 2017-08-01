package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.entity.User;
import nz.ac.edenz.ResearchBank.exception.UserDiabledException;


public interface IUserService {
    public static final String USER_STATUS_ACTIVE = "Active";
    public static final String USER_STATUS_DISABLED = "Disabled";
    public static final String USER_ROLE_SUPER_USER = "Admin";
    public static final String USER_ROLE_ADMIN = "Department Admin";
    
    
    /**
     * Method for authenticating user which return User on success
     * and null when failed and throws an exception if user is disabled
     * 
     * @param email holds the user name or email passed
     * @param password holds the password passed
     * @return User on success and null if failed
     * @throws nz.ac.edenz.ResearchBank.exception.UserDiabledException 
     */
    public User login(String email,String password)throws UserDiabledException;
    
    /**
     * Method takes an user object and register the user
     * 
     * @param user holds the user object passed
     */
    public void addUser(User user);
    
 
    /**
     * Method for deleting User based on the ID passed
     * 
     * @param userId holds the user id passed by user
     */
    public void deleteUserById(Integer userId);
    
    /**
     * Method to change user status whether it's disabled or enabled
     * @param email holds the email passed
     * @param status holds the status of the user
     */
    public void changeUserStatus(String email,String status);
    
    /**
     * Method to find user by ID
     * @param userId holds the email passed
     * @return list of users info based on the userId passed 
     */
    public User findUserById(Integer userId);
    
    /**
     * Method to find all users
     * @return list of users
     */
    public List<User> findAllUsers();
    
    
    public void updateUser(User user);
    /**
     * Method to find user by the email passed
     * @param email holds the value of email
     */
    public User findUserByEmail(String email);
    /**
     * Method to find number of active admins
     * @param accountStatus holds the value of account status
     * @return number of admins
     */
    public Integer findNumberOfAdmins(String accountStatus);
 
}
