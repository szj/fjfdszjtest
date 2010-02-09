/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.qzgf.NetStore.struts.action.BackAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.qzgf.NetStore.persistence.PayType;
import com.qzgf.NetStore.service.IPayTypeService;
import com.qzgf.NetStore.struts.form.BackForm.PayTypeForm;

/**
 * MyEclipse Struts Creation date: 08-20-2008
 * 
 * XDoclet definition:
 * 
 * @struts.action path="/sendMode" name="sendModeForm"
 *                input="/form/sendMode.jsp" parameter="status" scope="request"
 *                validate="true"
 */
public class PayTypeAction extends DispatchAction {
	private IPayTypeService payTypeService;

	public IPayTypeService getPayTypeService() {
		return payTypeService;
	}

	public void setPayTypeService(IPayTypeService payTypeService) {
		this.payTypeService = payTypeService;
	}

	/**
	 * 查询所有的付款方式 Method execute
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	@SuppressWarnings("unchecked")
	public ActionForward queryPayType(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		List payTypeList = this.payTypeService.queryPayType();
		request.setAttribute("payTypeList", payTypeList);
		return mapping.findForward("payTypeManage_Page");
	}

	/**
	 * 更新某一付款方式�޸����ͷ�ʽ
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward updatePayType(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String payTypeId = null;
		String payTypeName = null;
		String companyName = null;
		String openAccountName = null;
		String bankAccount = null;
		String remark = null;
		String ind = request.getParameter("ind");
		payTypeName = request.getParameter("payTypeName" + String.valueOf(ind));
		companyName = request.getParameter("companyName" + String.valueOf(ind));
		openAccountName = request.getParameter("openAccountName"
				+ String.valueOf(ind));
		bankAccount = request.getParameter("bankAccount" + String.valueOf(ind));
		remark = request.getParameter("remark" + String.valueOf(ind));
		payTypeId = request.getParameter("payTypeId" + String.valueOf(ind));
		String payTypeName1 = null;
		String companyName1 = null;
		String openAccountName1 = null;
		String bankAccount1 = null;
		String remark1 = null;
		try {
			payTypeName1 = new String(payTypeName.getBytes("gb2312"), "gb2312");
			if (!payTypeName1.equals(payTypeName)) {
				payTypeName = new String(payTypeName.getBytes("ISO-8859-1"),
						"gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			companyName1 = new String(companyName.getBytes("gb2312"), "gb2312");
			if (!companyName1.equals(companyName)) {
				companyName = new String(companyName.getBytes("ISO-8859-1"),"gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			openAccountName1 = new String(openAccountName.getBytes("gb2312"),
					"gb2312");
			if (!openAccountName1.equals(openAccountName)) {
				openAccountName = new String(openAccountName
						.getBytes("ISO-8859-1"), "gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			remark1 = new String(remark.getBytes("gb2312"), "gb2312");
			if (!remark1.equals(remark)) {
				remark = new String(remark.getBytes("ISO-8859-1"), "gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			bankAccount1 = new String(bankAccount.getBytes("gb2312"), "gb2312");
			if (!bankAccount1.equals(bankAccount)) {
				bankAccount = new String(bankAccount.getBytes("ISO-8859-1"),
						"gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		PayType payType = new PayType();
		payType.setBankAccount(bankAccount);
		payType.setCompanyName(companyName);
		payType.setOpenAccountName(openAccountName);
		payType.setPayTypeId(new Integer(payTypeId));
		payType.setPayTypeName(payTypeName);
		payType.setRemark(remark);
		boolean flag = this.payTypeService.updatePayType(payType);
		String xgResult = "";
		if (flag) {
			xgResult = "序号：" + payTypeId + "数据修改成功";
		} else {
			xgResult = "序号：" + payTypeId + "数据修改失败";
		}
		request.setAttribute("xgResult", xgResult);
		List payTypeList = this.payTypeService.queryPayType();
		request.setAttribute("payTypeList", payTypeList);
		return mapping.findForward("payTypeManage_Page");
	}

	/**
	 * 删除某一付款方式�޸����ͷ�ʽ
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward deletePayType(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("gbk");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setContentType("text/html;charset=gbk");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		String payTypeId = request.getParameter("payTypeId");

		boolean flag = this.payTypeService.deletePayType(payTypeId);
		if (flag) {
			out.print(false);
		} else {
			out.print(true);
		}
		return null;
	}

	/**
	 * 添加某一付款方式
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward addPayType(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		PayTypeForm f = (PayTypeForm) form;
		String payTypeName = f.getPayTypeName();
		String companyName = f.getCompanyName();
		String openAccountName = f.getOpenAccountName();
		String bankAccount = f.getBankAccount();
		String remark = f.getRemark();
		PayType payType = new PayType();
		String payTypeName1 = null;
		String companyName1 = null;
		String openAccountName1 = null;
		String bankAccount1 = null;
		String remark1 = null;
		try {
			payTypeName1 = new String(payTypeName.getBytes("gb2312"), "gb2312");
			if (!payTypeName1.equals(payTypeName)) {
				payTypeName = new String(payTypeName.getBytes("ISO-8859-1"),
						"gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {

			companyName1 = new String(companyName.getBytes("gb2312"), "gb2312");
			if (!companyName1.equals(companyName)) {
				companyName = new String(companyName.getBytes("ISO-8859-1"),"gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			openAccountName1 = new String(openAccountName.getBytes("gb2312"),
					"gb2312");
			if (!openAccountName1.equals(openAccountName)) {
				openAccountName = new String(openAccountName
						.getBytes("ISO-8859-1"), "gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			remark1 = new String(remark.getBytes("gb2312"), "gb2312");
			if (!remark1.equals(remark)) {
				remark = new String(remark.getBytes("ISO-8859-1"), "gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			bankAccount1 = new String(bankAccount.getBytes("gb2312"), "gb2312");
			if (!bankAccount1.equals(bankAccount)) {
				bankAccount = new String(bankAccount.getBytes("ISO-8859-1"),
						"gb2312");
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		payType.setBankAccount(bankAccount);
		payType.setCompanyName(companyName);
		payType.setOpenAccountName(openAccountName);
		payType.setPayTypeName(payTypeName);
		payType.setRemark(remark);
		boolean flag = this.payTypeService.addPayType(payType);
		if (flag) {
			String xgResult = "添加数据失败";
			request.setAttribute("xgResult", xgResult);
			List payTypeList = this.payTypeService.queryPayType();
			request.setAttribute("payTypeList", payTypeList);
		} else {
			String xgResult = "添加数据成功";
			request.setAttribute("xgResult", xgResult);
			List payTypeList = this.payTypeService.queryPayType();
			request.setAttribute("payTypeList", payTypeList);
		}
		return mapping.findForward("payTypeManage_Page");
	}
}