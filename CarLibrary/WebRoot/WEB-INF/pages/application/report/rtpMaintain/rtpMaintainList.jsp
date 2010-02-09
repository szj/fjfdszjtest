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
		 carNoData = [
				<tt:setProperty name="#select.dynamicSql" value="'select distinct * from tf_car_info where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'"/>
				<ww:iterator value="#select.selectList" status="carNoList">["<ww:property value="car_no_id"/>", "<ww:property value="car_no_code"/>"]<ww:if test="#carNoList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var carNoCode = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: carNoData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.carNoCode',
				fieldLabel: '���ƺ�',
				name: 'test',
				width:100
			})		
			 nurseTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="'select PARA_VALUE,PARA_VALUE_DESC  from td_system_para where para_type =\"FIXING_PARA\" and para_name = \"MAINTAIN_PARAM\" '"/>
				<ww:iterator value="#select.selectList" status="nurseTypeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#nurseTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var nurseType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: nurseTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.parmare',
				fieldLabel: '��������',
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
			        url:'/report/rtpMaintain.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/report/rtpMaintain.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [nurseType,carNoCode,cityId],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '�����쳣��ѯ',
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
	<tt:grid id="rtpMaintain" value="rtpMaintainList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="�������" width="80">
				<ww:if test="null != nurse_id">
					<a href="javascript:parent.addTab('������Ϣ', 'viewMaintainManage', '/carmanage/maintainmanage/maintainManage.shtml?actionType=view&search.nurseId=<ww:property value="nurse_id"/>','NO')">
						<ww:property value="car_no_code"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="�������" property="car_no_id" width="80" visible="true"/>	
			<tt:col name="������" property="fixing_id" width="80" visible="true"/>		
			<tt:col name="�������" property="fixing_name" width="80"/>			
			<tt:col name="��������" property="cityName" width="80"/>	
			<tt:col name="��������" property="parmare" width="80"/>	
			<tt:col name="��������(���)" property="aa" width="100"/>		
			<tt:col name="����ֵ" property="bb" width="100"/>	
		</tt:row>
	</tt:grid> 
</body>