// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.gvnix.geo.component.web;

import javax.servlet.http.HttpServletRequest;
import org.gvnix.geo.component.web.MapViewerController;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

privileged aspect MapViewerController_Roo_GvNIXMapViewer {
    
    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public String MapViewerController.showMap(Model uiModel, HttpServletRequest request) {
        return "mapview/show";
    }
    
}