
package nz.ac.edenz.ResearchBank.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import nz.ac.edenz.ResearchBank.command.SearchCommand;
import nz.ac.edenz.ResearchBank.entity.Document;
import nz.ac.edenz.ResearchBank.entity.Projects;
import nz.ac.edenz.ResearchBank.entity.Staff;
import nz.ac.edenz.ResearchBank.services.IDocumentService;
import nz.ac.edenz.ResearchBank.services.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import nz.ac.edenz.ResearchBank.services.IProjectsService;

@Controller
public class ResearchBankController {
    @Autowired
    IDocumentService documentService;
    @Autowired
    IStaffService staffService;
    @Autowired
    IProjectsService projectService;
    
    @RequestMapping({"/","*"})
    public String homePage(Model model,@ModelAttribute("staff")Staff staff){
        model.addAttribute("document",documentService.findRecentDocuments());
        model.addAttribute("searchModel", new SearchCommand());
        return "index";
    }
    
    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public String searchForDocuments(Model model,@ModelAttribute("searchCommand")SearchCommand searchCommand,
            HttpSession session){
        String searchString = searchCommand.getSearchString();
        session.setAttribute("sessionSearchString",searchString);
        model.addAttribute("searchModel", new SearchCommand());
        List<Document> fetchedDocuments = documentService.searchByString(searchString);
        model.addAttribute("documents",fetchedDocuments);        
        return "redirect:/searchResult";
    }
    
    @RequestMapping("/searchResult")
    public String searchResult(Model model,@ModelAttribute("searchCommand")SearchCommand searchCommand,HttpSession session){
            String searchString = (String) session.getAttribute("sessionSearchString");
            model.addAttribute("searchModel", new SearchCommand());
            model.addAttribute("searchKey",searchString);
            List<Document> searchResults = documentService.searchByString(searchString);
            
            if(searchResults == null){
                model.addAttribute("noDocument", "No Docuemnts Found");
                return "searchResults?act=no_doc";
            }else{
                model.addAttribute("documents",searchResults);        
                return "searchResults" ;
            }

       
    }
    
    @RequestMapping(value = "/docHandle")
    public String viewDocDetails(@RequestParam("documentId")Integer documentId,Model model,HttpSession session,
            @ModelAttribute ("document")Document document){
        Integer selectedDocumentId = (Integer) session.getAttribute("documentId");
       try{
            
            session.setAttribute("sessionDocumentId", selectedDocumentId);
            document = documentService.findDocumentById(documentId);
            model.addAttribute(document);
            return "docDetails";
       }catch(Exception e){
           e.printStackTrace();
           return "redirect:docHandle?act=f";
       }
    }
    
    @RequestMapping(value = "/currentProjects")
    public String currentProjects(Model model){
        model.addAttribute("projects",projectService.findCurrentProjects());
        return "currentProjects";
    }
    
    @RequestMapping(value = "/resarchHandle")
    public String viewResearchDetails(@RequestParam("projectId")Integer projectId,Model model,HttpSession session,
            @ModelAttribute("project")Projects project){
        Integer selectedReserachId = (Integer) session.getAttribute("projectId");
        session.setAttribute("sessionResearchId", selectedReserachId);
        model.addAttribute("selectedProject", projectService.findProjectById(projectId));
        return "researchDetails";
        
    }
    
    @RequestMapping(value = "/pastProjects")
    public String pastProjects(Model model){
        model.addAttribute("projects",projectService.findPastProjects());
        return "pastProjects";
    }
    @RequestMapping("/staffResearch")
    public String staffResearch(Model model,@ModelAttribute("staff")Staff staff){
        model.addAttribute("staffs", staffService.findAllStaff());
        return "staffResearch";
    }
    @RequestMapping(value = "/staffResearch/ResearchProfile")
    public String researchProfile(Model model,@ModelAttribute("documemt")Document document,
            @RequestParam("name")String name){
        String[] splittedName = name.split(", ");
        String firstName = splittedName[0];
        String lastName = splittedName[1];
        String fullName = firstName+" "+lastName;
        model.addAttribute("fullName",fullName);
        model.addAttribute("staff",staffService.findDesignation(firstName, lastName));
        model.addAttribute("documents", documentService.findDocumentByName(name));
        return "researchProfile";
    }
    @RequestMapping("/funding")
    public String funding(Model model){
        return "funding";
    }
    
    @RequestMapping("/ideas")
    public String ideas(Model model){
        return "ideas";
    }
    
    public void addDocumentIdInSession(Document document,HttpSession session){
        session.setAttribute("documentId", document.getDocument_id());
    }
    
    public void addProjectIdInSession(Projects project,HttpSession session){
        session.setAttribute("projectId", project.getProject_id());
    }
}
