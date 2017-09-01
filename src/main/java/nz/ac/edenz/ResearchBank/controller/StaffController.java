package nz.ac.edenz.ResearchBank.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import nz.ac.edenz.ResearchBank.entity.Staff;
import nz.ac.edenz.ResearchBank.services.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StaffController {

    @Autowired
    private IStaffService staffService;
    
    @RequestMapping(value = "/admin/addStaffPage")
    public String addStaffPage(Model model, @ModelAttribute("staff")@Valid Staff staff, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        return "addStaff";
    }

    @RequestMapping(value = "/admin/saveStaff",method = RequestMethod.POST)
    public String addStaff(Model model, @ModelAttribute("staff")@Valid Staff staff) {
        staffService.addStaff(staff);
        return "redirect:/admin/staff?act=sv";
    }

    @RequestMapping(value = "/admin/staff")
    public String staffList(Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        model.addAttribute("staffs", staffService.findAllStaff());
        return "staffList";
    }
    
    @RequestMapping(value = "/admin/editStaff")
    public String editStaffs(@RequestParam("staffId") Integer staffId, Model model, HttpSession session){
        session.setAttribute("selectedStaffId", staffId);
        Staff staff = staffService.findStaffById(staffId);
        model.addAttribute("staff", staff);
        return "editStaff";
    }
    @RequestMapping(value = "/admin/updateStaff")
    public String updateStaffs(Model model, @ModelAttribute("staff")@Valid Staff staff,
            HttpSession session,BindingResult result){
        Integer sessionStaffId = (Integer) session.getAttribute("selectedStaffId");
        staff.setStaff_id(sessionStaffId);
        staffService.updateStaff(staff);
        return "redirect:/admin/staff?act=u";
    }

    @RequestMapping(value = "/admin/deleteStaff")
    public String deleteStaff(@RequestParam("staffId") Integer StaffId, Model model) {
        staffService.deleteStaffByID(StaffId);
        return "redirect:/admin/staffs?act=del";
    }
    

}
