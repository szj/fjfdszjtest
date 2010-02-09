/**
 * ����һ������iBatis������д��һ��������
 * ����ID����ȡ�ö��ڵ�SQL����Ҫ�Ĳ�������
 * **/
package net.trust.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.engine.impl.ExtendedSqlMapClient;
import com.ibatis.sqlmap.engine.impl.SqlMapExecutorDelegate;
import com.ibatis.sqlmap.engine.mapping.parameter.ParameterMap;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.ibatis.sqlmap.engine.mapping.statement.MappedStatement;
import com.ibatis.sqlmap.engine.scope.RequestScope;

public class IbatisUtils {
	private Object[] sqlParam = null;

	private SqlMapClient sqlMapClient = null;
	private Log log = LogFactory.getLog(IbatisUtils.class);
	public IbatisUtils(SqlMapClient sqlMapClient) {
		//sqlMapClient = (SqlMapClient) CustomBeanFactory.getBean("sqlMapClient");
		this.sqlMapClient = sqlMapClient;
	}

	public void setSqlMapClient(SqlMapClient c) {
		sqlMapClient = c;
	}

	public SqlMapClient getSqlMapClient() {
		return sqlMapClient;
	}

	/**
	 * ȡ��һ��������ɵ�sql,�ڷ������и�sqlParam���鸳ֵ,��������������sql����Ҫ�Ĳ���
	 * @author chenf
	 * @param String sqlMapId ��Ӧ��ibatis�����ļ����sql���
	 * @param Object parameter ǰ̨����Ĳ���
	 * @throws none
	 * */
	public String getSql(String sqlMapId, Object parameter) {
		String sqlValue = "";
		ExtendedSqlMapClient extendedSqlMapClient = (ExtendedSqlMapClient) sqlMapClient;
		SqlMapExecutorDelegate sqlMapExecutorDelegate = extendedSqlMapClient
				.getDelegate();
		MappedStatement mappedStatement = sqlMapExecutorDelegate
				.getMappedStatement(sqlMapId);
		RequestScope requestScope = new RequestScope();
		mappedStatement.initRequest(requestScope);
		Sql sql = mappedStatement.getSql();

		sqlValue = sql.getSql(requestScope, parameter);
		ParameterMap pm = sql.getParameterMap(requestScope, parameter);
		pm.getParameterObjectValues(requestScope, parameter);
		sqlParam = pm.getParameterObjectValues(requestScope, parameter);
		if(log.isDebugEnabled())
			log.debug(sqlValue);
		return sqlValue;
	}

	public void setSqlParam(Object[] para) {
		sqlParam = para;
	}

	public Object[] getSqlParam() {
		return sqlParam;
	}
}
