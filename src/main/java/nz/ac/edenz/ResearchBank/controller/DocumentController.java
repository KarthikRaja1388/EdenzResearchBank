package nz.ac.edenz.ResearchBank.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import nz.ac.edenz.ResearchBank.entity.Document;
import nz.ac.edenz.ResearchBank.services.IDocumentService;
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
public class DocumentController {

    @Autowired
    IDocumentService documentService;
    @Autowired
    IUserService userService;

    @RequestMapping(value = {"/admin/addDocument", "/depAdmin/addDocument"})
    public String addDocumentPage(@ModelAttribute("command") Document document, Model model, HttpSession session) {
        String currentUserName = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("currentUser", currentUserName);
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", currentUserName);
        return "addDocument";
    }

    @RequestMapping(value = "/admin/saveDocument",method=RequestMethod.POST)
    public String addDocument(@ModelAttribute("command") Document document,Model model, HttpSession session) throws FileNotFoundException, IOException {
             Integer sessionUserId = (Integer) session.getAttribute("userId");
             document.setUser_id(sessionUserId);
             documentService.addDocument(document);
             return "redirect:/admin/documents?act=sv";

    }

    @RequestMapping(value = "/admin/documents")
    public String adminDocumentsPage(Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        model.addAttribute("document", documentService.findAllDocuments());
        return "documentList";
    }

    @RequestMapping(value = "/admin/deleteDocument")
    public String deleteDocument(@RequestParam("documentId") Integer documentId) {
        try {
            documentService.deleteDocumentById(documentId);
            return "redirect:documents?act=del";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:documents";
        }
    }

    @RequestMapping(value = "/depAdmin/depDocuments")
    public String depDocumentsPage(Model model, HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        model.addAttribute("depDocument", documentService.findDocumentByUserId(userId));
        return "depDocumentList";
    }

    @RequestMapping(value = "depAdmin/deleteDocument")
    public String depDeleteDocument(@RequestParam("documentId") Integer documentId) {
        try {
            documentService.deleteDocumentById(documentId);
            return "redirect:depDocuments?act=del";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:depDocuments";
        }
    }

    @RequestMapping(value = {"/admin/editDocument", "/depAdmin/editDocument"})
    public String editDocuemnt(@RequestParam("documentId") Integer documentId, Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        String role = (String) session.getAttribute("role");
        model.addAttribute("userRole", role);
        model.addAttribute("currentUser", name);
        session.setAttribute("sessionDocumentId", documentId);
        Document document = documentService.findDocumentById(documentId);
        model.addAttribute(document);
        return "editDocument";
    }

    @RequestMapping(value = {"/admin/updateDocument", "/depAdmin/updateDocument"}, method = RequestMethod.POST)
    public String updateDocument(Model model, @ModelAttribute("document") Document document, HttpSession session) {
        try {
            Integer documentId = (Integer) session.getAttribute("sessionDocumentId");
            document.setDocument_id(documentId);
            documentService.updateDocument(document);
            return "redirect:documents?act=u";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("update_error", "Failed to update");
            return "editDocument?act=f";
        }
    }

    @RequestMapping(value = "/admin/docs")
    public String documentListPage(Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        model.addAttribute("currentUser", name);
        return "documentList";
    }

    @RequestMapping(value = "/depAdmin/docs")
    public String depDocumentList(Model model, HttpSession session) {
        String name = (String) session.getAttribute("userFirstName");
        model.addAttribute("currentUser", name);
        return "depDocumentList";
    }
    
    @RequestMapping(value = {"/admin/upload","/depAdmin/upload"},method =RequestMethod.POST )
    public String uploadFile(@ModelAttribute("document")Document document,BindingResult result){
        return null;
        
    }
    

    
}
