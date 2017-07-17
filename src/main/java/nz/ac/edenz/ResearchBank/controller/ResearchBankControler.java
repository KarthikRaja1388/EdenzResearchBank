
package nz.ac.edenz.ResearchBank.controller;

import javax.servlet.http.HttpSession;
import nz.ac.edenz.ResearchBank.entity.Document;
import nz.ac.edenz.ResearchBank.services.IDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ResearchBankControler {
    @Autowired
    IDocumentService documentService;
    
    @RequestMapping({"/",""})
    public String homePage(Model model){
        model.addAttribute("document",documentService.findRecentDocuments());
        return "index";
    }
    
    @RequestMapping("/docDetails")
    public String viewDocDetails(@RequestParam("documentId")Integer documentId,Model model,HttpSession session){
        session.setAttribute("sessionDocumentId", documentId);
        Document document = documentService.findDocumentById(documentId);
        model.addAttribute(document);
        return "documentDetails";
    }
}
