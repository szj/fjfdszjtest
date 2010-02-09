<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>

<!-- 
	Ԥ������
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
		 	optFlagData = [["1", "δ����"],["2","�Ѵ���"]];
			var optFlag = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: optFlagData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.optFlag',
				fieldLabel: '����״̬',
				name: 'test',
				width:100
			});			
				  
		 	warningTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'WARNING_PARA' and para_name = 'WARNING_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="belongCompanyList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#select.selectList.size() != #belongCompanyList.count">,</ww:if></ww:iterator>
			];
			var warningType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: warningTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.warningType',
				fieldLabel: 'Ԥ������',
				name: 'test',
				width:100
			});
			
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/system/warning/warningLog.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [optFlag,warningType,{
			        	xtype: 'textfield',
			            fieldLabel: '������',
			            name: 'search.staffName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: 'Ԥ��ʱ��',
			            name: 'search.begCreateDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endCreateDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '����ʱ��',
			            name: 'search.begOptDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endOptDate',
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
			        title: '���Ͳ�ѯ',
			        width: 300,
			        height:300,
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
		
		<c:if test="${param.action != 'homepage'}">
			Ext.onReady(function(){
				new Ext.Button({
			        text: '�� ѯ',
			        handler: showSearch
			    }).render(document.all.searchPanel);
			})
		</c:if>
		
		<tt:authority value="CLJSDDX">
		function fun_opt(optType, warningLogId){
			var msg;
			if (optType == 'opt')
				msg = '��ȷ��������Ԥ����Ϊ�Ѵ���';
				
		    if (!confirm(msg)){
				return;
			}else{
			   var url = '/system/warning/warningLog.shtml?actionType='+optType+'&search.warningLogId='+warningLogId;
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
							<c:if test="${param.action != 'homepage'}">
								parent.document.ifrm_WarningLogManage.window.location.reload();
							</c:if>
							<c:if test="${param.action == 'homepage'}">
								parent.document.warningLogIframe.window.location.reload();
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
    </script>
</head>

<body>
	<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
	
	<c:if test="${param.action != 'homepage'}">
		<tt:grid id="warningLogList" value="warningLogList" pagination="true" xls="false">
			<tt:row>
				<tt:col name="Ԥ������" width="120">
					<ww:if test="null != warning_log_id">
						<a href='<ww:property value="url"/>'><ww:property value="warning_content"/></a>
					</ww:if>
				</tt:col>
				<tt:col name="Ԥ��ʱ��" property="create_date" width="120"/>
				<tt:col name="Ԥ������" property="warning_type_desc" width="90"/>
				<tt:col name="״̬" property="opt_flag_desc" width="70"/>
				<tt:col name="Ԥ������" property="city_name" width="120"/>
				<tt:col name="������" property="staff_name" width="120"/>
				<tt:col name="����ʱ��" property="opt_date" width="120"/>
				<tt:col name="����" width="50">
					<ww:if test="null != warning_log_id">
						<a href="javascript:fun_opt('opt', '<ww:property value="warning_log_id"/>')">����</a>
					</ww:if>
				</tt:col>
			</tt:row>
		</tt:grid>
	</c:if>
	<c:if test="${param.action == 'homepage'}">
		<tt:grid id="warningLogList" value="warningLogList" pagination="true" xls="false" width="800">
			<tt:row>
				<tt:col name="Ԥ������" width="400">
					<ww:if test="null != warning_log_id">
						<a href='<ww:property value="url"/>'><ww:property value="warning_content"/></a>
					</ww:if>
				</tt:col>
				<tt:col name="Ԥ��ʱ��" property="create_date" width="120"/>
				<tt:col name="Ԥ������" property="warning_type_desc" width="90"/>
				<tt:col name="״̬" property="opt_flag_desc" width="70"/>
				<tt:col name="Ԥ������" property="city_name" width="80"/>
				<tt:col name="����" width="50">
					<ww:if test="null != warning_log_id">
						<a href="javascript:fun_opt('opt', '<ww:property value="warning_log_id"/>')">����</a>
					</ww:if>
				</tt:col>
			</tt:row>
		</tt:grid>
	</c:if>
</body>