// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.web;

import com.springsource.petclinic.domain.Owner;
import com.springsource.petclinic.domain.Vet;
import com.springsource.petclinic.domain.Visit;
import com.springsource.petclinic.reference.Specialty;
import com.springsource.petclinic.web.VetController;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect VetController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String VetController.create(@Valid Vet vet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, vet);
            return "vets/create";
        }
        uiModel.asMap().clear();
        vet.persist();
        return "redirect:/vets/" + encodeUrlPathSegment(vet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String VetController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Vet());
        return "vets/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String VetController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vet", Vet.findVet(id));
        uiModel.addAttribute("itemId", id);
        return "vets/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String VetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("vets", Vet.findVetEntries(firstResult, sizeNo));
            float nrOfPages = (float) Vet.countVets() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("vets", Vet.findAllVets());
        }
        addDateTimeFormatPatterns(uiModel);
        return "vets/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String VetController.update(@Valid Vet vet, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, vet);
            return "vets/update";
        }
        uiModel.asMap().clear();
        vet.merge();
        return "redirect:/vets/" + encodeUrlPathSegment(vet.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String VetController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Vet.findVet(id));
        return "vets/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String VetController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Vet vet = Vet.findVet(id);
        vet.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/vets";
    }
    
    void VetController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vet_birthday_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("vet_employedsince_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void VetController.populateEditForm(Model uiModel, Vet vet) {
        uiModel.addAttribute("vet", vet);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("owners", Owner.findAllOwners());
        uiModel.addAttribute("visits", Visit.findAllVisits());
        uiModel.addAttribute("specialtys", Arrays.asList(Specialty.values()));
    }
    
    String VetController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
