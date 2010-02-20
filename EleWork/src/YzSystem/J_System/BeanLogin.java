package YzSystem.J_System;

import java.io.Serializable;

/**
 * <p>Title:��½��ϢBean </p>
 *
 * <p>Description: ����T_Login�����</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-07  ���ɴ���
 */
public class BeanLogin {

    private String loginSeqn = "";     // ��½���
    private String loginName = "";     // ��½����
    private String passwd = "";        // ��½����
    private String employeCode="";
    private String employeName = "";   // Ա������ 
    private String groupName = "";     // ��ɫ����
    private String groupPowerCode = "";     // ��ɫ����
    private String deptName = "";      // ����
    private String loginTime = "";     // ��½ʱ��
    private String logoutTime = "";    // �ǳ�ʱ��

    public BeanLogin() {
    }

    public void setLoginSeqn(String loginSeqn) {
        this.loginSeqn = loginSeqn;
    }


    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public void setEmployeName(String employeName) {
        this.employeName = employeName;
    }
    
    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public void setLoginTime(String loginTime) {
        this.loginTime = loginTime;
    }

    public void setLogoutTime(String logoutTime) {
        this.logoutTime = logoutTime;
    }

    public String getLoginSeqn() {
        return loginSeqn;
    }

    public String getLoginTime() {
        return loginTime;
    }

    public String getLogoutTime() {
        return logoutTime;
    }

	/**
	 * @param loginName the loginName to set
	 */
    public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	/**
	 * @return the loginName
	 */
    public String getLoginName() {
		return loginName;
	}

	/**
	 * @return the passwd
	 */
    public String getPasswd() {
		return passwd;
	}

	/**
	 * @return the employeName
	 */
    public String getEmployeName() {
		return employeName;
	}

	/**
	 * @return the groupName
	 */
    public String getGroupName() {
		return groupName;
	}

	/**
	 * @return the deptName
	 */
    public String getDeptName() {
		return deptName;
	}

	/**
	 * @param groupPowerCode the groupPowerCode to set
	 */
    public void setGroupPowerCode(String groupPowerCode) {
		this.groupPowerCode = groupPowerCode;
	}

	/**
	 * @return the groupPowerCode
	 */
    public String getGroupPowerCode() {
		return groupPowerCode;
	}

	/**
	 * @param employeCode the employeCode to set
	 */
	public void setEmployeCode(String employeCode) {
		this.employeCode = employeCode;
	}

	/**
	 * @return the employeCode
	 */
	public String getEmployeCode() {
		return employeCode;
	}

}
