
package nz.ac.edenz.ResearchBank.controller;

import javax.servlet.http.HttpSession;
import nz.ac.edenz.ResearchBank.entity.Document;
import nz.ac.edenz.ResearchBank.entity.Staff;
import nz.ac.edenz.ResearchBank.services.IDocumentService;
import nz.ac.edenz.ResearchBank.services.IStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ResearchBankController {
    @Autowired
    IDocumentService documentService;
    @Autowired
    IStaffService staffService;
    
    @RequestMapping({"/","*"})
    public String homePage(Model model,@ModelAttribute("staff")Staff staff){
        model.addAttribute("document",documentService.findRecentDocuments());
        return "index";
    }
    
    @RequestMapping(value = "/docHandle")
    public String viewDocDetails(@RequestParam("documentId")Integer documentId,Model model,HttpSession session,
            @ModelAttribute("document")Document document){
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
        return "currentProjects";
    }
    @RequestMapping(value = "/pastProjects")
    public String pastProjects(Model model){
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
}
