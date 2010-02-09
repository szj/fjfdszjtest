package com.qzgf.NetStore.dao;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.hibernate.Session;

public interface IBaseDao {

	/*************************begin ɾ������*************************************************/		
	  
    /**  
     * ���ܣ�ɾ����¼  
     *   
     * @param entity  
     */  
    public void delete(Object entity);   
  
    /**  
     * ���ܣ�ɾ������  
     *   
     * @param clazz  
     * @param id  
     */  
    @SuppressWarnings("unchecked")
	public void delete(Class clazz, long id);   
    
	public void delete(Class clazz, String id);
  
    /**  
     * ���ܣ�����ɾ������  
     *   
     * @param clazz  
     * @param id  
     */  
    @SuppressWarnings("unchecked")
	public void batchDelete(Class clazz, long[] id);   
  
    /**  
     * ���ܣ�ɾ�����е����еļ�¼  
     *   
     * @param clazz  
     */  
    @SuppressWarnings("unchecked")
	public void deleteAll(Class clazz);   
  
    /**  
     * ���ܣ�ɾ����¼���е����еļ�¼  
     *   
     * @param entities  
     */  
    @SuppressWarnings("unchecked")
	public void deleteAll(Collection entities);  
    
	/* (non-Javadoc)  
	 * @see zhenjw.hibernate.dao.IBaseDao#deleteAll(java.lang.Class) 
	 * ɾ��ȫ������,����������������
	 */
	public void deleteAll(Class clazz,String notkeyname,Serializable notkeyvalue);
  
	/*************************end ɾ������*************************************************/		
	
    /******************************begin ������***********************************************/		
    
    /**  
     * ���ܣ����Ӽ�¼  
     *   
     * @param entity  
     */  
    public void create(Object entity);   
  
    /**  
     * ���ܣ��޸ļ�¼  
     *   
     * @param entity  
     */  
    public void update(Object entity);   

    /**  
     * ���ܣ�ͨ��������ѯ��¼  
     *   
     * @param clazz  
     * @param id  
     * @return Object  
     */  
  
    @SuppressWarnings("unchecked")
	public Object getByPk(Class clazz, int id);   
  
    /**  
     * ���ܣ�ͨ��������ѯ��¼  
     *   
     * @param clazz  
     * @param id  
     * @return Object  
     */  
    public Object getByPk(Class clazz, long id);   
  
    /**  
     * ���ܣ�ͨ��������ѯ��¼  
     *   
     * @param clazz  
     * @param id  
     * @return Object  
     */  
    public Object getByPk(Class clazz, String id);   
  
    /**  
     * ���ܣ�ͨ���ؼ��ֺ�ֵ�����в�ѯ  
     *   
     * @param clazz  
     * @param keyName  
     * @param keyValue  
     * @return �õ���Object��List  
     */  
    public Object loadByPk(Class clazz, String keyName, Object keyValue);   
    /******************************end ������***********************************************/		
     
	/***********************begin ִ�и���sql���***********************************/
    /**  
     * ���ܣ�ִ��SQL��䣬��Ҫ�Ǹ�����ɾ����¼��SQL��䣬����Ҫ����ֵ��  
     *   
     * @param strsql  
     */  
    public void excuteSql(String strsql);  
    
	/***********************end ִ�и���sql���***********************************/
    
	/***********************begin ִ�в�ѯ���(hsql,sql)***********************************/
    /**  
     * ���ܣ�����hql��ѯ��¼  
     *   
     * @param strhql
     * @return List  
     */    
    public List find(String strhql);
    /**  
     * ���ܣ�����hql��ѯ��¼  
     *   
     * @param strhql  
     * @param param  
     * @return List  
     */  
    public List find(String strhql, Object param); 
    
    
    /**  
     * ���ܣ�����hql��ѯ��¼  
     *   
     * @param strhql  
     * @param param  
     * @return List  
     */  
    public List find(String strhql, Object[] param);    
  
    /**  
     * ���ܣ�����hql��ѯ��¼  
     *    
     * @param strhql  
     * @param name  
     * @param param  
     * @return List  
     */  
    public List find(String strhql, String name, Object param);   
  
       
    /**  
     * ���ܣ�SQL��ѯ  
     * @param strsql  
     * @return  
     */  
    public List findBySql(String strsql);   
       
    /**  
     * ���ܣ���ѯ���������ļ�¼��  
     * @param strsql  
     * @param params  
     * @return  
     */  
    public List findBySql(String strsql,List params);     

	public List findBySql(String strsql, Object[] param);
	
	public List findBySql(String strsql, Object[] param,Class cls);
	
    /**  
     * ���ܣ���ѯ���϶������ļ�¼��  
     * @param strsql  
     * @param params  
     * @return  
     */    
    public List findBySql(String strsql, List paramsnames, List paramvalues);
    
	/***********************end ִ�в�ѯ���(hsql,sql)***********************************/

	/***********************begin ����(hsql,sql)***********************************/
    /**  
     * ���ܣ�����hql���õ���¼����  
     *   
     * @param strhql  
     * @return int  
     */  
    public int getTotalCount(String strhql);   
    
    
    /**  
     * ���ܣ�����hql���õ���¼����  
     *   
     * @param strhql  
     * @param obj  
     * @return int  
     */  
    public int getTotalCount(String strhql, Object obj);   
       
        
    /**  
     * ���ܣ�����hql���õ���¼����  
     * @param strhql  
     * @param params  
     * @return int  
     */  
    @SuppressWarnings("unchecked")
	public int getTotalCount(String strhql, List params);   
  
    /**  
     * ���ܣ�����sql���õ���¼����  
     *   
     * @param strsql  
     * @return int  
     */  
    public int getTotalCountBySql(String strsql);   
 
       
    /**  
     * ���ܣ�����sql���õ���¼����  
     * @param strsql  
     * @param param  
     * @return  
     */  
    @SuppressWarnings("unchecked")
	public int getTotalCountBySql(String strsql, List params);   
       
	/***********************end ����(hsql,sql)***********************************/
	
	/***********************begin ��ҳ����***********************************/  
      
    /**  
     * ���ܣ���ҳ��ѯ  
     *   
     * @param pageNo  
     * @param pageSize  
     * @param strhql  
     * @return List  
     */  
    public List query(int pageNo, int pageSize, String strhql);   
  
    /**  
     * ���ܣ���ҳ��ѯ  
     *   
     * @param pageNo  
     * @param pageSize  
     * @param queryString  
     * @param obj  
     * @return List  
     */  
    public List query(int pageNo, int pageSize, String strhql, Object obj);   
       
       
    /**  
     * ���ܣ���ҳ��ѯ  
     * @param pageNo  
     * @param pageSize  
     * @param strhql  
     * @param params  
     * @return  
     */  
    public List query(int pageNo, int pageSize, String strhql, List params );   
  
    
       
    /**  
     * ���ܣ���ҳ��ѯ  
     *   
     * @param pageNo  
     * @param pageSize  
     * @param strsql  
     * @return List  
     */  
    public List queryBySql(int pageNo, int pageSize, String strsql);    
  
    /**  
     * ���ܣ���ҳ��ѯ  
     * @param pageNo  
     * @param pageSize  
     * @param strsql  
     * @param params  
     * @return  
     */  
    public List queryBySql(int pageNo, int pageSize, String strsql, List params) ;   
       
        
	/***********************end ��ҳ����***********************************/
	

	/***********************begin seesion����***********************************/

	/**  
     * ���ܣ�������ݿ����ӵ�Session  
     *   
     * @return Session  
     */  
    public Session getSession();   
	/***********************end seesion����***********************************/
  
}
