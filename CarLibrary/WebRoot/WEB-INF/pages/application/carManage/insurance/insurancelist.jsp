<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%--
	 * ���չ���
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
			 insuranceCompanyData = [
				<tt:setProperty name="#select.dynamicSql" value="\"select * from td_system_para where para_type = 'INSURANCE_PARA' and para_name = 'INSURANCE_AGENT'\""/>
				<ww:iterator value="#select.selectList" status="belongCompanyList">["<ww:property value="PARA_VALUE"/>", "<ww:property value="PARA_VALUE_DESC"/>"]<ww:if test="#belongCompanyList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var insuranceCompany = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: insuranceCompanyData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.insuranceAgent',
				fieldLabel: '���չ�˾',
				name: 'test',
				width:100
			})						
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/carmanage/insurance/insurance.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/insurance/insurance.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '��������',
			            name: 'search.insurant',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '���տ�ʼ����',
			            name: 'search.beginDate',
			            width:100  
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '���ս�������',
			            name: 'search.endDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },insuranceCompany,cityId],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '���ղ�ѯ',
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
		    <tt:authority value="TJCLBX">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('��ӱ�����Ϣ','addInsurance','/carmanage/insurance/insurance.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(insuranceId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/carmanage/insurance/insurance.shtml?actionType=delete&search.insuranceId='+insuranceId;
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
							parent.document.ifrm_CarInsurance.window.location.reload();
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
	<tt:grid id="insurance" value="insuranceList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="��������" width="80">
				<ww:if test="null != insurance_id">
					<a href="javascript:parent.addTab('������Ϣ', 'viewInsurance', '/carmanage/insurance/insurance.shtml?actionType=view&search.insuranceId=<ww:property value="insurance_id"/>','NO')">
						<ww:property value="booking_date"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="��������" property="insurant" width="80"/>			
			<tt:col name="���տ�ʼ����" property="begin_date" width="80"/>
			<tt:col name="���ս�������" property="end_date" width="80"/>	
			<tt:col name="���ճ������" property="carNoId" width="80"/>		
			<tt:col name="��;" property="purpose" width="100" visible="true"/>
			<tt:col name="���ս��" property="insurance_charge" width="75"/>
			<tt:col name="���շ�" property="insurance_fee" width="75"/>
			<tt:col name="���չ�˾" property="insuranceAgent" width="100"/>
			<tt:col name="��������" property="cityName" width="80"/>
			<tt:col name="����" align="center" width="100">			
				<ww:if test="null != insurance_id">
					<tt:authority value="XGCLBX">
						<a href="javascript:parent.addTab('�޸ı�����Ϣ', 'editInsurance', '/carmanage/insurance/insurance.shtml?actionType=edit&search.insuranceId=<ww:property value="insurance_id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="XCCLBX">
						<a href="javascript:fun_delete(<ww:property value="insurance_id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>