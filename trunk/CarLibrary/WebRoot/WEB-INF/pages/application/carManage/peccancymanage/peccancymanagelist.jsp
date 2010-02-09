<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%--
	 * Υ�¹���
 	 * @author FANGZL 
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
			 peccancyCompanyData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'PECCANCY_TYPE' and para_name = 'PECCANCY_TYPE'\""/>
				<ww:iterator value="#select.selectList" status="belongCompanyList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#belongCompanyList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var peccancyCompany = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: peccancyCompanyData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.peccancyType',
				fieldLabel: 'Υ������',
				name: 'test',
				width:100
			})						
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/carmanage/peccancymanage/peccancymanage.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/peccancymanage/peccancymanage.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: 'Υ�µص�',
			            name: 'search.peccancyAddress',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: 'Υ������',
			            name: 'search.begPeccancyDate',
			            width:100  
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endPeccancyDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },peccancyCompany,cityId],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: 'Υ�²�ѯ',
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
		<c:if test="${param.action != 'report'}">
		Ext.onReady(function(){
			new Ext.Button({
		        text: '�� ѯ',
		        handler: showSearch
		    }).render(document.all.searchPanel);
		    <tt:authority value="TJWZXX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���Υ����Ϣ','addInsurance','/carmanage/peccancymanage/peccancymanage.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		</c:if>
		
		function fun_delete(peccancyId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/carmanage/peccancymanage/peccancymanage.shtml?actionType=delete&search.peccancyId='+peccancyId;
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
							alert("ɾ��Υ����Ϣ�������ɹ���");
							parent.document.ifrm_PeccancyManage.window.location.reload();
						}else{
							alert("ɾ��Υ����Ϣ������ʧ�ܣ�");
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
	<tt:grid id="peccancy" value="peccancyList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="��������" width="80">
				<ww:if test="null != peccancy_id">
					<a href="javascript:parent.addTab('Υ����Ϣ', 'viewPeccancy', '/carmanage/peccancymanage/peccancymanage.shtml?actionType=view&search.peccancyId=<ww:property value="peccancy_id"/>','NO')">
						<ww:property value="peccancy_booking_date"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="Υ������" property="peccancy_type_desc" width="80"/>			
			<tt:col name="Υ������" property="peccancy_date" width="80"/>			
			<tt:col name="�������" property="car_no_code" width="80"/>		
			<tt:col name="Υ�µص�" property="peccancy_address" width="100" />
			<tt:col name="Υ������" property="peccancy_context" width="75"/>			
			<tt:col name="��������" property="city_name" width="80"/>
			<c:if test="${param.action != 'report'}">
				<tt:col name="����" align="center" width="100">			
					<ww:if test="null != peccancy_id">
						<tt:authority value="XGWZXX">
							<a href="javascript:parent.addTab('�޸�Υ����Ϣ', 'editInsurance', '/carmanage/peccancymanage/peccancymanage.shtml?actionType=edit&search.peccancyId=<ww:property value="peccancy_id"/>','NO')">�޸�</a>
						</tt:authority>
						<tt:authority value="SCWZXX">
							<a href="javascript:fun_delete(<ww:property value="peccancy_id"/>)">ɾ��</a>
						</tt:authority>
					</ww:if>
				</tt:col>
			</c:if>
		</tt:row>
	</tt:grid> 
</body>