<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<%--
	 * ���̶���
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
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			    	labelAlign: 'right', 
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/system/flower/flowerInfo.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/system/flower/flowerInfo.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '���̱��',
			            name: 'search.flowerdefineCode',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '��������',
			            name: 'search.flowerdefineName',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            fieldLabel: '������',
			            name: 'search.createMan',
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
			    <tt:authority value="TJPCXX">
			    new Ext.Button({
			        text: '�� ��',
			        handler: function(){
			        	parent.addTab('������̶�����Ϣ','addExpedite','/system/flower/flowerInfo.shtml?actionType=new','NO');
			        }
			    }).render(document.all.addPanel);
			    </tt:authority>
			})
		</c:if>
		
		function fun_delete(flowerdefineId){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/system/flower/flowerInfo.shtml?actionType=delete&search.flowerdefineId='+flowerdefineId;
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
							alert("ɾ�����̶�����Ϣ�������ɹ���");
							parent.document.ifrm_FlowerInfo.window.location.reload();
						}else{
							alert("ɾ�����̶�����Ϣ������ʧ�ܣ�");
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
	<tt:grid id="flowerDefine" value="flowerDefineList" pagination="true">
		<tt:row >
			<tt:col name="���̱��" width="120">
				<ww:if test="null != flowerdefine_id">
					<a href="javascript:parent.addTab('������Ϣ', 'viewFlowerInfo', '/system/flower/flowerInfo.shtml?actionType=view&search.flowerdefineId=<ww:property value="flowerdefine_id"/>','NO')">
						<ww:property value="flowerdefine_code"/>
					</a>
				</ww:if>
			</tt:col>			 		
			<tt:col name="��������" property="flowerdefine_name" width="120"/>			
			<tt:col name="���̰汾" property="flowerdefine_version" width="80"/>		
			<tt:col name="��������" property="city_name" width="100" />
			<tt:col name="����ʱ��" property="create_date" width="120"/>			
			<tt:col name="������" property="create_man_name" width="100"/>
			<c:if test="${param.action != 'report'}">
				<tt:col name="����" align="center" width="100">			
					<ww:if test="null != flowerdefine_id">
							<tt:authority value="XGPCXX">
								<a href="javascript:parent.addTab('�޸����̶���', 'editFlowerInfo', '/system/flower/flowerInfo.shtml?actionType=edit&search.flowerdefineId=<ww:property value="flowerdefine_id"/>','NO')">�޸�</a>
							</tt:authority>
							<tt:authority value="SCPCXX">
								<a href="javascript:fun_delete(<ww:property value="flowerdefine_id"/>)">ɾ��</a>
							</tt:authority>
					</ww:if>
				</tt:col>
			</c:if>
		</tt:row>
	</tt:grid> 
</body>