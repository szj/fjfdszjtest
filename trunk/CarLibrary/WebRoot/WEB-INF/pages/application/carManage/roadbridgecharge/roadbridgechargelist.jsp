<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	��·���ŷ��ù���
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
		 	chargeTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para tt  where tt.para_type='ROAD_BRIDGE_CHARGE' and  tt.para_name = 'CHARGE_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="chargeTypeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#chargeTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var chargeType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: chargeTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.chargeType',
				fieldLabel: '��������',
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
			        	this.getEl().dom.action='/carmanage/roadbridgecharge/roadBridgeCharge.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [chargeType,{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' �շ�ʱ��',
			            name: 'search.begChargeDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endChargeDate',
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
			        title: '���Ͳ�ѯ',
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
		
		<c:if test="${param.action != 'report'}">
			Ext.onReady(function(){
				new Ext.Button({
			        text: '�� ѯ',
			        handler: showSearch
			    }).render(document.all.searchPanel);
			    <tt:authority value="TJGLGQFY">
			    new Ext.Button({
			        text: '�� ��',
			        handler: function(){
			        	parent.addTab('��ӹ�·���ŷ�����Ϣ','addRoadBridgeCharge','/carmanage/roadbridgecharge/roadBridgeCharge.shtml?actionType=new','NO');
			        }
			    }).render(document.all.addPanel);
			    </tt:authority>
			})
		</c:if>
		
		function fun_delete(roadBridgeChargeId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   var url = '/carmanage/roadbridgecharge/roadBridgeCharge.shtml?actionType=delete&search.roadBridgeChargeId='+roadBridgeChargeId;
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
						var rowSet = root.selectNodes("//delete");
						if (0 < rowSet.item(0).selectSingleNode("value").text){
							alert("ɾ����·���ŷ�����Ϣ�������ɹ���");
							parent.document.ifrm_RoadBridgeCharge.window.location.reload();
						}else{
							alert("ɾ����·���ŷ�����Ϣ������ʧ�ܣ�");
						}
					}
				}catch(e){ 
					alert(e);
				}
			}	
		}
    </script>
</head>
<body>
	<div id="searchPanel" style="margin:0px;width:100px;float:left;"></div>
	<div id="addPanel" style="margin:0px;width:100px;"></div>
	
	<tt:grid id="roadBridgeChargeList" value="roadBridgeChargeList" pagination="true" xls="true">
		<tt:row>
			<tt:col name="���ݺ�" width="120">
				<ww:if test="null != road_bridge_charge_id">
					<a href="javascript:parent.addTab('��·���ŷ�����Ϣ', 'viewRoadBridgeCharge', '/carmanage/roadbridgecharge/roadBridgeCharge.shtml?actionType=view&search.roadBridgeChargeId=<ww:property value="road_bridge_charge_id"/>','NO')">
						<ww:property value="road_bridge_charge_id"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="�������" property="car_no_code" width="100"/>
			<tt:col name="�շ�ʱ��" property="charge_date" width="100"/>
			<tt:col name="�շ�����" property="charge_type_desc" width="100"/>
			<tt:col name="����" property="charge" width="100"/>
			<tt:col name="������" property="city_name" width="100"/>
			<c:if test="${param.action != 'report'}">
				<tt:col name="����" width="100">
					<ww:if test="null != road_bridge_charge_id">
						<tt:authority value="XGGLGQFY">
							<a href="javascript:parent.addTab('�޸Ĺ�·���ŷ���', 'editRoadBridgeCharge', '/carmanage/roadbridgecharge/roadBridgeCharge.shtml?actionType=edit&search.roadBridgeChargeId=<ww:property value="road_bridge_charge_id"/>','NO')">�޸�</a>
						</tt:authority>
						<tt:authority value="XCGLGQFY">
							<a href="javascript:fun_delete('<ww:property value="road_bridge_charge_id"/>')">ɾ��</a>
						</tt:authority>
					</ww:if>
				</tt:col>
			</c:if>
		</tt:row>
	</tt:grid>
</body>