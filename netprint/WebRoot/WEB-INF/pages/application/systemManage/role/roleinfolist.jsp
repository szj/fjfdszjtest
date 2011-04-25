<%@ page language="java" errorPage="/error.jsp" pageEncoding="gbk" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%> 
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
		createStaffData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select distinct t.staff_name,t.staff_id from tf_operator t\""/>
				<ww:iterator value="#select.selectList" status="createStaffList">["<ww:property value="staff_id"/>", "<ww:property value="staff_name"/>"]<ww:if test="#createStaffList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var createStaff = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: createStaffData
				}),
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.createStaff',
				fieldLabel: '������',
				name: 'test',
				width:300
			})

			roleNameData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select Role_Id,Role_Name from td_role_info\""/>
				<ww:iterator value="#select.selectList" status="roleNameList">["<ww:property value="Role_Id"/>", "<ww:property value="Role_Name"/>"]<ww:if test="#roleNameList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var roleNameCombo = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: roleNameData
				}),
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.roleName',
				fieldLabel: 'ְ��Ȩ������',
				name: 'test',
				width:300
			})	
							 			
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/system/role/roleInfo.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/system/role/roleInfo.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: 'ְ��Ȩ������',
			            name: 'search.roleName',
			            width:100  
			        },{
			            fieldLabel: '������',
			            name: 'search.createStaff',
			            width:100  
			        }],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: 'ְ��Ȩ����Ϣ��ѯ',
			        width: 300,
			        height:180,
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
			<tt:authority value="CXJSXX">
			new Ext.Button({
		        text: '�� ѯ',
		        handler: showSearch
		    }).render(document.all.searchPanel);
		    </tt:authority>
		    <tt:authority value="TJJSXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���ְ��Ȩ����Ϣ','addRoleInfo','/system/role/roleInfo.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(roleId){
		 if (!confirm('��ȷ��ɾ������Ϣ!')){
					return;
				}else{
			var url = '/system/role/roleInfo.shtml?actionType=delete&search.roleId='+roleId;
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
						alert("ɾ��ְ��Ȩ����Ϣ�������ɹ���");
						parent.document.ifrm_UserRole.window.location.reload();
					}else{
						alert("ɾ��ְ��Ȩ����Ϣ������ʧ�ܣ�");
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
	<tt:grid id="roleInfo" value="roleInfoList" pagination="true" xls="false" >
		<tt:row >
			<tt:col name="ְ��Ȩ������" property="ROLE_NAME" width="100"/>						
			<tt:col name="������" property="createStaff" width="100"/>
			<tt:col name="ְ��Ȩ��˵��" property="CONTENT" width="100"/>			
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != ROLE_ID">
					<tt:authority value="JSQXFP">
					<a href="javascript:parent.addTab('����ְ��Ȩ��', 'editRoleInfo', '/system/role/roleallot.shtml?roleId=<ww:property value="ROLE_ID"/>&roleName=<ww:property value="ROLE_NAME"/>','NO')">Ȩ��</a>
					</tt:authority>
					<tt:authority value="XGJSXX">
					<a href="javascript:parent.addTab('�޸�ְ��Ȩ��', 'editRoleInfo', '/system/role/roleInfo.shtml?actionType=edit&search.roleId=<ww:property value="ROLE_ID"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCJSXX">
					<a href="javascript:fun_delete(<ww:property value="ROLE_ID"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>