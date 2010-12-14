/*
============================================================================
��Ȩ���� (C) 2008-2010 �����ǻ㣨�������Ƽ����޹�˾������������Ȩ����
��վ��ַ��http://www.javamall.com.cn

����������ȫ���ء������û���ȨЭ�顷�Ļ����ϣ��������Ӧ�����κ���;��������
ҵ��;����������֧�������Ȩ��Ȩ���á��������û���ȨЭ�顷���Դ����ǵ���վ���أ�
������ķ��ɷ��գ���Ҳ������ϵ���ǻ������汾����ȨЭ�顣��δ����Ȩ����²�
����Գ���������κ���ʽ�κ�Ŀ�ĵ��޸Ļ��ٷ�����
============================================================================
*/
package com.enation.javashop.core.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.enation.eop.context.EopContext;
import com.enation.eop.impl.support.BaseSupport;
import com.enation.eop.model.Member;
import com.enation.eop.sdk.user.IUserService;
import com.enation.eop.sdk.user.UserServiceFactory;
import com.enation.framework.database.Page;
import com.enation.javashop.core.service.IGnotifyManager;

public class GnotifyManager extends BaseSupport implements IGnotifyManager {

	
	public Page pageGnotify(int pageNo, int pageSize) {
		IUserService userService = UserServiceFactory.getUserService();
		Member member = userService.getCurrentMember();
		String sql = "select a.*, b.image_default image,b.store store, b.name name, b.price price, b.mktprice mktprice from "+ this.getTableName("gnotify")+" a left join "+ this.getTableName("goods")+" b on b.goods_id = a.goods_id";
		sql += " and a.member_id = " + member.getMember_id();
 		Page webpage = this.daoSupport.queryForPage(sql, pageNo, pageSize);
		List<Map> list = (List<Map>) (webpage.getResult());
//		for (Map gnotify : list) {
//			Long create_time = (Long)gnotify.get("create_time");
//			gnotify.put("create_date", (new Date(create_time)));
//			//Long send_time = (Long)gnotify.get("send_time");
//			//gnotify.put("send_date", (new Date(send_time)));
//		}
		return webpage;
	}

	
	public void deleteGnotify(int gnotify_id) {
		this.baseDaoSupport.execute("delete from gnotify where gnotify_id = ?", gnotify_id);
	}

}
