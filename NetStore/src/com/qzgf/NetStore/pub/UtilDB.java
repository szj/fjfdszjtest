package com.qzgf.NetStore.pub;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.naming.*;

import javax.sql.*;
import javax.sql.rowset.CachedRowSet;

import org.apache.log4j.Logger;

import com.qzgf.NetStore.pub.LogUtil;
import com.sun.rowset.CachedRowSetImpl;

import oracle.jdbc.rowset.OracleCachedRowSet;

/**
 * <p>Title:���ݿ⴦����� </p>
 *
 * <p>Description: ���ݿ�������</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-17  ���ɴ���
 * 
 * @author szj 
 * @version 2.0
 * ˵��:
 * ���ݿ����Ӳ�ͨ��ctx.lookup(DBConPool);��ȡ�����ļ�connection.xml
 */






public class UtilDB {
    Connection myCon = null; // ����
    public ResultSet myRs = null; // �����
    
    Statement mystmt = null; // ���
    
    public Statement stmt=null;
    public Statement stmtTwo=null;//08.08.14
    PreparedStatement mypstmt = null; // ׼�����
    int rowCount = 0; // ��ǰ��ѯ���������

    
    //080710��ΰ��
    private DataSource ds;
	private String strError;
	private Logger log=LogUtil.getLogger(UtilDB.class);
	//080710��ΰ��
	
    /**
     * getCon
     * ���ܣ�ȡ������
     * @return Connection         ����
     */
	
	
	  ///////////////////////�����ӳ����������ݿ�
	  public static synchronized Connection getCon() throws wlglException {
	    	Connection con = null;
	        Context initCtx  = null;
	        Context envCtx =null;
	        DataSource ds = null;
	         
	        //ȡ�����ò���
	       // HttpSession session = UtilWebTools.getSession();
	       // String DBConPool = UtilCommon.NVL((String) (session.getAttribute(
	       //         "DBConPool")));
	        String DBConPool ="jdbc/DBConPool";
	        
	        //��ȡ���ӳ���Ϣ,���쳣����.
	        try {
	        	initCtx  = new InitialContext();
	        	envCtx  = (Context) initCtx.lookup("java:comp/env");
	            ds = (DataSource) envCtx.lookup(DBConPool);
	        } catch (javax.naming.NamingException ex) {
	            wlglException.ProcessMainWebExceptionMessage("201",
	                    "��������Tomcat���ӳ�jndiʧ��,jndi=" + DBConPool + ".", ex);
	        }
	        
	        //ȡ������
	        try {
	            con = ds.getConnection();
	        }

	        catch (java.sql.SQLException ex) {
	            wlglException.ProcessMainWebExceptionMessage("202", "ȡ�������ӳ�ʧ��:", ex);
	        }
	        return con;
	    }

	    ///////////////////////�����ӳ����������ݿ�
	  
	  
	
	  
	  
	
	  //ȡ�ö�����¼����
  @SuppressWarnings("unchecked")
public ResultSet exeQueryRow(String sqlStr) throws  wlglException {
	

 // try {
	 // conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	   ResultSet rs = null;
	  try {
		mystmt = myCon.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
		  myRs = mystmt.executeQuery(sqlStr);
	      rs=myRs;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}


  return  rs;
}
  //ȡ�ö�����¼����	  
	  
	  
	  
	  
	  
	  
	  
	  
	  

    /**
     * UtilDB
     * ����: ���Ի�����
     */
    public UtilDB() throws wlglException {
        if (myCon == null) {
      	           myCon = getCon();
        }
    }

    public void finalize() throws wlglException {
        System.err.println("�ر�utildb");
    }

