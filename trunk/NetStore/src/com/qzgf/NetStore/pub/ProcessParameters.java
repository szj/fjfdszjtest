package com.qzgf.NetStore.pub;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProcessParameters {

	@SuppressWarnings("unchecked")
	private List inlist=new ArrayList();
	@SuppressWarnings("unchecked")
	private List outlist=new ArrayList();
	
	class ParameterObject{
		public static final int IN=1;
		public static final int OUT=2;
		public static final int INOUT=3;
		
		private int index;
		private int intoutType;
		private int sqlType;
		private Object value;
		
		public int getIndex() {
			return index;
		}
		public void setIndex(int index) {
			this.index = index;
		}
		public int getIntoutType() {
			return intoutType;
		}
		public void setIntoutType(int intoutType) {
			this.intoutType = intoutType;
		}
		public int getSqlType() {
			return sqlType;
		}
		public void setSqlType(int sqlType) {
			this.sqlType = sqlType;
		}
		public Object getValue() {
			return value;
		}
		public void setValue(Object value) {
			this.value = value;
		}
	}
	
	/**
	 * ���IN���͵Ĳ���
	 * @param index �������
	 * @param value ������ֵ
	 */
	public void addInParameter(int index,Object value){
		ParameterObject p=new ParameterObject();
		p.setIndex(index);
		p.setIntoutType(ParameterObject.IN);
		p.setValue(value);
		inlist.add(p);
	}
	
	/**
	 * ���OUT���͵Ĳ���
	 * @param index �������
	 * @param sqlType �������������
	 */
	public void addOutParameter(int index,int sqlType){
		ParameterObject p=new ParameterObject();
		p.setIndex(index);
		p.setIntoutType(ParameterObject.OUT);
		p.setSqlType(sqlType);
		outlist.add(p);
	}
	
	/**
	 * ���INOUT���͵Ĳ���
	 * @param index �������
	 * @param value ������ֵ
	 * @param sqlType �������������
	 */
	public void addInOutParameter(int index,Object value,int sqlType){
		ParameterObject p=new ParameterObject();
		p.setIndex(index);
		p.setIntoutType(ParameterObject.INOUT);
		p.setValue(value);
		p.setSqlType(sqlType);
		inlist.add(p);
		outlist.add(p);
	}
	
	/**
	 * 
	 * @param cs
	 * @return ��������ΪMap��Map��keyΪ�����������ţ�Map��valueΪ���������ֵ
	 * @throws SQLException
	 */
	public Map getResult(CallableStatement cs) throws SQLException{
		Map map=new HashMap();
		for(int i=0;i<inlist.size();i++){
			ParameterObject po=(ParameterObject) inlist.get(i);
			cs.setObject(po.getIndex(), po.getValue());
		}
		for(int i=0;i<outlist.size();i++){
			ParameterObject po=(ParameterObject) outlist.get(i);
			cs.registerOutParameter(po.getIndex(), po.getSqlType());
		}
		cs.execute();
		for(int i=0;i<outlist.size();i++){
			ParameterObject po=(ParameterObject) outlist.get(i);
			map.put(String.valueOf(po.getIndex()), cs.getObject(po.getIndex()));
		}
		return map;
	}
}
