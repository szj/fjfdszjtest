<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%--
 * ������λ��Ϣ����
 * @author zhengmh 
--%>
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
		   coopUnitTypeData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'COOP_UNIT_INFO' and para_name = 'COOP_UNIT_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="coopUnitTypeList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#coopUnitTypeList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var coopUnitType = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: coopUnitTypeData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.coopUnitType',
				fieldLabel: '������λ���',
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
			        url:'/basearchives/recunit/recunit.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/basearchives/recunit/recunit.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '������λ���',
			            name: 'search.coopUnitCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '������λ����',
			            name: 'search.coopUnitName',
			            width:100  
			        },{
			            fieldLabel: '������λ���',
			            name: 'search.unitEasyName',
			            width:100  
			        },coopUnitType,cityId],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '������λ��ѯ',
			        width: 300,
			        height:220,
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
		    <tt:authority value="TJLWDWXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���������λ��Ϣ','addRecUnit','/basearchives/recunit/recunit.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		   	</tt:authority>
		})
		
		function fun_delete(coopUnitId){
		 if (!confirm('��ȷ��ɾ������Ϣ!')){
					return;
				}else{
			var url = '/basearchives/recunit/recunit.shtml?actionType=delete&search.coopUnitId='+coopUnitId;
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
						alert("ɾ��������λ��Ϣ�������ɹ���");
						parent.document.ifrm_ComeandgoUnitInfo.window.location.reload();
					}else{
						alert("ɾ��������λ��Ϣ������ʧ�ܣ�");
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
	<tt:grid id="recunit" value="recunitList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="������λ���" width="100">
				<ww:if test="null != coop_unit_id">
					<a href="javascript:parent.addTab('������λ��Ϣ', 'viewRecUnit', '/basearchives/recunit/recunit.shtml?actionType=view&search.coopUnitId=<ww:property value="coop_unit_id"/>','NO')">
						<ww:property value="coop_unit_code"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="������λ����" property="coop_unit_name" width="100"/>			
			<tt:col name="������λ���" property="unit_easy_name" width="100" visible="true"/>
			<tt:col name="������λ���" property="coopUnitType" width="100"/>
			<tt:col name="�绰" property="phone" width="80"/>			
			<tt:col name="����" property="fax" width="80"/>			
			<tt:col name="��ϵ��" property="link_man" width="80"/>
			<tt:col name="��ϵ�绰" property="link_man_phone" width="80"/>
			<tt:col name="��������" property="cityId" width="80"/>
			<tt:col name="��ע" property="memo" visible="true" width="100"/>
			<tt:col name="����" align="center" width="100">
				<ww:if test="null != coop_unit_id">
					<tt:authority value="XGLWDWXX">
						<a href="javascript:parent.addTab('�޸�������λ��Ϣ', 'editRecUnit', '/basearchives/recunit/recunit.shtml?actionType=edit&search.coopUnitId=<ww:property value="coop_unit_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="SCLWDWXX">
						<a href="javascript:fun_delete(<ww:property value="coop_unit_id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>