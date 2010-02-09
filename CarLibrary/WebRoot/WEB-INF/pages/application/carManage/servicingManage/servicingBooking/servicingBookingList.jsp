<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	����ά�޵Ǽ�
 -->
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
    		var coopUnitTree = new Ext.form.TreeField({
					minListHeight:200,
					dataUrl : '/basearchives/recunit/ajaxRecunit.shtml',
		            hiddenName : 'search.coopUnitId',
		            valueField : 'id',
		            fieldLabel : 'ά�޳�',
		            value : '',
		            treeRootConfig : {
		            	id:'',   
				        text : '��ѡ��',   
				        draggable:false  
		            }
			});
			
    		Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        labelAlign: 'right', 
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/servicingmanage/servicingApply.shtml';
			        	this.getEl().dom.submit();
			        },
			        items: [{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: ' ά��ʱ��',
			            name: 'search.begMaintainDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	labelSeparator:'',
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '',
			            name: 'search.endMaintainDate',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },coopUnitTree,{
			        	xtype: 'textfield',
			            fieldLabel: 'ά�޳������',
			            name: 'search.carNoCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '������',
			            name: 'search.proposer',
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
			        title: '����ά�������ѯ',
			        width: 300,
			        height:230,
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
    	function fun_delete(maintainId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   var url = '/carmanage/servicingmanage/servicingBooking.shtml?actionType=delete&search.maintainId='+maintainId;
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
							alert("ɾ������ά�޼�¼�������ɹ���");
							parent.document.ifrm_MaintainBooking.window.location.reload();
						}else{
							alert("ɾ������ά�޼�¼������ʧ�ܣ�");
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
	
	<tt:grid id="servicingList" value="servicingList" pagination="true" xls="true">
		<tt:row>
			<tt:col name="���ݺ�" width="120">
				<ww:if test="null != maintain_id">
					<ww:if test="maintain_state == 1">
						<a href="javascript:parent.addTab('����ά����Ϣ', 'viewMaintainApply', '/carmanage/servicingmanage/servicingApply.shtml?actionType=view&search.maintainId=<ww:property value="maintain_id"/>','NO')">
							<ww:property value="maintain_id"/>
						</a>
					</ww:if>
					<ww:if test="maintain_state == 2">
						<a href="javascript:parent.addTab('����ά����Ϣ', 'viewMaintainBooking', '/carmanage/servicingmanage/servicingBooking.shtml?actionType=view&search.maintainId=<ww:property value="maintain_id"/>','NO')">
							<ww:property value="maintain_id"/>
						</a>
					</ww:if>
				</ww:if>
			</tt:col>
			<tt:col name="ά��ʱ��" property="maintain_date" width="100"/>
			<tt:col name="ά�����ʱ��" property="maintain_end_date" width="100"/>
			<tt:col name="���(Ԫ)" property="charge" width="60"/>
			<tt:col name="ά�޳������" property="car_no_code" width="100"/>
			<tt:col name="������" property="proposer_name" width="100"/>
			<tt:col name="ά�޹�����(����)" property="maintain_mileage" width="100"/>
			<tt:col name="ά�޳�" property="coop_unit_name" width="100"/>
			<tt:col name="ά��ԭ��" property="maintain_excuse" width="100"/>
			<c:if test="${param.action != 'report'}">
				<tt:col name="����" width="100">
					<ww:if test="null != maintain_id">
						<ww:if test="maintain_state == 1">
							<tt:authority value="TJWXDJ">
								<a href="javascript:parent.addTab('����ά�޵Ǽ�', 'newMaintainBooking', '/carmanage/servicingmanage/servicingBooking.shtml?actionType=new&search.maintainId=<ww:property value="maintain_id"/>','NO')">�Ǽ�</a>
							</tt:authority>
						</ww:if>
						<ww:if test="maintain_state == 2">
							<tt:authority value="XGWXDJ">
								<a href="javascript:parent.addTab('�޸ĳ���ά�޵Ǽ�', 'editMaintainBooking', '/carmanage/servicingmanage/servicingBooking.shtml?actionType=edit&search.maintainId=<ww:property value="maintain_id"/>','NO')">�޸�</a>
							</tt:authority>
							<%-- <a href="javascript:fun_delete('<ww:property value="maintain_id"/>')">ɾ��</a> --%>
						</ww:if>
					</ww:if>
				</tt:col>
			</c:if>
		</tt:row>
	</tt:grid>
</body>