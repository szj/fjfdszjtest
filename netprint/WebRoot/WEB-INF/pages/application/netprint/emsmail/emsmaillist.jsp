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
    
   //��֤��ӡ����
   function  pagenumregexp(obj){
        var patrn=/^[0-9]*[1-9][0-9]*$/;
        var value=obj.value;
        if (!patrn.exec(value)) 
        {
	        Ext.MessageBox.alert('��ʾ', '���������͵Ĵ�ӡ����!');
	        return false;
        }  
		return true;
   }
   
   
        //ȫѡ��ѡ��
    	function chk_all(flag){
			var obj = $(searchpid);
			if (obj != null){
				if (obj.length > 1){
					for (var i=0; i<obj.length; i++){
						obj[i].checked = flag;
					}
				}else{
					obj.chekced = flag;
				}
			}
		}
		//��ѯ
		function showSearch(){
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
			            fieldLabel: '�ļ�������',
			            name: 'search.psendname',
			            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        },{
			        	xtype: 'textfield',
			            fieldLabel: '�ļ��˵绰',
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
		            var obj = $(searchpid);
		            var value="";
		            var flag=0;
		            //��ϴ�ӡ���ݵ��ַ���
		            if (obj != null){
						if (obj.length > 1){
							for (var i=0; i<obj.length; i++){
								if(obj[i].checked == true)
								{
								  flag=1;
								  value=value+obj[i].value+',';
								}
							}
						}else{
						    if(obj.chekced == true)
						    {
						      flag=1;
						      value=obj;
						    }
						}
					}
					if(flag==1)
					{
					   if(value.charAt(value.length-1)==',')
					   {
					      value=value.substr(0,value.length-1);
					      //Ext.MessageBox.alert('��ʾ',value);
					   }
					   //printoxc('http://172.30.193.28:8080/ocxprint.shtml?actionType=ocxprint&search.pid='+value);
					   parent.addTab('����EMS�ʼ���Ϣ','printEmsMail','/ocxprint.shtml?actionType=ocxprint&search.printtype=2&search.pagenum=1&search.pid='+value,'NO');
					   //parent.addTab('����EMS�ʼ���Ϣ','printEmsMail','/netprint/emsmail/emsmail.shtml?actionType=ocxprint&search.pid='+value,'NO');
					   //window.open("/netprint/emsmail/emsmail.shtml?actionType=pageprint&search.pid="+value);
					   //,"","toolbars=0,scrollbars=0,location=0,statusbars=0,menubars=0,resizable=0,width=100,height=100"
					}else{
					   Ext.MessageBox.alert('��ʾ', '����ѡ��һ���ӡ��');
					}
		        }
		    }).render(document.all.printPanel);
		    
		    
		    new Ext.Button({
		        text: '����ɾ��',
		        handler: function(){
		        Ext.MessageBox.confirm('��ʾ', '��ȷ��ɾ������Ϣ!', function(btn) {
				if (btn == 'yes'){	
				
				
				
		        
		        
		        
		        
		            var obj = $(searchpid);
		            var value="";
		            var flag=0;
		            //��ϴ�ӡ���ݵ��ַ���
		            if (obj != null){
						if (obj.length > 1){
							for (var i=0; i<obj.length; i++){
								if(obj[i].checked == true)
								{
								  flag=1;
								  value=value+obj[i].value+',';
								}
							}
						}else{
						    if(obj.chekced == true)
						    {
						      flag=1;
						      value=obj;
						    }
						}
					}
					if(flag==1)
					{
					   if(value.charAt(value.length-1)==',')
					   {
					      value=value.substr(0,value.length-1);
					   }
					  
					  	var url = '/netprint/emsmail/emsmail.shtml?actionType=deleteall&search.pid='+value;
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
									Ext.MessageBox.alert('��ʾ', 'ɾ��EMS�ʼ��������ɹ���', function(btn) {
									    parent.document.ifrm_EmsMail.window.location.reload();
									});	
								}else{
								    Ext.MessageBox.alert('��ʾ', 'ɾ��EMS�ʼ�������ʧ�ܣ�');
								}
							}
						}catch(e){ 
							alert(e);
						}
					  
					}else{
					   Ext.MessageBox.alert('��ʾ', '����ѡ��һ���ӡ��');
					}						    
				}
			});
				
		        }
		    }).render(document.all.delAllPanel);
		    
		    new Ext.Button({
		        text: 'ȫ ѡ',
		        handler: function(){
		        	chk_all(true);
		        }
		    }).render(document.all.selectAllPanel);
		    
		    new Ext.Button({
		        text: 'ȡ ��',
		        handler: function(){
		        	chk_all(false);
		        }
		    }).render(document.all.cancelAllPanel);
 
		})

		//ɾ������
		function fun_delete(id){
			Ext.MessageBox.confirm('��ʾ', '��ȷ��ɾ������Ϣ!', function(btn) {
				if (btn == 'yes'){			    
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
								Ext.MessageBox.alert('��ʾ', 'ɾ��EMS�ʼ��������ɹ���', function(btn) {
								    parent.document.ifrm_EmsMail.window.location.reload();
								});	
							}else{
							    Ext.MessageBox.alert('��ʾ', 'ɾ��EMS�ʼ�������ʧ�ܣ�');
							}
						}
					}catch(e){ 
						alert(e);
					}							    
				}
			});
		}
		
		//��ӡ����
		function printoxc(url)
		{
			//��һ����Ϊ����ģ��汾�ţ��ڶ�������Ϊ����ģ���ļ�������������Ϊ�����ļ����ƣ������ֶ�Ϊ�ϱ߾࣬�����ֶ�Ϊ��߾࣬��������Ϊbase64������
			//	edit1.value=aa.printdata('1.0','http://localhost:8080/x.fr3','x',20,20,document.all("RMVIEWER_DATA").value);
			aa.printxml('1.0','http://172.30.193.28:8080/x.fr3','x',0,0,url);
			//aa.printxml('1.0','http://172.30.193.28:8080/x.fr3','x',0,0,'http://172.30.193.28:8080/my.xml');
		}
	</script>
