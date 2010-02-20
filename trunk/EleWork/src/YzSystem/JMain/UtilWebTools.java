package YzSystem.JMain;

import  YzSystem.J_System.*;
import java.util.*;

import javax.faces.context.*;
import javax.naming.*;
import javax.servlet.http.*;
import javax.faces.el.ValueBinding;
import javax.faces.application.*;
import javax.faces.FactoryFinder;
import javax.servlet.ServletContext;

/**
 * <p>Title:���ع���</p>
 *
 * <p>Description: ��������ع���</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-07  ���ɴ���
 */
public class UtilWebTools {

    private String errorInfo = ""; //������Ϣ


    public static String readInitparam(String aParam) {
        String val = "";
        HttpSession session = getSession();
        return val;
    }
    public static void responseWrite(String str){
        try{
            getResponse().getWriter().write(str);
        }
        catch(Exception e){
             new wlglException("дhtmlҳ����ʧ��!" ,e);
        }
    }
    public static void printrequestparams() {
        HttpServletRequest request=getRequest();
        Enumeration paramnames= request.getParameterNames();
        while(paramnames.hasMoreElements()){
            String paramname=(String)paramnames.nextElement();
            System.out.println("================="+paramname+"=====================");
            String[] paramvalues=request.getParameterValues(paramname) ;
            if (paramvalues.length==1){
                String paramvalue=paramvalues[0];
                if (paramvalue.length()==0)
                    System.out.println("no value");
                else
                    System.out.println(paramvalue);
            }
            else {
                for (int i=0; i<paramvalues.length;i++){
                    System.out.println(paramvalues[i]);

                }
            }
            System.out.println("");
        }
    }

    /**
     * getSession
     * ���ܣ�ȡ������������.
     * @return HttpSession         http�Ự
     */
    public static HttpSession getSession() {
        FacesContext faceContext = FacesContext.getCurrentInstance();
        return ((HttpSession) faceContext.
                getExternalContext().
                getSession(true)
                );
    }

    /**
     * ClearSessionENV
     * ���ܣ�����λ��http����
     * @param tradeseqn String      ����
     * @return Object   ���ص�valueBinding
     */
    public static void ClearSessionENV() {
        HttpSession session = getSession();
        session.removeAttribute("userInfo");
        session.removeAttribute("userFunctions");
    }

