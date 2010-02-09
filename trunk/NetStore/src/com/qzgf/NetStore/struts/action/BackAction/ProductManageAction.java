/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.qzgf.NetStore.struts.action.BackAction;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.qzgf.NetStore.service.IProductManageService;

/** 
 * MyEclipse Struts
 * Creation date: 08-20-2008
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 * @struts.action-forward name="success" path="/JspForm/BackfuncModual/ProductManage.jsp"
 */
public class ProductManageAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private IProductManageService productManageService;
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	@SuppressWarnings("unchecked")
	public ActionForward select(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		List productBigList=this.productManageService.showProductBig();
		request.setAttribute("productBigList", productBigList);
		
        return mapping.findForward("success");		
	}
	
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String productName=request.getParameter("addProductName");
		this.productManageService.addProductBig(productName);
		return mapping.findForward("main");	
	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
	String uId=request.getParameter("uId");
	this.productManageService.deleteProductBig(uId);
	return mapping.findForward("main");	
	
	}
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String productId [] =request.getParameterValues("productId");	
	    String productName [] =request.getParameterValues("productName");	
	    if(productName!=null)
	    {
	    	for(int i=0;i<productName.length;i++)
	    	{
	    		this.productManageService.updateProductBig(productId[i], productName[i]);
	    	}
	    }
		
		return mapping.findForward("main");		
	}
	/////////////��Ʒ����
	
	
	
	
	////��ƷС�����
	@SuppressWarnings("unchecked")
	public ActionForward selectChild(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		request.setAttribute("catalogName", "��ѡ����Ʒ����");
		String id=request.getParameter("id");
		if(id!=null)//�����ڿն���˵���Ǵӡ������Ǳߴ�ֵ�����ģ�
		{
		id=request.getAttribute("id").toString();
		request.setAttribute("id", id);
		
	    try {
			request.setCharacterEncoding("gb2312");
			String catalogName=request.getParameter("catalogName");
			if((catalogName==null))
			{
				catalogName=request.getAttribute("catalogName").toString();
			}
			request.setAttribute("catalogName", catalogName);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		
		
		
		List productSmallList=this.productManageService.showSmallCatalog(id);
	    request.setAttribute("productSmallList", productSmallList);	
		}
		
		
		return mapping.findForward("successChild");	
	}
	
	@SuppressWarnings("unchecked")
	//ѡ��һ������࣬���ұ߲���һ����С��
	public ActionForward smallClass(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		request.setAttribute("id", id);
		
		String catalogName=request.getParameter("catalogName");
		request.setAttribute("catalogName", catalogName);
		
		
		
		List productSmallList=this.productManageService.showSmallCatalog(id);
	    request.setAttribute("productSmallList", productSmallList);	
		
		return mapping.findForward("mainChild");//		
	}
	
	public ActionForward addSmall(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//���id������
		String id=request.getParameter("id");
		request.setAttribute("id", id);
		
		String catalogName=request.getParameter("catalogName");
		request.setAttribute("catalogName", catalogName);
		//���id������
		
		String addProductSmallName=request.getParameter("addProductSmallName"); 
		this.productManageService.addProductSmall(id, addProductSmallName);
		
		
		
		return mapping.findForward("mainChild");
	}
	
	
	
	public ActionForward deleteSmall(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//���id������
		String id=request.getParameter("id");
		request.setAttribute("id", id);

         String catalogName=this.productManageService.catalogNameValue(id);
		 request.setAttribute("catalogName", catalogName);
		//���id������
		
		
		
		
		String cId=request.getParameter("cId");
		this.productManageService.deleteProductBig(cId);
		return mapping.findForward("mainChild");
	}
	
	public ActionForward saveSmall(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//���id������
		String id=request.getParameter("id");
		request.setAttribute("id", id);
		
		String catalogName=request.getParameter("catalogName");
		request.setAttribute("catalogName", catalogName);
		//���id������
		
		
		
		
		String HctgNameId  [] =request.getParameterValues("HctgName");	
		
	    String ctgName [] =request.getParameterValues("ctgName");	
	    
	    if(ctgName!=null)
	    {
	    	for(int i=0;i<ctgName.length;i++)
	    	{
	    		this.productManageService.updateProductBig(HctgNameId[i], ctgName[i]);
	    	}
	    }
		
		return mapping.findForward("mainChild");		
	}
	
	
	
	
	///�ж��ܷ�ɾ������
	
	public ActionForward isDelete(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
	response.setContentType("text/xml;charset=UTF-8");
	response.setHeader("Cache-Control","no-cache"); 
	PrintWriter out;
	 String id=request.getParameter("id");
        request.setAttribute("id", id);
	   
	try {
		out = response.getWriter();
		out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		out.println("<list>");
		  String exist=productManageService.isUseProduct(id);
		     if(exist.equals("1"))
		     {
		    	out.println("<exist>exist</exist>");
		    	
		     }
		     else
		     {
		    	 out.println("<exist>notesist</exist>");
		     }
		out.println("</list>");
		out.flush();
		out.close();
	} catch (Exception e) {
		// TODO: handle exception
	}
	
	return null;
	
	}
	
	
	
	
	public IProductManageService getProductManageService() {
		return productManageService;
	}
	public void setProductManageService(IProductManageService productManageService) {
		this.productManageService = productManageService;
	}
	

}