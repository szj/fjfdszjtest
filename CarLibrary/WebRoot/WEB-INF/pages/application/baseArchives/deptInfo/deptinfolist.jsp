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
    <script type="text/javascript" src="/js/TreeField.js"></script>
    <script language="javascript">
		function showSearch(){
			var belongCompanyTree = new Ext.form.TreeField({
					minListHeight:200,
					dataUrl : '/basearchives/institution/ajaxInstitution.shtml',
		            hiddenName : 'search.belongCompany',
		            valueField : 'id',
		            fieldLabel : '������˾',
		            treeRootConfig : {
		            	id:'',   
				        text : '��ѡ��',   
				        draggable:false  
		            },
		            displayValue:'',
		            value:''
			});
			
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
			        url:'/basearchives/deptInfo/deptInfo.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/basearchives/deptInfo/deptInfo.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '���ű��',
			            name: 'search.deptCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '��������',
			            name: 'search.deptName',
			            width:100  
			        },belongCompanyTree,cityId],
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
			        height:200,
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
		    <tt:authority value="TJBMXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('��Ӳ�����Ϣ','addDeptInfo','/basearchives/deptInfo/deptInfo.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(deptId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   var url = '/basearchives/deptInfo/deptInfo.shtml?actionType=delete&search.deptId='+deptId;
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
							parent.document.ifrm_DeptInfoManage.window.location.reload();
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
	<tt:grid id="deptinfo" value="deptInfoList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="���ű��" property="dept_code" width="100"/>
			<tt:col name="��������" property="dept_name" width="100"/>			
			<tt:col name="������˾" property="belongCompany" width="100"/>
			<tt:col name="��������" property="cityId" width="100"/>	
			<tt:col name="��ע" property="memo" width="100"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != dept_id">
					<tt:authority value="XGBMXX">
						<a href="javascript:parent.addTab('�޸Ĳ�����Ϣ', 'editDeptInfo', '/basearchives/deptInfo/deptInfo.shtml?actionType=edit&search.deptId=<ww:property value="dept_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCBMXX">
						<a href="javascript:fun_delete(<ww:property value="dept_id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>