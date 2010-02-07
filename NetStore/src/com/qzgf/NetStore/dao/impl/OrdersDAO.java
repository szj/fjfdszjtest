package com.qzgf.NetStore.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cownew.ctk.common.StringUtils;
import com.qzgf.NetStore.dao.IOrderDAO;
import com.qzgf.NetStore.pub.Page;
import com.qzgf.NetStore.pub.UtilDB;
import com.qzgf.NetStore.pub.wlglException;

public class OrdersDAO extends BaseDao implements IOrderDAO {
	
	
	
	//UtilDB du=new UtilDB();
	
    /**
     * ����ĳһ������ѯ�����������еĶ���
     */
	@SuppressWarnings("unchecked")
	public List queryOrdersByCondition(String condition,String userid) {
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		List allOrders=new ArrayList();

		StringBuffer strsql=new StringBuffer("select * from (select a.Orderid,a.userid,a.allsum,a.DownOrderTime,a.PayStatus,a.payTypeId,");
		        strsql.append("case a.orderstatus when 1 then '�����' when 2 then '�ȴ�����' "); 
                strsql.append("when 3 then '�������' when 4 then '�ȴ�����' when 5 then '�Ѿ�����' when 6 then '�Ѿ��ջ�' ");
                strsql.append("when 7 then '��ȡ��' when 8 then '������' when 9 then 'δ֧���ѷ���' end as orderStatusName");
				strsql.append(",a.orderstatus,b.sendmodeName,b.sendfee from t_orders a left join t_sendmode b on ");
		        strsql.append("(a.sendmodeId=b.sendmodeId ) where userid='"+userid+"' ");
		        if(condition==null||condition.equals(""))
		        	;
		        else{
		            if(condition.equals("1")){
		            	//һ����֮���¹��Ķ���
		        	    strsql.append(" and (to_days(now())-to_days(a.downordertime))<=31");
		            }
		            else if(condition.equals("2")){
		            	//�Ѿ������Ķ���
		            	strsql.append("and a.orderStatus=5");
		            }
		            else if(condition.equals("3")){
		            	//��ȡ���Ķ���
		            	strsql.append("and a.orderStatus=7");
		            }
		        }
		        strsql.append(") c left join t_paytype d on (c.Paytypeid= d.paytypeid)");
	    ResultSet rs;
		try {
			rs = utilDB.executeQuery(strsql.toString());
			
			
			while (rs.next()){
		    	Map map=new HashMap();
		    	map.put("OrderId", rs.getString("OrderId"));
		    	map.put("UserId",rs.getString("UserId"));
		    	map.put("AllSum",rs.getString("AllSum"));
		    	map.put("OrderStatusName",rs.getString("OrderStatusName"));
		    	map.put("DownOrderTime",rs.getString("DownOrderTime"));
		    	map.put("SendModeName", rs.getString("SendModeName"));
		    	map.put("SendFee", rs.getString("SendFee"));
		    	map.put("PayStatus", Integer.parseInt(rs.getString("PayStatus"))==2?"��֧��":"δ֧��");
		    	map.put("payStatusValue", rs.getString("PayStatus"));
		    	map.put("PayTypeName", rs.getString("PayTypeName"));
		    	allOrders.add(map);
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return allOrders;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	/**
	 * ���ݶ���״̬�г��ö���״̬�����еĶ���
	 */
	public List listOrdersByStatus(String orderStatus) {
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		List allOrders=new ArrayList();
		StringBuffer strsql=new StringBuffer("select * from (select a.Orderid,a.userid,a.allsum,a.DownOrderTime,a.PayStatus,a.payTypeId,");
		        strsql.append("case a.orderstatus when 1 then '�����' when 2 then '�ȴ�����' "); 
                strsql.append("when 3 then '�������' when 4 then '�ȴ�����' when 5 then '�Ѿ�����' when 6 then '�Ѿ��ջ�' ");
                strsql.append("when 7 then '��ȡ��' when 8 then '������' when 9 then 'δ֧���ѷ���' end as orderStatusName");
				strsql.append(",a.orderstatus,b.sendmodeName,b.sendfee from t_orders a left join t_sendmode b on ");
		        strsql.append("(a.sendmodeId=b.sendmodeId ) where a.orderStatus='"+orderStatus+"') c left join t_paytype d on (c.Paytypeid= d.paytypeid)");
	    ResultSet rs;
		try {
			rs = utilDB.executeQuery(strsql.toString());
			
			
			
			while (rs.next()){
		    	Map map=new HashMap();
		    	map.put("OrderId", rs.getString("OrderId"));
		    	map.put("UserId",rs.getString("UserId"));
		    	map.put("AllSum",rs.getString("AllSum"));
		    	map.put("OrderStatusName",rs.getString("OrderStatusName"));
		    	map.put("DownOrderTime",rs.getString("DownOrderTime"));
		    	map.put("orderStatus", orderStatus);
		    	map.put("SendModeName", rs.getString("SendModeName"));
		    	map.put("SendFee", rs.getString("SendFee"));
		    	map.put("PayStatus", Integer.parseInt(rs.getString("PayStatus"))==2?"��֧��":"δ֧��");
		    	map.put("PayTypeName", rs.getString("PayTypeName"));
		    	allOrders.add(map);
		    }
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return allOrders;
	}
	
	/**
	 * �г������ļ������ռ��˵���ϸ��Ϣ
	 * @param orderId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map listOrderUserInfo(String orderId){
		
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		
		Map map=new HashMap();

		StringBuffer strsql_userInfo=new StringBuffer("select a.orderid as orderId,a.downOrderTime,case a.IfInvoice when 0 then '��' when 1 then '��' end as IfInvoice,a.allSum,a.receiveUserName as receiveName,a.receivephone as receivePhone,");
	      strsql_userInfo.append("case a.orderstatus when 1 then '�����' when 2 then '�ȴ�����' ");
	      strsql_userInfo.append("when 3 then '�������' when 4 then '�ȴ�����' when 5 then '�Ѿ�����' when 6 then '�Ѿ��ջ�' ");
	      strsql_userInfo.append("when 7 then '��ȡ��' when 8 then '������' when 9 then 'δ֧���ѷ���' end as orderStatus,"); 
          strsql_userInfo.append("a.receivecellphone as receiveCellPhone,a.ReceiveuserAddress as receiveAddress,a.receivepostcode as receivePostCode,a.payTypeId,");
          strsql_userInfo.append("b.userid as sendUserId,b.phone as sendPhone,b.cellphone as sendCellPhone,b.address as sendAddress,a.sendModeId,d.sendModeName,d.sendFee,");
          strsql_userInfo.append("b.postcode as sendPostCode,concat(b.realname,'(',case sex when 0 then 'Ůʿ' when 1 then '����' end,')') "); 
          strsql_userInfo.append("as sendUserName  from t_orders a,t_user b,t_sendmode d where a.orderid='"+orderId+"' and a.userid=b.userid  and a.sendmodeid=d.sendmodeid;");
        ResultSet rs;
        
        try {
  		    rs = utilDB.executeQuery(strsql_userInfo.toString());
  			while(rs.next()){
  				map.put("orderId", rs.getString("orderId"));
  				map.put("allSum", rs.getString("allSum"));
  				map.put("receiveName", rs.getString("receiveName"));
  				map.put("orderStatus", rs.getString("orderStatus"));
  				map.put("receivePhone", rs.getString("receivePhone"));
  				map.put("receiveCellPhone", rs.getString("receiveCellPhone"));
  				map.put("receiveAddress", rs.getString("receiveAddress"));
  				map.put("ifInvoice", rs.getString("IfInvoice"));
  				map.put("sendModeId", rs.getString("sendModeId"));
  				map.put("sendModeName", rs.getString("sendModeName"));
  				map.put("downOrderTime", rs.getString("downOrderTime"));
  				map.put("receivePostCode", rs.getString("receivePostCode"));
  				map.put("sendUserId", rs.getString("sendUserId"));
  				map.put("sendPhone", rs.getString("sendPhone"));
  				map.put("sendCellPhone", rs.getString("sendCellPhone"));
  				map.put("sendAddress", rs.getString("sendAddress"));
  				map.put("sendPostCode", rs.getString("sendPostCode"));
  				map.put("sendUserName", rs.getString("sendUserName"));
  			}
  			
  		} catch (SQLException e) {
  			e.printStackTrace();
  		}	
  		
  		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		
  		
  		
		return map;
	}
	
	@SuppressWarnings("unchecked")
	public List listOrderDetails(String orderId){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		StringBuffer strsql_orderDetail=new StringBuffer("select a.productId,b.productName,b.memberPrice,a.unitId,a.quantity,");
		 strsql_orderDetail.append("c.unitName from t_orderDetails a ,t_product b,t_unit c  where orderId='"+orderId+"' and ");
		 strsql_orderDetail.append("a.productId=b.productId and b.unitId=c.unitId;");
		List orderDetailList=new ArrayList();
		ResultSet rs=null;
        
        try {
			rs=utilDB.executeQuery(strsql_orderDetail.toString());
			while(rs.next()){
				Map map=new HashMap();
				map.put("productId", rs.getString("productId"));
				map.put("productName", rs.getString("productName"));
				map.put("memberPrice", rs.getString("memberPrice"));
				map.put("unitId", rs.getString("unitId"));
				map.put("unitName", rs.getString("unitName"));
				map.put("quantity", rs.getString("quantity"));
				orderDetailList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		
		
		return orderDetailList;	
	}
	
	@SuppressWarnings("unchecked")
	public boolean updateOrderStatus(String orderId,String nextOrderStatus,String operatePerson){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String remark=null;
		if("3".equals(nextOrderStatus))
			remark="���Ķ���["+orderId+"]��״̬Ϊ�������";
		else if("4".equals(nextOrderStatus))
			remark="���Ķ���["+orderId+"]��״̬Ϊ�ȴ�����";
		else if("5".equals(nextOrderStatus))
			remark="���Ķ���["+orderId+"]��״̬Ϊ�Ѿ�����";
		else if("6".equals(nextOrderStatus))
			remark="���Ķ���["+orderId+"]��״̬Ϊ�Ѿ��ջ�";
		String strsql_updateOrderStatus="update t_orders set orderStatus="+nextOrderStatus+" where orderId='"+orderId+"'";
		StringBuffer addOperateHistory=new StringBuffer("insert into t_OperateHistory(orderStatus,operateObject,operatePerson,orderId,remark) values(");
		    addOperateHistory.append(nextOrderStatus+",2"+",'"+operatePerson+"','"+orderId+"','"+remark+"')");
		boolean flag=false;
		List sqlList=new ArrayList();
		sqlList.add(strsql_updateOrderStatus);
		sqlList.add(addOperateHistory);
		flag=utilDB.executeUpdate(sqlList);
		
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		
		
		return flag;
	}
	
	//��ѯ���е�֧����ʽ,���ڶ�����ѯ����
	@SuppressWarnings("unchecked")
	public List queryAllPayType(){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		String strsql_queryPayType="select * from t_payType";
		List payTypeList=new ArrayList();
		ResultSet rs=null;
		try {
			rs=utilDB.executeQuery(strsql_queryPayType);
			while(rs.next()){
				Map map=new HashMap();
				map.put("PayTypeId", rs.getString("PayTypeId"));
				map.put("PayTypeName", rs.getString("PayTypeName"));
				payTypeList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		
		return payTypeList;
	}
	
	//ͨ�������������ѯ������Щ�����Ķ���
	@SuppressWarnings("unchecked")
	public Page queryOrders(String orderId,String orderStatus,String userId,String allSum,String payTypeId,String beginDay,String endDay,int npage){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		StringBuffer strsql=new StringBuffer("select c.orderId,c.userId,c.allsum,c.orderStatusName,c.downorderTime,c.sendModeName,c.sendFee,c.payStatus,d.payTypeName from (select a.Orderid,a.userid,a.allsum,a.DownOrderTime,a.PayStatus,a.payTypeId,");
        strsql.append("case a.orderstatus when 1 then '�����' when 2 then '�ȴ�����' "); 
        strsql.append("when 3 then '�������' when 4 then '�ȴ�����' when 5 then '�Ѿ�����' when 6 then '�Ѿ��ջ�' ");
        strsql.append("when 7 then '��ȡ��' when 8 then '������' when 9 then 'δ֧���ѷ���' end as orderStatusName");
		strsql.append(",a.orderstatus,b.sendmodeName,b.sendfee from t_orders a left join t_sendmode b on ");
        strsql.append("(a.sendmodeId=b.sendmodeId ) where true ");
        if(orderId!=null&&!"".equals(orderId)){
        	strsql.append("and a.orderId='"+orderId+"' ");
        }
        if(orderStatus!=null&&!"".equals(orderStatus)&&!"0".equals(orderStatus)){
        	strsql.append("and a.orderStatus='"+orderStatus+"' ");
        }
        if(userId!=null&&!"".equals(userId)){
        	strsql.append("and a.userId='"+userId+"' ");
        }
        if(allSum!=null&&!"".equals(allSum)){
        	strsql.append("and a.allSum>"+allSum+" ");
        }
        if(payTypeId!=null&&!"".equals(payTypeId)&&!"0".equals(payTypeId)){
        	strsql.append("and a.payTypeId="+payTypeId+" ");
        }
        if(beginDay!=null&&!"".equals(beginDay)){
        	strsql.append("and a.downOrderTime>='"+beginDay+"' ");
        }
        if(endDay!=null&&!"".equals(endDay)){
        	strsql.append("and a.downOrderTime<='"+endDay+"' ");
        }
        strsql.append(")c left join t_paytype d on (c.Paytypeid= d.paytypeid)");
        List resultList=new ArrayList();
        Page page=null;
        try {
        	page=utilDB.executeQueryByPageForMySql(strsql.toString(), npage, Page.DEFAULT_PAGESIZE);
			ResultSet rs=page.getRowset();
			while(rs.next()){
				Map map=new HashMap();
				map.put("OrderId", rs.getString("OrderId"));
		    	map.put("UserId",rs.getString("UserId"));
		    	map.put("AllSum",rs.getString("AllSum"));
		    	map.put("OrderStatusName",rs.getString("OrderStatusName"));
		    	map.put("DownOrderTime",rs.getString("DownOrderTime"));
		    	map.put("orderStatus", orderStatus);
		    	map.put("SendModeName", rs.getString("SendModeName"));
		    	map.put("SendFee", rs.getString("SendFee"));
		    	map.put("PayStatus", Integer.parseInt(rs.getString("PayStatus"))==2?"��֧��":"δ֧��");
		    	map.put("PayTypeName", rs.getString("PayTypeName"));
  				resultList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		page.setResultList(resultList);     
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  		
		return page;
	}

	/**
	 * ��ѯ����ĳһ��������ʷ������¼ 
	 * @param orderId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List queryOperateHistory(String orderId){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		StringBuffer strsql=new StringBuffer("select sequenceNum,occurTime,orderId,case orderstatus when 2 then '�ȴ�����' when 3 then '�������' when 4 "); 
				strsql.append("then '�ȴ�����' when 5 then '�Ѿ�����' when 6 then '�Ѿ��ջ�' end as orderStatusName,case operateObject when 1 then '�˿�'" );
				strsql.append(" when 2 then '������Ա' end as operateObject,operatePerson,remark from t_operatehistory where orderId='"+orderId+"' order by sequenceNum ");
		List operateHistoryList=new ArrayList();
	    ResultSet rs=null;
				
		try {
			rs=utilDB.executeQuery(strsql.toString());
			while(rs.next()){
			    Map map=new HashMap();
			    map.put("sequenceNum", rs.getString("sequenceNum"));
			    map.put("orderStatusName", rs.getString("orderStatusName"));
			    map.put("occurTime", rs.getString("occurTime"));
			    map.put("operateObject", rs.getString("operateObject"));
			    map.put("operatePerson", rs.getString("operatePerson"));
			    map.put("remark", rs.getString("remark"));
			    map.put("orderId", rs.getString("orderId"));
			    operateHistoryList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return operateHistoryList;
	}
	
	/**
	 * �޸��ռ��˵���Ϣ
	 */
	public boolean updateReceiveInfo(String orderId,String receiveUserName,String postCode,String phone,String cellPhone,String receiveUserAddress){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		StringBuffer strsql=new StringBuffer("update T_orders set receiveUserName='"+receiveUserName+"',");
		strsql.append("receivepostCode='"+postCode+"',");
		if(phone!=null&&!"".equals(phone)){
		    strsql.append("receivephone='"+phone+"',");
		}
		if(cellPhone!=null&&!"".equals(cellPhone)){
			strsql.append("receivecellPhone='"+cellPhone+"',");
		}
		strsql.append("receiveUserAddress='"+receiveUserAddress+"' where orderId='"+orderId+"'");
		
		boolean tf=utilDB.executeUpdate(strsql.toString());
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return tf;
		
	}
	
	/**
	 * ��ѯ���е����ͷ�ʽ,��Ĭ��ѡ����ǰ���õ��������ͷ�ʽ
	 * @param orderId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List querySendMode(String orderId){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		
		StringBuffer strsql=new StringBuffer("select a.sendmodeid,a.sendmodename,a.sendFee,a.sendTime ,");
		    strsql.append("case when a.sendmodeid=b.sendmodeid then 'checked' else '' end as ifChecked  from t_sendmode a left join t_orders b ");
		    strsql.append("on(a.sendmodeid=b.sendmodeid) and b.orderid='"+orderId+"'");
		List sendModeList=new ArrayList();
		
		ResultSet rs=null; 
		try {
			rs=utilDB.executeQuery(strsql.toString());
			while(rs.next()){
				Map map=new HashMap();
				map.put("sendModeId", rs.getString("sendModeId"));
				map.put("sendModeName", rs.getString("sendModeName"));
				map.put("sendFee", rs.getString("sendFee"));
				map.put("sendTime", rs.getString("sendTime"));
				map.put("ifChecked", rs.getString("ifChecked"));
				sendModeList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		return sendModeList;
	}
	
	/**
	 * �޸����ͷ�ʽ
	 */
	@SuppressWarnings("unchecked")
	public boolean updateSendMode(String orderId,String sendModeId,String newSendFee,String oldSendFee ){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		List sqlList=new ArrayList();
		StringBuffer strsql=new StringBuffer("update t_orders set sendModeId='"+ sendModeId+"' where orderId='"+orderId+"'");
		if(!StringUtils.isEmpty(newSendFee)){
		float new_SendFee=Float.valueOf(newSendFee);
		float old_SendFee=Float.valueOf(oldSendFee);
		if(new_SendFee!=old_SendFee){
			//�۸��г���
			String strsql_update="update t_orders set allsum=allsum+("+new_SendFee+"-"+old_SendFee+") where orderId='"+orderId+"'";
			sqlList.add(strsql_update);
		}
		
		sqlList.add(strsql.toString());
		
		boolean tf=utilDB.executeUpdate(sqlList);
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;
		
		
		
		}
		else{
			return false;
		}
		
		
		
		
		
		
	}
	
	/**
	 * ��ѯ���ʽ,��Ĭ��ѡ���ϴ����õ�
	 * @param orderId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List queryPayType(String orderId){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		StringBuffer strsql=new StringBuffer("select a.payTypeid,a.payTypeName,a.companyName,a.openAccountName,a.remark,a.bankAccount,case when a.payTypeid=b.payTypeid ");
		strsql.append("then 'checked' else '' end as ifChecked  from t_payType a left join t_orders b ");
		strsql.append("on(a.payTypeId=b.payTypeid) and b.orderid='"+orderId+"'");

		List payTypeList=new ArrayList();
		
		ResultSet rs=null; 
		try {
			rs=utilDB.executeQuery(strsql.toString());
			while(rs.next()){
				Map map=new HashMap();
				map.put("payTypeId", rs.getString("payTypeId"));
				map.put("payTypeName", rs.getString("payTypeName"));
				map.put("companyName", rs.getString("companyName"));
				map.put("openAccountName", rs.getString("openAccountName"));
				map.put("bankAccount", rs.getString("bankAccount"));
				map.put("ifChecked", rs.getString("ifChecked"));
				map.put("remark", rs.getString("remark"));
				payTypeList.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return payTypeList;
	}
	
	/**
	 * �޸ĸ��ʽ
	 */
	@SuppressWarnings("unchecked")
	public boolean updatePayType(String orderId,String newPayTypeId){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		String strsql="update t_orders set payTypeId='"+ newPayTypeId+"' where orderId='"+orderId+"'";
		
		
	/*	int num=0;
		try {
			num=du.stmt.executeUpdate(strsql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (num==1){
			return true;
		}
		else{
			return false;
		}*/	
		
	boolean tf=utilDB.executeUpdate(strsql);
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tf;
			
		
		
	}
	
	/**
	 * ��ѯע���û�����Ϣ,�����޸�
	 * @param orderId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map queryUserInfo(String userId){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		StringBuffer strsql=new StringBuffer("select userId,sex,realName,Email,phone,cellPhone,address,");
		    strsql.append("postCode,IdCard from t_user where userid='"+userId+"'");
		    Map map=new HashMap();
		ResultSet rs=null; 
		try {
			rs=utilDB.executeQuery(strsql.toString());
			while(rs.next()){
				
				map.put("userId", rs.getString("userId"));
				map.put("sex", rs.getString("sex"));
				map.put("realName", rs.getString("realName"));
				map.put("email", rs.getString("email"));
				map.put("phone", rs.getString("phone"));
				map.put("cellPhone", rs.getString("cellPhone"));
				map.put("address", rs.getString("address"));
				map.put("postCode", rs.getString("postCode"));
				map.put("idCard", rs.getString("idCard"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return map;
	}

	/**
	 * �����û���Ϣ
	 */
	public boolean updateUserInfo(String userId,String realName,String sex,
			String email,String postCode,String phone,String cellPhone,String address){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		StringBuffer strsql=new StringBuffer("update t_user set realName='"+realName+"',sex="+sex+",");
		    strsql.append("email='"+email+"',postCode='"+postCode+"',phone='"+phone+"',cellPhone='");
		    strsql.append(cellPhone+"',address='"+address+"' where userId='"+userId+"'");
		    
		    
		/*	int num=0;
			try {
				num=du.stmt.executeUpdate(strsql.toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (num==1){
				return true;
			}
			else{
				return false;
			}  */
		boolean tf=utilDB.executeUpdate(strsql.toString());
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;
		
		
			
			
			
	}
	
	/**
	 * ��ѯ�û�Email�����޸�
	 * @param userId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map queryUserEmail(String userId){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		StringBuffer strsql=new StringBuffer("select email from t_user where userId='"+userId+"'");
		Map map=new HashMap();
		ResultSet rs=null; 
		try {
			rs=utilDB.executeQuery(strsql.toString());
			while(rs.next()){
				map.put("userId", userId);
				map.put("email", rs.getString("email"));
				return map;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * �����û�����
	 */
	public boolean updateUserEmail(String userId,String password,String newEmail){
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		StringBuffer strsql=new StringBuffer("update t_user set email='"+newEmail+"' where userId='"+userId+"' and userPwd='"+password+"'");
		/*	int num=0;
			try {
				num=utilDB.executeUpdate(strsql.toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (num==1){
				return true;
			}
			else{
				return false;
			}    */
		    
		boolean tf=    utilDB.executeUpdate(strsql.toString()); 
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;
		    
	}
	
	/**
	 * �����û�����
	 * @param userId
	 * @param old_password
	 * @param new_password
	 * @return
	 */
	public boolean updateUserPwd(String userId,String old_password,String new_password){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		
		StringBuffer strsql=new StringBuffer("update t_user set userpwd='"+new_password+"' where userId='"+userId+"' and userpwd='"+old_password+"'");
		    
		/*	int num=0;
			try {
				num=utilDB.executeUpdate(strsql.toString());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (num==1){
				return true;
			}
			else{
				return false;
			}    
			*/
			
		    boolean tf=    utilDB.executeUpdate(strsql.toString()); 
			
			
			try {
				utilDB.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return tf;	
			
	}
	
	@SuppressWarnings("unchecked")
	public boolean updateOrderStatus(String orderId){
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String strsql="update t_orders set orderStatus=3,payStatus=2 where orderId='"+orderId+"'";

	    boolean tf= utilDB.executeUpdate(strsql.toString()); 
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return tf;	
		
	}
	
}
