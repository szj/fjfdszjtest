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
			
			 nurseTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="'select distinct * from tf_fixing_info '"/>
				<ww:iterator value="#select.selectList" status="nurseTypeList">["<ww:property value="fixing_id"/>", "<ww:property value="fixing_name"/>"]<ww:if test="#nurseTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
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
				hiddenName:'search.nurseType',
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
			        url:'/carmanage/maintainmanage/maintainManage.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/maintainmanage/maintainManage.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [nurseType,{
			            fieldLabel: '�������',
			            name: 'search.nurseMileage',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��������',
			            name: 'search.nurseDate',
			            width:100  
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },cityId],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '������ѯ',
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
		    <tt:authority value="TJBYXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('��ӱ�����Ϣ','addMaintainManage','/carmanage/maintainmanage/maintainManage.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(nurseId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   var url = '/carmanage/maintainmanage/maintainManage.shtml?actionType=delete&search.nurseId='+nurseId;
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
							parent.document.ifrm_CareManage.window.location.reload();
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
	<tt:grid id="maintainManage" value="maintainManageList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="��������" width="80">
				<ww:if test="null != nurse_id">
					<a href="javascript:parent.addTab('������Ϣ', 'viewMaintainManage', '/carmanage/maintainmanage/maintainManage.shtml?actionType=view&search.nurseId=<ww:property value="nurse_id"/>','NO')">
						<ww:property value="booking_date"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="��������" property="nurseType" width="80"/>			
			<tt:col name="�������(����)" property="nurse_mileage" width="80"/>
			<tt:col name="��������" property="cityName" width="80"/>	
			<tt:col name="��������" property="nurse_date" width="80"/>		
			<tt:col name="�������" property="carNoId" width="80"/>
			<tt:col name="�������" property="nurse_charge" width="100"/>
			<tt:col name="��;" property="purpose" width="100"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != nurse_id">
					<tt:authority value="XGBYXX">
						<a href="javascript:parent.addTab('�޸ı�����Ϣ', 'editMaintainManage', '/carmanage/maintainmanage/maintainManage.shtml?actionType=edit&search.nurseId=<ww:property value="nurse_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCBYXX">
						<a href="javascript:fun_delete(<ww:property value="nurse_id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>