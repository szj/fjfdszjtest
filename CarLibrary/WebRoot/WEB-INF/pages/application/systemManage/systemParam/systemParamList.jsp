<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>

<head>
	<script language="javascript">
		function fun_delete(paraType, paraName, paraValue, paraValueMemo){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = "/system/systemparam/systemParam.shtml?actionType=delete&search.paraType="+paraType+
			   													"&search.paraName="+paraName+
			   													"&search.oldParaValue="+paraValue+
			   													"&search.paraValueMemo="+paraValueMemo;
				try{
					var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
					oXMLDom.async = false ;
					oXMLDom.load(url); 
					var root;
					if (oXMLDom.parseError.errorCode != 0) {
						var myErr = oXMLDom.parseError;
						return;
					} else {
						root = oXMLDom.documentElement;
					}
					if (null != root){
						var rowSet = root.selectNodes("//delete");
						if (0 < rowSet.item(0).selectSingleNode("value").text){
							alert("ɾ�������ֵ���Ϣ�������ɹ���");
							parent.document.ifrm_systemParamDetail.window.location.reload();
						}else{
							alert("ɾ�������ֵ���Ϣ������ʧ�ܣ�");
						}
					}
				}catch(e){ 
					alert(e);
				}
			}
		}
		
		Ext.onReady(function(){
			<tt:authority value="TJSJZDXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab("��������ֵ���Ϣ","addSystemParamInfo","/system/systemparam/systemParam.shtml?actionType=new&search.paraType=${param['search.paraType']}&search.paraName=${param['search.paraName']}&paraDesc=${param.paraDesc}&paraTypeDesc=${param.paraTypeDesc}","NO");
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
	</script>
</head>
<body>
	<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
	<div id="addPanel" style="margin:0px;width:100px;"></div>
	
	<tt:grid id="systemParamList" value="systemParamList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="��������" property="PARA_TYPE_DESC" width="150"/>
			<tt:col name="��������" property="PARA_DESC" width="150"/>
			<tt:col name="����ֵ" property="PARA_VALUE" width="150"/>
			<tt:col name="����ֵ˵��" property="PARA_VALUE_DESC" width="150"/>
			<tt:col name="����ֵ��ע" property="PARA_VALUE_MEMO" width="150"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != PARA_TYPE">
					<tt:authority value="XGSJZDXX">
						<a href="javascript:parent.addTab('<ww:property value="PARA_DESC"/>', 'editSystemParamDetail', '/system/systemparam/systemParam.shtml?actionType=edit&search.paraType=<ww:property value="PARA_TYPE"/>&search.paraName=<ww:property value="PARA_NAME"/>&search.paraValue=<ww:property value="PARA_VALUE"/>&search.paraValueMemo=<ww:property value="PARA_VALUE_MEMO"/>', 'NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCSJZDXX">
						<a href="javascript:fun_delete('<ww:property value="PARA_TYPE"/>', '<ww:property value="PARA_NAME"/>', '<ww:property value="PARA_VALUE"/>', '<ww:property value="PARA_VALUE_MEMO"/>')">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid>	
</body>