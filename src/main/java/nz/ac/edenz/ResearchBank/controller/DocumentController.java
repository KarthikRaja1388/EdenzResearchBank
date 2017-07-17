
package nz.ac.edenz.ResearchBank.controller;

import javax.servlet.http.HttpSession;
import nz.ac.edenz.ResearchBank.entity.Document;
import nz.ac.edenz.ResearchBank.services.IDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DocumentController {
    
    @Autowired
    IDocumentService documentService;
    
    @RequestMapping(value = {"/admin/addDocument","/depAdmin/addDocument"})
    public String addDocumentPage(@ModelAttribute("command")Document document, Model model){
        return "addDocument";
    }
    
    @RequestMapping(value = {"/admin/saveDocument","/depAdmin/saveDocument"})
    public String addDocument(@ModelAttribute("command")Document document,Model model,HttpSession session){
       Integer sessionUserId = (Integer) session.getAttribute("userId");
       document.setUser_id(sessionUserId);
       documentService.addDocument(document);
       return "redirect:/admin/documents?act=sv";
    }
    
    @RequestMapping(value = "/admin/documents")
    public String adminDocumentsPage(Model model,HttpSession session){
            model.addAttribute("document",documentService.findAllDocuments());
            return "documentList";
    }
    @RequestMapping(value = "/depAdmin/documents")
    public String depDocumentsPage(Model model, HttpSession session){
        Integer userId = (Integer) session.getAttribute("userId");
            try{
                Document document = documentService.findDocumentByUserId(userId);
                model.addAttribute("document",document );
                return "redirect:/depAdmin/documentPage";
            }catch(Exception e){
                return "redirect:/depAdmin/documentPage";
            }
    }
    @RequestMapping(value = {"/admin/deleteDocument","/depAdmin/deleteDocument"})
    public String deleteDocument(@RequestParam ("documentId")Integer documentId){
       try{
        documentService.deleteDocumentById(documentId);
        return "redirect:documents?act=del";
       }catch(Exception e){
           e.printStackTrace();
           return "redirect:documents";
       }
    }
    
    @RequestMapping(value = {"/admin/editDocument","/depAdmin/editDocument"})
    public String editDocuemnt(@RequestParam ("documentId")Integer documentId,Model model,HttpSession session){
        session.setAttribute("sessionDocumentId", documentId);
        Document document = documentService.findDocumentById(documentId);
        model.addAttribute(document);
        return "editDocument";
    }
    @RequestMapping(value = {"/admin/updateDocument","/depAdmin/updateDocument"}, method = RequestMethod.POST)
    public String updateDocument(Model model,@ModelAttribute("document")Document document,HttpSession session){
        try{
            Integer documentId = (Integer) session.getAttribute("sessionDocumentId");
            document.setDocument_id(documentId);
            documentService.updateDocument(document);
            return "redirect:documentList?act=u";
            }catch(Exception e){
                e.printStackTrace();
              model.addAttribute("update_error", "Failed to update");
              return "editDocument";
            }
    }
    
    @RequestMapping(value = "/depAdmin/documentPage")
    public String documentListPage(Model model){
        return "documentList";
    }
    
}
