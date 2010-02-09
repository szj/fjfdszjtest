<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	���͹���
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
		 	putonsteamTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para tt  where tt.para_type='BASE_PARA'    and  tt.para_name = 'PUT_ON_STEAM_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="putonsteamTypeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#putonsteamTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var putonsteamType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: putonsteamTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.putOnSteamType',
				fieldLabel: '��������',
				name: 'test',
				width:100
			})				  
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/report/rtpPutonsteam.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/report/rtpPutonsteam.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' ����ʱ��',
			            name: 'search.begPutOnDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endPutOnDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: ' �ٹ����ͺ�',
			            name: 'search.begconsume_100',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'textfield',
			            fieldLabel: '',
			            name: 'search.endconsume_100',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: ' �������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },putonsteamType],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '�ٹ����ͺ��쳣��ѯ',
			        width: 300,
			        height:280,
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
	<tt:grid id="putonsteam" value="rtpPutonsteamList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="����ʱ��" width="80">
				<ww:if test="null != put_on_steam_id">
					<a href="javascript:parent.addTab('������Ϣ', 'viewPutOnSteamManage', '/carmanage/putonsteam/putonsteam.shtml?actionType=view&search.putonsteamId=<ww:property value="put_on_steam_id"/>','NO')">
						<ww:property value="put_on_date"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="�ϴμ������" property="last_put_on_mileage" width="80" visible="true"/>	
			<tt:col name="�������" property="carNoId" width="100"/>
			<tt:col name="�ٹ����ͺ�" property="consume_100" width="100"/>		
			<tt:col name="����վ" property="gasStation" width="100"/>
			<tt:col name="��������" property="cityName" width="80"/>	
			<tt:col name="��������" property="putOnType" width="80"/>		
			<tt:col name="����ʱ������(����)" property="put_on_mileage" width="80" visible="true"/>
			<tt:col name="��ʻ���(����)" property="run_mileage" width="80"/>
			<tt:col name="������" property="put_on_num" width="80"/>
			<tt:col name="����" property="price" width="80"/>
			<tt:col name="���(Ԫ)" property="charge" width="80"/>
		</tt:row>
	</tt:grid> 
</body>