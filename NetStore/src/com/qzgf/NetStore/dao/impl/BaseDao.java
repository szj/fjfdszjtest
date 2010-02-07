package com.qzgf.NetStore.dao.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.qzgf.NetStore.dao.IBaseDao;
import com.qzgf.NetStore.persistence.Menu;

public class BaseDao implements IBaseDao {
	private Logger logger = Logger.getLogger(this.getClass());

	private SessionFactory sessionFactory;

	/*************************begin ɾ������*************************************************/		
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#delete(java.lang.Object)  
	 * ɾ��ʵ��
	 */
	public void delete(Object entity) {
		logger.info("delete(Object) entity.class="
				+ entity.getClass().getName());
		
		Session session = null;
		Transaction tr = null;
		boolean commitflag = false;
		try {
			session = this.getSession();
			tr = session.getTransaction();
			tr.begin();
			session.delete(entity);
			tr.commit();
			commitflag = true;
			session.flush();
			session.clear();
		} catch (Exception e) {
			if (tr != null)
				tr.rollback();
		} finally {
			if (!commitflag) {
				try {
					if (tr != null)
						tr.rollback();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			this.closeSession(session);
		}
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#delete(java.lang.Class, long) 
	 * ����id�õ�����ɾ�� 
	 */
	public void delete(Class clazz, long id) {
		// TODO Auto-generated method stub   
		logger.info("ClassName=" + clazz.getName() + "  ,id=" + id);
		try {
			Object entity = this.getByPk(clazz, id);
			if (entity != null)
				this.delete(entity);
			else
				logger.info(clazz.getName() + " �Ĺؼ���Ϊ " + id + "  �Ķ��󲻴��� ");
		} catch (Exception e) {
			logger.info("  delete(Class, long)  excute is error  . Error="
					+ e.toString());
		}

	}
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#delete(java.lang.Class, long) 
	 * ����id�õ�����ɾ�� 
	 */
	public void delete(Class clazz, String id) {
		// TODO Auto-generated method stub   
		logger.info("ClassName=" + clazz.getName() + "  ,id=" + id);
		try {
			Object entity = this.getByPk(clazz, id);
			if (entity != null)
				this.delete(entity);
			else
				logger.info(clazz.getName() + " �Ĺؼ���Ϊ " + id + "  �Ķ��󲻴��� ");
		} catch (Exception e) {
			logger.info("  delete(Class, long)  excute is error  . Error="
					+ e.toString());
		}

	}
	
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#delete(java.lang.Class, long) 
	 * ����id�õ�����ɾ�� 
	 */
	public void delete(Class clazz, Serializable kid) {
		// TODO Auto-generated method stub   
		logger.info("ClassName=" + clazz.getName() + "  ,id=");
		try {
			Object entity = this.loadByPk(clazz, kid);
			if (entity != null)
				this.delete(entity);
			else
				logger.info(clazz.getName() + " �Ĺؼ���Ϊ " + "  �Ķ��󲻴��� ");
		} catch (Exception e) {
			logger.info("  delete(Class, long)  excute is error  . Error="
					+ e.toString());
		}

	}
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#deleteAll(java.lang.Class) 
	 * ɾ��ȫ������,����������������
	 */
	public void deleteAll(Class clazz,String notkeyname,Serializable notkeyvalue) {
		logger.info("deleteAll(Class) ClassName=" + clazz.getName());
		Session session = null;
		Transaction tr = null;
		boolean commitflag = false;
		try {
			session = this.getSession();
			tr = session.beginTransaction();
			Query query = session.createQuery(" delete   from "+ clazz.getName()+" where "+ notkeyname+"='"+notkeyvalue+"'");
			query.executeUpdate();
			tr.commit();
			commitflag = true;
			session.flush();
		} catch (Exception e) {
			logger.info("  deleteAll(Class clazz)  excute is error  . Error="
					+ e.toString());
		} finally {
			if (!commitflag) {
				try {
					if (tr != null)
						tr.rollback();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			this.closeSession(session);
		}
	}
	
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#deleteAll(java.lang.Class) 
	 * ɾ��ȫ������ 
	 */
	public void deleteAll(Class clazz) {
		logger.info("deleteAll(Class) ClassName=" + clazz.getName());
		Session session = null;
		Transaction tr = null;
		boolean commitflag = false;
		try {
			session = this.getSession();
			tr = session.beginTransaction();
			Query query = session.createQuery(" delete   from "
					+ clazz.getName());
			query.executeUpdate();
			tr.commit();
			commitflag = true;
			session.flush();
		} catch (Exception e) {
			logger.info("  deleteAll(Class clazz)  excute is error  . Error="
					+ e.toString());
		} finally {
			if (!commitflag) {
				try {
					if (tr != null)
						tr.rollback();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			this.closeSession(session);
		}
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#deleteAll(java.util.Collection) 
	 * ����ɾ�����ű�
	 */
	public void deleteAll(Collection entities) {
		Session session = null;
		Transaction tr = null;
		boolean commitflag = false;
		try {
			session = this.getSession();
			tr = session.beginTransaction();
			Iterator ite = entities.iterator();
			while (ite.hasNext())
				session.delete(ite.next());
			tr.commit();
			commitflag = true;
			session.flush();
		} catch (Exception e) {
			logger.info("  deleteAll(Collection entities)  excute is error  . Error="
					+ e.toString());
		} finally {

			if (!commitflag) {
				try {
					if (tr != null)
						tr.rollback();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			this.closeSession(session);

		}

	}
	
	
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#batchDelete(java.lang.Class, long[])  
	 * ����ɾ��
	 */
	public void batchDelete(Class clazz, long[] id) {
		String strId = "";
		for (int i = 0; i < id.length; i++) {
			if (i > 0)
				strId += ", " + id[i];
			else
				strId = "" + id[i];
		}
		logger.info("batchDelete(Class, long[])  id[]={" + strId + "}");
		for (int i = 0; i < id.length; i++) {
			this.delete(clazz, id[i]);
		}
	}

	//
    /******************************end ɾ������***********************************************/	

    /******************************begin ������***********************************************/		
	/*
	 * (non-Javadoc)
	 * @see zhenjw.hibernate.dao.IBaseDao#create(java.lang.Object)
	 * ����ʵ��
	 */
	public void create(Object entity) {
		Session session = null;
		Transaction tr = null;
		boolean commitflag = false;
		try {
			session = this.getSession();
			tr = session.beginTransaction();
			session.save(entity);
			tr.commit();
			commitflag = true;
			session.flush();
			session.clear();
			logger.info("����" + entity.getClass().getName() + " ��ʵ�������ݿ�ɹ���");
		} catch (Exception e) {
			logger.info("����" + entity.getClass().getName() + " ��ʵ�������ݿ����", e);
			e.printStackTrace();
		} finally {
			if (!commitflag) {
				try {
					if (tr != null)
						tr.rollback();
				} catch (Exception e1) {
					logger.info("����", e1);
				}
			}

			this.closeSession(session);

		}

	}

	
	/* ����:����ʵ��
	 * (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#update(java.lang.Object)  
	 */
	public void update(Object entity) {
		logger.info("update(Object) entity.class="
				+ entity.getClass().getName());
		Session session = null;
		Transaction tr = null;
		try {
			session = this.getSession();
			tr = session.beginTransaction();
			session.update(entity);
			tr.commit();
			session.flush();
			session.clear();
		} catch (Exception e) {
			if (tr != null)
				tr.rollback();
			logger.info("update(Object entity) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}

	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getByPk(java.lang.Class, int)  
	 * ����id�õ�����int
	 */
	public Object getByPk(Class clazz, int id) {
		logger.info("getByPk(Class, Integer) class=" + clazz.getName()
				+ " , ID=" + id);
		Object result = null;
		Session session = null;
		try {
			session = this.getSession();
			result = session.get(clazz, new Integer(id));
		} catch (Exception e) {
			logger.info("getByPk(Class clazz, int id) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getByPk(java.lang.Class, long)  
	 * ����id�õ�����long
	 */
	public Object getByPk(Class clazz, long id) {
		logger.info("getByPk(Class, Long) Class=" + clazz.getName() + ",id="
				+ id);
		Object result = null;
		Session session = null;
		try {
			session = this.getSession();
			result = session.get(clazz, new Long(id));
		} catch (Exception e) {
			logger.info("getByPk(Class clazz, long id) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}

		return result;
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getByPk(java.lang.Class, java.lang.String)  
	 *  ����id�õ�����String
	 */
	public Object getByPk(Class clazz, String id) {
		logger.info("getByPk(Class, String) Class=" + clazz.getName() + ",id="
				+ id);
		Object result = null;
		Session session = null;
		try {
			session = this.getSession();
			result = session.get(clazz, id);
		} catch (Exception e) {
			logger.info("getByPk(Class clazz, String id) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getByPk(java.lang.Class, java.lang.String)  
	 *  ����id�õ�����String
	 */
//	public Object getByPk(Class clazz, Object id) {
//		logger.info("getByPk(Class, String) Class=" + clazz.getName() + ",id="
//				+ id);
//		Object result = null;
//		Session session = null;
//		try {
//			session = this.getSession();
//			result = session.load(clazz, id);
//		} catch (Exception e) {
//			logger.info("getByPk(Class clazz, String id) excute is error  . Error="
//					+ e.toString());
//		} finally {
//			this.closeSession(session);
//		}
//		return result;
//	}
	
	/* ���ܣ��õ����ж���
	 * (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#loadAll(java.lang.String)  
	 */
	public List loadAll(String strhql) {
		return this.find(strhql);
	}

	/* ���ܣ����������õ�����
	 *  (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#loadByPk(java.lang.Class, java.lang.String, java.lang.Object)  
	 */
	public Object loadByPk(Class clazz, String keyName, Object keyValue) { 
		Object result = null;
		String query = "from " + clazz.getName() + "  where " + keyName + "=? ";
		logger.info("loadByPk(Class, String, Object) queryString=" + query
				+ "  ,keyValue=" + keyValue);
		Session session = null;
		try {
			session = this.getSession();
			result = session.createCriteria(clazz).add(
					Restrictions.eq(keyName, keyValue)).list();
		} catch (Exception e) {
			logger.info("loadByPk(Class clazz, String keyName, Object keyValue) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}
	
	public Object loadByPk(Class clazz, Serializable kid) { 
		Object result = null;
		Session session = null;
		try {
			session = this.getSession();
			result = session.load(clazz,kid);
		} catch (Exception e) {
			logger.info("loadByPk(Class clazz, String keyName, Object keyValue) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

    /******************************end ������***********************************************/		

	/***********************begin ִ�и���sql���***********************************/
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#excuteSql(java.lang.String) 
	 * ִ��sql����Update���
	 */
	public void excuteSql(String strsql) {
		// TODO Auto-generated method stub   
		logger.info("excuteSql(String) strsql=" + strsql);
		Session session = null;
		Transaction tr = null;
		boolean commitflag = false;
		try {
			session = this.getSession();
			tr = session.beginTransaction();
			SQLQuery query = session.createSQLQuery(strsql);
			query.executeUpdate();
			tr.commit();
			commitflag = true;
			session.flush();
		} catch (Exception e) {
			logger.info(" excuteSql(String strsql) excute is error  . Error="
					+ e.toString());
		} finally {
			if (!commitflag) {
				try {
					if (tr != null)
						tr.rollback();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			this.closeSession(session);
		}

	}

	/***********************end ִ�и���sql���***********************************/
	
	/***********************begin ִ�в�ѯ���(hsql,sql)***********************************/
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#find(java.lang.String) 
	 * ͨ��hqlִ�в�ѯ 
	 */
	@SuppressWarnings("unchecked")
	public List find(String strhql) {
		logger.info(" find(String) queryString=" + strhql);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			Query query = session.createQuery(strhql);
			result = query.list();
		} catch (Exception e) {
			logger.info(" find(String strhql) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#find(java.lang.String, java.lang.Object) 
	 * ��һ�������Ĳ�ѯ 
	 */
	public List find(String strhql, Object param) {
		// TODO Auto-generated method stub   
		logger.info("find(String, Object) queryString=" + strhql + " ,param="
				+ param);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			Query query = session.createQuery(strhql);
			query.setParameter(0, param);
			result = query.list();
		} catch (Exception e) {
			logger.info("  find(String strhql, Object param) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}
	
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#find(java.lang.String, java.lang.Object) 
	 * ����������Ĳ�ѯ 
	 * ���� select * from table,�ڶ�hql��Ӧ����table��Ӧ��hibernate�е�������
	 */
	public List find(String strhql, Object[] param) {
		// TODO Auto-generated method stub   
		logger.info("find(String, Object) queryString=" + strhql + " ,param="
				+ param);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			Query query = session.createQuery(strhql);
			for(int i=0;i<param.length;i++){
			    query.setParameter(i, param[i]);
			}
			result = query.list();
		} catch (Exception e) {
			logger.info("  find(String strhql, Object param) excute is error  . Error="
					+ e.toString());
			e.printStackTrace();
		} finally {
			this.closeSession(session);
		}
		return result;
	}
		
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#findByNamedParam(java.lang.String, java.lang.String, java.lang.Object)
	 * ��һ���������ƵĲ�ѯ  
	 */
	public List find(String strhql, String name, Object param) {
		logger.info("find(String, String, Object) strhql="
				+ strhql + "name=" + name + " ,param=" + param);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			Query query = session.createQuery(strhql);
			query.setParameter(name, param);
			result = query.list();
		} catch (Exception e) {
			logger.info(" findByNamedParam(String strhql, String name, Object param) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#findBySql(java.lang.String)  
	 *  ��ѯ�������List��
	 */
	public List findBySql(String strsql) {
		logger.info("exceuteSQL(String) strsql=" + strsql);
		Session session = null;
		List result = null;
		try {
			session = this.getSession();
			SQLQuery query = session.createSQLQuery(strsql);
			result = query.list();
		} catch (Exception e) {
			logger.info(" findBySql(String strsql) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#findBySql(java.lang.String, java.util.List)  
	 * �������ѯ
	 */
	public List findBySql(String strsql, Object[] param) {
		String paramnameArray = "";
		/*
		if (param != null) {
			for (int i = 0; i < param.length; i++) {
				if (i > 0)
					paramnameArray += " , " + param.;
				else
					paramnameArray = "" + param.get(i);
			}
		}
		*/
		
		logger.info("excuteSql(String, List) strsql=" + strsql + " , List="
				+ paramnameArray);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			SQLQuery query = session.createSQLQuery(strsql);
			for(int i=0;i<param.length;i++){
			    query.setParameter(i, param[i]);
			}
			result = query.addEntity(Menu.class).list() ;
		} catch (Exception e) {
			//e.printStackTrace();
			logger.info("findBySql(String strsql, List params) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}
	
	
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#findBySql(java.lang.String, java.util.List)  
	 * �������ѯ
	 */
	public List findBySql(String strsql, Object[] param,Class cls) {
		String paramnameArray = "";
		/*
		if (param != null) {
			for (int i = 0; i < param.length; i++) {
				if (i > 0)
					paramnameArray += " , " + param.;
				else
					paramnameArray = "" + param.get(i);
			}
		}
		*/
		logger.info("excuteSql(String, List) strsql=" + strsql + " , List="
				+ paramnameArray);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			SQLQuery query = session.createSQLQuery(strsql);
			for(int i=0;i<param.length;i++){
			    query.setParameter(i, param[i]);
			}
			result = query.addEntity(cls).list();
		} catch (Exception e) {
			//e.printStackTrace();
			logger.info("findBySql(String strsql, List params) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#findBySql(java.lang.String, java.util.List)  
	 * �������ѯ
	 */
	public List findBySql(String strsql, List params) {
		String paramnameArray = "";
		if (params != null) {
			for (int i = 0; i < params.size(); i++) {
				if (i > 0)
					paramnameArray += " , " + params.get(i);
				else
					paramnameArray = "" + params.get(i);
			}
		}
		logger.info("excuteSql(String, List) strsql=" + strsql + " , List="
				+ paramnameArray);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			SQLQuery query = session.createSQLQuery(strsql);
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					query.setParameter(i, params.get(i));
				}
			}
			result = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("findBySql(String strsql, List params) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#findBySql(java.lang.String, java.util.List)  
	 * �������ѯ
	 */
	public List findBySql(String strsql, List paramsnames, List paramvalues) {
		String paramArray = "", paramArraySql = "";
		List result = null;
		Session session = null;
		if (paramsnames.size() != paramvalues.size())
			logger.info("findBySql(String strsql, List paramsnames, List paramvalues) error");
		else {
			if (paramvalues != null) {
				for (int i = 0; i < paramvalues.size(); i++) {
					if (i > 0) {
						paramArray += " , " + paramsnames.get(i) + ":"
								+ paramvalues.get(i);
						paramArraySql = " and " + paramsnames.get(i) + "=?";
					} else {
						paramArray = "" + paramsnames.get(i) + ":"
								+ paramvalues.get(i);
						paramArraySql = strsql + "where " + paramsnames.get(i)
								+ "=?";
					}
				}
			}
			logger.info("excuteSql(String, List) strsql=" + strsql
					+ " , List=" + paramArray);
			try {
				session = this.getSession();
				SQLQuery query = session.createSQLQuery(paramArraySql);
				if (paramvalues != null) {
					for (int i = 0; i < paramvalues.size(); i++) {
						query.setParameter(i, paramvalues.get(i));
					}
				}
				result = query.list();
			} catch (Exception e) {
				e.printStackTrace();
				logger.info("findBySql(String strsql, List paramsnames, List paramvalues) excute is error  . Error="
						+ e.toString());
				} finally {
				this.closeSession(session);
			}
		}
		return result;
	}

	/***********************end ִ�в�ѯ���(hsql,sql)***********************************/

	/***********************begin ����(hsql,sql)***********************************/
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getTotalCount(java.lang.String)  
	 * Hsql�õ�����
	 * select count(*) from table;�����Ϊ list.get(0)Ϊ����ֵ 
	 */
	public int getTotalCount(String strhql) {
		logger.info("getTotalCount() strhql=" + strhql);
		int result = 0;
		Session session = null;
		try {
			String strsql = this.getQueryTotalCountString(strhql);
			session = this.getSession();
			Query query = session.createQuery(strsql);
			List list = query.list();
			result = this.getNum(list);
		} catch (Exception e) {
			logger.info("getTotalCount(String strhql) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* ���ܣ��õ�����
	 *  (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getTotalCount(java.lang.String, java.lang.Object)  
	 * Customer customer=new Customer();
	 * customer.setName(��pansl��);
	 * customer.setAge(80);
	 * Query query=session.createQuery(��from Customer c where c.name=:name and c.age=:age ��);
	 * query.setProperties(customer);
	 * setProperties()�������Զ���customer����ʵ��������ֵƥ�䵽���������ϣ�����Ҫ�������������Ʊ���Ҫ��ʵ�������Ӧ������ͬ����
	 */
	public int getTotalCount(String strhql, Object obj) {
		logger.info("getTotalCount(String,Object)  strhql=" + strhql + ""
				+ obj.getClass().getName());
		int result = 0;
		Session session = null;
		try {
			String strsql = this.getQueryTotalCountString(strhql);
			logger.info("strsql=" + strsql);
			session = this.getSession();
			Query query = session.createQuery(strsql);
			List list = query.setProperties(obj).list();
			result = this.getNum(list);
		} catch (Exception e) {
			logger.info("getTotalCount(String strhql, Object obj) excute is error  . Error="
					+ e.toString());
			e.printStackTrace();
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* ���ܣ�hsql�õ�����
	 * (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getTotalCount(java.lang.String, java.util.List)  
	 */
	public int getTotalCount(String strhql, List params) {
		String paramnameArray = "";
		if (params != null) {
			for (int i = 0; i < params.size(); i++) {
				if (i > 0)
					paramnameArray += " , " + params.get(i);
				else
					paramnameArray = "" + params.get(i);
			}
		}
		logger.info("getTotalCount(String, List) strhql=" + strhql
				+ " , List=" + paramnameArray);
		int result = 0;
		Session session = null;
		try {
			String strquery = this.getQueryTotalCountString(strhql);
			session = this.getSession();
			logger.info("strquery==" + strquery);
			Query query = session.createQuery(strquery);
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					query.setParameter(i, params.get(i));
				}
			}
			List list = query.list();
			result = this.getNum(list);
		} catch (Exception e) {
			logger.info("getTotalCount(String strhql, List params) excute is error  . Error="
					+ e.toString());
			e.printStackTrace();
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* ���ܣ����������
	 *  (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getTotalCountBySql(java.lang.String)  
	 */
	public int getTotalCountBySql(String strsql) {
		logger.info("getTotalCountBySql(String) strsql=" + strsql);
		int result = 0;
		Session session = null;
		try {
			strsql = this.getQueryTotalCountString(strsql);
			session = this.getSession();
			logger.info("strsql==" + strsql);
			List list = session.createSQLQuery(strsql).list();
			result = this.getNum(list);
		} catch (Exception e) {
			logger.info("getTotalCountBySql(String strsql) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* ���ܣ��õ�����
	 * (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getTotalCountBySql(java.lang.String, java.util.List)  
	 */
	public int getTotalCountBySql(String strsql, List params) { 
		String paramnameArray = "";
		if (params != null) {
			for (int i = 0; i < params.size(); i++) {
				if (i > 0)
					paramnameArray += " , " + params.get(i);
				else
					paramnameArray = "" + params.get(i);
			}
		}
		logger.info("getTotalCountBySql(String, List) strsql=" + strsql
				+ " , List=" + paramnameArray);
		int result = 0;
		Session session = null;
		try {
			strsql = this.getQueryTotalCountString(strsql);
			logger.info("strsql==" + strsql);
			session = this.getSession();
			SQLQuery query = session.createSQLQuery(strsql);
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					query.setParameter(i, params.get(i));
				}
			}
			List list = query.list();
			result = this.getNum(list);
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("getTotalCountBySql(String strsql, List params) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}
	
	/**  
	 * ���ܣ��õ���ѯ��¼��������䣨����sql��hql��  
	 * @param queryString  
	 * @return  
	 */
	private String getQueryTotalCountString(String queryString) {
		int form_index = queryString.indexOf("from ");
		int orderby_index = queryString.indexOf(" order by ");
		String strsql = "";
		if (form_index < 0) {
			strsql = "";
		} else {
			strsql = " select count(*) ";
			if (orderby_index > -1) {
				strsql = strsql
						+ queryString.substring(form_index, orderby_index);
			} else {
				strsql = strsql + queryString.substring(form_index);
			}
		}
		return strsql;
	}

	/**  
	 * ���ܣ��õ���¼���ķ���  
	 * @param list  
	 * @return  
	 */
	protected int getNum(List list) {
		int result = 0;
		if (list != null || list.size() > 0)
			result = Integer.parseInt(list.get(0).toString());
		return result;
	}

	/***********************end ����(hsql,sql)***********************************/
	
	/***********************begin ��ҳ����***********************************/

	/* ����:hsql��ҳ��ѯ
	 *  (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#query(int, int, java.lang.String)  
	 */
	public List query(int pageNo, int pageSize, String strhql) {
		logger.info("query(int, int, String) pageNo=" + pageNo + ",pageSize="
				+ pageSize + " ,strhql=" + strhql);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			Query query = session.createQuery(strhql);
			if (pageNo > 0 && pageSize > 0) {
				query.setFirstResult((pageNo - 1) * pageSize);
				query.setMaxResults(pageSize);
			}
			result = query.list();
		} catch (Exception e) {
			logger.info("query(int pageNo, int pageSize, String strhql) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* ���ܣ�hsql�������ķ�ҳ��ѯ
	 *  (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#query(int, int, java.lang.String, java.lang.Object)  
	 */
	public List query(int pageNo, int pageSize, String strhql, Object obj) {
		logger.info("query(int, int, String, Object) pageNo=" + pageNo
				+ ",pageSize=" + pageSize + "strhql=" + strhql + "  ,obj"
				+ obj.getClass().getName());
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			Query query = session.createQuery(strhql);
			query.setProperties(obj);
			if (pageNo > 0 && pageSize > 0) {
				query.setFirstResult((pageNo - 1) * pageSize);
				query.setMaxResults(pageSize);
			}
			result = query.list();
		} catch (Exception e) {
			logger.info("query(int pageNo, int pageSize, String strhql, Object obj) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/* ����:Hsql��ҳ�������ѯ
	 *  (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#query(int, int, java.lang.String, java.util.List)  
	 */
	public List query(int pageNo, int pageSize, String strhql, List params) {
		logger.info("query(int, int, String, Object) pageNo=" + pageNo
				+ ",pageSize=" + pageSize + ",strhql=" + strhql);
		String paramnameArray = "";
		if (params != null) {
			for (int i = 0; i < params.size(); i++) {
				if (i > 0)
					paramnameArray += " , " + params.get(i);
				else
					paramnameArray = "" + params.get(i);
			}
		}
		logger.info("params=" + params);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			Query query = session.createQuery(strhql);
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					query.setParameter(i, params.get(i));
				}
			}
			if (pageNo > 0 && pageSize > 0) {
				query.setFirstResult((pageNo - 1) * pageSize);
				query.setMaxResults(pageSize);
			}
			result = query.list();
		} catch (Exception e) {
			logger.info("query(int pageNo, int pageSize, String strhql, List params) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;

	}

	/* ����:��ҳ��ѯ
	 * (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#queryBySql(int, int, java.lang.String) 
	 *  
	 */
	public List queryBySql(int pageNo, int pageSize, String strsql) {
		logger.info("query(int, int, String) pageNo=" + pageNo + ",pageSize="
				+ pageSize + " ,strsql=" + strsql);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			SQLQuery query = session.createSQLQuery(strsql);
			if (pageNo > 0 && pageSize > 0) {
				query.setFirstResult((pageNo - 1) * pageSize);
				query.setMaxResults(pageSize);
			}
			result = query.list();
		} catch (Exception e) {
			logger.info("queryBySql(int pageNo, int pageSize, String strsql) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;

	}

	/* ���ܣ���ҳ��ֵ��ѯ����
	 * (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#queryBySql(int, int, java.lang.String, java.util.List)  
	 */
	public List queryBySql(int pageNo, int pageSize, String strsql, List params) {
		logger.info("query(int, int, String, Object) pageNo=" + pageNo
				+ ",pageSize=" + pageSize + " , strsql=" + strsql);
		String paramnameArray = "";
		if (params != null) {
			for (int i = 0; i < params.size(); i++) {
				if (i > 0)
					paramnameArray += " , " + params.get(i);
				else
					paramnameArray = "" + params.get(i);
			}
		}
		logger.info("params=" + params);
		List result = null;
		Session session = null;
		try {
			session = this.getSession();
			SQLQuery query = session.createSQLQuery(strsql);
			if (params != null) {
				for (int i = 0; i < params.size(); i++) {
					query.setParameter(i, params.get(i));
				}
			}
			if (pageNo > 0 && pageSize > 0) {
				query.setFirstResult((pageNo - 1) * pageSize);
				query.setMaxResults(pageSize);
			}
			result = query.list();
		} catch (Exception e) {
			logger.info("queryBySql(int pageNo, int pageSize, String strsql, List params) excute is error  . Error="
					+ e.toString());
		} finally {
			this.closeSession(session);
		}
		return result;
	}

	/***********************end ��ҳ����***********************************/
	

	/***********************begin seesion����***********************************/
	/* ����:��һ��session
	 * (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#getSession()  
	 */
	public Session getSession() {
		return this.sessionFactory.openSession();
	}
	/**  
	 * ���ܣ��ر�session  
	 * @param session  
	 */
	protected void closeSession(Session session) {
		if (session != null && session.isOpen())
			session.close();
		session = null;
	}
	/*
	 * ����:sessionFactory���������ȡ
	 */
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	/***********************end seesion����***********************************/
}
