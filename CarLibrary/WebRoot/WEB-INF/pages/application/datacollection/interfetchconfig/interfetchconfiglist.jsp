<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!--
	������Ϣ���� 
 -->
<ww:action name="'select'" id="select"></ww:action>
<head>
<style type="text/css">
    .x-panel-body p {
        margin:10px;
    }
    #container {
        padding:10px;
    }
    </style>
    <script language="javascript">
		function showSearch(){
		 fetchModeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'INTER_FETCH_CONFIG' and para_name = 'FETCH_MODE'\""/>
				<ww:iterator value="#select.selectList" status="fetchModeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#fetchModeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var fetchMode = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: fetchModeData
				}),
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.fetchMode',
				fieldLabel: '�ɼ���ʽ',
				name: 'test',
				width:300
			})	
												
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/datacollection/interFatchConfig.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [fetchMode,{
			            fieldLabel: '��������',
			            name: 'search.interFetchConfigName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        }],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '����GPS�ӿ����ݲɼ���������',
			        width: 300,
			        height:150,
			        minWidth: 300,
			        minHeight: 200,
			        layout: 'fit',
			        plain:true,
			        bodyStyle:'padding:5px;',
			        buttonAlign:'center',
			        items: schForm
			    });
			
			    window.show();
			});
		}
		Ext.onReady(function(){
			new Ext.Button({
		        text: '�� ѯ',
		        handler: showSearch
		    }).render(document.all.searchPanel);
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���GPS�ӿ����ݲɼ���������','addCarInfo','/datacollection/interFatchConfig.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		})
		
		function fun_delete(interFetchConfigId){
			if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
				var url = '/datacollection/interFatchConfig.shtml?actionType=delete&search.interFetchConfigId='+interFetchConfigId;
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
							alert("ɾ��GPS�ӿ����ݲɼ��������ã������ɹ���");
							parent.document.ifrm_InterFetchConfig.window.location.reload();
						}else{
							alert("ɾ��GPS�ӿ����ݲɼ��������ã�����ʧ�ܣ�");
						}
					}
				}catch(e){ 
					alert(e);
				}
			}
		}
	</script>
</head>
<body>
	<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
	<div id="addPanel" style="margin:0px;width:100px;"></div>
	<tt:grid id="interFatchConfigList" value="interFatchConfigList" pagination="true" xls="false">
		<tt:row>
			<tt:col name="��ˮ��" property="inter_fetch_config_id" width="120"/>
			<tt:col name="�ɼ���������" property="inter_fetch_config_name" width="200"/>
			<tt:col name="�ɼ���ʽ" property="fetch_mode_name" width="100"/>
			<tt:col name="����" width="100">
				<ww:if test="null != inter_fetch_config_id">
					<a href="javascript:parent.addTab('�޸ĳ�����Ϣ', 'editCarInfo', '/datacollection/interFatchConfig.shtml?actionType=edit&search.interFetchConfigId=<ww:property value="inter_fetch_config_id"/>','NO')">�޸�</a>
					<a href="javascript:fun_delete(<ww:property value="inter_fetch_config_id"/>)">ɾ��</a>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid>
</body>
