package net.trust.webutils.tags;

/**
 * �Զ����ǩ
 * �ñ�ǩ�������ж��û�Ȩ��
 * @author chenqf
 * @date 2006-4-19
 */
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.BodyTagSupport ;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StringUtils;

import net.trust.Def;
import net.trust.application.systemManage.manager.dto.UserInfo;

import com.opensymphony.xwork.ActionContext;

public class AuthorityTag extends BodyTagSupport  {
	private static final long serialVersionUID = 1L;
	private Log log = LogFactory.getLog(AuthorityTag.class);
	private String value;//����Ȩ��ID��,��Ϊ�ַ�������Ϊ��ͨ��
	
	public int doAfterBody() {
		try{
			UserInfo userInfo = (UserInfo)ActionContext.getContext().getSession().get(Def.LOGIN_SESSION_NAME);
			String powers = userInfo.getPowers();//ȡ����ǰ��Աӵ�е�Ȩ���б�
			
			String[] authorities = StringUtils.tokenizeToStringArray(value,",");//�����յ���Ȩ��ID��תΪ����
			
			//��ȡ��ǩ����������
			BodyContent body = getBodyContent(); 
			//����һ��JSP�������
			JspWriter out = body.getEnclosingWriter();
			
			//ѭ���жϵ�ǰ��Ա�Ƿ�ӵ��Ȩ��
			for (int i=0;i<authorities.length;i++){
				if (powers.indexOf((new StringBuffer((char)2).append(authorities[i]).append((char)2)).toString())!=-1){
					out.print(body.getString());//��ҳ�����body�е�����
					break;
				}
			}

		}catch(Exception e){
			System.out.println("User-defined taglib inside error:  "+e.getMessage());
		}
		
		return SKIP_BODY;
	}

	/*
	 * ����ֵ
	 */
	public String getValue() {
		return value;
	}
	/*
	 * ��ȡֵ
	 */
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
