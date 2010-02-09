package com.qzgf.NetStore.struts.action.FrontAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.service.IProductDisplayService;

public class ProductDisplayAction extends DispatchAction {
	private IProductDisplayService productDisplayService;
    
	public IProductDisplayService getProductDisplayService() {
		return productDisplayService;
	}

	public void setProductDisplayService(
			IProductDisplayService productDisplayService) {
		this.productDisplayService = productDisplayService;
	}
	
	public ActionForward queryProductByNew(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		
		String page =request.getParameter("page");
		if ("".equals(page) || page==null)	{
			page =request.getParameter("targetPage");
		}
		
		if ("".equals(page) || page==null)	{
			page="1";
		}
		//�ж�һ�������ҳֵ�ǲ��Ǵ����ܵ�ҳ��
		String totalPages= request.getParameter("totalPages");
		if  (!"".equals(totalPages) && totalPages!=null)
			if ((Integer.parseInt(page))>(Integer.parseInt(totalPages)))//�����ҳ�����ܳ�����ҳ��
				page=totalPages;
	         //�ж�һ�������ҳֵ�ǲ��Ǵ����ܵ�ҳ��	
			request.setAttribute("targetPage", page);
			request.setAttribute("page", page);
			Page ppage = this.productDisplayService.queryProductByNews(Integer.parseInt(page));
			request.setAttribute("newPpage",ppage);
            System.out.println("���˴���ҳ���λ����");
		
			return mapping.findForward("newProduct_Page");
	}
	
}
