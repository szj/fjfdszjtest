<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%--
	 * ˾���г��Ǽ�
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
    <script type="text/javascript" src="/js/TreeField.js"></script>
    <script language="javascript">
		function showSearch(){	
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			    	labelAlign: 'right', 
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/carmanage/expedite/driversms.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/expedite/driversms.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '˾��',
			            name: 'search.driverStaffName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '˾���ֻ�',
			            name: 'search.driverMobile',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '���ƺ�',
			            name: 'search.carMark',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' �յ�ʱ��',
			            name: 'search.begintransferDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endtransferDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        }],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '�ɳ���ѯ',
			        width: 300,
			        height:250,
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
		    <tt:authority value="Driversms_Add">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���˾���г���Ϣ','adddriversms','/carmanage/expedite/driversms.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
		function fun_delete(driversmsId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/carmanage/expedite/driversms.shtml?actionType=delete&search.driversmsId='+driversmsId;
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
							alert("ɾ���г���¼�������ɹ���");
							parent.document.ifrm_Driversms.window.location.reload();
						}else{
							alert("ɾ���г���¼������ʧ�ܣ�");
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
	<tt:grid id="driversms" value="driversmsList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="���ݺ�" width="135">
				<ww:if test="null != driversms_id">
					<a href="javascript:parent.addTab('�г��Ǽ���Ϣ', 'viewdriversms', '/carmanage/expedite/driversms.shtml?actionType=view&search.driversmsId=<ww:property value="driversms_id"/>','NO')">
						<ww:property value="driversms_id"/>
					</a>
				</ww:if>
			</tt:col>	
			<tt:col name="���ƺ�" property="car_mark" width="80" />
			<tt:col name="˾��" property="driver_staffname" width="80" />
			<tt:col name="˾���ֻ�" property="driver_mobile" width="80" visible="true"/>								 		
			<tt:col name="���" property="first_locus" width="80" />	
			<tt:col name="���ʱ��" property="first_date" width="80" visible="true"/>
			<tt:col name="��ʼ���" property="first_mileage" width="80" visible="true"/>
			<tt:col name="�յ�" property="transfer_locur" width="80"/>
			<tt:col name="�յ�ʱ��" property="transfer_date" width="80" visible="true"/>		
			<tt:col name="�س����" property="transfer_mileage" width="80" visible="true"/>	
			<tt:col name="��ʻ���" property="run_mileage" width="80" visible="true"/>	
			<tt:col name="������" property="use_oil_num" width="80"/>
			<tt:col name="���ͽ��" property="use_oil_charge" width="80"/>
			<tt:col name="·�ŷ�" property="road_charge" width="80"/>
			<tt:col name="ס�޷�" property="reside_charge" width="80"/>		
			<tt:col name="ͣ����" property="stopcar_charge" width="80" visible="true"/>	
			<tt:col name="ϴ����" property="washcar_charge" width="80" visible="true" />
				<tt:col name="����" align="center" width="100">			
					<ww:if test="null != driversms_id">
					  		<tt:authority value="Driversms_Update">
					  			<a href="javascript:parent.addTab('�޸��г���¼', 'updatedriversms', '/carmanage/expedite/driversms.shtml?actionType=edit&search.driversmsId=<ww:property value="driversms_id"/>','NO')">�޸�</a>
					  		</tt:authority>
					  		<tt:authority value="Driversms_Delete">
					  		    <a href="javascript:fun_delete(<ww:property value="driversms_id"/>)">ɾ��</a>
					    	</tt:authority>
					</ww:if>
				</tt:col>

		</tt:row>
	</tt:grid> 
</body>