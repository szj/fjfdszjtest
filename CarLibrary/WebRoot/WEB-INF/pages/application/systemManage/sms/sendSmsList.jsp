<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>

<!-- 
	��ȡ���յ��ļ�¼�� 
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
		 	sendStateData = [["0", "δ����"],["1","�ѷ���"],["2","ȡ������"]];
			var sendState = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: sendStateData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.sendState',
				fieldLabel: '����״̬',
				name: 'test',
				width:100
			})			
			
			sourceOrderTypeData = [["0", "����"],["1","�ɳ�������"],["2","���ȵ�����"],["3","����ת��"],["4","IC���쳣"],
			["5","�ֶ�����"],["6","�ǹ���ʱ�䱨��"],["7","Խ�籨��"],["8","��������"],["9","�ͻ�����"],["10","˾���г���¼"],
			["11","ͣ����ʱ"],["12","��վ����"],["13","������ʱ�ɳ�"]];
			var sourceOrderType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: sourceOrderTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.sourceOrderType',
				fieldLabel: 'Դ������',
				name: 'test',
				width:100
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
			        	this.getEl().dom.action='/system/sms/sendSms.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [sendState,{
			        	xtype: 'textfield',
			            fieldLabel: '������',
			            name: 'search.staffName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '����ʱ��',
			            name: 'search.begSendDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endSendDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },sourceOrderType,{
			        	xtype: 'textfield',
			            fieldLabel: 'Դ����',
			            name: 'search.sourceOrderCode',
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
			        title: '���ŷ��Ͳ�ѯ',
			        width: 300,
			        height:250,
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
		
		<c:if test="${param.action != 'ExpSuccess'}">
			Ext.onReady(function(){
				new Ext.Button({
			        text: '�� ѯ',
			        handler: showSearch
			    }).render(document.all.searchPanel);
			})
		</c:if>
		
		
		function view(callPhone, sendDate, smsContent){
			var smsViewWindow = new Ext.Window({
			        title: '��������',
			        width: 300,
		        	height:200,
			        layout: 'fit',
			        plain:true,
			        bodyStyle:'padding:5px;',
			        buttonAlign:'center',
			        html: "�����ߺ��룺"+callPhone+"<br>"+
			        	  "����ʱ�䣺"+sendDate+"<br>"+
			        	  "�������ݣ�<br>"+smsContent
			    });
			smsViewWindow.show();
		}
		
		function resend(optType, sendSmsId){
			var url = '/system/sms/sendSms.shtml?actionType='+optType+'&search.sendSmsId='+sendSmsId;
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
					var rowSet = root.selectNodes("//result");
					if (optType == 'resend'){
						<c:if test="${param.action != 'ExpSuccess'}">
							parent.document.ifrm_SendSmsManage.window.location.reload();
						</c:if>
						<c:if test="${param.action == 'ExpSuccess'}">
							parent.document.sendSmsFrame.window.location.reload();
						</c:if>
					}
					if (optType == 'cancel'){
						if (1 == rowSet.item(0).selectSingleNode("value").text){
							alert("ȡ�����ŷ��ͣ������ɹ�!");
							
							<c:if test="${param.action != 'ExpSuccess'}">
								parent.document.ifrm_SendSmsManage.window.location.reload();
							</c:if>
							<c:if test="${param.action == 'ExpSuccess'}">
								parent.document.sendSmsFrame.window.location.reload();
							</c:if>
						}else{
							alert("����ʧ��!");
						}
					}
						
							
					
				}
			}catch(e){ 
				alert(e);
			}
		}
    </script>
</head>

<body>
		<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
		
	<tt:grid id="smsList" value="smsList" pagination="true" xls="true">
		<tt:row>
			<tt:col name="���պ���" property="call_phone" width="100"/>
			<tt:col name="������" property="call_staff_name" width="120"/>
			<tt:col name="����ʱ��" property="create_date" width="120"/>
			<tt:col name="����ʱ��" property="send_date" width="120"/>
			<tt:col name="Դ������" property="source_order_type_desc" width="100"/>
			<tt:col name="������" property="staff_id_name" width="100"/>
			<tt:col name="����״̬" property="send_state_desc" width="80"/>
			<tt:col name="����" width="100">
				<ww:if test="null != send_sms_id">
					<a style="cursor:hand;" onclick="view('<ww:property value="call_phone"/>', '<ww:property value="send_date"/>', '<ww:property value="send_content"/>')">�鿴</a>
					<ww:if test="send_state == 0">
						<tt:authority value="CFDX">
						<a href="javascript:resend('resend', '<ww:property value="send_sms_id"/>')">�ط�</a>
						</tt:authority>
						<tt:authority value="QXDXFS">
							<a href="javascript:resend('cancel', '<ww:property value="send_sms_id"/>')">ȡ��</a>
						</tt:authority>
					</ww:if>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid>
	
</body>