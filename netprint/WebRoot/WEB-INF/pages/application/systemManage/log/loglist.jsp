<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
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
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/system/log/log.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/system/log/log.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '��Ա',
			            name: 'operateLog.staffId',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: 'ҵ���������',
			            name: 'operateLog.serviceName',
			            width:100  
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '����ʱ��',
			            name: 'operateLog.optTime',
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
			        title: '��־��ѯ',
			        width: 300,
			        height:230,
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
		})
		
		
	</script>
</head>
<body>
	<div id="searchPanel" style="margin:0px;width:100px;"></div>	
	<tt:grid id="log" value="logList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="��Ա����" property="staff_name" width="100"/>
			<tt:col name="ҵ���������" property="SERVICE_NAME" width="150"/>
			<tt:col name="����ʱ��" property="OPT_TIME" width="120"/>			
			<tt:col name="�������" width="100" property='OPT_RESULTName'>
			</tt:col>
			<tt:col name="��¼�ն˺�" property="OPT_TERM" width="100"/>
			<tt:col name="��������" property="DeptName" width="100"></tt:col>		
		</tt:row>
	</tt:grid>
</body>