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
				hiddenName:'userInfo.cityId',
				fieldLabel: '��������',
				name: 'test',
				width:100
			})							
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/system/manage/manager.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/system/manage/manager.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '����Ա����',
			            name: 'userInfo.staffNo',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '����Ա����',
			            name: 'userInfo.staffName',
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
			        title: 'ϵͳ����Ա��ѯ',
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
			new Ext.Button({
		        text: '�� ѯ',
		        handler: showSearch
		    }).render(document.all.searchPanel);
		    <tt:authority value="TJXTYWXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('��ӹ���Ա��Ϣ','addDeptInfo','/system/manage/manager.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(staffId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/system/manage/manager.shtml?actionType=delete&userInfo.staffId='+staffId;
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
							alert("ɾ������Ա��Ϣ�������ɹ���");
							parent.document.ifrm_SystemManager.window.location.reload();
						}else{
							alert("ɾ������Ա��Ϣ������ʧ�ܣ�");
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
	<tt:grid id="userInfo" value="userList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="����" property="staffNo" width="100"/>
			<tt:col name="�û���" property="staffName" width="100"/>
			<tt:col name="��ϵ�绰" property="phone" width="100"/>
			<tt:col name="ע��ʱ��" property="registerTime" width="100"/>
			<tt:col name="��������" property="cityName" width="100"/>
			<tt:col name="����" align="center" width="140">
				<ww:if test="null != staffId">
					<tt:authority value="XTYHGXQYFP">
						<a href="javascript:parent.addTab('�����Ͻ����', 'areaAllot', '/system/manage/manager.shtml?actionType=city&userInfo.staffId=<ww:property value="staffId"/>&userInfo.staffNo=<ww:property value="staffNo"/>&userInfo.staffName=<ww:property value="staffName"/>', 'NO')">����</a>
					</tt:authority>
					<tt:authority value="XTYHJSFP">
						<a href="javascript:parent.addTab('�����û���', 'roleAllot', '/system/manage/manager.shtml?actionType=role&userInfo.staffId=<ww:property value="staffId"/>&userInfo.staffNo=<ww:property value="staffNo"/>&userInfo.staffName=<ww:property value="staffName"/>', 'NO')">�û���</a>
					</tt:authority> 
					<tt:authority value="XGXTWHXX">
						<a href="javascript:parent.addTab('�޸�ϵͳ����Ա��Ϣ', 'editSystemManager', '/system/manage/manager.shtml?actionType=edit&userInfo.staffId=<ww:property value="staffId"/>', 'NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCXTYWXX">
						<a href="javascript:fun_delete(<ww:property value="staffId"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid>	
</body>