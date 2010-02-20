 <%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	��Ա���ڹ���
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
    <script type="text/javascript" src="/js/TreeField.js"></script>
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
			            <ww:if test="\"1\".equals(method)">
			            	this.getEl().dom.action='/carmanage/staffcheckinmanage/staffCheckin.shtml';
			            </ww:if>
			            <ww:else>
			            	this.getEl().dom.action='/carmanage/staffcheckinmanage/staffCheckinex.shtml';
			            </ww:else>
			        	this.getEl().dom.submit();
			        },
			        items: [{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: 'ǩ��ʱ��',
			            name: 'search.begLoginTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endLoginTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: 'ǩ��ʱ��',
			            name: 'search.begLogoutTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endLogoutTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�������',
			            name: 'search.carMark',
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
			        },new Ext.form.Hidden({//hidden  
               			id:'search.method',
                		name:'search.method',
                		value:<ww:property value="method"/>
                    })],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
    			});
    			
    			var window = new Ext.Window({
			        title: '����ά�������ѯ',
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
	
	<tt:grid id="staffCheckinList" value="staffCheckinList" pagination="true" xls="true">
		<tt:row>
			<tt:col name="GPSԱ�����" property="DriverID" width="100"/>
			<tt:col name="GPSԱ������" property="NAME" width="100"/>
			<tt:col name="�������" property="car_mark" width="100"/>
			<tt:col name="ǩ��ʱ��" property="LOGIN_TIME" width="100"/>
			<tt:col name="ǩ��ʱ��" property="LOGOUT_TIME" width="100"/>
			<tt:col name="���(����)" property="DISTANCE" width="100"/>
			<tt:col name="�³�����" property="LOGOUT_LON" width="100"/>
			<tt:col name="�³�γ��" property="LOGOUT_LAT" width="100"/>
		</tt:row>
	</tt:grid>
</body>