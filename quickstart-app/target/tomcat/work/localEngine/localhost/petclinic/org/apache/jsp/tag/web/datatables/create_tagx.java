package org.apache.jsp.tag.web.datatables;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class create_tagx
    extends javax.servlet.jsp.tagext.SimpleTagSupport
    implements org.apache.jasper.runtime.JspSourceDependent {


  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList(4);
    _jspx_dependants.add("/WEB-INF/tags/jquery/form/create.tagx");
    _jspx_dependants.add("/WEB-INF/tags/jquery/util/panel.tagx");
    _jspx_dependants.add("/WEB-INF/tags/datatables/redirect.tagx");
    _jspx_dependants.add("/WEB-INF/tags/datatables/set-input-values-from-request.tagx");
  }

  private JspContext jspContext;
  private java.io.Writer _jspx_sout;
  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public void setJspContext(JspContext ctx) {
    super.setJspContext(ctx);
    java.util.ArrayList _jspx_nested = null;
    java.util.ArrayList _jspx_at_begin = null;
    java.util.ArrayList _jspx_at_end = null;
    this.jspContext = new org.apache.jasper.runtime.JspContextWrapper(ctx, _jspx_nested, _jspx_at_begin, _jspx_at_end, null);
  }

  public JspContext getJspContext() {
    return this.jspContext;
  }
  private java.lang.String id;
  private java.lang.String modelAttribute;
  private java.lang.String path;
  private java.lang.String compositePkField;
  private java.lang.Boolean multipart;
  private java.lang.String label;
  private java.lang.Boolean render;
  private java.lang.Boolean openPane;
  private java.lang.String z;

  public java.lang.String getId() {
    return this.id;
  }

  public void setId(java.lang.String id) {
    this.id = id;
    jspContext.setAttribute("id", id);
  }

  public java.lang.String getModelAttribute() {
    return this.modelAttribute;
  }

  public void setModelAttribute(java.lang.String modelAttribute) {
    this.modelAttribute = modelAttribute;
    jspContext.setAttribute("modelAttribute", modelAttribute);
  }

  public java.lang.String getPath() {
    return this.path;
  }

  public void setPath(java.lang.String path) {
    this.path = path;
    jspContext.setAttribute("path", path);
  }

  public java.lang.String getCompositePkField() {
    return this.compositePkField;
  }

  public void setCompositePkField(java.lang.String compositePkField) {
    this.compositePkField = compositePkField;
    jspContext.setAttribute("compositePkField", compositePkField);
  }

  public java.lang.Boolean getMultipart() {
    return this.multipart;
  }

  public void setMultipart(java.lang.Boolean multipart) {
    this.multipart = multipart;
    jspContext.setAttribute("multipart", multipart);
  }

  public java.lang.String getLabel() {
    return this.label;
  }

  public void setLabel(java.lang.String label) {
    this.label = label;
    jspContext.setAttribute("label", label);
  }

  public java.lang.Boolean getRender() {
    return this.render;
  }

  public void setRender(java.lang.Boolean render) {
    this.render = render;
    jspContext.setAttribute("render", render);
  }

  public java.lang.Boolean getOpenPane() {
    return this.openPane;
  }

  public void setOpenPane(java.lang.Boolean openPane) {
    this.openPane = openPane;
    jspContext.setAttribute("openPane", openPane);
  }

  public java.lang.String getZ() {
    return this.z;
  }

  public void setZ(java.lang.String z) {
    this.z = z;
    jspContext.setAttribute("z", z);
  }

  public Object getDependants() {
    return _jspx_dependants;
  }

  private void _jspInit(ServletConfig config) {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(config.getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) config.getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void doTag() throws JspException, java.io.IOException {
    PageContext _jspx_page_context = (PageContext)jspContext;
    HttpServletRequest request = (HttpServletRequest) _jspx_page_context.getRequest();
    HttpServletResponse response = (HttpServletResponse) _jspx_page_context.getResponse();
    HttpSession session = _jspx_page_context.getSession();
    ServletContext application = _jspx_page_context.getServletContext();
    ServletConfig config = _jspx_page_context.getServletConfig();
    JspWriter out = jspContext.getOut();
    _jspInit(config);
    jspContext.getELContext().putContext(JspContext.class,jspContext);
    if( getId() != null ) 
      _jspx_page_context.setAttribute("id", getId());
    if( getModelAttribute() != null ) 
      _jspx_page_context.setAttribute("modelAttribute", getModelAttribute());
    if( getPath() != null ) 
      _jspx_page_context.setAttribute("path", getPath());
    if( getCompositePkField() != null ) 
      _jspx_page_context.setAttribute("compositePkField", getCompositePkField());
    if( getMultipart() != null ) 
      _jspx_page_context.setAttribute("multipart", getMultipart());
    if( getLabel() != null ) 
      _jspx_page_context.setAttribute("label", getLabel());
    if( getRender() != null ) 
      _jspx_page_context.setAttribute("render", getRender());
    if( getOpenPane() != null ) 
      _jspx_page_context.setAttribute("openPane", getOpenPane());
    if( getZ() != null ) 
      _jspx_page_context.setAttribute("z", getZ());

    try {
      if (_jspx_meth_form_005fcreate_005f0(_jspx_page_context))
        return;
    } catch( Throwable t ) {
      if( t instanceof SkipPageException )
          throw (SkipPageException) t;
      if( t instanceof java.io.IOException )
          throw (java.io.IOException) t;
      if( t instanceof IllegalStateException )
          throw (IllegalStateException) t;
      if( t instanceof JspException )
          throw (JspException) t;
      throw new JspException(t);
    } finally {
      jspContext.getELContext().putContext(JspContext.class,super.getJspContext());
      ((org.apache.jasper.runtime.JspContextWrapper) jspContext).syncEndTagFile();
    }
  }

  private boolean _jspx_meth_form_005fcreate_005f0(PageContext _jspx_page_context)
          throws Throwable {
    JspWriter out = _jspx_page_context.getOut();
    //  form:create
    org.apache.jsp.tag.web.jquery.form.create_tagx _jspx_th_form_005fcreate_005f0 = new org.apache.jsp.tag.web.jquery.form.create_tagx();
    org.apache.jasper.runtime.AnnotationHelper.postConstruct(_jsp_annotationprocessor, _jspx_th_form_005fcreate_005f0);
    _jspx_th_form_005fcreate_005f0.setJspContext(_jspx_page_context);
    _jspx_th_form_005fcreate_005f0.setParent(new javax.servlet.jsp.tagext.TagAdapter((javax.servlet.jsp.tagext.SimpleTag) this ));    // /WEB-INF/tags/datatables/create.tagx(14,287) name = z type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setZ((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${z}", java.lang.String.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = openPane type = java.lang.Boolean reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setOpenPane((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${openPane == null ? true : openPane}", java.lang.Boolean.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = render type = java.lang.Boolean reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setRender((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${render == null ? true : render}", java.lang.Boolean.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = label type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setLabel((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${label}", java.lang.String.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = multipart type = java.lang.Boolean reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setMultipart((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${multipart == null ? false : multipart}", java.lang.Boolean.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = compositePkField type = java.lang.String reqTime = true required = false fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setCompositePkField((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${compositePkField}", java.lang.String.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = path type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setPath((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${path}", java.lang.String.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = modelAttribute type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setModelAttribute((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${modelAttribute}", java.lang.String.class, (PageContext)this.getJspContext(), null, false));
    // /WEB-INF/tags/datatables/create.tagx(14,287) name = id type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_form_005fcreate_005f0.setId((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${id}", java.lang.String.class, (PageContext)this.getJspContext(), null, false));
    _jspx_th_form_005fcreate_005f0.setJspBody(new Helper( 0, _jspx_page_context, _jspx_th_form_005fcreate_005f0, null));
    _jspx_th_form_005fcreate_005f0.doTag();
    org.apache.jasper.runtime.AnnotationHelper.preDestroy(_jsp_annotationprocessor, _jspx_th_form_005fcreate_005f0);
    return false;
  }

  private boolean _jspx_meth_datatables_005fredirect_005f0(javax.servlet.jsp.tagext.JspTag _jspx_parent, PageContext _jspx_page_context)
          throws Throwable {
    JspWriter out = _jspx_page_context.getOut();
    //  datatables:redirect
    org.apache.jsp.tag.web.datatables.redirect_tagx _jspx_th_datatables_005fredirect_005f0 = new org.apache.jsp.tag.web.datatables.redirect_tagx();
    org.apache.jasper.runtime.AnnotationHelper.postConstruct(_jsp_annotationprocessor, _jspx_th_datatables_005fredirect_005f0);
    _jspx_th_datatables_005fredirect_005f0.setJspContext(_jspx_page_context);
    _jspx_th_datatables_005fredirect_005f0.setParent(_jspx_parent);
    // /WEB-INF/tags/datatables/create.tagx(16,36) name = id type = java.lang.String reqTime = true required = true fragment = false deferredValue = false expectedTypeName = java.lang.String deferredMethod = false methodSignature = null
    _jspx_th_datatables_005fredirect_005f0.setId((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${id}", java.lang.String.class, (PageContext)this.getJspContext(), null, false));
    _jspx_th_datatables_005fredirect_005f0.doTag();
    org.apache.jasper.runtime.AnnotationHelper.preDestroy(_jsp_annotationprocessor, _jspx_th_datatables_005fredirect_005f0);
    return false;
  }

  private boolean _jspx_meth_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0(javax.servlet.jsp.tagext.JspTag _jspx_parent, PageContext _jspx_page_context)
          throws Throwable {
    JspWriter out = _jspx_page_context.getOut();
    //  datatables:set-input-values-from-request
    org.apache.jsp.tag.web.datatables.set_002dinput_002dvalues_002dfrom_002drequest_tagx _jspx_th_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0 = new org.apache.jsp.tag.web.datatables.set_002dinput_002dvalues_002dfrom_002drequest_tagx();
    org.apache.jasper.runtime.AnnotationHelper.postConstruct(_jsp_annotationprocessor, _jspx_th_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0);
    _jspx_th_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0.setJspContext(_jspx_page_context);
    _jspx_th_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0.setParent(_jspx_parent);
    _jspx_th_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0.doTag();
    org.apache.jasper.runtime.AnnotationHelper.preDestroy(_jsp_annotationprocessor, _jspx_th_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0);
    return false;
  }

  private class Helper
      extends org.apache.jasper.runtime.JspFragmentHelper
  {
    private javax.servlet.jsp.tagext.JspTag _jspx_parent;
    private int[] _jspx_push_body_count;

    public Helper( int discriminator, JspContext jspContext, javax.servlet.jsp.tagext.JspTag _jspx_parent, int[] _jspx_push_body_count ) {
      super( discriminator, jspContext, _jspx_parent );
      this._jspx_parent = _jspx_parent;
      this._jspx_push_body_count = _jspx_push_body_count;
    }
    public boolean invoke0( JspWriter out ) 
      throws Throwable
    {
      ((org.apache.jasper.runtime.JspContextWrapper) this.jspContext).syncBeforeInvoke();
      _jspx_sout = null;
      if (getJspBody() != null)
        getJspBody().invoke(_jspx_sout);
      jspContext.getELContext().putContext(JspContext.class,getJspContext());
      if (_jspx_meth_datatables_005fredirect_005f0(_jspx_parent, _jspx_page_context))
        return true;
      if (_jspx_meth_datatables_005fset_002dinput_002dvalues_002dfrom_002drequest_005f0(_jspx_parent, _jspx_page_context))
        return true;
      return false;
    }
    public void invoke( java.io.Writer writer )
      throws JspException
    {
      JspWriter out = null;
      if( writer != null ) {
        out = this.jspContext.pushBody(writer);
      } else {
        out = this.jspContext.getOut();
      }
      try {
        this.jspContext.getELContext().putContext(JspContext.class,this.jspContext);
        switch( this.discriminator ) {
          case 0:
            invoke0( out );
            break;
        }
      }
      catch( Throwable e ) {
        if (e instanceof SkipPageException)
            throw (SkipPageException) e;
        throw new JspException( e );
      }
      finally {
        if( writer != null ) {
          this.jspContext.popBody();
        }
      }
    }
  }
}
