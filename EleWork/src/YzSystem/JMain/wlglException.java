package YzSystem.JMain;

import java.io.*;

/**
 * <p>Title:�쳣����</p>
 *
 * <p>Description: �쳣���� </p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-07  ���ɴ���
 */
public class wlglException extends Exception {

    /**
     * ProcessWebExceptionMessage
     * ���ܣ��ӹ�Web�쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * Զ���쳣��aCode��Ϊ7λ:
     * ��1-3λ:WLW(����Web)
     * ��4λ:1���ó���,2������Ϣ,3ϵͳ����,4�ִ�����,5���˹���,6���͹���,7�������
     * ��5-7λ:�û�����
     */
    public static String ProcessWebExceptionMessage(String aCode,
            String myString, Exception E) {
        String yc="";
        String ycxx="";
        if (wlglException.class.isInstance(E)){
            yc="YzSystemException";
            ycxx="myString";
        } else{
            yc=E.toString();
            ycxx=E.getMessage();
        }
        String returnValue = "YzSystem" + aCode +
                             "\n<br>-------------�쳣������ʼ("+myString+")-------------------" +
                             "\n<br>��������:" + myString +
                             "\n<br>�쳣:" + yc +
                             "\n<br>�쳣��Ϣ:" + ycxx
                             ;
        System.err.println(returnValue);
        StringWriter sw = new StringWriter();
        PrintWriter ps = new PrintWriter(sw, true);

        E.printStackTrace(ps);
//                    out.println("<P>" + sw.getBuffer() + "</P>");
        String errorInfo = "\n<br>�쳣��ջ:" + sw.getBuffer()+
                           "\n<br>---------------�쳣��������("+myString+")-----------------\n";
        returnValue+=errorInfo;
        return returnValue;
    }

    /**
     * ProcessMainWebExceptionMessage
     * ���ܣ��ӹ�Web���ó���ģ���쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * �ο�:
     * ProcessWebExceptionMessage;
     * ������Ϣ�б�:
     * WLW1001 UtilWebTools.getRemoteInitialContext | ��ȡԶ��InitContextʧ��.
     * WLW1101 UtilEJB2Local.Init:UtilEJB2Local | ���ñ��س�ʼ����ȡ����Initcontextʧ��.
     * WLW1102 UtilEJB2Local.getEJBBean | ����ejb beanʧ��.
     * WLW1103 UtilEJB2Local.getSessionLogin | ����sessionlogin,����Զ���쳣.
     * WLW1104 UtilEJB2Local.getSessionLogin | ����sessionlogin,���ֽ����쳣.
     * WLW1105 UtilEJB2Local.checkLogin | checklogin,����Զ���쳣.
     * WLW1106 UtilEJB2Local.getChildTrade | getChildTrade,����Զ���쳣.
     * WLW1107 UtilEJB2Local.getUserInfo | getUserInfo,����Զ���쳣.
     * WLW1108 UtilEJB2Local.getSessionCommon | ����sessionCommon,����Զ���쳣.
     * WLW1109 UtilEJB2Local.getSessionCommon | ����sessionCommon,���ֽ����쳣.
     * WLW1110 UtilEJB2Local.getPubSeqn | ȡ���к�,���ֽ����쳣.
     * WLW1201 UtilDB.getCon | ȡ������Ϣ����.
     * WLW1202 UtilDB.getCon | ���������ӳ�ʧ��.
     * WLW1203 UtilDB.exeUpdate | updateSQLʧ��.
     * WLW1204 UtilDB.exeQuery | QuerySQLʧ��.
     * WLW1205 UtilDB.exeUpdate | �ر�����ʧ��.
     * WLW1206 UtilDB.CloseCon | �ر�����ʧ��.
     * WLW1207 UtilDB.getCount | ��ȡ���ݼ�¼��Ŀʧ��
     * WLW1208 UtilDB.execQueryoneRow | ִ�е��з��ؽ��ʧ��
     * WLW1209 UtilDB.execQueryOneRow | ִ�е��з��ؽ��ʧ��
     * WLW1210 UtilDB.getRowData | ȡ������ʧ��
     */
    public static String ProcessMainWebExceptionMessage(String aCode,
            String myString, Exception E) throws wlglException {
        String errInfo = ProcessWebExceptionMessage("1" + aCode, myString, E);
        if (!aCode.equals("")) {
            throw new wlglException(errInfo);
        }
        return errInfo;
    }

    /**
     * ProcessBasicWebExceptionMessage
     * ���ܣ��ӹ�Web��������ģ���쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * �ο�:
     * ProcessWebExceptionMessage;
     * ������Ϣ�б�:
     */
    public static String ProcessBasicWebExceptionMessage(String aCode,
            String myString, Exception E) {
        return ProcessWebExceptionMessage("2" + aCode, myString, E);
    }

    /**
     * ProcessSysWebExceptionMessage
     * ���ܣ��ӹ�Webϵͳ����ģ���쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * �ο�:
     * ProcessWebExceptionMessage;
     * ������Ϣ�б�:
     */
    public static String ProcessSysWebExceptionMessage(String aCode,
            String myString, Exception E) {
        return ProcessWebExceptionMessage("3" + aCode, myString, E);
    }

    /**
     * ProcessStorageWebExceptionMessage
     * ���ܣ��ӹ�Web�ִ�����ģ���쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * �ο�:
     * ProcessWebExceptionMessage;
     * ������Ϣ�б�:
     */
    public static String ProcessStorageWebExceptionMessage(String aCode,
            String myString, Exception E) {
        return ProcessWebExceptionMessage("4" + aCode, myString, E);
    }

    /**
     * ProcessConveryWebExceptionMessage
     * ���ܣ��ӹ�Web���˹���ģ���쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * �ο�:
     * ProcessWebExceptionMessage;
     * ������Ϣ�б�:
     */
    public static String ProcessConveryWebExceptionMessage(String aCode,
            String myString, Exception E) {
        return ProcessWebExceptionMessage("5" + aCode, myString, E);
    }

    /**
     * ProcessAttemperWebExceptionMessage
     * ���ܣ��ӹ�Web���ȹ���ģ���쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * �ο�:
     * ProcessWebExceptionMessage;
     * ������Ϣ�б�:
     */
    public static String ProcessAttemperWebExceptionMessage(String
            aCode,
            String myString, Exception E) {
        return ProcessWebExceptionMessage("6" + aCode, myString, E);
    }

    /**
     * ProcessAccountWebExceptionMessage
     * ���ܣ��ӹ�Web�������ģ���쳣��Ϣ
     * @param aCode String     ������쳣����
     * @param myString String  ������Զ����쳣��Ϣ
     * @param Exception E      �����ϵͳ�쳣
     * �ο�:
     * ProcessWebExceptionMessage;
     * ������Ϣ�б�:
     */
    public static String ProcessAccountWebExceptionMessage(String aCode,
            String myString, Exception E) {
        return ProcessWebExceptionMessage("7" + aCode, myString, E);
    }

    public wlglException() {
    }

    public wlglException(String message) {
        super(message);
    }


    public wlglException(String message, Throwable cause) {
        super(message, cause);
    }


    public wlglException(Throwable cause) {
        super(cause);
    }
}
