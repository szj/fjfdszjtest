<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%--
	 * �ռ�����Ϣ���� 
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
				<tt:setProperty name="#select.dynamicSql" value="\"select the_code,the_name from td_province\""/>
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
			        url:'/netprint/clientmsg/recclientmsg.shtml',	
			        defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			        defaults: {width: 100}, 	//Ĭ�Ͽ��
					onSubmit:Ext.emptyFn,
			        submit:function(){
			        	this.getEl().dom.action='/netprint/clientmsg/recclientmsg.shtml';
			        	this.getEl().dom.submit();
			        },
			       items: [{
			            fieldLabel: '�ռ����û�����',
			            name: 'search.pcode',
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
			            fieldLabel: '�ռ�������',
			            name: 'search.pname',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�ռ�����ϵ�绰',
			            name: 'search.ptel',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�ռ��˵�ַ',
			            name: 'search.paddress',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },new Ext.form.Hidden({//hidden  
               			id:'search.pbill_sort',
                		name:'search.pbill_sort',
                		value:0
                    })],
			        buttons: [{
			            text: '��ѯ',
			            handler: function(){
			            	schForm.form.submit(); 
			            }
			        }]
			    });
			
			    var window = new Ext.Window({
			        title: '�ռ�����Ϣ��ѯ',
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
		    <tt:authority value="AddRecClientMsg">
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('����ռ�����Ϣ','addRecClientMsg','/netprint/clientmsg/recclientmsg.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		    </tt:authority>
		})
		//ɾ������
		function fun_delete(id){
			Ext.MessageBox.confirm('��ʾ', '��ȷ��ɾ������Ϣ!', function(btn) {
				if (btn == 'yes'){			    
				   	var url = '/netprint/clientmsg/recclientmsg.shtml?actionType=delete&search.pid='+id;
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
								Ext.MessageBox.alert('��ʾ', 'ɾ���ռ�����Ϣ�������ɹ���', function(btn) {
								     parent.document.ifrm_RecClientMsg.window.location.reload();
								});	
							}else{
							    Ext.MessageBox.alert('��ʾ', 'ɾ���ռ�����Ϣ������ʧ�ܣ�');
							}
						}
					}catch(e){ 
						alert(e);
					}							    
				}
			});
		}
	</script>
</head>
<body>
	<div id="searchPanel" style="margin: 0px;width: 100px; float: left;"></div>
	<div id="addPanel" style="margin: 0px; width: 100px;"></div>
	<tt:grid id="clientmsg" value="clientmsgList" pagination="true" xls="false">
		<tt:row >
			<tt:col name="�ռ����û�����" width="80">
				<ww:if test="null != id">
					<a href="javascript:parent.addTab('�ռ�����Ϣ', 'viewRecClientMsg', '/netprint/clientmsg/recclientmsg.shtml?actionType=view&search.pid=<ww:property value="id"/>','NO')">
						<ww:property value="code"/>
					</a>
				</ww:if>
			</tt:col>
			<tt:col name="�ռ�������" property="name" width="80"/>			
			<tt:col name="�ռ��˵�λ" property="unit" width="80"/>
			<tt:col name="�ռ����ؼ�" property="countyname" width="80"/>	
			<tt:col name="�ռ�����ϸ��ַ" property="address" width="80"/>	
			<tt:col name="�ռ�����ϵ�绰" property="tel" width="80"/>		
			<tt:col name="�ռ����ʱ�" property="post" width="80"/>		
			<tt:col name="������" property="create_manname" width="100" visible="true"/>
			<tt:col name="����ʱ��" property="create_date" width="75"/>
			<tt:col name="����" align="center" width="100">			
				<ww:if test="null != id">
					<tt:authority value="EditRecClientMsg">
						<a href="javascript:parent.addTab('�޸��ռ�����Ϣ', 'editRecClientMsg', '/netprint/clientmsg/recclientmsg.shtml?actionType=edit&search.pid=<ww:property value="id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="DelRecClientMsg">
						<a href="javascript:fun_delete(<ww:property value="id"/>)">ɾ��</a>
					</tt:authority>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
	<input type='hidden' name='search.pbill_sort' value='0'/>
</body>