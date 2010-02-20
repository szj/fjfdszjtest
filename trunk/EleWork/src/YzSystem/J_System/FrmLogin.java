package YzSystem.J_System;

import YzSystem.JMain.*;

import java.util.*;
import javax.faces.context.*;
import javax.naming.*;
import javax.servlet.http.*;

/**
 * <p>Title:login.jsp���崦����� </p>
 *
 * <p>Description: ����login.jsp������</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-07  ���ɴ���
 * 
 * @author szj
 * @version 2.0
 * ˵��:�޸������ʹ֧��Tomcat,���÷���EJB.
 * 2008-5-23
 */

public class FrmLogin {
    private String userID; // �û�ID
    private String pwd; // ����
    private String hint; // ��ʾ
    FacesContext faceContext;
    Hashtable menu;
    Context ctx;
    UtilEJB2Local utilEJB2Local;

    /**
     * doLogin
     * ���ܣ���½��֤.
     * @return boolean         ""succ"�ɹ�,"fail"ʧ��.
     */
    public String doLogin() throws Exception {
        String returnValue = "fail";
        hint = "";
        if (UtilWebTools.getUtilEJB2Local().checkLogin(userID, pwd)) {
            UtilWebTools.ClearSessionENV();
            setLoginInfo(userID);
            returnValue = "succ";
            /*
            BeanLogin userinfo = ((BeanLogin) session.getAttribute(
                   "userInfo"));
                   */
            BeanLogin userinfo = ((BeanLogin) UtilWebTools.getSession().
            		getAttribute("userInfo"));
            getFunctions(userinfo.getGroupPowerCode());
        } else {
            if (UtilWebTools.getUtilEJB2Local().getErrorInfo().equals("")) {
                hint = new String("��½ʧ�ܣ������˺Ż���������");
            } else {
                hint = UtilWebTools.getUtilEJB2Local().getErrorInfo();
            }
        }
        if (!hint.equals("")) {
            returnValue = "fail";
        }
        return returnValue;
    }


    /**
     * setLoginInfo
     * ���ܣ������û�ID�����û���½��Ϣ��session.
     * @param userID String    �û�ID
     */
    public void setLoginInfo(String userID) throws wlglException {
        BeanLogin groupuser = UtilWebTools.getUtilEJB2Local().getUserInfo(
                userID);
        UtilWebTools.getSession().setAttribute("userInfo", groupuser);
        
    }
    
    /**
     * getTrades
     * ���ܣ������û�seqnȡ���û�������Ϣ�б�ŵ�session.
     * @param userSeqn String    �û�seqn
     * @return ArrayList       ���ױ�
     */
    private ArrayList getFunctions(String powercode) throws wlglException {
        ArrayList returnValue;
        returnValue = (ArrayList) UtilWebTools.getSession().getAttribute("userFunctions");
        if (returnValue == null) {
            returnValue = getChildFunctions(powercode, "0");
            UtilWebTools.getSession().setAttribute("userFunctions", returnValue);
        }
        return returnValue;
    }

    /**
     * getChildTrades
     * ���ܣ������û�ID,upperseqnȡ���û�������Ϣ�б�.�������޲��ȡ��.
     * @param usersSeqn String    �û�Seqn
     * @param upperSeqn String    �ϼ�����Seqn
     * @return ArrayList          ���ױ�
     */
    private ArrayList getChildFunctions(String powercode, String upperSeqn) throws
            wlglException {
        ArrayList returnValue = null;
        if ((upperSeqn == null) | (powercode == null)) {
            return returnValue;
        }
        returnValue = (ArrayList) UtilWebTools.getUtilEJB2Local().
                      getChildFunction(powercode, upperSeqn);
        Iterator itx = returnValue.iterator();
        while (itx.hasNext()) {
            BeanSystemFunctionCode aFunction = (BeanSystemFunctionCode) itx.next();
            if (aFunction.getChildFlag().equals("1")) {
                ArrayList childtrades = getChildFunctions(
                		powercode, aFunction.getTheCode());
                aFunction.setChildSystemFunctionCode(childtrades);
            }
        }
        return returnValue;

    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setUserID(String UserID) {
        this.userID = UserID;
    }

    public void setHint(String hint) {
        this.hint = hint;
    }

    public String getPwd() {
        return pwd;
    }

    public String getUserID() {
        return userID;
    }

    public String getHint() {
        return hint;
    }

    public FrmLogin() throws wlglException {
        utilEJB2Local = UtilWebTools.getUtilEJB2Local();
    }
	

}
