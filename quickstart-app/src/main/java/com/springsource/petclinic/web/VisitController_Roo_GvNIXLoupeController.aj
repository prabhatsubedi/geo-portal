// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.web;

import com.github.dandelion.datatables.core.ajax.ColumnDef;
import com.github.dandelion.datatables.core.ajax.DataSet;
import com.github.dandelion.datatables.core.ajax.DatatablesCriterias;
import com.springsource.petclinic.domain.Visit;
import com.springsource.petclinic.web.VisitController;
import java.lang.StringBuffer;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.gvnix.web.datatables.query.SearchResults;
import org.gvnix.web.datatables.util.DatatablesUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.ConversionService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

privileged aspect VisitController_Roo_GvNIXLoupeController {
    
    @Autowired
    public ConversionService VisitController.conversionService_loupe;
    
    @RequestMapping(params = "selector", produces = "text/html")
    public String VisitController.showOnlyList(Model uiModel, HttpServletRequest request, @RequestParam("path") String listPath) {
        // Do common datatables operations: get entity list filtered by request
        // parameters
        Map<String, String> params = populateParametersMap(request);
        // Get parentId information for details render
        String parentId = params.remove("_dt_parentId");
        if (StringUtils.isNotBlank(parentId)) {
            uiModel.addAttribute("parentId", parentId);
        }
        String rowOnTopIds = params.remove("dtt_row_on_top_ids");
        if (StringUtils.isNotBlank(rowOnTopIds)) {
            uiModel.addAttribute("dtt_row_on_top_ids", rowOnTopIds);
        }
        String tableHashId = params.remove("dtt_parent_table_id_hash");
        if (StringUtils.isNotBlank(tableHashId)) {
            uiModel.addAttribute("dtt_parent_table_id_hash", tableHashId);
        }
         if (!params.isEmpty()) {
            uiModel.addAttribute("baseFilter", params);
        }
        // Show only the list fragment (without footer, header, menu, etc.)
        return "forward:/WEB-INF/views/" + listPath + ".jspx";
    }
    
    @RequestMapping(params = "findUsingAjax", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<List<Map<String, String>>> VisitController.findUsingAjax(WebRequest request, @RequestParam(value = "_search_", required = false) String search, @RequestParam(value = "_id_", required = false) String id, @RequestParam("_pkField_") String pkField, @RequestParam(value = "_max_", required = false, defaultValue = "3") Integer maxResult, @RequestParam(value = "_caption_", required = false) String caption, @RequestParam(value = "_additionalFields_", required = false) String additionalFields, @RequestParam("_field_") String field) {
        // Declaring error utils
        List<Map<String, String>> errorList = new ArrayList<Map<String, String>>();
        Map<String, String> error = new HashMap<String, String>();
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type","application/json; charset=utf-8");
        // Getting Entity
        BeanWrapper visitBean = new BeanWrapperImpl(Visit.class);
        // Getting field
        Class targetEntity = visitBean.getPropertyType(field);
        BeanWrapper targetBean = new BeanWrapperImpl(targetEntity);
        Map<String, Object> baseSearchValuesMap = new HashMap<String, Object>();
        String paramName;
        Iterator<String> iter = request.getParameterNames();
        while (iter.hasNext()) {
            paramName = iter.next();
            if (targetBean.isReadableProperty(paramName)) {
                baseSearchValuesMap.put(paramName,conversionService_loupe.convert(request.getParameter(paramName),targetBean.getPropertyType(paramName)));
            }
        }
        // Getting Entity Manager
        EntityManager targetEntityManager = null;
        try {
            Method entityManagerMethod = targetEntity.getMethod("entityManager");
            targetEntityManager = (EntityManager) entityManagerMethod.invoke(null);
        } catch (Exception e) {
            return new ResponseEntity<List<Map<String, String>>>(null, headers,HttpStatus.INTERNAL_SERVER_ERROR);
        }
        // Creating ColumnDef - ID COLUMN
        List<ColumnDef> columnDefs = new ArrayList<ColumnDef>();
        ColumnDef idColumn = new ColumnDef();
        idColumn.setName(pkField);
        idColumn.setFilterable(true);
        columnDefs.add(idColumn);
        // Creating more columns to search
        if (StringUtils.isNotBlank(additionalFields)) {
            String[] fields = StringUtils.split(additionalFields, ",");
            if (fields.length > 0) {
                for (String aditionalField : fields) {
                    ColumnDef aditionalColumn = new ColumnDef();
                    aditionalColumn.setName(aditionalField);
                    aditionalColumn.setFilterable(true);
                    columnDefs.add(aditionalColumn);
                }
            }
        }
        SearchResults<?> searchResult = null;
        if (id != null) {
            // if not select element, id is empty. Return item with empty values 
            if(id.isEmpty()){
                List<Map<String, String>> resultRows = new ArrayList<Map<String,String>>();
                Map<String, String> rowItem = new HashMap<String, String>();
                Iterator<ColumnDef> iterColumns = columnDefs.iterator();
                while(iterColumns.hasNext()){
                    ColumnDef columnDef = iterColumns.next();
                    rowItem.put(columnDef.getName(),"");
                }
                rowItem.put("__caption__","");
                resultRows.add(rowItem);
                return new ResponseEntity<List<Map<String, String>>>(resultRows,headers, HttpStatus.OK);
            }
            targetBean.setConversionService(conversionService_loupe);
            Class idType = targetBean.getPropertyType(pkField);
             StringBuffer sqlBuf = new StringBuffer("");
            if(idType.equals(String.class)){
                //String with case insensitive
                sqlBuf.append("SELECT o FROM %s o WHERE UPPER(o.%s) = UPPER(:id)");
            }else{
                sqlBuf.append("SELECT o FROM %s o WHERE o.%s = :id");
            }
            // set baseSearch parameters to query
            if(baseSearchValuesMap != null && !baseSearchValuesMap.isEmpty()){
                for (Entry<String, Object> entry : baseSearchValuesMap.entrySet()) {
                    sqlBuf.append(" AND ").append(entry.getKey()).append(" = :").append(entry.getKey());
                }
            }
            String query = String.format(sqlBuf.toString(),targetEntity.getSimpleName(), pkField);
            TypedQuery<Object> q = targetEntityManager.createQuery(query,targetEntity);
            q.setParameter("id", targetBean.convertIfNecessary(id, idType));
            // set baseSearch values
            if (baseSearchValuesMap != null && !baseSearchValuesMap.isEmpty()) {
                for (Entry<String, Object> entry : baseSearchValuesMap.entrySet()) {
                    q.setParameter(entry.getKey(), entry.getValue());
                }
            }
            searchResult = new SearchResults(q.getResultList(), 1, false, 0, 1, 1);
        } else {
            DatatablesCriterias criterias = new DatatablesCriterias(search, 0,maxResult, columnDefs, columnDefs, null);
            // Get all columns with results in id column and additional columns
            searchResult = DatatablesUtils.findByCriteria(targetEntity,targetEntityManager, criterias, baseSearchValuesMap);
        }
        // Getting Result with only id column and additional columns
        DataSet<Map<String, String>> result = DatatablesUtils.populateDataSet(searchResult.getResults(), pkField, searchResult.getResultsCount(), searchResult.getResultsCount(), columnDefs, null, conversionService_loupe);
        // If No Data Found, return message
        if (result.getTotalDisplayRecords() == 0) {
            error.put("Error", "No Data Found");
            errorList.add(error);
            return new ResponseEntity<List<Map<String, String>>>(errorList, headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        List<Map<String, String>> resultRows = result.getRows();
        Map<String, String> captionRow = new HashMap<String, String>();
        // If caption is blank, use ConversionService to show item as String
        boolean notCaption = StringUtils.isBlank(caption);
        BeanWrapperImpl resultBean = new BeanWrapperImpl(targetEntity);
        if (!notCaption && !resultBean.isReadableProperty(caption)) {
            error.put("Error", caption + " is not a valid field");
            errorList.add(error);
            return new ResponseEntity<List<Map<String, String>>>(errorList, headers, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        List<?> results = searchResult.getResults();
        Iterator<?> it = results.iterator();
        Iterator<Map<String, String>> it2 = resultRows.iterator();
        Object rowCaption;
        while (it.hasNext() && it2.hasNext()) {
            Object rowResult = it.next();
            Map<String, String> rowItem = it2.next();
            resultBean.setWrappedInstance(rowResult);
            if (notCaption) {
                rowCaption = rowResult;
            } else {
                rowCaption = resultBean.getPropertyValue(caption);
                if (rowCaption == null) {
                    rowCaption = rowResult;
                }
            }
            rowItem.put("__caption__", conversionService_loupe.convert(rowCaption, String.class));
        }
        return new ResponseEntity<List<Map<String, String>>>(resultRows, headers, HttpStatus.OK);
    }
    
}
