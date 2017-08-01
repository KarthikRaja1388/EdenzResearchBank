
package nz.ac.edenz.ResearchBank.controller;

import javax.servlet.http.HttpSession;
import nz.ac.edenz.ResearchBank.command.LoginCommand;
import nz.ac.edenz.ResearchBank.entity.Document;
import nz.ac.edenz.ResearchBank.entity.User;
import nz.ac.edenz.ResearchBank.exception.UserDiabledException;
import nz.ac.edenz.ResearchBank.services.IDocumentService;
import nz.ac.edenz.ResearchBank.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
  
    @Autowired
    private IUserService userService;
    @Autowired
    private IDocumentService documentService;
    
    @RequestMapping("/loginApp")
    public String loginPage(Model model){
        model.addAttribute("login", new LoginCommand());
        return "loginPage";
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginHandler(@ModelAttribute("login") LoginCommand loginCommand,@ModelAttribute("document")Document document,Model model,HttpSession session){
        try {
            User loggedinUser = userService.login(loginCommand.getLoginName(), loginCommand.getPassword());
            if(loggedinUser == null){
                /**
                 * add Error message and go back to log in page
                 */
                model.addAttribute("error", "Login Failed- Invalid Credentials");
                return "loginPage";
                }else{
                    if(loggedinUser.getRole().equals(IUserService.USER_ROLE_SUPER_USER)){   
                        addUserInSession(loggedinUser, session);

                        return "redirect:/admin/dashboard";
                    }else if(loggedinUser.getRole().equals(IUserService.USER_ROLE_ADMIN)){
                        addUserInSession(loggedinUser, session);
                        return "redirect:/depAdmin/dashboard";
                    }else{
                        model.addAttribute("error", "Invalid User Role");
                        return "loginPage";
                    }
                }
        } catch (UserDiabledException ex) {
            /**
             * add Error message and go back to log in page
             */
            model.addAttribute("error", ex.getMessage());
            return "loginPage";
        }
    }
    @RequestMapping(value = "/depAdmin/dashboard")
    public String userDashboard(Model model,HttpSession session){
        String email = (String) session.getAttribute("email");
        String department = (String) session.getAttribute("department");
        String accountStatus = (String) session.getAttribute("status");
        User currentUser = userService.findUserByEmail(email);
        model.addAttribute("currentUser", currentUser.getFirst_name());
        model.addAttribute("userRole", currentUser.getRole());
        model.addAttribute("numberOfActiveUsers", userService.findNumberOfAdmins(accountStatus));
        model.addAttribute("depDocument", documentService.findDocumentByDepartment(department));
        model.addAttribute("documentCount",documentService.findNumberofDocument());
        return "user_dashboard";
    }
    @RequestMapping(value = "/admin/dashboard")
    public String adminDashboard(Model model,HttpSession session){
        String currentUserName = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        String accountStatus = (String) session.getAttribute("status");
        model.addAttribute("currentUser", currentUserName);
        model.addAttribute("userRole", role);
        model.addAttribute("numberOfActiveUsers", userService.findNumberOfAdmins(accountStatus));
        model.addAttribute("documents",documentService.findRecentDocuments());
        model.addAttribute("documentCount",documentService.findNumberofDocument());
        return "admin_dashboard";
    }
    /**
     * Helper Method to Bind user to session
     * @param user holds the logged in user
     * @param session current session
     */
    private void addUserInSession(User user,HttpSession session){
        session.setAttribute("user", user);
        session.setAttribute("userId", user.getUser_id());
        session.setAttribute("userFirstName", user.getFirst_name());
        session.setAttribute("role", user.getRole());
        session.setAttribute("email", user.getEmail());
        session.setAttribute("department", user.getDepartment());
        session.setAttribute("status", user.getAccount_status());
        
    }
    
    @RequestMapping(value = {"/admin/logout","/depAdmin/logout"})
    public String userLogout( HttpSession session){
        session.invalidate();
        return "redirect:/";
        
    }
}
