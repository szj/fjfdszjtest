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
					<input type="checkbox" name="staffIds" value="<ww:property value="staffId"/>^<ww:property value="staffName"/>"/>
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

	<script>
	    //ȫѡ
		function chk_all(){
			var obj = $(staffIds);
			if (obj != null){
				if (obj.length > 1){
					for (var i=0; i<obj.length; i++){
						obj[i].checked = true;
					}
				}else{
					obj.chekced = true;
				}
			}
		}
	</script>
</body>