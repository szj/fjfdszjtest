package YzSystem.JMain;

import YzSystem.J_System.*;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import javax.naming.*;
import java.util.*;
import java.util.Collection;
import java.sql.SQLException;

/**
 * <p>Title:EJBϵͳ����ͻ��˽ӿں���</p>
 *
 * <p>Description: �ṩԶ��ϵͳ����ͻ��˽ӿ�</p>
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
 * ˵��:��ʹ��EJB
 * 2008-05-24
 */

public class UtilEJB2Local {
    Context ctx; // �����ռ�������
    HttpSession session; // http�Ự
    private String errorInfo = ""; // �쳣��Ϣ
    /**
     * Init
     * ���ܣ���ʼ��session,ctx,�м�ֻ��ʹ��һ��.
     */
    public void Init() throws wlglException {
        errorInfo = "";
        session = UtilWebTools.getSession();
            try {
                ctx = new InitialContext();
            } catch (NamingException ex) {
                errorInfo = wlglException.ProcessMainWebExceptionMessage("101",
                        "UtilEJB2Local ���ñ��س�ʼ����ȡ����Initcontextʧ��.",
                        ex);
            }
    }

    /**
     * checkLogin
     * ���ܣ���½��֤.
     * @param  userID String   �û�id
     * @param  pwd String      ����
     * @return boolean         True�ɹ�
     */
    public boolean checkLogin(String userID, String pwd) throws wlglException {
        UtilDB utilDB= new UtilDB();
        ArrayList al=new ArrayList();
        al.add(userID);
        System.err.println("======================================="
                   +"��ʼexequeryonerow");
        ArrayList ow=utilDB.exeQueryOneRow("select passwd from tssystemgroupuser where theCode=?",al);
        System.err.println("======================================="
                   +"exequeryonerow�ɹ�");

        System.err.println("=====checkloginʱ:myrsֵΪ:"+utilDB.myRs);
        if (ow.size()!=0) {
            if (pwd.equals(ow.get(0))) {
                return true;
            }
        }
        utilDB.closeCon();
        return false;
    }

    /**
     * getChildTrade
     * ���ܣ�ȡ���ӽ���
     * @param userSeqn String          �û�Seqn
     * @param UpperTradeSeqn String    ������Seqn
     * @return Collection              ������Ϣ��¼��
     */
    public Collection getChildFunction(String powercode, String parenteqn) throws
            wlglException {
        errorInfo = "";
        Collection returnValue = new ArrayList();
        UtilDB utildb=new UtilDB();
        ArrayList params= new ArrayList();
        params.add(powercode);
        params.add(parenteqn);
        utildb.exeQuery("select a.TheCode,a.TheShortCode,a.TheName,a.ParentCode,a.childflag,a.refpage,a.img"
                +" from tsSystemFunction a,tsSystemGroupPower b"
                +" where b.FunCode=a.TheCode and b.FunisShow=1"
                +" and b.TheCode=? and a.ParentCode=? order by a.TheCode ", params);
        try{
            while (utildb.myRs.next()){
                BeanSystemFunctionCode btc=new BeanSystemFunctionCode();
                btc.setTheCode(utildb.myRs.getString(1));
                btc.setTheShortCode(utildb.myRs.getString(2));
                btc.setTheName(utildb.myRs.getString(3));
                btc.setParentCode(utildb.myRs.getString(4));
                btc.setChildFlag(utildb.myRs.getString(5));
                btc.setRefPage(utildb.myRs.getString(6));
                btc.setImg(utildb.myRs.getString(7));
                returnValue.add(btc);
        }
       } catch (SQLException ex) {
          wlglException.ProcessMainWebExceptionMessage("105",
                "", ex);
      }finally
      {
    	  utildb.closeCon();
      }

      return returnValue;
    }

    /**
     * getUserInfo
     * ���ܣ�ȡ���û���Ϣ
     * @param userID String            �û�ID
     * @param UpperTradeSeqn String    ������Seqn
     * @return Collection              �û���Ϣ��¼��
     */
    public BeanLogin getUserInfo(String userID) throws wlglException {
        errorInfo = "";
        BeanLogin returnValue = null;
        UtilDB utilDB= new UtilDB();
        ArrayList al=new ArrayList();
        al.add(userID);
        ArrayList rs=utilDB.exeQueryOneRow(
        		"select a.TheCode loginSeqn,a.passwd passwd,a.TheName loginName,b.TheName employeName, " +
        		"d.TheName DeptName,c.TheName GroupName,c.TheCode GroupPowerCode,b.TheCode employeCode " +
        		" from tsSystemGroupUser a,tbDatumemployee b,tsSystemGroup c," +
        		"tbDatumDepartment d where a.employeCode=b.TheCode and a.GroupCode=c.TheCode and " +
        		"b.DepCode=d.TheCode and a.TheCode=?",al );
        if  (rs!=null){
            returnValue=new BeanLogin();
            returnValue.setLoginSeqn((String)rs.get(0));
            returnValue.setPasswd((String)rs.get(1));
            returnValue.setLoginName((String)rs.get(2));
            returnValue.setEmployeName((String)rs.get(3));
            returnValue.setDeptName((String)rs.get(4));
            returnValue.setGroupName((String)rs.get(5));
            returnValue.setGroupPowerCode((String)rs.get(6));
            returnValue.setEmployeCode((String)rs.get(7));
            returnValue.setLoginTime(UtilCommon.getTime());
        }
        utilDB.closeCon();
        return returnValue;
    }
    /**
     * getUserInfo
     * ���ܣ�ȡ���û�Ȩ����Ϣ
     * @param userID String            �û�ID
     * @param UpperTradeSeqn String    ������Seqn
     * @return Collection              �û���Ϣ��¼��
     */
    
    public BeanSystemGroupPower getGroupPower(String powercode,String funcode) throws wlglException{
        errorInfo = "";
        BeanSystemGroupPower returnValue = null;
        UtilDB utilDB= new UtilDB();
        ArrayList al=new ArrayList();
        al.add(powercode);
        al.add(funcode);
        ArrayList rs=utilDB.exeQueryOneRow(
        		"select a.TheCode TheCode,a.Remark,a.FunCode,a.FunIsShow,a.PowerValue " +
        		" from tsSystemgrouppower a where " +
        		"  a.TheCode=? and a.Funcode=?",al );
        if  (rs!=null){
            returnValue=new BeanSystemGroupPower();
            returnValue.setTheCode((String)rs.get(0));
            returnValue.setRemark((String)rs.get(1));
            returnValue.setFunCode((String)rs.get(2));
            returnValue.setFunIsShow(rs.get(3).toString());
            returnValue.setPowerValue((String)rs.get(4));
        }
        utilDB.closeCon();
        return returnValue;
    }

    public UtilEJB2Local() {
    }

    public void setErrorInfo(String ErrorIno) {
        this.errorInfo = ErrorIno;
    }

    public String getErrorInfo() {
        return errorInfo;
    }


}
