<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>

<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>


<form name="form1"  action='/basearchives/uldExcel/uploadExcel.shtml' class="formcheck" onsubmit="return checkSubmit();">
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>
<!-- 
	<input type="file"  name="fileName"  id="fileNameId"  onpropertychange="modifyfilename();" />
	<input type="hidden"  name="fileNameex"  id="fileNameIdex" value=""/>
		<script   language='javascript'>   
	  function   modifyfilename(){   
		  var ttt=document.getElementById("fileNameIdex");
		  alert(ttt);
		  document.getElementById("fileNameIdex")=ttt;
	  }   
	</script>  
	<input type="file" name="fileNamedig"  id="fileNameIddig" style="visibility:hidden">
	<input name="fileName"  id="fileNameId" type="text" readonly>
	<input type=button value=��� onclick="fileNameIddig.click(); fileNameId.value= fileNameIddig.value">

	<input type="file"  name="fileName"  id="fileNameId"  onpropertychange="modifyfilename();" />
	<input type="hidden"  name="fileNameex"  id="fileNameIdex" value=""/>
 	<script   language='javascript'>   
	  function   modifyfilename(){   
		  var ttt=document.getElementById("fileNameIdex");
		  alert(ttt);
		  document.getElementById("fileNameIdex")=ttt;
	  }   
	</script>  
 -->
<table><tr><td>excel�ļ�</td>
<td>
	<input type="file"  name="fileName"  id="fileNameId" />
</td> 
<td><input type="button"  name="buttonName"  id="buttonId" value="�ϴ�" onclick="selectJg()" /></td>
<td><input type="button"  name="btnprint"  id="btnprintid" value="��ӡ" onclick="print()" /></td>
</tr>
</table>
<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
 <div id="searchPanel" style="margin: 0px; float: left;"></div>
	<div id="addPanel" style="margin: 0px; width: 100px;"></div>
	<tt:grid id="uploadExcelExport" value="uploadExcelList" pagination="true" xlsex="true"  xls="false" >
		<tt:row>
		    <tt:col name="��Ӫ��" property="Operators" width="80" />
		    <tt:col name="����" property="number" width="80" />
			<tt:col name="�û���" property="userName" width="120" />
			<tt:col name="������" property="address" width="120" />
			<tt:col name="Ʒ��" property="Brand" width="120" />
			<tt:col name="����ɷ�ʱ��" property="JFtime" width="120" />
			<tt:col name="�ܽ��" property="money" width="120" />
			<tt:col name="�ɷ�����" property="payNet" width="120" />
			<tt:col name="��������" property="updateNet" width="120" />
			<tt:col name="����ʱ��" property="ImportTime" width="120" />
			<tt:col name="�ļ���" property="fileName" width="120" />
			<tt:col name="����" align="center" width="200">
				<ww:if test="null != id">
				<a href="javascript:parent.addTab('�޸�', 'baseInfoEdit', '/basearchives/uldExcel/uploadExcel.shtml?actionType=editList&search.id=<ww:property  value="id" />','NO');">�޸�</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:fun_delete(<ww:property value="id"/>);"> ɾ�� </a>
				</ww:if>
			</tt:col>
		</tt:row>
	</tt:grid> 
</form>
<script type="text/javascript" src="/js/TreeCheckNodeUI.js"></script>
<script>
    function selectJg(){
    document.form1.submit();
    }
    
    function print(){
    Ext.get('actionType').dom.value="report";
    //document.form1.actionType="report";//actionType
    document.form1.submit();
    }
</script>
 <script language="javascript">
	   Ext.onReady(function(){
            new Ext.Button({
		        text: '�� ѯ',
		        handler:showSearch
		   }).render(document.all.searchPanel);
		   
		})
     
       function showSearch(){
	       var schForm = new Ext.form.FormPanel({
	           baseCls: 'x-plain',
			   method:'GET', 	//�ύ����
			   labelWidth: 100,//�ı���ǩ����
			   url:'/basearchives/uldExcel/uploadExcel.shtml',//form��action��ַ	
			   defaultType: 'textfield',	//Ĭ�Ͽؼ�����
			   defaults: {width: 100}, 	//Ĭ�Ͽ��
			   onSubmit:Ext.emptyFn,
			   submit:function(){
			       this.getEl().dom.action='/basearchives/uldExcel/uploadExcel.shtml';
			       this.getEl().dom.submit();
			   },
			   items:[ {
			       fieldLabel: '��Ӫ��',
			       name: 'search.Operators',
			       width:100  
			   }, {
			       fieldLabel: '����',
			       name: 'search.number',
			       width:100  
			   },{
			       fieldLabel: '�û���',
			       name: 'search.userName',
			       width:100  
			   },{
			       fieldLabel: '������',
			       name: 'search.address',
			       width:100  
			   },{
			       xtype: 'datefield',
			       readOnly:true,
			       format: 'Y-m-d',
			       fieldLabel: '<font color="red">�ɷ�ʱ�俪ʼ</font>',
			       name: 'search.KSRQ',
			       width:100

			   },{
			       xtype: 'datefield',
			       readOnly:true,
			       format: 'Y-m-d',
			       fieldLabel: '<font color="red">�ɷ�ʱ�����</font>',
			       name: 'search.JSRQ',
			       width:100

			   },{
			       fieldLabel: '�ɷ�����',
			       name: 'search.payNet',
			       width:100  
			   },{
			       fieldLabel: '��������',
			       name: 'search.updateNet',
			       width:100  
			   },{
			       fieldLabel: '�ļ���',
			       name: 'search.fileName',
			       width:100  
			   }],
			   buttons: [{
			                text: '�� ѯ',
			                handler: function(){
			                  if((Ext.get('search.KSRQ').dom.value!='')||(Ext.get('search.JSRQ').dom.value!=''))
			                 {
			                  alert('��ʼ���ڸ��������ڶ�Ϊ�ջ��߶���Ϊ��!');
			                  }
                             else
                             {
			            	    schForm.form.submit(); 
			            	    }
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
			   var url = '/basearchives/uldExcel/uploadExcel.shtml?actionType=delete&search.id='+id;
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
	 				    	alert('ɾ����¼��Ϣ�������ɹ���');
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
					//alert(e);
				}
			   }
			});
		}
 
 </script>
 
 
 
 
 
 
 
 
 
 
 