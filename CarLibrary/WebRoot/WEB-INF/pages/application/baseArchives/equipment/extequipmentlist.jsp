<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	�豸����
 -->
 
<body>
	<tt:grid  id="equipment" width="750" value="equipmentList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="" width="45">
				<ww:if test="null != fixing_id">
					<input type="checkbox" name="fixingId" value="<ww:property value="fixing_id"/>^<ww:property value="fixing_code"/>^<ww:property value="fixing_name"/>^<ww:property value="memo"/>"/>
				</ww:if>
				<ww:else>
					<a href="javascript:chk_all()">ѡ��</a>
				</ww:else>
			</tt:col>
			<tt:col name="�豸���" width="130">
				<ww:if test="null != fixing_id">
					<a href="javascript:parent.addTab('�鿴�豸��Ϣ', 'editEquipment', '/basearchives/equipment/equipment.shtml?actionType=view&search.fixingId=<ww:property value="fixing_id"/>','NO')"><ww:property value="fixing_code"/></a>
				</ww:if>
			</tt:col>
			<tt:col name="�豸����" property="fixing_name" width="130"/>			
			<tt:col name="��ע" property="memo" width="490"/>
		</tt:row>
	</tt:grid> 

	<script>
		function chk_all(){
			var obj = $(fixingId);
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