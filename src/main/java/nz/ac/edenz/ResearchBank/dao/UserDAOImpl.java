/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nz.ac.edenz.ResearchBank.dao;

import java.util.HashMap;
import java.util.Map;
import nz.ac.edenz.ResearchBank.entity.User;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl extends BaseDAO implements IUserDAO{

    /**
     * This method adds the user to database
     * @param user holds the user object passed
     * 
     */
    @Override
    public void addUser(User user) {
        String query = "insert into user_info(first_name,last_name,department,email,password)values(:first_name,:last_name,:department,:email,:password)";
       
        Map userMap = new HashMap();
        userMap.put("first_name",user.getFirst_name());
        userMap.put("last_name",user.getLast_name());
        userMap.put("department",user.getDepartment());
        userMap.put("email",user.getEmail());
        userMap.put("password",user.getPassword());
        
        KeyHolder keyHolder = new GeneratedKeyHolder();
        SqlParameterSource parameterSource = new MapSqlParameterSource(userMap);
        getNamedParameterJdbcTemplate().update(query,parameterSource,keyHolder);
        
    }

    //Needs to checked -- getting no value error
    @Override
    public void updateUser(User user) {
        String query = "UPDATE user_info "
                + "SET first_name=:first_name,"
                + "last_name=:last_name,"
                + "department=:department,"
                + "email=:email"
                + "WHERE first_name=:first_name";
        
        Map userMap = new HashMap();
        userMap.put("first_name",user.getFirst_name());
        userMap.put("last_name",user.getLast_name());
        userMap.put("department",user.getDepartment());
        userMap.put("email",user.getEmail());
        
        getNamedParameterJdbcTemplate().update(query,userMap);
                
    }

    @Override
    public void deleteUser(User user) {
        this.deleteUserById(user.getUser_id());
    }

    @Override
    public void deleteUserById(Integer userId){
       String query = "DELETE FROM user_info WHERE user_id = ?";
       getJdbcTemplate().update(query, userId);
    }

}
