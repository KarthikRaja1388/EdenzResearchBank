package nz.ac.edenz.ResearchBank.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import nz.ac.edenz.ResearchBank.entity.User;
import nz.ac.edenz.ResearchBank.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    IUserService userService;

    @RequestMapping(value = "/admin/addUser")
    public String addUserPage(@ModelAttribute ("command") @Valid User user, Model model, HttpSession session) {
        String email = (String) session.getAttribute("email");
        User currentUser = userService.findUserByEmail(email);
        model.addAttribute("currentUser", currentUser.getFirst_name());
        model.addAttribute("userRole", currentUser.getRole());
        return "addUserPage";
    }

    @RequestMapping(value = "/admin/saveuser", method = RequestMethod.GET)
    public String addUser(@ModelAttribute("command") @Valid User user, Model model, BindingResult result) {
        if(result.hasErrors()){
            return "addUserPage";
        }else{
            userService.addUser(user);
            return "redirect:/admin/userList?act=sv";
        }
    }

    @RequestMapping(value = "/admin/userList")
    public String userList(Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        model.addAttribute("users", userService.findAllUsers());
        return "userList";
    }

    @RequestMapping(value = "/admin/deleteUser")
    public String deleteUser(@RequestParam("userId") Integer userId) {
        userService.deleteUserById(userId);
        return "redirect:userList?act=del";
    }

    @RequestMapping(value = "/admin/editUser")
    public String editUser(Model model, @RequestParam("userId") Integer userId, HttpSession session) {
        session.setAttribute("sessionUserId", userId);
        User user = userService.findUserById(userId);
        String name = (String) session.getAttribute("userFirstName");
        model.addAttribute("currentUser", name);
        model.addAttribute(user);
        return "editUser";
    }

    @RequestMapping(value = "/admin/updateUser", method = RequestMethod.POST)
    public String updateUser(Model model, @ModelAttribute("user")@Valid User user, HttpSession session) {

        try {
            Integer userId = (Integer) session.getAttribute("sessionUserId");
            user.setUser_id(userId);
            userService.updateUser(user);
            return "redirect:userList?act=u";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("update_error", "Failed to update");
            return "editUser";
        }
    }

}
