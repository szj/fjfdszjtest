package com.qzgf.security.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContextException;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.object.MappingSqlQuery;

import com.qzgf.security.MethodRoles;
import com.qzgf.security.PageRoles;

public class JdbcDaoImpl extends JdbcDaoSupport {
	//��ҪȨ���жϵ�ҳ�棬��������������ڻ�ȡ���ݵ�sql
	private String authoritiesByPageIdQuery;
	private String authoritiesByMethodQuery;
	private PageRoleMapping pageRoleMapping;
	private MethodRoleMapping methodRoleMapping;

	public JdbcDaoImpl() {
	}

	public String getAuthoritiesByPageIdQuery() {
		return authoritiesByPageIdQuery;
	}

	public void setAuthoritiesByPageIdQuery(String authoritiesByPageIdQuery) {
		this.authoritiesByPageIdQuery = authoritiesByPageIdQuery;
	}

	//����������Զ���spring����
	protected void initDao() throws ApplicationContextException {
		setPageRoleMapping(new PageRoleMapping(getDataSource()));
		setMethodRoleMapping(new MethodRoleMapping(getDataSource()));
	}

	public void setPageRoleMapping(PageRoleMapping prm) {
		pageRoleMapping = prm;
	}

	public PageRoleMapping getPageRoleMapping() {
		return pageRoleMapping;
	}

	public MethodRoleMapping getMethodRoleMapping() {
		return methodRoleMapping;
	}

	public void setMethodRoleMapping(MethodRoleMapping methodRoleMapping) {
		this.methodRoleMapping = methodRoleMapping;
	}

	public String getAuthoritiesByMethodQuery() {
		return authoritiesByMethodQuery;
	}

	public void setAuthoritiesByMethodQuery(String authoritiesByMethodQuery) {
		this.authoritiesByMethodQuery = authoritiesByMethodQuery;
	}

	//================
	@SuppressWarnings("unchecked")
	public List getPageRoleData() {
		return pageRoleMapping.execute();
	}

	@SuppressWarnings("unchecked")
	public List getMethodRoleData() {
		return methodRoleMapping.execute();
	}

	//================================================================
	protected class PageRoleMapping extends MappingSqlQuery {
		protected PageRoleMapping(DataSource ds) {
			super(ds, authoritiesByPageIdQuery);
			compile();
		}

		protected Object mapRow(ResultSet rs, int rownum) throws SQLException {
			//����ʹ��rs����ȡ����
			return new PageRoles(rs.getString(1), rs.getString(2));
		}
	}

	protected class MethodRoleMapping extends MappingSqlQuery {
		protected MethodRoleMapping(DataSource ds) {
			super(ds, authoritiesByMethodQuery);
			compile();
		}

		protected Object mapRow(ResultSet rs, int rownum) throws SQLException {
			//����ʹ��rs����ȡ����
			return new MethodRoles(rs.getString(1), rs.getString(2));
		}
	}

}
