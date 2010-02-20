package YzSystem.JMain;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.servlet.http.*;
import javax.sql.*;

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
    PreparedStatement mypstmt = null; // ׼�����
    int rowCount = 0; // ��ǰ��ѯ���������

    /**
     * getCon
     * ���ܣ�ȡ������
     * @return Connection         ����
     */
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

    /**
     * exeUpdate
     * ���ܣ�ִ�и���
     * @param sqlStr String SQL���
     */
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

    /**
     * beginTransaction
     * ���ܣ���ʼ�������
     */
    public void beginTransaction() throws wlglException {
        try {
            myCon.setAutoCommit(false);
        }

        catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "begintransactionʧ��", ex);
        }
    }


    /**
     * commit
     * ���ܣ�ȷ���������
     */
    public void commit() throws wlglException {
        try {
            myCon.commit();
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "commitʧ��", ex);
        }

    }

    /**
     * rollback
     * ���ܣ��ع��������
     */
    public void rollback() throws wlglException {
        try {
            myCon.rollback();
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("208",
                    "rollbackʧ��", ex);
        }

    }

    /**
     * exeQuery
     * ���ܣ�ִ�и���,������
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     */
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


    /**
     * exeUpdate
     * ���ܣ�ִ�и���,������
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     */
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

    /**
     * exeQuery
     * ���ܣ�ִ�в�ѯ
     * @param sqlStr String SQL���
     * @return ResultSet         �����
     */
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

    /**
     * exeQueryOneRow
     * ���ܣ�ִ�и���
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     */
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

    /**
     * exeQueryOneRow
     * ���ܣ�ִ�и���
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     */
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

    /**
     * exeQueryOneRow
     * ���ܣ�ִ�и���,������
     * @param sqlStr String SQL���
     * @param params ArrayList ������������
     */
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

    
    

    /**
     * UtilDB
     * ����: ���Ի�����
     */
    public UtilDB() throws wlglException {
        if (myCon == null) {
            myCon = getCon();
            System.err.println("�µ�utildb");
        }
    }

    public void finalize() throws wlglException {
        //closeCon();
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
               myCon.close();
               myCon=null;
            }
        } catch (SQLException ex) {
            wlglException.ProcessMainWebExceptionMessage("206",
                    "�ر�UtilDB��CloseConʧ��.", ex);
        }

    }

    /**
     * getCount
     * ����:ȡ�ý����¼��
     * @return int
     */
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

    /**
     * getSomeRow
     * ����:ȡ��ָ����Ŀ��������
     * @param beginIndex int
     * @param endIndex int
     * @return ArrayList
     */
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

    /**
     * getRowData
     * //ȡ����������������ʽ����
     * @param anObject ResultSet
     * @return ArrayList
     */
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

    }

}
