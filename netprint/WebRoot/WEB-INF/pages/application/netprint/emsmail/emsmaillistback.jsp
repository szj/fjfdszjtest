<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%--
	 * EMS�ʼ���Ϣ����
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
			//ʡ
			provinceData = [
				<tt:setProperty name="#select.dynamicSql" value="'select the_code,the_name from td_province"/>
				<ww:iterator value="#select.selectList" status="provinceList">["<ww:property value="the_code"/>", "<ww:property value="the_name"/>"]<ww:if test="#provinceList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var province = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: provinceData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.pprovince',
				fieldLabel: '����ʡ��',
				name: 'test',
				width:100
			})	
			//��
			cityData = [
				<tt:setProperty name="#select.dynamicSql" value="'select the_code,the_name from td_citys where province_code=' + #session['UserInfo'].staffId+')'"/>
				<ww:iterator value="#select.selectList" status="cityList">["<ww:property value="the_code"/>", "<ww:property value="the_name"/>"]<ww:if test="#cityList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var city = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: cityData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.pcity',
				fieldLabel: '��������',
				name: 'test',
				width:100
			})	
			//��	
			countyData = [
				<tt:setProperty name="#select.dynamicSql" value="'select the_code,the_name from td_county where city_code=' + #session['UserInfo'].staffId+')'"/>
				<ww:iterator value="#select.selectList" status="countyList">["<ww:property value="the_code"/>", "<ww:property value="the_name"/>"]<ww:if test="#countyList.count != #select.selectList.size()">,</ww:if></ww:iterator>
			];
			var county = new Ext.form.ComboBox({
				valueField :"id",
				displayField: "text",
				store:new Ext.data.SimpleStore({
					fields: ["id", "text"],
					data: countyData
				}),
				editable:false,
				triggerAction: 'all',
				mode: 'local',
				blankText:'��ѡ��',
				emptyText:'��ѡ��',
				hiddenName:'search.pcounty',
				fieldLabel: '��������',
				name: 'test',
				width:100
			})	
			//==================���ϲ����齨============================
			
			//��ѯ����			
			Ext.onReady(function() {
			    var schForm = new Ext.form.FormPanel({
			        baseCls: 'x-plain',
			        method:'GET', 	//�ύ����
			        labelWidth: 100,//�ı���ǩ����
			        url:'/netprint/emsmail/emsmail.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/netprint/emsmail/emsmail.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '�ʼ���',
			            name: 'search.pmailno',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��ʼ����',
			            name: 'search.begincreate_date',
			            width:100  
			        },{
			            xtype: 'datefield',
			        	format: 'Y-m-d',
			            fieldLabel: '��������',
			            name: 'search.endcreate_date',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '����������',
			            name: 'search.psendname',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�����˵绰',
			            name: 'search.psendtel',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�ռ�������',
			            name: 'search.precname',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�ռ��˵绰',
			            name: 'search.prectel',
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
			        title: '�ͻ���Ϣ��ѯ',
			        width: 300,
			        height:270,
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
		//�󶨿ؼ���Ϣ
		Ext.onReady(function(){
			new Ext.Button({
		        text: '�� ѯ',
		        handler: showSearch
		    }).render(document.all.searchPanel);
		    <tt:authority value="AddEmsMail">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('���EMS�ʼ���Ϣ','addEmsMail','/netprint/emsmail/emsmail.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		    new Ext.Button({
		        text: '������ӡ',
		        handler: function(){
		        	parent.addTab('����EMS�ʼ���Ϣ','printEmsMail','/netprint/emsmail/emsmail.shtml?actionType=print','NO');
		        }
		    }).render(document.all.printPanel);
		})
		//ɾ������
		function fun_delete(id){
		    if (!confirm('��ȷ��ɾ������Ϣ!')){
				return;
			}else{
			   	var url = '/netprint/emsmail/emsmail.shtml?actionType=delete&search.pid='+id;
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
							alert("ɾ��EMS�ʼ��������ɹ���");
							parent.document.ifrm_EmsMail.window.location.reload();
						}else{
							alert("ɾ��EMS�ʼ�������ʧ�ܣ�");
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
	<div id="searchPanel" style="margin: 0px; float: left;"></div>
	<div id="addPanel" style="margin: 0px;float: left;"></div>
	<div id="printPanel" style="margin: 0px; width: 100px;"></div>
	<tt:grid id="emsmail" value="emsmailList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="�ʼ���" width="80">
				<ww:if test="null != id">
					<a href="javascript:parent.addTab('EMS�ʼ���Ϣ', 'viewEmsMail', '/netprint/emsmail/emsmail.shtml?actionType=view&search.pid=<ww:property value="id"/>','NO')">
						<ww:property value="mailno"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="�������ռľ�" property="sendoffice" width="80"/>			
			<tt:col name="����������" property="sendname" width="80"/>
			<tt:col name="�����˵绰" property="sendtel" width="80"/>	
			<tt:col name="�����˵�λ����" property="sendunit" width="80"/>	
			<tt:col name="�����˵�ַ" property="sendaddress" width="80"/>	
			<tt:col name="�ռ�������" property="recname" width="80"/>
			<tt:col name="�ռ��˵绰" property="rectel" width="80"/>	
			<tt:col name="�ռ��˵�λ����" property="recunit" width="80"/>	
			<tt:col name="�ռ��˵�ַ" property="recaddress" width="80"/>	
			<tt:col name="�ڼ�Ʒ��" property="sendgoodsname" width="80"/>		
			<tt:col name="������" property="create_manname" width="100" visible="true"/>
			<tt:col name="����ʱ��" property="create_date" width="75"/>
			<tt:col name="����" align="center" width="100">			
				<ww:if test="null != id">
					<tt:authority value="EditEmsMail">
						<a href="javascript:parent.addTab('�޸�EMS�ʼ���Ϣ', 'editEmsMail', '/netprint/emsmail/emsmail.shtml?actionType=edit&search.pid=<ww:property value="id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="DelEmsMail">
						<a href="javascript:fun_delete(<ww:property value="id"/>)">ɾ��</a>
					</tt:authority>
					    <a href="javascript:parent.addTab('��ӡEMS�ʼ���Ϣ', 'printEmsMail', '/netprint/emsmail/emsmail.shtml?actionType=print&search.pid=<ww:property value="id"/>','NO')">��ӡ</a>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</body>