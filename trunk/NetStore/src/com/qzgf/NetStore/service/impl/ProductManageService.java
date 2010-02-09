package com.qzgf.NetStore.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qzgf.NetStore.dao.IProductManageDAO;
import com.qzgf.NetStore.persistence.ProductCatalog;

import com.qzgf.NetStore.pub.UtilDB;
import com.qzgf.NetStore.pub.wlglException;
import com.qzgf.NetStore.service.IProductManageService;

public class ProductManageService implements IProductManageService {
	
	
	
	//UtilDB du = new UtilDB();
	
	
	private IProductManageDAO productManageDAO;
	
	@SuppressWarnings("unchecked")
	@Override
	public List showProductBig() {
		return this.productManageDAO.showProductBig();
	}
	
	
	// ���
	public void addProductBig(String productName)
	{
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
		
		
		
		
		 String insertStr="insert into t_productcatalog(CatalogName,ParentId)  values('"+productName+"','0')";	
		 /*	try {
				utilDB.executeUpdate(insertStr);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			utilDB.executeUpdate(insertStr);
			try {
				utilDB.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//ɾ��
	public String isUseProduct(String id)
	{
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
		
		
		
		String sql="select * from t_productcatalog where parentid='"+id+"'";
		ResultSet rs=null;
	    String strSql="";
		rs = utilDB.executeQuery(sql);
		try {
			if(rs.next())
			{
				return strSql="1";
			}
			else
			{
				return strSql="0";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
		
	return strSql;
}
	
	
	//ɾ��
	public void deleteProductBig(String id)
	{
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		 String delStr="delete from t_productcatalog  where Id="+id;
		/* try {
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		 utilDB.executeUpdate(delStr);
		 
		 try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//����
	public void updateProductBig(String id,String productName)
	{
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		String updateStr="update t_productcatalog  set CatalogName='"+productName+"' where Id="+id;
		/* try {
				utilDB.executeUpdate(updateStr);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	*/
		
		utilDB.executeUpdate(updateStr);
		
		 try {
				utilDB.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
/////////////��ƷС�����
	@SuppressWarnings("unchecked")
	public List showSmallCatalog(String pId)
	{
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		
		
		String sql="select * from t_productcatalog where parentid='"+pId+"'";
		ResultSet rs=null;
	    List results = new ArrayList();	

		try {
			rs = utilDB.executeQuery(sql);
			while(rs.next()){
				ProductCatalog prdCtg=new ProductCatalog();
				prdCtg.setId(rs.getString("Id"));
				prdCtg.setCatalogName(rs.getString("CatalogName"));
				results.add(prdCtg);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		 try {
				utilDB.closeCon();
			} catch (wlglException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		return results;
	}
	 
	
	//����
	public void    addProductSmall(String pid, String  catalogName)
	{
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
          String insertStr="insert into t_productcatalog(CatalogName,ParentId)  values('"+catalogName+"','"+pid+"')";	
		 /*	try {
				utilDB.executeUpdate(insertStr);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	*/
      	utilDB.executeUpdate(insertStr);
      	try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	public String catalogNameValue(String id)
	{
		
		UtilDB utilDB=null;
    	try {
			 utilDB= new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		String sql="select * from t_productcatalog where  id='"+id+"'";
		
		ResultSet rs=null;
		String result="";
		try {
			rs = utilDB.executeQuery(sql);
			if(rs.next())
			{
				result=rs.getString("catalogName");	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return  result;
	}
	
	
	/////////��ƷС�����
	
	

	public IProductManageDAO getProductManageDAO() {
		return productManageDAO;
	}

	public void setProductManageDAO(IProductManageDAO productManageDAO) {
		this.productManageDAO = productManageDAO;
	}

}
