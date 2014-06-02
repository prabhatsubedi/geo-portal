// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.web;

import com.github.dandelion.datatables.core.ajax.DataSet;
import com.github.dandelion.datatables.core.ajax.DatatablesCriterias;
import com.github.dandelion.datatables.core.ajax.DatatablesResponse;
import com.github.dandelion.datatables.core.exception.ExportException;
import com.github.dandelion.datatables.core.export.CsvExport;
import com.github.dandelion.datatables.core.export.DatatablesExport;
import com.github.dandelion.datatables.core.export.ExportConf;
import com.github.dandelion.datatables.core.export.ExportType;
import com.github.dandelion.datatables.core.export.ExportUtils;
import com.github.dandelion.datatables.core.export.XmlExport;
import com.github.dandelion.datatables.core.html.HtmlTable;
import com.github.dandelion.datatables.extras.export.itext.PdfExport;
import com.github.dandelion.datatables.extras.export.poi.XlsExport;
import com.github.dandelion.datatables.extras.export.poi.XlsxExport;
import com.github.dandelion.datatables.extras.spring3.ajax.DatatablesParams;
import com.springsource.petclinic.domain.Vet;
import com.springsource.petclinic.web.VetController;
import com.springsource.petclinic.web.VetController_Roo_Controller;
import com.springsource.petclinic.web.VetController_Roo_GvNIXDatatables;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.validation.Valid;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.gvnix.web.datatables.query.SearchResults;
import org.gvnix.web.datatables.util.DatatablesUtils;
import org.gvnix.web.datatables.util.QuerydslUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.convert.ConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

