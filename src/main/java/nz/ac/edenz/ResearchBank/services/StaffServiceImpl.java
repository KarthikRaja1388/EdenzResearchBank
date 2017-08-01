
package nz.ac.edenz.ResearchBank.services;

import java.util.List;
import nz.ac.edenz.ResearchBank.dao.BaseDAO;
import nz.ac.edenz.ResearchBank.dao.IStaffDAO;
import nz.ac.edenz.ResearchBank.entity.Staff;
import nz.ac.edenz.ResearchBank.rowmapper.StaffRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StaffServiceImpl extends BaseDAO implements IStaffService{

    @Autowired
    private IStaffDAO staffDAO;
    @Override
    public void addStaff(Staff staff) {
        staffDAO.addStaff(staff);
    }

    @Override
    public void updateStaff(Staff staff) {
        staffDAO.upadteStaff(staff);
    }

    @Override
    public void deleteStaffByID(Integer staff_id) {
        staffDAO.deleteStaffById(staff_id);
    }

    @Override
    public List<Staff> findAllStaff() {
        String query = "SELECT * FROM staffs ORDER BY first_name";
        return getJdbcTemplate().query(query,new StaffRowMapper());
    }

    @Override
    public Staff findDesignation(String firstName, String lastName) {
        String query = "SELECT * FROM staffs WHERE first_name = ? AND last_name = ?";
        return getJdbcTemplate().queryForObject(query, new StaffRowMapper(),firstName,lastName);
    }

    @Override
    public Staff findStaffById(Integer staff_id) {
        String query = "SELECT * FROM staffs WHERE staff_id = ?";
        return getJdbcTemplate().queryForObject(query, new StaffRowMapper(),staff_id);
    }


}
