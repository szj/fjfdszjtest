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
package com.enation.javashop.core.model.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.enation.javashop.core.model.GoodsType;

public class GoodsTypeMapper implements RowMapper {

	public Object mapRow(ResultSet rs, int arg1) throws SQLException {
		
		GoodsType goodsType = new GoodsType();
		goodsType.setType_id(rs.getInt("type_id"));
		goodsType.setName(rs.getString("name"));
		goodsType.setHave_parm(rs.getInt("have_parm"));
		goodsType.setHave_prop(rs.getInt("have_prop"));
		goodsType.setIs_physical(rs.getInt("is_physical"));
		goodsType.setJoin_brand(rs.getInt("join_brand"));
		goodsType.setProps(rs.getString("props"));
		goodsType.setParams(rs.getString("params"));
		
		return goodsType;
		
	}

}
