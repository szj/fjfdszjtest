<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<%--
	 * �ɳ��Ǽ�
 	 * @author FANGZL 
--%>
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
			
			//����
			var belongCompanyTree = new Ext.form.TreeField({
					minListHeight:200,
					dataUrl : '/basearchives/deptInfo/ajaxDeptInfo.shtml',
		            hiddenName : 'search.deptId',
		            valueField : 'id',
		            fieldLabel: '�ó�����',
		            treeRootConfig : {
		            	id:'',   
				        text : '��ѡ��',   
				        draggable:false  
		            },
		            value:''
			});
							
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			    	labelAlign: 'right', 
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/carmanage/expedite/expedite.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/expedite/expedite.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [belongCompanyTree,{
			            fieldLabel: '�������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�ɳ���',
			            name: 'search.expediteMan',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�ó���',
			            name: 'search.useCarMan',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '��ʻԱ',
			            name: 'search.driver',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' ��������',
			            name: 'search.begExpediteDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endExpediteDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '�ɳ����뵥���',
			            name: 'search.expediteapplyId',
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
			})
		</c:if>
		
		function fun_delete(expediteCarId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/carmanage/expedite/expedite.shtml?actionType=delete&search.expediteCarId='+expediteCarId;
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
							alert("ɾ���ɳ���Ϣ�������ɹ���");
							parent.document.ifrm_ExpediteCarBooking.window.location.reload();
						}else{
							alert("ɾ���ɳ���Ϣ������ʧ�ܣ�");
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
	<tt:grid id="expedite" value="expediteList" pagination="true" xls="true">
		<tt:row >
			<tt:col name="���ݺ�" width="120">
				<ww:if test="null != expedite_car_id">
					<a href="javascript:parent.addTab('�ɳ���Ϣ', 'viewExpedite', '/carmanage/expedite/expedite.shtml?actionType=view&search.expediteCarId=<ww:property value="expedite_car_id"/>&search.expediteapplyId=<ww:property value="expediteapply_id"/>','NO')">
						<ww:property value="expedite_car_id"/>
					</a>
				</ww:if>
			</tt:col>			 		
			<tt:col name="�ɳ�����" property="expedite_date" width="120"/>			
			<tt:col name="�ɳ���" property="expedite_man_name" width="80"/>		
			<tt:col name="�ó�����" property="dept_name" width="100" />
			<tt:col name="�ó���" property="use_car_man_name" width="75"/>			
			<tt:col name="�������" property="car_no_code" width="80"/>			
			<tt:col name="��ʻԱ" property="driver_name" width="80"/>
			<tt:col name="��ʼ���(����)" property="init_mileage" width="90"/>
			<tt:col name="Ԥ�ƻس�ʱ��" property="intending_date" width="120"/>

			<c:if test="${param.action != 'report'}">
				<tt:col name="����" align="center" width="100">			
					<ww:if test="null != expedite_car_id">
						<ww:if test="expedite_state == 1">
							<tt:authority value="XGPCXX">
								<a href="javascript:parent.addTab('�޸��ɳ���Ϣ', 'editExpedite', '/carmanage/expedite/expedite.shtml?actionType=edit&search.expediteCarId=<ww:property value="expedite_car_id"/>&search.expediteapplyId=<ww:property value="expediteapply_id"/>','NO')">�޸�</a>
							</tt:authority>
						</ww:if>
					</ww:if>
				</tt:col>
			</c:if>
		</tt:row>
	</tt:grid> 
</body>