privileged aspect VetController_Roo_GvNIXDatatables {
    
    declare precedence: VetController_Roo_GvNIXDatatables, VetController_Roo_Controller;
    
    @Autowired
    public ConversionService VetController.conversionService_dtt;
    
    @Autowired
    public MessageSource VetController.messageSource_dtt;
    
    public BeanWrapper VetController.beanWrapper;
    
    @RequestMapping(method = RequestMethod.GET, produces = "text/html")
    public String VetController.listDatatables(Model uiModel, HttpServletRequest request) {
        Map<String, String> params = populateParametersMap(request);
        // Get parentId information for details render
        String parentId = params.remove("_dt_parentId");
        if (StringUtils.isNotBlank(parentId)) {
            uiModel.addAttribute("parentId", parentId);
        }
        if (!params.isEmpty()) {
            uiModel.addAttribute("baseFilter", params);
        }
        // Add attribute available into view with information about each detail datatables 
        Map<String, String> details;
        List<Map<String, String>> detailsInfo = new ArrayList<Map<String, String>>(1);
        details = new HashMap<String, String>();
        // Base path for detail datatables entity (to get detail datatables fragment URL)
        details.put("path", "visits");
        details.put("property", "visits");
        // Property name in detail entity with the relation to master entity
        details.put("mappedBy", "vet");
        detailsInfo.add(details);
        uiModel.addAttribute("detailsInfo", detailsInfo);
        return "vets/list";
    }
    
    @ModelAttribute
    public void VetController.populateDatatablesConfig(Model uiModel) {
        uiModel.addAttribute("datatablesHasBatchSupport", true);
        uiModel.addAttribute("datatablesUseAjax",true);
        uiModel.addAttribute("datatablesInlineEditing",false);
        uiModel.addAttribute("datatablesInlineCreating",false);
        uiModel.addAttribute("datatablesSecurityApplied",true);
        uiModel.addAttribute("datatablesStandardMode",false);
        uiModel.addAttribute("finderNameParam","ajax_find");
    }
    
    @RequestMapping(produces = "text/html")
    public String VetController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        // overrides the standard Roo list method and
        // delegates on datatables list method
        return listDatatables(uiModel, null);
    }
    
    public Map<String, String> VetController.populateParametersMap(HttpServletRequest request) {
        Map<String, Object> params;
        if (request == null) {
            params = Collections.emptyMap();
        } else {
            params = new HashMap<String, Object>(request.getParameterMap());
        }
        
        Map<String, String> allParams = new HashMap<String, String>(params.size());
        
        String value;
        Object objValue;
        for (String key : params.keySet()) {
            objValue = params.get(key);
            if (objValue instanceof String[]) {
                value = ((String[]) objValue)[0];
            } else {
                value = (String) objValue;
            }
            allParams.put(key, value);
        }
        return allParams;
    }
    
    public Map<String, Object> VetController.getPropertyMap(Vet vet, Enumeration<Map<String, String>> propertyNames) {
        Map<String, Object> propertyValuesMap = new HashMap<String, Object>();
        
        // If no entity or properties given, return empty Map
        if(vet == null || propertyNames == null) {
            return propertyValuesMap;
        }
        
        List<String> properties = new ArrayList<String>();
        CollectionUtils.addAll(properties, propertyNames);
        
        // There must be at least one property name, otherwise return empty Map
        if (properties.isEmpty()) {
            return propertyValuesMap;
        }
        
        // Iterate over given properties to get each property value
        BeanWrapper entityBean = new BeanWrapperImpl(vet);
        for (String propertyName : properties) {
            if (entityBean.isReadableProperty(propertyName)) {
                Object propertyValue = null;
                try {
                    propertyValue = entityBean.getPropertyValue(propertyName);
                } catch (Exception e){
                    // TODO log warning
                    continue;
                }
                propertyValuesMap.put(propertyName, propertyValue);
            }
        }
        return propertyValuesMap;
    }
    
    public Map<String, Object> VetController.getPropertyMap(Vet vet, HttpServletRequest request) {
        // URL parameters are used as base search filters
        @SuppressWarnings("unchecked") Map<String, Object> propertyValuesMap = getPropertyMap(vet, request.getParameterNames());
        // Add to the property map the parameters used as query operators
        Map<String, Object> params = new HashMap<String, Object>(populateParametersMap(request));
        Set<String> keySet = params.keySet();
        for (String key : keySet) {
            if (key.startsWith(QuerydslUtils.OPERATOR_PREFIX)) {
                propertyValuesMap.put(key, params.get(key));
            } else if (DatatablesUtils.ROWS_ON_TOP_IDS_PARAM.equals(key)) {
                propertyValuesMap.put(key, request.getParameterMap().get(key));
            }
        }
        return propertyValuesMap;
    }
    
    public void VetController.setDatatablesBaseFilter(Map<String, Object> propertyMap) {
        // TODO: Add here your baseFilters to propertyMap.
        //		 This code will be generated by gvNIX commands/annotation
        //		 on future.
    }
    
    @RequestMapping(produces = "text/html", value = "/list")
    public String VetController.listDatatablesDetail(Model uiModel, HttpServletRequest request, @ModelAttribute Vet vet) {
        // Do common datatables operations: get entity list filtered by request parameters
        listDatatables(uiModel, request);
        // Show only the list fragment (without footer, header, menu, etc.) 
        return "forward:/WEB-INF/views/vets/list.jspx";
    }
    
    @RequestMapping(produces = "text/html", method = RequestMethod.POST, params = "datatablesRedirect")
    public String VetController.createDatatablesDetail(@RequestParam(value = "datatablesRedirect", required = true) String redirect, @Valid Vet vet, BindingResult bindingResult, RedirectAttributes uiModel, HttpServletRequest httpServletRequest) {
        // Do common create operations (check errors, populate, persist, ...)
        String view = create(vet, bindingResult, uiModel, httpServletRequest);
        // If binding errors or no redirect, return common create error view (remain in create form)
        if (bindingResult.hasErrors() || redirect == null || redirect.trim().isEmpty()) {
            return view;
        }
        uiModel.addFlashAttribute(DatatablesUtils.ROWS_ON_TOP_IDS_PARAM, vet.getId());
        // If create success, redirect to given URL: master datatables
        return "redirect:".concat(redirect);
    }
    
    @RequestMapping(produces = "text/html", method = RequestMethod.PUT, params = "datatablesRedirect")
    public String VetController.updateDatatablesDetail(@RequestParam(value = "datatablesRedirect", required = true) String redirect, @Valid Vet vet, BindingResult bindingResult, RedirectAttributes uiModel, HttpServletRequest httpServletRequest) {
        // Do common update operations (check errors, populate, merge, ...)
        String view = update(vet, bindingResult, uiModel, httpServletRequest);
        // If binding errors or no redirect, return common update error view (remain in update form)
        if (bindingResult.hasErrors() || redirect == null || redirect.trim().isEmpty()) {
            return view;
        }
        uiModel.addFlashAttribute(DatatablesUtils.ROWS_ON_TOP_IDS_PARAM, vet.getId());
        // If update success, redirect to given URL: master datatables
        return "redirect:".concat(redirect);
    }
    
    @RequestMapping(produces = "text/html", method = RequestMethod.DELETE, params = "datatablesRedirect", value = "/{id}")
    public String VetController.deleteDatatablesDetail(@RequestParam(value = "datatablesRedirect", required = true) String redirect, @PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        // Do common delete operations (find, remove, add pagination attributes, ...)
        String view = delete(id, page, size, uiModel);
        // If no redirect, return common list view
        if (redirect == null || redirect.trim().isEmpty()) {
            return view;
        }
        // Redirect to given URL: master datatables
        return "redirect:".concat(redirect);
    }
    
    public void VetController.populateItemForRender(HttpServletRequest request, Vet vet, boolean editing) {
        org.springframework.ui.Model uiModel = new org.springframework.ui.ExtendedModelMap();
        
        request.setAttribute("vet", vet);
        request.setAttribute("itemId", conversionService_dtt.convert(vet.getId(),String.class));
        
        if (editing) {
            // spring from:input tag uses BindingResult to locate property editors for each bean
            // property. So, we add a request attribute (required key id BindingResult.MODEL_KEY_PREFIX + object name)
            // with a correctly initialized bindingResult.
            BeanPropertyBindingResult bindindResult = new BeanPropertyBindingResult(vet, "vet");
            bindindResult.initConversion(conversionService_dtt);
            request.setAttribute(BindingResult.MODEL_KEY_PREFIX + "vet",bindindResult);
            // Add date time patterns and enums to populate inputs
            populateEditForm(uiModel, vet);
        } else {
            // Add date time patterns
            addDateTimeFormatPatterns(uiModel);
        }
        
        // Load uiModel attributes into request
        Map<String, Object> modelMap = uiModel.asMap();
        for (String key : modelMap.keySet()){
            request.setAttribute(key, modelMap.get(key));
        }
    }
    
    public List<Map<String, String>> VetController.renderVets(SearchResults<Vet> searchResult, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Prepare result
        List<Vet> vets = searchResult.getResults();
        List<Map<String, String>> result = new ArrayList<Map<String, String>>(vets.size());
        String controllerPath = "vets";
        String pageToUse = "show";
        String renderUrl = String.format("/WEB-INF/views/%s/%s.jspx", controllerPath, pageToUse);
        
        // For every element
        for (Vet vet: vets) {
            Map<String, String> item = new HashMap<String, String>();
            final StringWriter buffer = new StringWriter();
            // Call JSP to render current entity
            RequestDispatcher dispatcher = request.getRequestDispatcher(renderUrl);
            
            populateItemForRender(request, vet, false);
            dispatcher.include(request, new HttpServletResponseWrapper(response) {
                private PrintWriter writer = new PrintWriter(buffer);
                @Override
                public PrintWriter getWriter() throws IOException {
                    return writer;
                }
            });
            
            String render = buffer.toString();
            // Load item id)
            item.put("DT_RowId", conversionService_dtt.convert(vet.getId(), String.class));
            // Put rendered content into first column (uses column index)
            item.put("0", render);
            
            result.add(item);
        }
        
        return result;
    }
    
    @RequestMapping(headers = "Accept=application/json", value = "/datatables/ajax", produces = "application/json")
    @ResponseBody
    public DatatablesResponse<Map<String, String>> VetController.findAllVets(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Vet vet, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // URL parameters are used as base search filters
        Map<String, Object> baseSearchValuesMap = getPropertyMap(vet, request);
        setDatatablesBaseFilter(baseSearchValuesMap);
        SearchResults<Vet> searchResult = DatatablesUtils.findByCriteria(Vet.class, Vet.entityManager(), criterias, baseSearchValuesMap, conversionService_dtt, messageSource_dtt);
        
        // Get datatables required counts
        long totalRecords = searchResult.getTotalCount();
        long recordsFound = searchResult.getResultsCount();
        List<Map<String, String>> rows = renderVets(searchResult, request, response);
        DataSet<Map<String, String>> dataSet = new DataSet<Map<String, String>>(rows, totalRecords, recordsFound); 
        return DatatablesResponse.build(dataSet,criterias);
    }
    
    @RequestMapping(value = "/exportcsv", produces = "text/csv")
    public void VetController.exportCsv(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Vet vet, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, vet, ExportType.CSV, new CsvExport(), request, response);
    }
    
    @RequestMapping(value = "/exportpdf", produces = "text/pdf")
    public void VetController.exportPdf(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Vet vet, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, vet, ExportType.PDF, new PdfExport(), request, response);
    }
    
    @RequestMapping(value = "/exportxls", produces = "text/xls")
    public void VetController.exportXls(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Vet vet, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, vet, ExportType.XLS, new XlsExport(), request, response);
    }
    
    @RequestMapping(value = "/exportxlsx", produces = "text/xlsx")
    public void VetController.exportXlsx(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Vet vet, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, vet, ExportType.XLSX, new XlsxExport(), request, response);
    }
    
    @RequestMapping(value = "/exportxml", produces = "text/xml")
    public void VetController.exportXml(@DatatablesParams DatatablesCriterias criterias, @ModelAttribute Vet vet, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ExportException {
        export(criterias, vet, ExportType.XML, new XmlExport(), request, response);
    }
    
    private void VetController.export(DatatablesCriterias criterias, Vet vet, ExportType exportType, DatatablesExport datatablesExport, HttpServletRequest request, HttpServletResponse response) throws ExportException {
        // Does the export process as is explained in http://dandelion.github.io/datatables/tutorials/export/controller-based-exports.html
        // 1. Retrieve the data
        List<Map<String, String>> data = retrieveData(criterias, vet, request);
        // 2. Build an instance of "ExportConf"
        ExportConf exportConf = new ExportConf.Builder(exportType).header(true).exportClass(datatablesExport).autoSize(true).fileName(vet.getClass().getSimpleName()).build();
        // 3. Build an instance of "HtmlTable"
        HtmlTable table = DatatablesUtils.makeHtmlTable(data, criterias, exportConf, request);
        // 4. Render the generated export file
        ExportUtils.renderExport(table, exportConf, response);
    }
    
    private List<Map<String, String>> VetController.retrieveData(DatatablesCriterias criterias, Vet vet, HttpServletRequest request) {
        // Cloned criteria in order to not paginate the results
        DatatablesCriterias noPaginationCriteria = new DatatablesCriterias(criterias.getSearch(), 0, null, criterias.getColumnDefs(), criterias.getSortingColumnDefs(), criterias.getInternalCounter());
        // Do the search to obtain the data
        Map<String, Object> baseSearchValuesMap = getPropertyMap(vet, request);
        setDatatablesBaseFilter(baseSearchValuesMap);
        org.gvnix.web.datatables.query.SearchResults<com.springsource.petclinic.domain.Vet> searchResult = DatatablesUtils.findByCriteria(Vet.class, Vet.entityManager(), noPaginationCriteria, baseSearchValuesMap);
        org.springframework.ui.Model uiModel = new org.springframework.ui.ExtendedModelMap();
        addDateTimeFormatPatterns(uiModel);
        Map<String, Object> datePattern = uiModel.asMap();
        // Use ConversionService with the obtained data
        return DatatablesUtils.populateDataSet(searchResult.getResults(), "id", searchResult.getTotalCount(), searchResult.getResultsCount(), criterias.getColumnDefs(), datePattern, conversionService_dtt).getRows();
    }
    
}