    /**
     * closeCon
     * ����: �ر�����
     */
    public void closeCon() throws wlglException {
        try {
            if (myRs != null) {
            	
                myRs.close();
                myRs=null;
            }
            if (mystmt != null) {
                mystmt.close();
                mystmt=null;
            }

            if (mypstmt != null) {
                mypstmt.close();
                mypstmt=null;
            }
            if (myCon != null) {
            	if(!myCon.isClosed())
            	{
            		 myCon.close();
                     myCon=null;
            	}
              
            }
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("206",
                    "�ر�UtilDB��CloseConʧ��.", ex);
        }

    }

    
    
    
    public OracleCachedRowSet executeQueryOracle(String sql){
		//log.info(sql);
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		OracleCachedRowSet ocrs=null;
		try {
			con=myCon;//ds.getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			ocrs=new OracleCachedRowSet();
			ocrs.populate(rs);
		}catch (Exception e) {
			strError=e.getMessage();
			System.out.println(strError);
		}finally{
			try {
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
		}
		return ocrs;
	}
	
	/**
	 * ȡ�ò�ѯ���
	 * @param sql
	 * @return CachedRowSet
	 */
	public CachedRowSet executeQuery(String sql){
		//log.info(sql);
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		CachedRowSet crs=null;
		
		try {
			if (myCon.isClosed())
			{
				     try {
						myCon = getCon();
					} catch (wlglException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		try {
			con=myCon;//ds.getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			crs=new CachedRowSetImpl();
			crs.populate(rs);
		}catch (Exception e) {
			strError=e.getMessage();
			System.out.println(strError);
		}finally{
			try {
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
		}
		return crs;
	}
	
	/**
	 * ȡ�ò�ѯ���
	 * @param sql
	 * @return List
	 */
	@SuppressWarnings({ "unchecked", "unchecked" })
	public List executeQuery2List(String sql){
		//log.info(sql);
		List resultlist=setRowSet2List(executeQuery(sql));
		return resultlist;
	}
	
	/**
	 * ȡ�÷�ҳ��ѯ���
	 * mysql���ݿ�ר��
	 * ����ocrs12.jar
	 * @param sql
	 * @param page2
	 * @param pageSize
	 * @return Page
	 */
	public Page executeQueryByPageForMySql(String sql,int pageNo,int pageSize)
	{
		UtilDB utilDB=null;
		try {
			 utilDB=new UtilDB();
		} catch (wlglException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		ResultSet rs=null;
		Page page=new Page(pageNo,pageSize);//��ǰҳ����ÿҳ��������¼
		
		
		///////////����sql��������ܵ�������¼
		StringBuffer countSql=new StringBuffer();
		countSql.append("select count(*) as recordcount from ( ");
		countSql.append(sql);
		countSql.append(" ) T ");

		try {
			rs=utilDB.executeQuery(countSql.toString());
			while(rs.next()){
				page.setTotalRecords(rs.getInt("recordcount"));
				break;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        ///////////����sql��������ܵ�������¼0,4; 4,4; 8,4   pageNo*4
		
		StringBuffer searchSql=new StringBuffer();
		searchSql.append(sql+" limit "+((pageNo-1)*pageSize)+","+pageSize);
		

		rs=utilDB.executeQuery(searchSql.toString());
		
		page.setResultList(setRowSet2List(rs));
		
		page.setRowset(rs);
		
		page.initOtherData();
		
		
		
		
		try {
			utilDB.closeCon();
		} catch (wlglException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return page;
	}
	
	
	
	
	
	
	public Page executeQueryByPageForOracle(String sql,int pageNo,int pageSize){
		//log.info(sql);
		Connection con=null;
		//Statement stmt=null;
		ResultSet rs=null;
		OracleCachedRowSet ocrs=null;
		Page page=new Page(pageNo,pageSize);
		//��ѯ�ܼ�¼����sql���
		StringBuffer countSql=new StringBuffer();
		countSql.append("select count(*) as recordcount from ( ");
		countSql.append(sql);
		countSql.append(" )");
		//����pageNo��pageSizeȷ������rownum��Χ
		//int rownum_start=(pageNo-1)*pageSize+1;
		//int rownum_end=pageNo*pageSize;
		//����rownum_start��rownum_end��ü�¼��sql���
		StringBuffer searchSql=new StringBuffer();
		
		searchSql.append("select * from testtable ");
		
		
		
		//searchSql.append("select * from ( ");
		//searchSql.append("select A.* , rownum rn from ( ");
		//searchSql.append(sql+" ) A ");
		//searchSql.append("where rownum <= "+rownum_end+") B ");
		//searchSql.append("where rn >= "+rownum_start);
		
		/*
		 * sql��������ڣ�
		SELECT * FROM
	     (
	     SELECT A.*, rownum r  FROM
	          (
	          SELECT * FROM tableName Order By field (field�ֶα������Ψһ��,��û�п������һ������Ψһ�Ե��ֶ�)
	          ) A
	     WHERE rownum <= 10
	     ) B
	     WHERE r > 0
	     */
		try {
			log.info("��ѯ��¼��䣺"+searchSql.toString());
			System.out.println(searchSql.toString());
			
			rs=stmt.executeQuery(searchSql.toString());
			ocrs=new OracleCachedRowSet();
			ocrs.populate(rs);
			
			page.setRowset(ocrs);
			page.setResultList(setRowSet2List(ocrs));
			ocrs.beforeFirst();
			page.initOtherData();
		}catch (Exception e) {
			strError=e.getMessage();
			System.out.println(strError);
		}finally{
			try {
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
		}
		return page;
	}
	
	/**
	 * ִ�и��£�ɾ������
	 * @param sql
	 * @return
	 */
	public boolean executeUpdate(String sql){
		log.info(sql);
		Connection con=null;
		Statement stmt=null;
		try {
			con=myCon;//ds.getConnection();
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
			return true;
		} catch (Exception e) {
			strError=e.getMessage();
			System.out.println(strError);
		}finally{
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
		}
		return false;
	}
	
	/**
	 * ʹ�����������sql���
	 * @param sql
	 * @return
	 */
	public boolean executeUpdate(String[] sql){
		for (int i = 0; i < sql.length; i++) {
			log.info(sql[i]);
		}
		
		Connection con=null;
		Statement stmt=null;
		try {
			con=myCon;//ds.getConnection();
			con.setAutoCommit(false);
			stmt=con.createStatement();
			for (int i = 0; i < sql.length; i++) {
				stmt.executeUpdate(sql[i]);
			}
			con.commit();
			return true;
		} catch (Exception e) {
			try {
				if(con!=null)
					con.rollback();
			} catch (SQLException e1) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			strError=e.getMessage();
			System.out.println(strError);
		}finally{
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
		}
		return false;
	}
	
	/**
	 * ʹ�����������sql���
	 * @param sql
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean executeUpdate(List sql){		Statement stmt1=null;
		Connection conn1=null;
		Statement stmtTwo2=null; 

			 try{ 
	        	 Class.forName("com.mysql.jdbc.Driver").newInstance();
	        	 String url1 ="jdbc:mysql://localhost/netstore?user=root&password=123@123&useUnicode=true&characterEncoding=gbk";
	        	 conn1= DriverManager.getConnection(url1);
	        	 stmt1=conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	        	 stmtTwo2=conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			
			
			conn1.setAutoCommit(false);
			stmt1=conn1.createStatement();
			
			for (int i = 0; i < sql.size(); i++) {
				log.info(sql.get(i).toString());
				stmt1.executeUpdate(sql.get(i).toString());
			}
			conn1.commit();
			return true;
		} catch (Exception e) {
			try {
				if(conn1!=null)
					conn1.rollback();
			} catch (SQLException e1) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			strError=e.getMessage();
			System.out.println(strError);
		}finally{
			try {
				if(stmt1!=null)
					stmt1.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(conn1!=null)
					conn1.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
		}
		return false;
	}
	
	
	/**
	 * ���������һ��������Ϣ
	 * @return
	 */
	public String getLastError(){
		return strError;
	}
	
	/**
	 * ��rowset�����ݱ���ΪList
	 * @param rs
	 * @return List
	 */
	@SuppressWarnings("unchecked")
	public  List setRowSet2List(ResultSet rs){
		List resultlist = new ArrayList();
		List columnNames=new ArrayList();
		try {
			ResultSetMetaData rsmd=rs.getMetaData();
			//�����������
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				columnNames.add(rsmd.getColumnName(i));
			}
			//�������ҳ�����������
			while(rs.next()){
				Map map=new HashMap();
				//���������ֶ�
				for (int i = 0; i < columnNames.size(); i++) {
					map.put(columnNames.get(i), rs.getObject(i+1));
				}
				resultlist.add(map);
			}
			rs.beforeFirst();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultlist;
	}
	
	/**
	 *  ���ô洢����
	 * @param sql
	 * @param parameters �����洢�����е����в���
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map executeProcess(String sql,ProcessParameters parameters){
		Connection con=null;
		CallableStatement cs=null;
		Map result=null;
		try {
			con=myCon;//ds.getConnection();
			cs= con.prepareCall(sql);
			result=parameters.getResult(cs);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(cs!=null)
					cs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public List getAll(String sql){
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		CachedRowSet crs=null;
		List resultlist = new ArrayList();
		List columnNames=new ArrayList();
		try {
			con=myCon;//ds.getConnection();
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			crs=new CachedRowSetImpl();
			crs.populate(rs);
			ResultSetMetaData rsmd=crs.getMetaData();
			for (int i = 1; i <= rsmd.getColumnCount(); i++) {
				columnNames.add(rsmd.getColumnName(i));
			}
			while(crs.next()){
				Map map=new HashMap();
				for (int i = 0; i < columnNames.size(); i++) {
					map.put(columnNames.get(i), crs.getObject(i+1));
				}
				resultlist.add(map);
			}
			return resultlist;
		}catch (Exception e) {
			strError=e.getMessage();
			System.out.println(strError);
		}finally{
			try {
				if(rs!=null)
					rs.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(stmt!=null)
					stmt.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
			try {
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				strError=e.getMessage();
				System.out.println(strError);
			}
		}
		return null;
	}
	
	  
    
    
    
    
    
    
    
    
    
    
    /**
     * exeUpdate
     * ���ܣ�ִ�и���
     * @param sqlStr String SQL���
     *//*
    public void exeUpdate(String sqlStr) throws wlglException {
        if (UtilCommon.NVL(sqlStr).equals("")) {
            return;
        }

        try {
            mystmt = myCon.createStatement();
            mystmt.executeUpdate(sqlStr);
            //mystmt.close();
        } catch (SQLException ex) {
            rollback();
            wlglException.ProcessMainWebExceptionMessage("203",
                    "update SQLʧ��:SQLStr:" + sqlStr, ex);
        }

        System.out.println("SQLStr��:" + sqlStr);

    }

    *//**
     * beginTransaction
     * ���ܣ���ʼ�������
     *//*
    public void beginTransaction() throws wlglException {
        try {
            myCon.setAutoCommit(false);
        }

        catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "begintransactionʧ��", ex);
        }
    }


    *//**
     * commit
     * ���ܣ�ȷ���������
     *//*
    public void commit() throws wlglException {
        try {
            myCon.commit();
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "commitʧ��", ex);
        }

    }

    *//**
     * rollback
     * ���ܣ��ع��������
     *//*
    public void rollback() throws wlglException {
        try {
            myCon.rollback();
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "rollbackʧ��", ex);
        }

    }

    *//**
     * exeQuery
     * ���ܣ�ִ�и���,������
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     *//*
    public ResultSet exeQuery(String sqlStr, ArrayList params) throws
            wlglException {
        return (exeQuery(sqlStr, params, java.sql.ResultSet.CONCUR_READ_ONLY));
    }

    public ResultSet exeQuery(String sqlStr, ArrayList params,
                              int resultSetConcurrency) throws
            wlglException {

        try {
            mypstmt = myCon.prepareStatement(sqlStr,
                                             java.sql.ResultSet.
                                             TYPE_SCROLL_INSENSITIVE,
                                             resultSetConcurrency);
            Iterator itx = params.iterator();
            int i = 1;
            while (itx.hasNext()) {
                Object param = itx.next();
                if (param != null) {
                    if (Integer.class.isInstance(param)) {
                        mypstmt.setInt(i, ((Integer) param).intValue());
                    }
                    else if (String.class.isInstance(param)) {
                        mypstmt.setString(i, ((String) param));
                    }
                    else if (Double.class.isInstance(param)) {
                        mypstmt.setDouble(i, ((Double) param).doubleValue());
                    }
                    else if (Boolean.class.isInstance(param)) {
                        mypstmt.setBoolean(i, ((Boolean) param).booleanValue());
                    }
                } else {
                    mypstmt.setString(i, "");
                }
                i = i + 1;
            }
            myRs = mypstmt.executeQuery();
        }

        catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("204",
                    "execute SQLʧ��:SQLStr:" + sqlStr + "\nParams:" + params +
                    ".", ex);
        }
        getCount();
        System.out.println("SQLStr��:" + sqlStr);
        System.out.println("params��:" + params);
        return myRs;
    }


    *//**
     * exeUpdate
     * ���ܣ�ִ�и���,������
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     *//*
    public void exeUpdate(String sqlStr, ArrayList params) throws
            wlglException {

        try {
            mypstmt = myCon.prepareStatement(sqlStr);
            Iterator itx = params.iterator();
            int i = 1;
            while (itx.hasNext()) {
                Object param = itx.next();
                if (Integer.class.isInstance(param)) {
                    mypstmt.setInt(i, ((Integer) param).intValue());
                } else if (String.class.isInstance(param)) {
                    mypstmt.setString(i, ((String) param));
                } else if (Double.class.isInstance(param)) {
                    mypstmt.setDouble(i, ((Double) param).doubleValue());
                    
                } else if (Boolean.class.isInstance(param)) {
                    mypstmt.setBoolean(i, ((Boolean) param).booleanValue());
                }
                else {
                    mypstmt.setString(i, ((String) param));
                }

                i = i + 1;
            }
            mypstmt.executeUpdate();
            //mypstmt.close();
        } catch (SQLException ex) {
            rollback();
            wlglException.ProcessMainWebExceptionMessage("204",
                    "update SQLʧ��:SQLStr:" + sqlStr + "\nParams:" + params +
                    ".", ex);
        }
        System.out.println("SQLStr��:" + sqlStr);
        System.out.println("params��:" + params);

    }

    *//**
     * exeQuery
     * ���ܣ�ִ�в�ѯ
     * @param sqlStr String SQL���
     * @return ResultSet         �����
     *//*
    public ResultSet exeQuery(String sqlStr) throws wlglException {

        try {
            mystmt = myCon.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                                           ResultSet.CONCUR_UPDATABLE);
            myRs = mystmt.executeQuery(sqlStr);
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("204",
                    "execute SQLʧ��:SQLStr:" + sqlStr, ex);
        }
        System.out.println("SQLStr��:" + sqlStr);
        getCount();
        return myRs;

    }

    *//**
     * exeQueryOneRow
     * ���ܣ�ִ�и���
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     *//*
    public String exeQueryValue(String sqlStr) throws
            wlglException {

        ArrayList al = exeQueryOneRow(sqlStr);
        String val = "";
        if (al.size() > 0) {
            val = (String) al.get(0);
        }
        return val;
    }

    public String exeQueryValue(String sqlStr, ArrayList params) throws
            wlglException {

        ArrayList al = exeQueryOneRow(sqlStr, params);
        String val = "";
        if (al.size() > 0) {
            val = (String) al.get(0);
        }
        return val;
    }

    *//**
     * exeQueryOneRow
     * ���ܣ�ִ�и���
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     *//*
    public ArrayList exeQueryOneRow(String sqlStr) throws
            wlglException {
        ArrayList myArray = new ArrayList();

        try {
            mystmt = myCon.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
                                           ResultSet.CONCUR_READ_ONLY);
            myRs = mystmt.executeQuery(sqlStr);
            ResultSetMetaData md = myRs.getMetaData();
            if (myRs.next()) {
                for (int i = 1; i <= md.getColumnCount(); i++) {
                    myArray.add(myRs.getString(i));
                }
            }
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "ִ�е��з��ؽ��SQLʧ��:SQLStr:" + sqlStr + '.', ex);
        }
        System.out.println("SQLStr��:" + sqlStr);

        return myArray;
    }

    *//**
     * exeQueryOneRow
     * ���ܣ�ִ�и���,������
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     *//*
    public ArrayList exeQueryOneRow(String sqlStr, ArrayList params) throws
            wlglException {

        ArrayList myArray = new ArrayList();
        ArrayList mytitle = new ArrayList();
        exeQueryOneRowTitlesAndDatas(sqlStr, params, mytitle, myArray);
        return myArray;
    }

    public boolean next() throws wlglException {
        boolean s = false;
        try {

            if (myRs != null) {
                return (myRs.next());
            }
        } catch (Exception ex) {
            throw new wlglException("��ȡ������¼ʧ��", ex);
        }
        return s;

    }

    public void exeQueryOneRowTitlesAndDatas(String sqlStr, ArrayList params,
                                             ArrayList titles, ArrayList datas) throws
            wlglException {

        try {
            mypstmt = myCon.prepareStatement(sqlStr);
            Iterator itx = params.iterator();
            int i = 1;
            while (itx.hasNext()) {
                Object param = itx.next();
                if (Integer.class.isInstance(param)) {
                    mypstmt.setInt(i, ((Integer) param).intValue());
                }
                else if (String.class.isInstance(param)) {
                    mypstmt.setString(i, ((String) param));
                }
                else if (Double.class.isInstance(param)) {
                    mypstmt.setDouble(i, ((Double) param).doubleValue());
                }
                else if (Boolean.class.isInstance(param)) {
                    mypstmt.setBoolean(i, ((Boolean) param).booleanValue());
                }
                i = i + 1;
            }
            myRs = mypstmt.executeQuery();
            ResultSetMetaData md = myRs.getMetaData();
            boolean hasNext = false;
            if (myRs.next()) {
                hasNext = true;
            } else {
                hasNext = false;
            }
            for (i = 1; i <= md.getColumnCount(); i++) {
                if (hasNext) {
                	//��ʱ���Ӵ�����������Ϊbit���͵�.0,1
                	//Date�� 2008-6-15
                	//author: szj
                	int tmp=md.getColumnType(i);
                	
                	if(tmp==java.sql.Types.BIT)
                	{
                		if(myRs.getByte(i)==1)
                			datas.add("1");	
                		else
                		    datas.add("0");
                	}
                	else
                	{
                		datas.add(myRs.getString(i));
                	}
                    titles.add(md.getColumnName(i));
                } else {
                    datas.add("");
                }
            }
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "ִ�е��з��ؽ��SQLʧ��:SQLStr:" + sqlStr + "\nParams:" + params +
                    ".", ex);
        }
        System.err.println("SQLStr��:" + sqlStr);
        System.err.println("params��:" + params);
    }
    public String getString(int i) throws wlglException {
        String s="";
        try {

            if (myRs != null) {
                return ( UtilCommon.NVL(myRs.getString(i)));
            }
        } catch (Exception ex) {
            throw new wlglException("��ȡ���ݼ��ֶ�ʧ�ܣ��ֶ�����" + i + ".", ex);
        }
        return s;

    }

    
    

   
    *//**
     * getCount
     * ����:ȡ�ý����¼��
     * @return int
     *//*
    private int getCount() throws wlglException {
        int count = 0;
        try {
            myRs.last();
            rowCount = myRs.getRow();
            myRs.beforeFirst();
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("207",
                    "��ȡ��¼��Ŀʧ��.", ex);
        }
        count = rowCount;
        return count;
    }

    *//**
     * getSomeRow
     * ����:ȡ��ָ����Ŀ��������
     * @param beginIndex int
     * @param endIndex int
     * @return ArrayList
     *//*
    public ArrayList getSomeRow(int beginIndex, int endIndex) throws
            wlglException {
        ArrayList myArray = new ArrayList();
        if (beginIndex > rowCount) {
            return myArray;
        }
        try {
            myRs.absolute(beginIndex);
            for (int row = beginIndex; row <= endIndex; row++) {
                myArray.add(getRowData(myRs));
                if (!myRs.next()) {
                    break;
                }
            }
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("209",
                    "ȡ��������ʧ��.", ex);
        }
        return myArray;
    }

    *//**
     * getRowData
     * //ȡ����������������ʽ����
     * @param anObject ResultSet
     * @return ArrayList
     *//*
    public ArrayList getRowData(ResultSet rs) throws wlglException {
        ArrayList myArray = new ArrayList();

        ResultSetMetaData md = null;
        try {
            md = rs.getMetaData();
            for (int i = 1; i <= md.getColumnCount(); i++) {
                myArray.add(rs.getString(i));
            }
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("210",
                    "ȡ������ʧ��.", ex);
        }
        return myArray;

    }*/

}
