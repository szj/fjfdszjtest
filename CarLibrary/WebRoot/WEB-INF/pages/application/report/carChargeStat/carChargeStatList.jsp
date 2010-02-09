<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	�ۺϱ��� -�� ��������ͳ��
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
    		sourceOrderTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para a where para_type = 'FINANCE_PARA' and para_name = 'SOURCE_ORDER_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="sourceOrderTypeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#sourceOrderTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
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
			        labelAlign: 'right', 
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/report/carChargeStat.shtml';
			        	this.getEl().dom.submit();
			        },
			        items: [{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��������',
			            name: 'search.begBookingDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endBookingDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },sourceOrderType,{
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
	
	<tt:grid id="carChargeStatList" value="carChargeStatList" pagination="true" xls="true">
		<tt:row>
			<tt:col name="��������" property="source_order_type_name" width="100"/>
			<tt:col name="�ܷ���(Ԫ)" width="100">
				<ww:if test="null != source_order_type">
					<ww:if test="\"1\".equals(source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-���ͷ���', 'viewSourceOrder_PutOnSteamManage', '/carmanage/putonsteam/putonsteam.shtml?action=report&search.carNoCode=${param['search.carNoCode']}','NO')">
							<ww:property value="charge"/>
						</a>
					</ww:if>
					<ww:if test="\"2\".equals(source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-ά�޷���', 'viewSourceOrder_MaintainBooking', '/carmanage/servicingmanage/servicingBooking.shtml?action=report&search.maintainState=2&search.carNoCode=${param['search.carNoCode']}','NO')">
							<ww:property value="charge"/>
						</a>
					</ww:if>
					<ww:if test="\"3\".equals(source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-��������', 'viewSourceOrder_MaintainManage', '/carmanage/maintainmanage/maintainManage.shtml?action=report&search.carNoCode=${param['search.carNoCode']}','NO')">
							<ww:property value="charge"/>
						</a>
					</ww:if>
					<ww:if test="\"4\".equals(source_order_type)">
						<a href="javascript:parent.addTab('���񵥾���Ϣ-��·���ŷ���', 'viewSourceOrder_RoadBridgeCharge', '/carmanage/roadbridgecharge/roadBridgeCharge.shtml?action=report&search.carNoCode=${param['search.carNoCode']}','NO')">
							<ww:property value="charge"/>
						</a>
					</ww:if>
				</ww:if>
			</tt:col>
			<tt:col name="��������" property="amount" width="100"/>
		</tt:row>
	</tt:grid>
	<div style="color:red">
		&nbsp;&nbsp;&nbsp;&nbsp;ע�����ÿ�����͵��ܷ���ֵ���鿴��������µĵ�����ϸ
	</div>
</body>