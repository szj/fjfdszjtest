<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �ɳ����� - �ɳ��ɹ�����ʱҳ�棬ͬʱչʾ���ŷ������
 	 * @author chenqf 
--%>

<head>
	<script language="javascript">	
		<%--ˢ�¿��--%>
		<ww:iterator value="actionScripts">
			//parent.FunListFrm.window.location.reload();
			<ww:property />
		</ww:iterator>
	</script>
</head>
<body>
	<div align="center" style="color:red">
		::<b>��ʾ��Ϣ</b><br>
		<ww:if test="actionMessages==null">
			�����ɹ�!
		</ww:if>
		<ww:else>
			<ww:iterator value="actionMessages">
				<ww:property />
			</ww:iterator>
		</ww:else>
		<br>
		����Ϊ���ŷ����б�
	</div>
	
	<iframe width="100%", height="400" id="sendSmsFrame" name="sendSmsFrame" src="/system/sms/sendSms.shtml?action=ExpSuccess&search.sourceOrderType=<ww:property value="search.sourceOrderType"/>&search.sourceOrderCode=<ww:property value="search.sourceOrderCode"/>" scrolling="no"></iframe>
</body>