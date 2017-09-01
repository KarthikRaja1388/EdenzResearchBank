package nz.ac.edenz.ResearchBank.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import nz.ac.edenz.ResearchBank.command.SearchCommand;
import nz.ac.edenz.ResearchBank.entity.Projects;
import nz.ac.edenz.ResearchBank.services.IProjectsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProjectsController {

    @Autowired
    IProjectsService projectsService;

    @RequestMapping(value = "/admin/addProjects")
    public String addProject(Model model, @ModelAttribute("command") Projects projects, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        return "addProject";
    }

    @RequestMapping(value = "/admin/saveProjects")
    public String saveProject(@ModelAttribute("command") Projects projects, Model model) {
        projectsService.saveProjects(projects);
        return "redirect:/admin/Projects?act=sv";

    }

    @RequestMapping(value = "/admin/Projects")
    public String viewProjects(Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        model.addAttribute("projects", projectsService.findAllProjects());
        return "projectList";
    }

    @RequestMapping(value = {"/admin/editProjects"})
    public String editDocuemnt(@RequestParam("projectId") Integer projectId, Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        Projects selectedProject = projectsService.findProjectById(projectId);
        System.out.println(projectId);
        bindProjectToSession(selectedProject, session);
        try{
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        model.addAttribute("project",selectedProject);
        return "editProject";
        }catch(Exception e){
            e.printStackTrace();
            model.addAttribute("error", "Failed to update");
            return "editProject?act=f";
        }
    }

    @RequestMapping(value = "/admin/updateProjects")
    public String updatProjects(Model model, @ModelAttribute("project") Projects project, HttpSession session) {
        try {
            Integer projectId = (Integer) session.getAttribute("projectId");
            System.out.println(projectId);
            project.setProject_id(projectId);
            projectsService.updateProjects(project);
            return "redirect:Projects?act=u";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("update_error", "Failed to update");
            return "redirect:Projects?act=f";
        }
    }
    
    @RequestMapping(value = "/admin/deleteProjects")
    public String deleteProjects(@RequestParam("projectId") Integer projectId){
        try{
        projectsService.deleteProject(projectId);
        return "redirect:Projects?act=del";
        }catch(Exception e){
            e.printStackTrace();
            return "redirect:Projects";
        }
    }
    
    @RequestMapping(value="/currentProjects/search")
    public String search(Model model,@ModelAttribute("searchCommand")SearchCommand searchCommand,
            HttpSession session){
        String searchString = searchCommand.getSearchString();
        session.setAttribute("sessionSearchString", searchString);
        model.addAttribute("searchModel", new SearchCommand());
        List<Projects> fetchedProjects = projectsService.findProjectsByString(searchString);
        model.addAttribute("projects", fetchedProjects);
        return "redirect:currentProjects/searchResult";
        
    }
    
    @RequestMapping(value = "/currentProjects/searchResult")
    public String projectSearchResult(Model model,@ModelAttribute("searchCommand")SearchCommand searchCommand,
            HttpSession session){
        String searchString = (String) session.getAttribute("sessionSearchString");
        model.addAttribute("searchModel", new SearchCommand());
        model.addAttribute("searchKey",searchString);
        List<Projects> searchResults = projectsService.findProjectsByString(searchString);
        model.addAttribute("projects",searchResults );
        return "projectSearchResult";
        
    }
    
    public void bindProjectToSession(Projects project,HttpSession session){
        session.setAttribute("projectId", project.getProject_id());
    }
}
