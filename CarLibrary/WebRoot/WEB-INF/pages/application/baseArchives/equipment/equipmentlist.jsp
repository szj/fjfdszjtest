<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	�豸����
 -->
 
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
		 		
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        
			        url:'/basearchives/equipment/equipment.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/basearchives/equipment/equipment.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '�豸���',
			            name: 'search.fixingCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�豸����',
			            name: 'search.fixingName',
			            width:100  
			        }],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '�豸��Ϣ��ѯ',
			        width: 300,
			        height:180,
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
		    <tt:authority value="TJSBXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('����豸��Ϣ','addEquipment','/basearchives/equipment/equipment.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(equipmentId){
		 	if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
				var url = '/basearchives/equipment/equipment.shtml?actionType=delete&search.fixingId='+equipmentId;
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
							alert("ɾ���豸��Ϣ�������ɹ���");
							parent.document.ifrm_EquipmentInfo.window.location.reload();
						}else{
							alert("ɾ���豸��Ϣ������ʧ�ܣ�");
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
	<tt:grid id="equipment" value="equipmentList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="�豸���" width="130">
				<ww:if test="null != fixing_id">
					<a href="javascript:parent.addTab('�鿴�豸��Ϣ', 'editEquipment', '/basearchives/equipment/equipment.shtml?actionType=view&search.fixingId=<ww:property value="fixing_id"/>','NO')"><ww:property value="fixing_code"/></a>
				</ww:if>
			</tt:col>
			<tt:col name="�豸����" property="fixing_name" width="130"/>			
			<tt:col name="��ע" property="memo" width="130"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != fixing_id">
					<tt:authority value="XGSBXX">
						<a href="javascript:parent.addTab('�޸��豸��Ϣ', 'editEquipment', '/basearchives/equipment/equipment.shtml?actionType=edit&search.fixingId=<ww:property value="fixing_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCSBXX">
						<a href="javascript:fun_delete(<ww:property value="fixing_id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>