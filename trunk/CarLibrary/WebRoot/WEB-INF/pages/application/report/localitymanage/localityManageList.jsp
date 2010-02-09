<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	�ۺϱ��� -�� λ�ù���
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
    		carStateData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para a where para_type = 'CAR_INFO' and para_name = 'CAR_STATE'\""/>
				<ww:iterator value="#select.selectList" status="carStateList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#carStateList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var carState = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: carStateData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.carState',
				fieldLabel: '����״̬',
				name: 'test',
				width:100
			})	
			
    		Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        labelAlign: 'right', 
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/report/localityManage.shtml';
			        	this.getEl().dom.submit();
			        },
			        items: [carState,{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '���λʱ��',
			            name: 'search.begLastTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endLastTime',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�������',
			            name: 'search.carNoCode',
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
			        title: '���񵥾ݲ�ѯ',
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
	<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
	<div id="addPanel" style="margin:0px;width:100px;"></div>
	
	<tt:grid id="localityList" value="localityList" pagination="true" xls="true">
		<tt:row>
			<tt:col name="�������" property="car_no_code" width="100"/>
			<tt:col name="��˾" property="belong_to_company_name" width="100"/>
			<tt:col name="���λ��" property="LAST_LOCATION" width="100"/>
			<tt:col name="����ٶ�" property="LAST_SPEED" width="100"/>
			<tt:col name="���λʱ��" property="LAST_TIME" width="100"/>
			<tt:col name="���λ״̬" property="LAST_FLAG" width="100"/>
			<tt:col name="����" property="LAST_ANGLE" width="100"/>
			<tt:col name="���λ����" property="LAST_LON" width="100"/>
			<tt:col name="���λγ��" property="LAST_LAT" width="100"/>
			<tt:col name="����״̬" property="car_state_name" width="100"/>
		</tt:row>
	</tt:grid>
</body>