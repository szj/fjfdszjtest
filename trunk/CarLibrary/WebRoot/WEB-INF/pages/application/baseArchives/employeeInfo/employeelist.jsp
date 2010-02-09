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
		function showSearch(){
		  sexData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para  t where t. para_type = 'BASE_PARA' and t.para_name = 'sex'\""/>
				<ww:iterator value="#select.selectList" status="sexList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#sexList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var sex = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: sexData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.sex',
				fieldLabel: '�Ա�',
				name: 'test',
				width:100
			})		
			 staffTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'STAFF_INFO' and para_name = 'STAFF_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="staffTypeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#staffTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var staffType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: staffTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.staffType',
				fieldLabel: 'Ա������',
				name: 'test',
				width:100
			})		
			
			 belongCompanyData = [
				<tt:setProperty name="#select.dynamicSql" value="'select * from tf_manage_organ_archives t where t.city_id in (select a.city_id from tf_staff_city a where a.staff_id = '+ #session['UserInfo'].staffId + ')'"/>
				<ww:iterator value="#select.selectList" status="belongCompanyList">["<ww:property value="company_id"/>", "<ww:property value="company_name"/>"]<ww:if test="#belongCompanyList.count != #select.selectList.size()">,</ww:if></ww:iterator>
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
			 belongDeptData = [
				<tt:setProperty name="#select.dynamicSql" value="'select distinct * from tf_dept_info t where t.city_id in (select a.city_id from tf_staff_city a where a.staff_id = ' + #session['UserInfo'].staffId + ')'"/>
				<ww:iterator value="#select.selectList" status="belongDeptList">["<ww:property value="dept_id"/>", "<ww:property value="dept_name"/>"]<ww:if test="#belongDeptList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var belongDept = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: belongDeptData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.belongDept',
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
			        url:'/basearchives/employeeInfo/employee.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/basearchives/employeeInfo/employee.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: 'Ա�����',
			            name: 'search.staffCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: 'Ա������',
			            name: 'search.staffName',
			            width:100  
			        },sex,staffType,{
			        	xtype: 'textfield',
			            fieldLabel: '�������',
			            name: 'search.carNo',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },belongCompany,belongDept,{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��ְʱ��',
			            name: 'search.accessionDate',
			            width:100  
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��ְʱ��',
			            name: 'search.dimissionDate',
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
			        title: 'Ա����Ϣ��ѯ',
			        width: 300,
			        height:350,
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
		    <tt:authority value="TJYGXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���Ա����Ϣ','addEmployeeInfo','/basearchives/employeeInfo/employee.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(staffId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
					return;
				}else{
				   var url = '/basearchives/employeeInfo/employee.shtml?actionType=delete&search.staffInfoId='+staffId;
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
						alert("ɾ��Ա����Ϣ�������ɹ���");
						parent.document.ifrm_EmployeeInfo.window.location.reload();
					}else{
						alert("ɾ��Ա����Ϣ������ʧ�ܣ�");
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
	<tt:grid id="employeeinfo" value="employeeList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="Ա�����" width="100">
				<ww:if test="null != staff_info_id">
					<a href="javascript:parent.addTab('Ա����Ϣ', 'viewEmployeeInfo', '/basearchives/employeeInfo/employee.shtml?actionType=view&search.staffInfoId=<ww:property value="staff_info_id"/>','NO')"><ww:property value="staff_code"/></a>
				</ww:if>
			</tt:col>
			<tt:col name="Ա������" property="staff_name" width="100"/>
			<tt:col name="ϵͳ�û�" property="operator_name" width="70"/>
			<tt:col name="Ա���Ա�" property="sex2" visible="true" width="50"/>
			<tt:col name="Ա����ַ" property="address" visible="true" width="150"/>
			<tt:col name="Ա������" property="staffType" width="80"/>	
			<tt:col name="֤������" property="certificateType" visible="true" width="80"/>
			<tt:col name="֤����" property="certificate_no" visible="true" width="100"/>	
			<tt:col name="��ϵ�绰" property="link_phone" visible="true" width="80"/>	
			<tt:col name="������ϵ�绰" property="link_other" visible="true" width="80"/>	
			<tt:col name="�����ֻ�" property="sms_phone" width="80"/>		
			<tt:col name="������˾" property="belongCompany" width="120"/>
			<tt:col name="��������" property="belongDept" width="100"/>
			<tt:col name="���ƺ�" property="carNo" visible="true" width="100"/>
			<tt:col name="IC����" property="Ic_Code" visible="true" width="100"/>
			<tt:col name="��ְʱ��" property="accession_date" visible="true" width="80"/>
			<tt:col name="��ְʱ��" property="dimission_date" visible="true" width="80"/>
			<tt:col name="��������" property="cityId" width="80"/>	
			<tt:col name="��ע" property="memo" visible="true" width="100"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != staff_info_id">
					<tt:authority value="XGYGXX">
						<a href="javascript:parent.addTab('�޸�Ա����Ϣ', 'editEmployeeInfo', '/basearchives/employeeInfo/employee.shtml?actionType=edit&search.staffInfoId=<ww:property value="staff_info_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCYGXX">
						<a href="javascript:fun_delete(<ww:property value="staff_info_id"/>)">ɾ��</a>
					</tt:authority>
					    <a href="javascript:parent.addTab('����Ա����Ϣ', 'reEmployeeInfo', '/basearchives/employeeInfo/employee.shtml?actionType=renew&search.staffInfoId=<ww:property value="staff_info_id"/>','NO')">����</a>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>