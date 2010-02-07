package com.qzgf.NetStore.struts.action.FrontAction;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.cownew.ctk.common.StringUtils;
import com.qzgf.NetStore.persistence.Cart;
import com.qzgf.NetStore.persistence.Item;
import com.qzgf.NetStore.persistence.Product;
import com.qzgf.NetStore.persistence.User;
import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.pub.SysConstants;
import com.qzgf.NetStore.pub.sessionMgr.SessionManager;
import com.qzgf.NetStore.service.IOrderService;
import com.qzgf.NetStore.service.IShoppingCartService;
import com.qzgf.NetStore.struts.form.FrontForm.CartForm;

public class ShoppingCartAction extends DispatchAction {
	private IShoppingCartService shoppingCartService;
	private IOrderService orderService;

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	public IShoppingCartService getShoppingCartService() {
		return shoppingCartService;
	}

	public void setShoppingCartService(IShoppingCartService shoppingCartService) {
		this.shoppingCartService = shoppingCartService;
	}

	/**
	 * ��Ӳ�Ʒ�����ﳵ
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward addItemToCart(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		@SuppressWarnings("unused")
		Map listProduct = this.shoppingCartService.listProducts();
		HttpSession session = request.getSession();
		// �ж������Ʒ�Ƿ��ڲ�Ʒ������
		String productId = request.getParameter("productId");
		Cart cart = null;
		Product product = null;
		cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
		}
		for (int i = 0; i < listProduct.size(); i++) {
			product = (Product) listProduct.get(i);
			if (product != null
					&& productId.equals(String.valueOf(product.getProductId()))) {
				cart.addItem(product, 1);
			}
		}
		session.setAttribute("cart", cart);
		return mapping.findForward("toCheck");
	}

	/**
	 * ��չ��ﳵ
	 */
	public ActionForward clearCart(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart != null)
			cart.clear();
		return mapping.findForward("toCheck");
	}

	/**
	 * ����
	 */
	public ActionForward goCheck(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("toCheck");
	}

	/**
	 * ���ص��޸Ĺ��ﳵ�������Ϣ
	 */
	public ActionForward goModifyCart(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("goFlag", "1");
		return mapping.findForward("toCheck");
	}

	/**
	 * �����ռ����޸�ҳ��,�Ӷ���ȷ��ҳ����
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward goModifyReceiver(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String sessionId = (String) request.getSession().getAttribute(
				"SessionId");
		// �ж�SessionId�Ƿ���Ч
		if (!(sessionId == null && "".equals(sessionId))) {
			SessionManager sessionMgr = SessionManager.getInstance();
			boolean valid = sessionMgr.isValid(sessionId);
			if (!valid) {
				// sessionId���Ϸ�
				return mapping.findForward("login_Page");
			} else {
				// sessionId�Ϸ�
				// userId=(String)request.getSession().getAttribute("userId");
				String userId = (String) request.getSession().getAttribute(
						"userId");
				request.setAttribute("goFlag", "1");
				Map infoMap = this.shoppingCartService
						.listOrderUserInfo(userId);
				request.setAttribute("infoMap", infoMap);
				return mapping.findForward("addressInfoModify_Page");
			}
		}
		return mapping.findForward("login_Page");
	}

	/**
	 * ���뵽���ͺ͸��ʽ�޸�ҳ��
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward goModifySendPayType(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String sessionId = (String) request.getSession().getAttribute(
				"SessionId");
		// �ж�SessionId�Ƿ���Ч
		if (!(sessionId == null && "".equals(sessionId))) {
			SessionManager sessionMgr = SessionManager.getInstance();
			boolean valid = sessionMgr.isValid(sessionId);
			if (!valid) {
				// sessionId���Ϸ�
				return mapping.findForward("login_Page");
			} else {
				// sessionId�Ϸ�
				// userId=(String)request.getSession().getAttribute("userId");
				String userId = (String) request.getSession().getAttribute(
						"userId");

				request.setAttribute("goFlag", 1);
				List payTypeList = this.shoppingCartService
						.queryPayType(userId);
				List sendModeList = this.shoppingCartService
						.querySendMode(userId);
				request.setAttribute("payTypeList", payTypeList);
				request.setAttribute("sendModeList", sendModeList);
				return mapping.findForward("payAndSendMode_Page");
			}
		}
		return mapping.findForward("login_Page");
	}

	/**
	 * ɾ����ѡ��Ʒ
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward deleteProduct(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String productId = (String) request.getParameter("goods");
		Cart cart = (Cart) session.getAttribute("cart");
		String goFlag = request.getParameter("goFlag");
		request.setAttribute("goFlag", goFlag);
		if (cart != null) {
			cart.deleteItemByProductId(productId);
		}
		request.setAttribute("cart", cart);
		return mapping.findForward("toCheck");
	}

	/**
	 * �޸Ĺ��ﳵ��Ʒ����
	 */
	public ActionForward modifyProductNum(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		String goFlag = request.getParameter("goFlag");
		request.setAttribute("goFlag", goFlag);
		Cart cart = (Cart) session.getAttribute("cart");
		String[] productIds = request.getParameterValues("productId");
		if (productIds != null) {
			for (int i = 0; i < productIds.length; i++) {
				String number = request.getParameter(productIds[i]);
				if (cart != null && number.length() != 0
						&& number.matches("^[0-9]{1,5}$"))// �����Ʒ�������Ϊ5λ��
					cart.modifyNumberByProductId(productIds[i], Integer
							.parseInt(number));
			}
		}
		request.setAttribute("cart", cart);
		return mapping.findForward("toCheck");
	}

	/**
	 * �޸�ĳ���ջ���,�ӹ��ﳵ��
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward toModifyReceiver(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		String sessionId = (String) request.getSession().getAttribute(
				"SessionId");
		// �ж�SessionId�Ƿ���Ч
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart != null && !cart.isEmpty()) {
			if (!(sessionId == null && "".equals(sessionId))) {
				SessionManager sessionMgr = SessionManager.getInstance();
				boolean valid = sessionMgr.isValid(sessionId);
				if (!valid) {
					// sessionId���Ϸ�
					return mapping.findForward("login_Page");
				} else {
					String userId = (String) request.getSession().getAttribute(
							"userId");
					if (!StringUtils.isEmpty(userId)) {

						String goFlag = (String) request.getParameter("goFlag");
						if ("1".equals(goFlag)) {
							Map sendInfoMap = this.shoppingCartService
									.listSendInfo(userId);
							// ��ѯ�����͵��ʼķ���
							Float sendFee = Float
									.parseFloat((String) sendInfoMap
											.get("sendFee"));
							request.setAttribute("sendFee", sendFee);
							request.setAttribute("sendInfoMap", sendInfoMap);
							return mapping.findForward("orderConfirm_Page");
						}
						Map infoMap = this.shoppingCartService
								.listOrderUserInfo(userId);
						request.setAttribute("infoMap", infoMap);
						return mapping.findForward("addressInfoModify_Page");
					} else {
						return mapping.findForward("login_Page");
					}
				}
			}
		} else {
			String xgResult = "���ﳵΪ��,���ȹ�����";
			request.setAttribute("xgResult", xgResult);
			return mapping.findForward("toCheck");
		}
		return mapping.findForward("login_Page");
	}

	/**
	 * �޸Ĺ���ĳ�����ﳵ���ռ���,�ļ�����Ϣ
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward updateReceiverInfo(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String sessionId = (String) request.getSession().getAttribute(
				"SessionId");
		// �ж�SessionId�Ƿ���Ч
		if (!(sessionId == null && "".equals(sessionId))) {
			SessionManager sessionMgr = SessionManager.getInstance();
			boolean valid = sessionMgr.isValid(sessionId);
			if (!valid) {
				// sessionId���Ϸ�
				return mapping.findForward("login_Page");
			} else {
				String userId = (String) request.getSession().getAttribute(
						"userId");
				CartForm f = (CartForm) form;
				String ifSame = f.getIfSame();
				boolean flag = false;
				if ("1".equals(ifSame)) {
					// ��Ӹö������ջ��˵���Ϣ,����Ҳ�ǰ�һ�������ߵ���Ϣ����һ�����������������
					// �ж��ջ��˵���Ϣ�Ƿ�����д
					String receiveUser = f.getReceiveUserName();
					String receiveAddress = f.getReceiveAddress();
					String receivePhone = f.getReceivePhone();
					String receiveCellPhone = f.getReceiveCellPhone();
					String receivePostCode = f.getReceivePostCode();

					try {
						String receiveUser1 = new String(receiveUser
								.getBytes("gb2312"), "gb2312");
						if (!receiveUser1.equals(receiveUser)) {
							receiveUser = new String(receiveUser
									.getBytes("ISO-8859-1"), "gb2312");
						}
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					try {
						String receiveAddress1 = new String(receiveAddress
								.getBytes("gb2312"), "gb2312");
						if (!receiveAddress1.equals(receiveAddress)) {
							receiveAddress = new String(receiveAddress
									.getBytes("ISO-8859-1"), "gb2312");
						}
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					User user = new User();
					user.setReceiveUserName(receiveUser);
					user.setReceiveUserAddress(receiveAddress);
					user.setReceivePhone(receivePhone);
					user.setReceiveCellPhone(receiveCellPhone);
					user.setReceivePostCode(receivePostCode);
					user.setUserId(userId);
					flag = this.shoppingCartService.updateUserRes(user);
				} else if ("0".equals(ifSame)) {
					String receiveUser = f.getReceiveUserName();
					String receiveAddress = f.getReceiveAddress();
					String receivePhone = f.getReceivePhone();
					String receiveCellPhone = f.getReceiveCellPhone();
					String receivePostCode = f.getReceivePostCode();

					String userName = f.getSendUser();
					String userAddress = f.getSendAddress();
					String userPhone = f.getSendPhone();
					String userCellPhone = f.getSendCellPhone();
					String userPostCode = f.getSendPostCode();

					try {
						String receiveUser1 = new String(receiveUser
								.getBytes("gb2312"), "gb2312");
						if (!receiveUser1.equals(receiveUser)) {
							receiveUser = new String(receiveUser
									.getBytes("ISO-8859-1"), "gb2312");
						}
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					try {
						String receiveAddress1 = new String(receiveAddress
								.getBytes("gb2312"), "gb2312");
						if (!receiveAddress1.equals(receiveAddress)) {
							receiveAddress = new String(receiveAddress
									.getBytes("ISO-8859-1"), "gb2312");
						}
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					try {
						String userName1 = new String(userName
								.getBytes("gb2312"), "gb2312");
						if (!userName1.equals(userName)) {
							userName = new String(userName
									.getBytes("ISO-8859-1"), "gb2312");
						}
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					try {
						String userAddress1 = new String(userAddress
								.getBytes("gb2312"), "gb2312");
						if (!userAddress1.equals(userAddress)) {
							userAddress = new String(userAddress
									.getBytes("ISO-8859-1"), "gb2312");
						}
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					User user = new User();
					user.setUserId(userId);
					user.setAddress(userAddress);
					user.setRealName(userName);
					user.setPhone(userPhone);
					user.setCellPhone(userCellPhone);
					user.setPostCode(userPostCode);

					user.setReceiveUserName(receiveUser);
					user.setReceiveUserAddress(receiveAddress);
					user.setReceivePhone(receivePhone);
					user.setReceiveCellPhone(receiveCellPhone);
					user.setReceivePostCode(receivePostCode);

					flag = this.shoppingCartService.updateUserResSed(user);

				}
				if (flag) {
					String goFlag = request.getParameter("goFlag");
					if (goFlag == null || "".equals(goFlag)) {
						List payTypeList = this.shoppingCartService
								.queryPayType(userId);
						List sendModeList = this.shoppingCartService
								.querySendMode(userId);
						request.setAttribute("payTypeList", payTypeList);
						request.setAttribute("sendModeList", sendModeList);
						return mapping.findForward("payAndSendMode_Page");
					} else if ("1".equals(goFlag)) {
						Map sendInfoMap = this.shoppingCartService
								.listSendInfo(userId);
						// ��ѯ�����͵��ʼķ���
						Float sendFee = Float.parseFloat((String) sendInfoMap
								.get("sendFee"));
						request.setAttribute("sendFee", sendFee);
						request.setAttribute("sendInfoMap", sendInfoMap);
						return mapping.findForward("orderConfirm_Page");
					}
				}
			}
		}
		return mapping.findForward("login_Page");
	}

	/**
	 * ��ת������ȷ��ҳ��
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public ActionForward to_orderConfirm(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		String sessionId = (String) request.getSession().getAttribute(
				"SessionId");
		// �ж�SessionId�Ƿ���Ч
		if (!(sessionId == null && "".equals(sessionId))) {
			SessionManager sessionMgr = SessionManager.getInstance();
			boolean valid = sessionMgr.isValid(sessionId);
			if (!valid) {
				// sessionId���Ϸ�
				return mapping.findForward("login_Page");
			} else {
				String userId = (String) request.getSession().getAttribute(
						"userId");
				CartForm f = (CartForm) form;
				String payTypeId = f.getPayTypeId();
				String sendModeId = f.getSendModeId();

				boolean flag = this.shoppingCartService.updateSendPayMode(
						userId, sendModeId, payTypeId);
				if (flag) {
					Map sendInfoMap = this.shoppingCartService
							.listSendInfo(userId);
					// ��ѯ�����͵��ʼķ���
					Float sendFee = Float.parseFloat((String) sendInfoMap
							.get("sendFee"));
					request.setAttribute("sendFee", sendFee);
					request.setAttribute("sendInfoMap", sendInfoMap);
					return mapping.findForward("orderConfirm_Page");
				} else {
					return null;
				}

			}
		}
		return mapping.findForward("login_Page");
	}

	/**
	 * �µ�
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings( { "unchecked", "unchecked" })
	public ActionForward downOrder(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String userId = (String) request.getSession().getAttribute("userId");
		if (cart != null && !cart.isEmpty()) {
			String sessionId = (String) request.getSession().getAttribute(
					"SessionId");
			// �ж�SessionId�Ƿ���Ч
			if (!(sessionId == null && "".equals(sessionId))) {
				SessionManager sessionMgr = SessionManager.getInstance();
				boolean valid = sessionMgr.isValid(sessionId);
				if (!valid) {
					// sessionId���Ϸ�
					return mapping.findForward("login_Page");
				} else {

					if (request.getSession().getAttribute("cart") != null) {
						Map map = ((Cart) request.getSession().getAttribute(
								"cart")).getItems();
						Set<String> set = map.keySet();
						Set<Item> items = new HashSet<Item>();
						float allSum = 0;
						for (String i : set) {
							Item item = (Item) map.get(i);
							// item.getProduct().getProductId()*item
							allSum = allSum
									+ this.shoppingCartService
											.getProductPrice(item.getProduct()
													.getProductId())
									* item.getNumber();
							// item.getNumber()
							items.add(item);
						}
						allSum = allSum
								+ this.shoppingCartService.getSendFee(userId);
						// ��������ˮ��
						Page pg = new Page();
						String orderId = pg.OrdLsh();

						boolean flag = this.shoppingCartService
								.insertOrderDetails(new HashSet(items), userId,
										allSum, orderId);
						if (flag) {
							cart.clear();
							// session.setAttribute("cart", null);
							Map payTypeMap = this.shoppingCartService
									.listPayInfo(orderId);
							// Ҫ��ʾ������,��֧����ʽ
							request.setAttribute("payTypeMap", payTypeMap);

							request.setAttribute("allSum", allSum);
							request.setAttribute("orderId", orderId);

							// //////////////////����//////////////////////////
							String MerId = SysConstants.MerId;// �̻���
							// �ܽ��
							String TransAmt = String
									.valueOf((int) (allSum * 100));
							int length = 12 - TransAmt.length();
							for (int i = 0; i < length; i++) {
								TransAmt = "0" + TransAmt;
							}
							// ��������
							String CuryId = SysConstants.CuryId;
							// ����
							String TransDate = null;
							SimpleDateFormat sdf = new SimpleDateFormat(
									"yyyyMMdd");
							TransDate = sdf.format(new Date());
							// ��������
							String TransType = SysConstants.TransType;
							chinapay.SecureLink t;
							t = getKeyInstance(MerId, request);
							// ����ǩ������
							String CheckValue = t.signOrder(MerId, orderId,
									TransAmt, CuryId, TransDate, TransType);
							request.setAttribute("MerId", MerId);
							request.setAttribute("TransAmt", TransAmt);
							// request.setAttribute("CuryId", CuryId);
							request.setAttribute("TransDate", TransDate);
							request.setAttribute("TransType", TransType);
							request.setAttribute("ChkValue", CheckValue);

							request.setAttribute("OrdId", orderId);
							// ///////////////////////////////////////////////
							return mapping.findForward("downOrder_Page");
						}

					} else {
						return null;
					}

				}
			}
		} else {

			Map sendInfoMap = this.shoppingCartService.listSendInfo(userId);
			// ��ѯ�����͵��ʼķ���
			Float sendFee = Float.parseFloat((String) sendInfoMap
					.get("sendFee"));
			request.setAttribute("sendFee", sendFee);
			request.setAttribute("sendInfoMap", sendInfoMap);
			String xgResult = "���Ĺ��ﳵ��Ϊ��,���ȹ���";
			request.setAttribute("xgResult", xgResult);
			return mapping.findForward("orderConfirm_Page");

		}
		return mapping.findForward("login_Page");
	}

	/**
	 * ���˽��Կ
	 * 
	 * @param MerId
	 * @param request
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static chinapay.SecureLink getKeyInstance(String MerId,
			HttpServletRequest request) {
		chinapay.PrivateKey key = new chinapay.PrivateKey();
		chinapay.SecureLink t;
		boolean flag;
		flag = key.buildKey(MerId, 0, request.getRealPath("/key/MerPrK.key"));
		if (flag == false) {
			return null;
		} else {
		}
		t = new chinapay.SecureLink(key);
		return t;
	}

	public ActionForward chinapayReturn(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		String TransDate = null;
		String MerId = null;
		String OrdId = null;
		String TransType = null;
		String TransAmt = null;
		String CuryId = null;
		String ChkValue = null;
		String OrderStatus = null;
		String GateId = null;

		try {
			TransDate = request.getParameter("transdate");
			MerId = request.getParameter("merid");
			OrdId = request.getParameter("orderno");
			TransType = request.getParameter("transtype");
			TransAmt = request.getParameter("amount");
			CuryId = request.getParameter("currencycode");
			OrderStatus = request.getParameter("status");
			ChkValue = request.getParameter("checkvalue");
			chinapay.PrivateKey key = new chinapay.PrivateKey();
			chinapay.SecureLink t;
			boolean flag;
			String msg = "";
			t = getPubKeyInstance(MerId, request);
			flag = t.verifyTransResponse(MerId, OrdId, TransAmt, CuryId,
					TransDate, TransType, OrderStatus, ChkValue);
			if (flag == false) {
			} else {
				/**
				 * ���ݿ���µ���ع���
				 */
			}
		} catch (Exception e) {
		}

		return null;
	}

	/*
	 * ����������Ϣ,��Щ���༭
	 */
	public static chinapay.SecureLink getPubKeyInstance(String MerId,
			HttpServletRequest request) {
		chinapay.PrivateKey key = new chinapay.PrivateKey();
		chinapay.SecureLink t;
		boolean flag;
		flag = key.buildKey(MerId, 0, request.getRealPath("/key/PgPubk.key"));
		if (flag == false) {
			System.out.println("build key error!");
			return null;
		} else {
		}
		t = new chinapay.SecureLink(key);
		return t;
	}

	/**
	 * ����������Ϣ
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public ActionForward chinapayRet(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String TransDate = null;
		String MerId = null;
		String OrdId = null;
		String TransType = null;
		String TransAmt = null;
		String CuryId = null;
		String ChkValue = null;
		String OrderStatus = null;
		String GateId = null;
		TransDate = request.getParameter("transdate");
		MerId = request.getParameter("merid");
		OrdId = request.getParameter("orderno");
		TransType = request.getParameter("transtype");
		TransAmt = request.getParameter("amount");
		CuryId = request.getParameter("currencycode");
		OrderStatus = request.getParameter("status");

		ChkValue = request.getParameter("checkvalue");
		chinapay.PrivateKey key = new chinapay.PrivateKey();
		chinapay.SecureLink t;
		t = new chinapay.SecureLink(key);
		boolean flag;
		boolean flag1;
		String msg = "";
		flag = key.buildKey("999999999999999", 0, request
				.getRealPath("/key/PgPubk.key"));
		if (flag == false) {
			msg = "build key error!";
			return null;
		}
		flag1 = t.verifyTransResponse(MerId, OrdId, TransAmt, CuryId,
				TransDate, TransType, OrderStatus, ChkValue);
		if (flag1 == false) {
			msg = "������֤ʧ��!";
			System.out.println(msg);
		} else {
			this.orderService.updateOrderStatus(OrdId);
		}
		return mapping.findForward("getChinapayRet_Page");
	}

	// ���ChkValue
	public ActionForward getChkValue(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String MerId = request.getParameter("MerId");
		String orderId = request.getParameter("OrderId");
		String TransAmt = request.getParameter("TransAmt");
		String CuryId = request.getParameter("CuryId");
		String TransDate = request.getParameter("TransDate");
		String TransType = request.getParameter("TransType");

		response.setContentType("text/html;charset=gbk");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = null;
		chinapay.SecureLink t;
		t = getKeyInstance(MerId, request);
		// ����ǩ������
		String CheckValue = t.signOrder(MerId, orderId, TransAmt, CuryId,
				TransDate, TransType);
		try {
			out = response.getWriter();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		out.println(CheckValue);
		return null;
	}

}