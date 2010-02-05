package com.qzgf.utils;

import javax.sql.DataSource;
import java.sql.*;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * ���ݿ⹤��
 * @author lsr
 * @date 20081102
 *
 */
public final class SqlServerDBUtil {
	private static final Log log = LogFactory.getLog(SqlServerDBUtil.class);
	
	/**
     * ��ȡϵͳ������Դ
     *
     * @return DataSource
     */
    public static DataSource getDataSource() {
        DataSource dataSource = null;
        try {
            dataSource = (DataSource) ContextHelper.getContext().getBean("sqlServerDataSource");
        } catch (Exception e) {
            log.error("��ȡ����Դ��������Spring����Դ���ã�");
        }
        return dataSource;
    }

    /**
     * ��ȡ���ݿ�����
     *
     * @return Connection
     */
    public static Connection makeConnection() {
        Connection conn = null;
        try {
            conn = getDataSource().getConnection();
        } catch (SQLException e) {
            log.error("ͨ������Դ��ȡ���ݿ����ӷ����쳣��");
            e.printStackTrace();
        }
        return conn;
    }

    /**
     * ִ��û�в�����SQL����
     *
     * @param procedureName �洢��������
     * @return boolean      ���ش洢����ִ�еĽ��,true��ʾִ�гɹ�,false��ʾִ��ʧ��.
     */
    public static boolean executeBSDProcedure(String procedureName) {
        boolean flag = false;
        String sqlStr = "{call " + procedureName + "()}";
        CallableStatement cs;
        Connection conn = makeConnection();
        try {
            cs = (CallableStatement) conn.prepareStatement(sqlStr);
            cs.executeUpdate(sqlStr);
            flag = true;
        } catch (SQLException e) {
            log.error("���ô洢����" + sqlStr + "ʧ�ܣ�");
            e.printStackTrace();
        }
        return flag;
    }
}