</head>
<body>
<OBJECT id="aa"
	  classid="clsid:40E8496C-E64A-4CC3-A380-99A93EBBF739"
	  width=0
	  height=0
	  align=center
	  hspace=0
	  vspace=0
>
</OBJECT>
	<div id="searchPanel" style="margin: 0px;width: 100px; float: left;"></div>
	<div id="addPanel" style="margin: 0px; width: 100px;float: left;"></div>
	<div id="selectAllPanel" style="margin: 0px; width: 100px;float: left;"></div>
	<div id="cancelAllPanel" style="margin: 0px; width: 100px;float: left;"></div>
	<div id="delAllPanel" style="margin: 0px; width: 100px;float: left;"></div>
	<tt:authority value="UpdateprintEmsMail">	
	<div id="printPanel" style="margin: 0px; width: 100px;"></div>
	</tt:authority>	
	<tt:grid id="emsmail" value="emsmailList" pagination="true" xls="false">
		<tt:row >
		  <tt:col name="����" align="center" width="150">			
				<ww:if test="null != id">
				    <a href="javascript:parent.addTab('EMS�ʼ���Ϣ', 'viewEmsMail', '/netprint/emsmail/emsmail.shtml?actionType=view&search.pid=<ww:property value="id"/>','NO')">�鿴</a>
					<tt:authority value="EditEmsMail">
						<a href="javascript:parent.addTab('�޸�EMS�ʼ���Ϣ', 'editEmsMail', '/netprint/emsmail/emsmail.shtml?actionType=edit&search.pid=<ww:property value="id"/>','NO')">�޸�</a>
					</tt:authority>
					<tt:authority value="UpdateprintEmsMail">
					   <a href="javascript:parent.addTab('��ӡ�ʼ���Ϣ', 'printEmsMail', '/ocxprint.shtml?actionType=ocxprint&search.printtype=1&search.pagenum='+Ext.get('pagenum<ww:property value="id"/>').dom.value+'&search.pid=<ww:property value="id"/>','NO')">��ӡ</a>
					   <!-- 
					   <a href="javascript:printoxc(/netprint/emsmail/emsmail.shtml?actionType=ocxprint&search.pid=<ww:property value="id"/>)">��ӡ</a>
					   
					    <a href="/netprint/emsmail/emsmail.shtml?actionType=pageprint&search.pid=<ww:property value="id"/>" target=_blank>��ӡ</a>
					   -->
					</tt:authority>
					<tt:authority value="DelEmsMail">
						<a href="javascript:fun_delete(<ww:property value="id"/>)">ɾ��</a>
					</tt:authority> 
				</ww:if>
			</tt:col>
			
			<tt:col name="����" width="20">	
				<ww:if test="null != id">
				<input size="5" type="text" id="pagenum<ww:property value='id'/>" name="pagenum<ww:property value='id'/>" value="1"  onblur="pagenumregexp(this)"/>
			    </ww:if>
			</tt:col>
			
			<tt:col name="�ʼ���" width="80">
				<ww:if test="null != id">
						<input type="checkbox" name="searchpid" value="<ww:property value="id"/>"/>
						<ww:property value="mailno"/>
				</ww:if>
			</tt:col>
			
			
			<tt:col name="�ļ����ռľ�" property="sendoffice" width="80" visible="true"/>			
			<tt:col name="�ļ�������" property="sendname" width="80"/>
			<tt:col name="�ļ��˵绰" property="sendtel" width="80"/>	
			<tt:col name="�ļ��˵�λ����" property="sendunit" width="80" visible="true"/>	
			<tt:col name="�ļ��˵�ַ" property="sendaddress" width="80" visible="true"/>	
			<tt:col name="�ռ�������" property="recname" width="80"/>
			<tt:col name="�ռ��˵绰" property="rectel" width="80"/>	
			<tt:col name="�ռ��˵�λ����" property="recunit" width="80" visible="true"/>	
			<tt:col name="�ռ��˵�ַ" property="recaddress" width="80" visible="true"/>	
			<tt:col name="�ڼ�Ʒ��" property="sendgoodsname" width="80"/>		
			<tt:col name="������" property="create_manname" width="100" visible="true"/>
			<tt:col name="����ʱ��" property="create_date" width="75"/>
			<tt:col name="����ӡʱ��" property="printtime" width="75"/>
			<tt:col name="�Ѵ�ӡ����" property="printcount" width="75"/>
			
		</tt:row>
	</tt:grid> 
    <!-- 
	<div id="selectAllPanel" style="margin: 0px; width: 100px;float: left;"></div>
	<div id="cancelAllPanel" style="margin: 0px; width: 100px;float: left;"></div>
	<tt:authority value="UpdateprintEmsMail">	
	<div id="printPanel" style="margin: 0px; width: 100px;"></div>
	</tt:authority>
	 -->
</body>