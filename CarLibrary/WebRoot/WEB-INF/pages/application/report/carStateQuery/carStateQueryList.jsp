<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	�ۺϱ��� -�� ����״̬��ѯ
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
			        	this.getEl().dom.action='/report/carStateQuery.shtml';
			        	this.getEl().dom.submit();
			        },
			        items: [{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��ѯʱ��',
			            name: 'search.begDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endDate',
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
			        title: '����״̬��ѯ',
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
	
	<tt:grid id="carStateQueryList" value="carStateQueryList" pagination="true" xls="true">
		<tt:row>
			<tt:col name="�������" property="car_no_code" width="100"/>
			<tt:col name="��������" property="city_name" width="100"/>
			<tt:col name="�ɳ�����" width="100">
				<ww:if test="null != car_no_id">
					 <a href="javascript:parent.addTab('�ɳ�����', 'expedite_num', '/carmanage/expedite/expedite.shtml?action=report&search.carNoId=<ww:property value="car_no_id"/>&search.begExpediteDate=${param['search.begDate']}&search.endExpediteDate=${param['search.endDate']}')"><ww:property value="expedite_num"/></a>
				</ww:if>
			</tt:col>
			<tt:col name="�س�����" width="100">
				<ww:if test="null != car_no_id">
					 <a href="javascript:parent.addTab('�س�����', 'goback_num', '/carmanage/expedite/goback.shtml?action=report&search.carNoId=<ww:property value="car_no_id"/>&search.begGobackDate=${param['search.begDate']}&search.endGobackDate=${param['search.endDate']}')"><ww:property value="goback_num"/></a>
				</ww:if>
			</tt:col>
			<tt:col name="ά�޴���" width="100">
				<ww:if test="null != car_no_id">
					 <a href="javascript:parent.addTab('ά�޴���', 'maintain_num', '/carmanage/servicingmanage/servicingBooking.shtml?action=report&search.carNoId=<ww:property value="car_no_id"/>&search.begMaintainEndDate=${param['search.begDate']}&search.endMaintainDate=${param['search.endDate']}')"><ww:property value="maintain_num"/></a>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid>
	
	<div style="color:red">
		ע�����ֵ�鿴��ϸ
	</div>
</body>