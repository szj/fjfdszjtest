<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	����Ա��Ϣ
 -->
<body>
	<tt:grid  id="userInfo" width="750" value="userList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="" width="45">
				<ww:if test="null != staffId">
					<input type="radio" name="rdstaffId" onclick="setValue('<ww:property value="staffId"/>', '<ww:property value="staffName"/>')"/>
				</ww:if>
				<ww:else>
					<a href="javascript:chk_all()">ѡ��</a>
				</ww:else>
			</tt:col>
			<tt:col name="����" property="staffNo" width="130"/>
			<tt:col name="�û���" property="staffName" width="100"/>
			<tt:col name="��ϵ�绰" property="phone" width="100"/>
			<tt:col name="��������" property="cityName" width="100"/>
		</tt:row>
	</tt:grid> 
	<input type="hidden" name="staffId" value="">
	<input type="hidden" name="staffName" value="">
	
	<script>
		function setValue(staffId,staffName){
			document.all.staffId.value = staffId;
			document.all.staffName.value = staffName;
		}
	</script>
</body>