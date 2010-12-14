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
package com.enation.app.base.widget;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.enation.eop.sdk.widget.AbstractWidget;
import com.enation.framework.database.IDBRouter;

public class SqlListWidget extends AbstractWidget {
	private IDBRouter baseDBRouter;
	@Override
	protected void config(Map<String, String> params) {
		
	}

	@Override
	protected void execute(Map<String, String> params) {
		String sql  =params.get("sql");
		sql = filterSql(sql);
		List list = this.daoSupport.queryForList(sql);
		this.putData("dataList", list);
	}

	private String filterSql(String sql ){
		 
		String pattern = "#(.*?)#";
 
		Pattern p = Pattern.compile(pattern, 2 | Pattern.DOTALL);
		Matcher m = p.matcher(sql);
		while(m.find()) {
				String tb  = m.group(0);
				 
				String newTb  = tb.replaceAll("#", "");
				newTb = this.baseDBRouter.getTableName(newTb);
				sql = sql.replaceAll(tb, newTb);
		}		
		return sql;
	}
	
	public static void main(String[] args){
		String sql  ="select * from  #goods# g ,#goods_cat# where cat_id=1";
		String pattern = "#(.*?)#";
 
		Pattern p = Pattern.compile(pattern, 2 | Pattern.DOTALL);
		Matcher m = p.matcher(sql);
		while(m.find()) {
				String tb  = m.group(0);
				System.out.println(tb);
				String newTb  = tb.replaceAll("#", "");
				sql = sql.replaceAll(tb, newTb);
		}		
		System.out.println(sql);
	}

	public IDBRouter getBaseDBRouter() {
		return baseDBRouter;
	}

	public void setBaseDBRouter(IDBRouter baseDBRouter) {
		this.baseDBRouter = baseDBRouter;
	}
	
}
