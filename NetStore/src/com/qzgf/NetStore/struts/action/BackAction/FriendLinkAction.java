/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.qzgf.NetStore.struts.action.BackAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.service.IFriendLinkService;


/** 
 * MyEclipse Struts
 * Creation date: 10-06-2008
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 * @struts.action-forward name="friendSuccess" path="/JspForm/BackfuncModual/friendLink.jsp"
 */
public class FriendLinkAction extends DispatchAction {
	/*
	 * Generated Methods
	 */
	private IFriendLinkService friendLinkService;
	
	
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	
	public ActionForward exec(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		String page =request.getParameter("page");
		if ("".equals(page) || page==null)	{
			page =request.getParameter("targetPage");
		}
		
		if(request.getAttribute("page")!=null)
		{
			page =	request.getAttribute("page").toString();
		}
		
		
		if ("".equals(page) || page==null)	{
			page="1";
		}
		
		//�ж�һ�������ҳֵ�ǲ��Ǵ����ܵ�ҳ��
		String totalPages= request.getParameter("totalPages");
		if  (!"".equals(totalPages) && totalPages!=null)
		if ((Integer.parseInt(page))>(Integer.parseInt(totalPages)))//�����ҳ�����ܳ�����ҳ��
			page=totalPages;
		request.setAttribute("page", page);
		
		
		  Page ppage=this.friendLinkService.friendLinkList(Integer.parseInt(page));
		  request.setAttribute("ppage", ppage);
		  
		return mapping.findForward("friendSuccess");
		
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
	  HttpServletRequest request, HttpServletResponse response) 
	{
		Page pg = new Page();
		String tag = "WB";// ��־λ
		int len = 12;// λ��
		String tableStr = "t_lsh";// ����
		String dateField = "friendLinkDate";// �����ֶ���
		String initField = "friendLinkInitValue";// ��ʼ��ֵ
		String urlID = pg.lshNO(tag, len, tableStr, dateField, initField);// �Զ�����
		
		
		
		String urlTitle=request.getParameter("webSite");
		String url=request.getParameter("url");
		String no=request.getParameter("no");

		this.friendLinkService.addFriendLink(urlID, urlTitle, url, no);
		return mapping.findForward("friendLocal");//���ر�ҳ��

	}
	
	public ActionForward delete(ActionMapping mapping, ActionForm form,
			  HttpServletRequest request, HttpServletResponse response) 
			{
		
		    String page=request.getParameter("dpage");
		    request.setAttribute("page", page);

		    String urlId=request.getParameter("urlId"); 
		    this.friendLinkService.delete(urlId);
		    
		    return mapping.findForward("friendLocal");//���ر�ҳ��
		    
			}
	
	public ActionForward save(ActionMapping mapping, ActionForm form,
			  HttpServletRequest request, HttpServletResponse response) {
		
		String urlId [] = request.getParameterValues("urlId");	
	    String urlTitle [] = request.getParameterValues("webSiteName");
	    String url [] = request.getParameterValues("urlName");
	    String no [] = request.getParameterValues("noName");
        
	    if(urlTitle!=null)
	    {
	    	for(int i=0;i<urlTitle.length;i++)
	    	{
	    		this.friendLinkService.update(urlId[i],urlTitle[i], url[i],no[i]);
	    	}
	    }
		
	    String page=request.getParameter("page");
	    request.setAttribute("page", page);
	    
	    return mapping.findForward("friendLocal");
		 
	}
	
	
	
	
	
	public IFriendLinkService getFriendLinkService() {
		return friendLinkService;
	}

	public void setFriendLinkService(IFriendLinkService friendLinkService) {
		this.friendLinkService = friendLinkService;
	}
}