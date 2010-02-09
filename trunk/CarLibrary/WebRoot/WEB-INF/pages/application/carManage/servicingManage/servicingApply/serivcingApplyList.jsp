<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<!-- 
	����ά������
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
			        url:'/carmanage/putonsteam/putonsteam.shtml',	
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/carmanage/servicingmanage/servicingApply.shtml';
			        	this.getEl().dom.submit();
			        },
			        items: [{
			        	xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '����ʱ��',
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
    	Ext.onReady(function(){
			new Ext.Button({
		        text: '�� ѯ',
		        handler: showSearch
		    }).render(document.all.searchPanel);
		    <tt:authority value="TJWXSQ">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���ά������','addMaintainApply','/carmanage/servicingmanage/servicingApply.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		
    	function fun_delete(maintainId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   var url = '/carmanage/servicingmanage/servicingApply.shtml?actionType=delete&search.maintainId='+maintainId;
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
							alert("ɾ������ά�����룬�����ɹ���");
							parent.document.ifrm_MaintainApply.window.location.reload();
						}else{
							alert("ɾ������ά�����룬����ʧ�ܣ�");
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
	
	<tt:grid id="servicingList" value="servicingList" pagination="true" xls="false">
		<tt:row>
			<tt:col name="���ݺ�" width="120">
				<ww:if test="null != maintain_id">
					<ww:if test="null != maintain_id">
					<a href="javascript:parent.addTab('����ά������', 'viewMaintainApply', '/carmanage/servicingmanage/servicingApply.shtml?actionType=view&search.maintainId=<ww:property value="maintain_id"/>','NO')">
						<ww:property value="maintain_id"/>
					</a>
				</ww:if>
				</ww:if>
			</tt:col>
			<tt:col name="ά��ʱ��" property="maintain_date" width="100"/>
			<tt:col name="ά�޳������" property="car_no_code" width="100"/>
			<tt:col name="������" property="proposer_name" width="100"/>
			<tt:col name="ά�޹�����(����)" property="maintain_mileage" width="100"/>
			<tt:col name="ά�޳�" property="coop_unit_name" width="100"/>
			<tt:col name="ά��ԭ��" property="maintain_excuse" width="100"/>
			<tt:col name="����" width="100">
				<ww:if test="null != maintain_id">
					<ww:if test="maintain_state == 1">
						<tt:authority value="XGWXSQ">
							<a href="javascript:parent.addTab('�޸ĳ���ά������', 'editMaintainApply', '/carmanage/servicingmanage/servicingApply.shtml?actionType=edit&search.maintainId=<ww:property value="maintain_id"/>','NO')">�޸�</a>
						</tt:authority>
						<tt:authority value="SCWXSQ">
							<a href="javascript:fun_delete(<ww:property value="maintain_id"/>)">ɾ��</a>
						</tt:authority>
					</ww:if>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid>
</body>