    /**
     * checkRight
     * ���ܣ����Ȩ��
     * @param aTrade BeanTradeCode ����
     * @param aRight String        Ҫ�����ɾ�Ĳ�Ȩ��
     * @return boolean             ����Ȩ��
     */
    public static boolean checkRight(BeanSystemGroupPower aGroupPower, String aRight) {
    	
        boolean val = false;
        if (aGroupPower != null) {
            if (UtilCommon.NVL(aRight).equals("")) {
                val = true;
            } else {
                if ((aRight.equals("query")) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).length() >= 1) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).substring(0, 1)).equals(
                            "1")) {
                    val = true;
                }
                if ((aRight.equals("edit")) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).length() >= 2) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).substring(1, 2)).equals(
                            "1")) {
                    val = true;
                }

                if ((aRight.equals("add")) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).length() >= 3) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).substring(2, 3)).equals(
                            "1")) {
                    val = true;
                }
                if ((aRight.equals("del")) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).length() >= 4) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).substring(3, 4)).equals(
                            "1")) {
                    val = true;
                }
                if ((aRight.equals("print")) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).length() >= 5) &&
                    (UtilCommon.NVL(aGroupPower.getPowerValue()).substring(4, 5)).equals(
                            "1")) {
                    val = true;
                }
            }
        }

        return val;
    }

    /**
     * getValueBinding
     * ���ܣ�ȡ��ValueBinding.
     * @param aName String     ����
     * @return Object   ���ص�valueBinding
     */
    public static Object getValueBinding(String aName) {
        Object returnValue = null;
        ApplicationFactory factory = (ApplicationFactory)
                                     FactoryFinder.getFactory(FactoryFinder.
                APPLICATION_FACTORY);
        Application application = factory.getApplication();
        FacesContext facescontext = FacesContext.getCurrentInstance();
        returnValue = application.createValueBinding("#{" + aName + "}").
                      getValue(facescontext);
        return returnValue;
    }

    /**
     * getRequestParameter
     * ���ܣ�ȡ��request��parameter.
     * @param akey String     ������
     * @return String         parameterֵ
     */
    public static String getRequestParameter(String akey) {
        String returnValue=getRequestParameterN(akey);
        if (returnValue == null) {
            returnValue = "";
        }
        return returnValue;
    }
    public static String getRequestParameterN(String akey) {
        String returnValue = null;
        FacesContext faceContext = FacesContext.getCurrentInstance();
        Map requestParameterMap = faceContext.getExternalContext().
                                  getRequestParameterMap();
        if (requestParameterMap != null) {
            returnValue = (String) requestParameterMap.get(akey);
        }
        return returnValue;
    }

    public static String getRequestPath() {
        FacesContext faceContext = FacesContext.getCurrentInstance();
        String aVal=getRequest().getRequestURI();
        aVal=UtilCommon.Replace(".jsp", ".faces",aVal);
        return aVal;
    }
    public static HttpServletRequest getRequest() {
        HttpServletRequest aval=null;
        FacesContext faceContext = FacesContext.getCurrentInstance();
        aval=(HttpServletRequest)faceContext.getExternalContext().getRequest();
        return aval;
    }
    public static HttpServletResponse getResponse() {
        HttpServletResponse aval=null;
        FacesContext faceContext = FacesContext.getCurrentInstance();
        aval=(HttpServletResponse)faceContext.getExternalContext().getResponse();
        return aval;
    }

    public static ServletContext getServletContext() {
        ServletContext aval=null;
        FacesContext faceContext = FacesContext.getCurrentInstance();
        aval=(ServletContext)faceContext.getExternalContext().getContext();
        return aval;
    }


    /**
     * getSessionAttributer
     * ���ܣ�ȡ��session��Attributer.
     * @param akey String     ������
     * @return String         parameterֵ
     */
    public static Object getSessionAtrributerO(String akey) {
        HttpSession session=getSession();
        Object val=session.getAttribute(akey);
        return val;
    }
    public static String getSessionAtrributerS(String akey) {
        HttpSession session=getSession();
        String val=UtilCommon.NVL((String)(session.getAttribute(akey)));
        return val;
    }
    public static int getSessionAtrributerI(String akey) {
        int val;
        HttpSession session=getSession();
        val=Integer.parseInt(UtilCommon.NVL((String)(session.getAttribute(akey))));
        return val;
    }


    /**
     * getTradeName
     * ���ܣ����ݽ���seqnȡ�ý�����Ϣ.
     * @param seqn String     ����seqn
     * @return BeanTradeCode         ������Ϣ
     */
    public static BeanSystemFunctionCode getTradeInfoBySeqn(String seqn) {
    	BeanSystemFunctionCode returnValue = null;
        HttpSession session = getSession();
        ArrayList functions = (ArrayList) session.getAttribute("userFunctions");
        if (seqn.equals("0")) {
            returnValue = new BeanSystemFunctionCode();
            returnValue.setTheCode("0");
            if (functions != null) {
                returnValue.setChildFlag("1");
            } else {
                returnValue.setChildFlag("0");
            }
            returnValue.setChildSystemFunctionCode(functions);
        } else {
            returnValue = getTradeInfoByRoot(functions, seqn);
        }
        return returnValue;
    }

    private static BeanSystemFunctionCode getTradeInfoByRoot(ArrayList trades,
            String seqn) {
    	BeanSystemFunctionCode returnValue = null;
        if ((trades == null) | (seqn == null)) {
            return returnValue;
        }
        Iterator itx = trades.iterator();
        while (itx.hasNext() & (returnValue == null)) {
        	BeanSystemFunctionCode atrade = (BeanSystemFunctionCode) itx.next();
            if (UtilCommon.NVL(atrade.getTheCode()).equals(seqn)) {
                returnValue = atrade;
                return returnValue;
            } else {
                if ((UtilCommon.NVL(atrade.getChildFlag()).equals("1")) &
                    (atrade.getChildSystemFunctionCode() != null)) {
                    returnValue = getTradeInfoByRoot(atrade.getChildSystemFunctionCode(),
                            seqn);
                }
            }
        }

        return returnValue;
    }

    /**
     * getUtilEJB2Local
     * ���ܣ�ȡ��session�е�utilEJB2Local����.
     * @return UtilEJB2Local         session�е�utilEJB2Local����.
     */
    public static UtilEJB2Local getUtilEJB2Local() throws wlglException {
        HttpSession session = getSession();
        UtilEJB2Local utilEJB2Local = (UtilEJB2Local) session.getAttribute(
                "utilEJB2Local");
        if (utilEJB2Local == null) {
            utilEJB2Local = new UtilEJB2Local();
            utilEJB2Local.Init();
            session.setAttribute("utilEJB2Local", utilEJB2Local);
        }
        return utilEJB2Local;
    }

    public UtilWebTools() {
    }

    public void setErrorInfo(String errorInfo) {
        this.errorInfo = errorInfo;
    }

    public String getErrorInfo() {
        return errorInfo;
    }

}
