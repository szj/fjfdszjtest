<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!--
	�������� 
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
    		Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        labelAlign: 'right', 
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/report/rtpMotorman.shtml';
			        	this.getEl().dom.submit();
			        },
			        items: [{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: 'ʱ��',
			            name: 'search.begTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: 'Ա������',
			            name: 'search.staffName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: 'Ա������',
			            name: 'search.driverID',
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
			        title: '��Ա����',
			        width: 300,
			        height:300,
			        minWidth: 300,
			        minHeight: 300,
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
		})
		
	</script>
</head>
<body>
    <div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
	<div id="addPanel" style="margin:0px;width:100px;"></div>
	<tt:grid id="rtpMotorman" value="rtpMotormanList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="��Ա���" width="80">
				<ww:if test="null != driverId">
					<a href="javascript:parent.addTab('������Ϣ', 'viewStaffCheckinManage', '/carmanage/staffcheckinmanage/staffCheckin.shtml?search.id=<ww:property value="Id"/>','NO')">
						<ww:property value="driverId"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="��Ա����" property="Name" width="80" />	
			<tt:col name="ʱ���" property="groupdata" width="150"/>		
			<tt:col name="ǩ������" width="80">
			<ww:if test="null != driverId">
				<a href="javascript:parent.addTab('������Ϣ', 'viewStaffCheckinManage', '/carmanage/staffcheckinmanage/staffCheckin.shtml?search.id=<ww:property value="Id"/>&search.begLoginTime=<ww:property value="begdata"/>&search.endLoginTime=<ww:property value="enddata"/>','NO')">
						<ww:property value="SLogin"/>	
				</a>
			</ww:if>
			</tt:col>	
			<tt:col name="ǩ�˴���" width="80">
			<ww:if test="null != driverId">
				<a href="javascript:parent.addTab('������Ϣ', 'viewStaffCheckinManage', '/carmanage/staffcheckinmanage/staffCheckin.shtml?search.id=<ww:property value="Id"/>&search.begLogoutTime=<ww:property value="begdata"/>&search.endLogoutTime=<ww:property value="enddata"/>','NO')">
						<ww:property value="SLogOut"/>	
				</a>
			</ww:if>
			</tt:col>	
		</tt:row>
	</tt:grid> 
</body>