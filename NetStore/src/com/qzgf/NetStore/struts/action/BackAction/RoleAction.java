/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.qzgf.NetStore.struts.action.BackAction;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.qzgf.NetStore.persistence.Role;
import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.service.IRoleService;
import com.qzgf.NetStore.struts.form.BackForm.RoleForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-28-2008
 * 
 * XDoclet definition:
 * @struts.action path="/manufacturer" name="manufacturerForm" input="/form/manufacturer.jsp" parameter="status" scope="request" validate="true"
 */
public class RoleAction extends DispatchAction {
	private IRoleService roleService;

	public IRoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	@SuppressWarnings("unchecked")
	public ActionForward queryAllRoles(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
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
		Page ppage = this.roleService.queryRoles(Integer.parseInt(page));
		request.setAttribute("ppage", ppage);
		return mapping.findForward("roleManage_Page");
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward queryRoleById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		@SuppressWarnings("unused")
		String id=request.getParameter("id");
		Map roleMap=this.roleService.queryRoleById(id);
		request.setAttribute("roleMap", roleMap);
		return mapping.findForward("roleModify_Page");
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward updateRole(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		RoleForm f=(RoleForm)form;
		Role mfr=new Role();
		mfr.setRoleId(Integer.valueOf(f.getRoleId()));
		mfr.setRoleName(f.getRoleName());
		boolean flag=this.roleService.updateRole(mfr);
		if(flag){
			String xgResult="�޸ĳɹ�";
			request.setAttribute("xgResult", xgResult);
			Page ppage = this.roleService.queryRoles(1);
			request.setAttribute("ppage", ppage);
			return mapping.findForward("roleManage_Page");
		}
		else{
			String xgResult="�޸�ʧ��,������";
			request.setAttribute("xgResult", xgResult);
			return null;
		}
	}
	
	public ActionForward to_addPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		return mapping.findForward("roleAdd_Page");
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward addRole(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		RoleForm f=(RoleForm)form;
		Role mfr=new Role();
		mfr.setRoleName(f.getRoleName());
		boolean flag=this.roleService.addRole(mfr);
		if(flag){
			String xgResult="���ӳɹ�";
			request.setAttribute("xgResult", xgResult);
			Page ppage = this.roleService.queryRoles(1);
			request.setAttribute("ppage", ppage);
			return mapping.findForward("roleManage_Page");
		}
		else{
			String xgResult="�޸�ʧ��,������";
			request.setAttribute("xgResult", xgResult);
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward deleteRoleById(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		@SuppressWarnings("unused")
		String id=request.getParameter("id");
		boolean flag=this.roleService.deleteRoleByID(id);
		if(flag){
			String xgResult="ɾ���ɹ�";
			request.setAttribute("xgResult", xgResult);
			Page ppage = this.roleService.queryRoles(1);
			request.setAttribute("ppage", ppage);
			return mapping.findForward("roleManage_Page");
		}
		else{
			String xgResult="ɾ��ʧ�ܣ�������";
			request.setAttribute("xgResult", xgResult);
			Page ppage = this.roleService.queryRoles(1);
			request.setAttribute("ppage", ppage);
			return mapping.findForward("roleManage_Page");
	    }
	}
}