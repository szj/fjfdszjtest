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
		 	smsStateData = [["1", "δ����"],["2","�Ѵ���"]];
			var smsState = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: smsStateData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.smsState',
				fieldLabel: '����״̬',
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
			        	this.getEl().dom.action='/system/sms/inceptSms.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [smsState,{
			        	xtype: 'textfield',
			            fieldLabel: '�������ֻ�',
			            name: 'search.phoneCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '������',
			            name: 'search.staffName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '����ʱ��',
			            name: 'search.begCollDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endCollDate',
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
			        title: '���Ž��ղ�ѯ',
			        width: 300,
			        height:250,
			        minWidth: 300,
			        minHeight: 250,
			        layout: 'fit',
			        plain:true,
			        bodyStyle:'padding:5px;',
			        buttonAlign:'center',
			        items: schForm
			    });
			
			    window.show();
			});
		}
		
		<c:if test="${param.action != 'homepage'}">
			Ext.onReady(function(){
				new Ext.Button({
			        text: '�� ѯ',
			        handler: showSearch
			    }).render(document.all.searchPanel);
			})
		</c:if>
		
		<tt:authority value="CLJSDDX">
		function fun_opt(optType, inceptSmsId){
			var msg;
			if (optType == 'delete')
				msg = '��ȷ������������ɾ����';
			else if (optType == 'update')
				msg = '��ȷ������������״̬��Ϊ��������';
				
		    if (!confirm(msg)){
				return;
			}else{
			   var url = '/system/sms/inceptSms.shtml?actionType='+optType+'&search.inceptSmsId='+inceptSmsId;
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
						if (0 < rowSet.item(0).selectSingleNode("value").text){
							alert("�����ɹ���");
							<c:if test="${param.action == 'homepage'}">
								parent.document.inceptSmsIframe.window.location.reload();
							</c:if>
							<c:if test="${param.action != 'homepage'}">
								parent.document.ifrm_InceptSmsManage.window.location.reload();
							</c:if>
						}else{
							alert("����ʧ�ܣ�");
						}
					}
				}catch(e){ 
					alert(e);
				}
			}	
		}
		</tt:authority>
		
		function view(phoneCode, inceptDate, smsContent){
			var smsViewWindow = new Ext.Window({
			        title: '��������',
			        width: 300,
			        <c:if test="${param.action == 'homepage'}">
			        	height:100,
			        </c:if>
			        <c:if test="${param.action != 'homepage'}">
			        	height:200,
			        </c:if>
			        layout: 'fit',
			        plain:true,
			        bodyStyle:'padding:5px;',
			        buttonAlign:'center',
			        html: "�����ߺ��룺"+phoneCode+"<br>"+
			        	  "�������ڣ�"+inceptDate+"<br>"+
			        	  "�������ݣ�"+smsContent
			    });
			smsViewWindow.show();
		}
    </script>
</head>

<body>
	<c:if test="${param.action != 'homepage'}">
		<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
		
		<tt:grid id="inceptSmsList" value="smsList" pagination="true" xls="true">
			<tt:row>
				<tt:col name="�����ߺ���" property="phone_code" width="120"/>
				<tt:col name="����������" property="sms_staff_name" width="120"/>
				<tt:col name="����ʱ��" property="incept_date" width="110"/>
				<tt:col name="����״̬" property="sms_state_name" width="100"/>
				<tt:col name="�ɼ�ʱ��" property="coll_date" width="110"/>
				<tt:col name="������" property="staff_name" width="100"/>
				<tt:col name="����ʱ��" property="tran_date" width="100"/>
				<tt:col name="����" width="100">
					<ww:if test="null != incept_sms_id">
						<a onclick="view('<ww:property value="phone_code"/>', '<ww:property value="incept_date"/>', '<ww:property value="sms_content"/>')" href="javascript:void(0)">�鿴</a>
						<tt:authority value="CLJSDDX">
							<a href="javascript:fun_opt('update', '<ww:property value="incept_sms_id"/>')">����</a>
							<a href="javascript:fun_opt('delete', '<ww:property value="incept_sms_id"/>')">ɾ��</a>
						</tt:authority>
					</ww:if>
				</tt:col>
			</tt:row>
		</tt:grid>
	</c:if>
	
	<c:if test="${param.action == 'homepage'}">
		<tt:grid id="inceptSmsList" value="smsList" pagination="true" xls="false" width="570">
			<tt:row>
				<tt:col name="�����ߺ���" property="phone_code" width="90"/>
				<tt:col name="����������" property="sms_staff_name" width="90"/>
				<tt:col name="����ʱ��" property="incept_date" width="110"/>
				<tt:col name="����״̬" property="sms_state_name" width="70"/>
				<tt:col name="�ɼ�ʱ��" property="coll_date" width="110"/>
				<tt:col name="����" width="100">
					<ww:if test="null != incept_sms_id">
						<a onclick="view('<ww:property value="phone_code"/>', '<ww:property value="incept_date"/>', '<ww:property value="sms_content"/>')" href="javascript:void(0)">�鿴</a>
						<tt:authority value="CLJSDDX">
							<a href="javascript:fun_opt('update', '<ww:property value="incept_sms_id"/>')">����</a>
							<a href="javascript:fun_opt('delete', '<ww:property value="incept_sms_id"/>')">ɾ��</a>
						</tt:authority>
					</ww:if>
				</tt:col>
			</tt:row>
		</tt:grid>
	</c:if>
	<br>
	<div style="color:red">
		ע������������ǽ�������Ϣ״̬����Ϊ�Ѵ���״̬
	</div>
</body>