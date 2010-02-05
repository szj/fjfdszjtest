package com.qzgf.utils;

/**
 *@author chenf
 *@date 2005��11��16��
 *@docRoot
 *    ִ��sql�ӿ���
 * */

import java.sql.ResultSet;

public interface StatementIface {
	/**
	 * @author chenf
	 * @dete 2005��11��16��
	 * @param String sql ��Ҫ���е�sql
	 * @param Object[] para sql��Ҫ�Ĳ���
	 * @exception Exception
	 * @return ResultSet
	 * */
	public ResultSet executeSql(String sql,Object[] para)throws Exception;
	/**
	 * @author chenf
	 * @dete 2005��11��16��
	 * �����ͷ���Դ
	 * */
	public void clear();
}
