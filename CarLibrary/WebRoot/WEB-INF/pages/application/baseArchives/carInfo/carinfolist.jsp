<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!--
	������Ϣ���� 
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
		 terminalTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'CAR_INFO' and para_name = 'TERMINAL_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="terminalTypeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#terminalTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var terminalType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: terminalTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.terminalType',
				fieldLabel: '�ն�����',
				name: 'test',
				width:300
			})	
			colorData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para  t where t. para_type = 'CAR_INFO' and t.para_name = 'COLCOR'\""/>
				<ww:iterator value="#select.selectList" status="colorList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#colorList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var color = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: colorData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.color',
				fieldLabel: '������ɫ',
				name: 'test',
				width:100
			})
		 belongCompanyData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'UP_COMPANY'\""/>
				<ww:iterator value="#select.selectList" status="belongCompanyList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#belongCompanyList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var belongCompany = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: belongCompanyData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.belongCompany',
				fieldLabel: '������˾',
				name: 'test',
				width:100
			})
			 carStateData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'CAR_INFO' and para_name = 'CAR_STATE'\""/>
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
			 cityIdData = [
				<tt:setProperty name="#select.dynamicSql" value="'select city_id,city_name from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'"/>
				<ww:iterator value="#select.selectList" status="cityIdList">["<ww:property value="city_id"/>", "<ww:property value="city_name"/>"]<ww:if test="#cityIdList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var cityId = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: cityIdData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.cityId',
				fieldLabel: '��������',
				name: 'test',
				width:100
			})											
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/basearchives/car/carInfo.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/basearchives/car/carInfo.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '���Ʊ��',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },terminalType,color,belongCompany,carState,{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��װʱ��',
			            name: 'search.installDate',
			            width:100  
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��������',
			            name: 'search.buyDate',
			            width:100  
			          
			        },cityId],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '������Ϣ��ѯ',
			        width: 300,
			        height:330,
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
		    <tt:authority value="TJCLXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('��ӳ�����Ϣ','addCarInfo','/basearchives/car/carInfo.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(carNoId){
			if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
				var url = '/basearchives/car/carInfo.shtml?actionType=delete&search.carNoId='+carNoId;
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
							alert("ɾ��������Ϣ�������ɹ���");
							parent.document.ifrm_CarInfo.window.location.reload();
						}else{
							alert("ɾ��������Ϣ������ʧ�ܣ�");
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
	<tt:grid id="carInfo" value="carInfoList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="���Ʊ��" width="100">
				<ww:if test="null != car_no_id">
					<a href="javascript:parent.addTab('������Ϣ', 'viewCarInfo', '/basearchives/car/carInfo.shtml?actionType=view&search.carNoId=<ww:property value="car_no_id"/>','NO')">
						<ww:property value="car_no_code"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="�ն�����" property="terminalType" width="100"/>
			<tt:col name="������ɫ" property="color2" width="80"/>
			<tt:col name="��ʻ��̳�ʼ(��)" property="run_mileage_init" width="80" visible="true"/>			
			<tt:col name="������˾" property="belongCompany" width="100"/>
			<tt:col name="����״̬" property="carState" width="80"/>
			<tt:col name="���ص绰" property="car_phone" width="80"/>
			<tt:col name="��װʱ��" property="install_date" width="80" visible="true"/>
			<tt:col name="��������" property="buy_date" width="80" visible="true"/>	
			<tt:col name="��������" property="cityId" width="80"/>			
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != car_no_id">
					<tt:authority value="XGCLXX">
						<a href="javascript:parent.addTab('�޸ĳ�����Ϣ', 'editCarInfo', '/basearchives/car/carInfo.shtml?actionType=edit&search.carNoId=<ww:property value="car_no_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCCLXX">
						<a href="javascript:fun_delete(<ww:property value="car_no_id"/>)">ɾ��</a>
					</tt:authority>
						<a href="javascript:parent.addTab('���Ƴ�����Ϣ', 'reCarInfo', '/basearchives/car/carInfo.shtml?actionType=renew&search.carNoId=<ww:property value="car_no_id"/>','NO')">����</a>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>