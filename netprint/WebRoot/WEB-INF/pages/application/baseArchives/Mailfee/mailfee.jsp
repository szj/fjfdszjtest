<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>

<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>

<form name="form1" method="post" action='/basearchives/mailfee/Mailfee.shtml' class="formcheck" onsubmit="return checkSubmit();" enctype="multipart/form-data">
<table><tr><td>excel�ļ�</td>
<td>
<input type="file"  name="upload"  id="upload" onpropertychange="if(!/(xls)/.test(this.value.substr(this.value.lastIndexOf('.')+1))){Ext.MessageBox.alert('��ʾ','���Ͳ�֧��');}" />
</td> 
<td><input type="button"  name="buttonName"  id="buttonId" value="�ϴ�" onclick="selectJg()" />
ģ��:<a href="http://print.yzyogo.com/model2.xls"><font color="red">����</font></a>
</td>
<td>
<div id="waitlog" style="display:none">
������,��ȴ�......<img src="/images/extanim32.gif">
</div>
</td>
</tr>
</table>
<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
</form>

<div id="searchPanel" style="margin: 0px; float: left;"></div>
<div id="addPanel" style="margin: 0px; width: 100px;"></div>
	<tt:grid id="mailfeeListExport" value="mailfeeList" pagination="true" xlsex="false"  xls="false" >
		<tt:row>
		    <tt:col name="ʡ��" property="province_name" width="80" />
		    <tt:col name="����" property="city_name" width="80" />
			<tt:col name="����" property="county_name" width="120" />
			<tt:col name="ʡ�ʷⷢ��" property="send_office" width="120" />
			<tt:col name="̨ϯ" property="email_fee" width="120" />
			<tt:col name="�Ʒ���" property="mail_feearea" width="120" />
			<tt:col name="���ж���" property="belong_city" width="120" />
			<tt:col name="��ϵ�ַ��" property="addressname" width="120" />
			<tt:col name="�ռ�����������" property="recpost" width="120" />
			<tt:col name="����" align="center" width="200">
				<ww:if test="null != id">
				<a href="javascript:parent.addTab('�޸�', 'mailfeeEdit', '/basearchives/mailfee/Mailfee.shtml?actionType=editList&search.id=<ww:property  value="id" />','NO');">�޸�</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:fun_delete(<ww:property value="id"/>);"> ɾ�� </a>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
<script>
function selectJg(){
    Ext.get('waitlog').dom.style.display='block';
    //document.form1.getbyid('waitlog').style.display='block';//ͬ��
   	document.form1.submit();
}
</script>
 <script language="javascript">
	   Ext.onReady(function(){
            new Ext.Button({
		        text: '�� ѯ',
		        handler:showSearch
		   }).render(document.all.searchPanel);
		   
		    new Ext.Button({
		        text: '�� ��',
		        handler: function(){
		        	parent.addTab('��ӷⷢ����Ϣ','addMailfee','/basearchives/mailfee/Mailfee.shtml?actionType=new','NO');
		        }
		    }).render(document.all.addPanel);
		})
     
       function showSearch(){
	       var schForm = new Ext.form.FormPanel({
	           baseCls: 'x-plain',
			   method:'GET', 	//�ύ����
			   labelWidth: 100,//�ı���ǩ����
			   url:'/basearchives/mailfee/Mailfee.shtml',//form��action��ַ	
			   defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			   defaults: {width: 100}, 	//Ĭ�Ͽ��
			   onSubmit:Ext.emptyFn,
			   submit:function(){
			       this.getEl().dom.action='/basearchives/mailfee/Mailfee.shtml';
			       this.getEl().dom.submit();
			   },
			   items:[ {
			       fieldLabel: 'ʡ��',
			       name: 'search.pprovince_name',
			       width:100  
			   }, {
			       fieldLabel: '����',
			       name: 'search.pcity_name',
			       width:100  
			   },{
			       fieldLabel: '����',
			       name: 'search.pcounty_name',
			       width:100  
			   },{
			       fieldLabel: 'ʡ�ʷⷢ��',
			       name: 'search.psend_office',
			       width:100  
			   }],
			   buttons: [{
			                text: '�� ѯ',
			                handler: function(){
			            	    schForm.form.submit(); 
			                }
			            },{
			                text: '�� ��',
			                handler: function(){
			            	    schForm.form.reset(); 
			                }
			            }]
	       });
	       
	       var window = new Ext.Window({
			   title: '��ѯ����',
			   width: 300,
			   height:320,
			   minWidth: 300,
			   minHeight: 200,
			   layout: 'fit',
			   plain:true,
			   bodyStyle:'padding:5px;',
			   buttonAlign:'center',
			   items: schForm
			});
			
			window.show();       
	   }
 </script>
 <script language="javascript">
 function fun_delete(id){
		    Ext.MessageBox.confirm("��ʾ","ȷ��Ҫɾ������Ϣ��?",function(button,text){
		       if(button=="yes"){
			   var url = '/basearchives/mailfee/Mailfee.shtml?actionType=delete&search.pid='+id;
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
						if (1 == rowSet.item(0).selectSingleNode("value").text){
	 				    	Ext.MessageBox.show('��ʾ','ɾ����¼��Ϣ�������ɹ���');
							parent.document.ifrm_UploadExcel.window.location.reload();
						}else if(2==rowSet.item(0).selectSingleNode("value").text){
						    Ext.Msg.show({
			 					title:'��Ϣ',
								msg: "ɾ����¼��Ϣ,���ܱ�ɾ��",
								modal : true,
								buttons: Ext.Msg.OK
	 				    	});
						}
						else{
							Ext.Msg.show({
			 					title:'��Ϣ',
								msg: 'ɾ����¼��Ϣ������ʧ�ܣ�',
								modal : true,
								buttons: Ext.Msg.OK
	 				    	});
						}
					}
				}catch(e){ 
				}
			   }
			});
		}
 </script>