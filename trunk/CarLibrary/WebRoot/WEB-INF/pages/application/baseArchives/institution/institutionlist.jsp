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
    	//��ʾ��ѯ���
		function showSearch(){
			Ext.onReady(function() {
				upCompanyData = [
					<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'UP_COMPANY'\""/>
					<ww:iterator value="#select.selectList" status="upCompanyList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#upCompanyList.count != #select.selectList.size()">,</ww:if></ww:iterator>
				];
				var upCompany = new Ext.form.ComboBox({
					valueField :"id",
					displayField: "text",
					store:new Ext.data.SimpleStore({
						fields: ["id", "text"],
						data: upCompanyData
					}),
					editable:false,
					triggerAction: 'all',
					mode: 'local',
					blankText:'��ѡ��',
					emptyText:'��ѡ��',
					hiddenName:'search.upCompany',
					fieldLabel: '�ϼ���˾',
					name: 'test',
					width:100
				})
				companyPropertyData = [
					<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'COMPANY_PROPERTY'\""/>
					<ww:iterator value="#select.selectList" status="companyPropertyList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#companyPropertyList.count != #select.selectList.size()">,</ww:if></ww:iterator>
				];
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
				var companyProperty = new Ext.form.ComboBox({
					valueField :"id",
					displayField: "text",
					store:new Ext.data.SimpleStore({
						fields: ["id", "text"],
						data: companyPropertyData
					}),
					editable:false,
					triggerAction: 'all',
					mode: 'local',
					blankText:'��ѡ��',
					emptyText:'��ѡ��',
					hiddenName:'search.companyProperty',
					fieldLabel: '��˾����',
					name: 'test',
					width:100
				})
				callingData = [
					<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'CALLING'\""/>
					<ww:iterator value="#select.selectList" status="callingList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#callingList.count != #select.selectList.size()">,</ww:if></ww:iterator>
				];
				var calling = new Ext.form.ComboBox({
					valueField :"id",
					displayField: "text",
					store:new Ext.data.SimpleStore({
						fields: ["id", "text"],
						data: callingData
					}),
					editable:false,
					triggerAction: 'all',
					mode: 'local',
					blankText:'��ѡ��',
					emptyText:'��ѡ��',
					hiddenName:'search.calling',
					fieldLabel: '��˾��ҵ',
					name: 'test',
					width:100
				})
				proxyLevelData = [
					<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'MANAGE_ORGAN_ARCHIVES' and para_name = 'PROXY_LEVEL'\""/>
					<ww:iterator value="#select.selectList" status="proxyLevelList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#proxyLevelList.count != #select.selectList.size()">,</ww:if></ww:iterator>
				];
				var proxyLevel = new Ext.form.ComboBox({
					valueField :"id",
					displayField: "text",
					store:new Ext.data.SimpleStore({
						fields: ["id", "text"],
						data: proxyLevelData
					}),
					editable:false,
					triggerAction: 'all',
					mode: 'local',
					blankText:'��ѡ��',
					emptyText:'��ѡ��',
					hiddenName:'search.proxyLevel',
					fieldLabel: '������',
					name: 'test',
					width:100
				})				
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/basearchives/institution/institution.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/basearchives/institution/institution.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '��˾���',
			            name: 'search.companyCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '��˾����',
			            name: 'search.companyName',
			            width:100  
			        },{
			            fieldLabel: '��˾���',
			            name: 'search.companyEasyName',
			            width:100  
			        },	 {
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			        	fieldLabel: 'ע������',
			        	name: 'search.regDate',
			        	width:100
			        },upCompany, companyProperty, calling, proxyLevel,cityId],
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
			        height:320,
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
		//������ť
		Ext.onReady(function(){
			new Ext.Button({
		        text: '�� ѯ',
		        handler: showSearch
		    }).render(document.all.searchPanel);
		    <tt:authority value="SCGLJGXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('��ӻ�����Ϣ','addInstitution','/basearchives/institution/institution.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		//ɾ����¼ AJAX��ʽ����
		function fun_delete(companyId){
			if (!confirm('��ȷ��ɾ������Ϣ!')){
					return;
			}else{
				var url = '/basearchives/institution/institution.shtml?actionType=delete&search.companyId='+companyId;
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
							parent.document.ifrm_InstitutionManage.window.location.reload();
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
	<tt:grid id="institution" value="institutionList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="��˾���" width="100">
				<ww:if test="null != company_id">
					<a href="javascript:parent.addTab('�鿴������Ϣ', 'viewInstitution', '/basearchives/institution/institution.shtml?actionType=view&search.companyId=<ww:property value="company_id"/>','NO')"><ww:property value="company_code"/></a> 
				</ww:if>
			</tt:col>
			<tt:col name="��˾����" property="company_name" width="100"/>			
			<tt:col name="��˾���" property="company_easy_name" visible="true"/>
			<tt:col name="ע������" property="reg_date" visible="true"/>
			<tt:col name="�ϼ���˾" property="upCompany" width="70"/>			
			<tt:col name="��˾����" property="companyProperty" width="70"/>
			<tt:col name="��˾��ҵ" property="CALLING2" width="70"/>
			<tt:col name="������" property="proxyLevel" width="70"/>
			<tt:col name="��������" property="cityId" width="70"/>
			<tt:col name="��ϵ��" property="link_man" width="70"/>
			<tt:col name="��ϵ�绰" property="link_phone" width="70"/>
			<tt:col name="����" align="center" width="80">
				<ww:if test="null != company_id">
					<tt:authority value="TJGLJGXX">
						<a href="javascript:parent.addTab('�޸Ļ�����Ϣ', 'editInstitution', '/basearchives/institution/institution.shtml?actionType=edit&search.companyId=<ww:property value="company_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="XGGLJGXX">
						<a href="javascript:fun_delete(<ww:property value="company_id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>