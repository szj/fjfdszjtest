<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<style type="text/css">
<!--
#tree-ct1 {
	position:absolute;
	width:915px;
	height:40px;
	z-index:1;
	left: 11px;
	top: 20px;
}
-->
</style>
<body>
<div id="tree-ct1"></div>

<input type="hidden" name="actionType" value=""/>
<input type="hidden" name="search.JGID" value=<ww:property value="search.JGID"/>>
<input type="hidden" name="search.JG_MC" value=<ww:property value="search.JG_MC"/>>
<!-- 
<center><font color="red">Ҫ��ĳһ�����������޸ġ�����ɾ����������˫��ѡ����һ����</font></center>
<input type="hidden" name="search.pid" value="">
 -->

<script type="text/javascript" src="/js/TreeCheckNodeUI.js"></script>
<script>  
	Ext.BLANK_IMAGE_URL = '/ext/resources/images/default/s.gif';   
	Ext.onReady(function(){   
	    var JGID=Ext.get('search.JGID').dom.value;
        var JG_MC=Ext.get('search.JG_MC').dom.value;
        var tree = new Ext.tree.TreePanel({
		    width:'100%',   
			height:300,   
			checkModel: 'cascade',   
			onlyLeafCheckable: false,   
			animate: false,   
			rootVisible: true,   
			autoScroll:true,   
			loader: new Ext.tree.TreeLoader({   
			    dataUrl:'/basearchives/organ/organManage.shtml?actionType=organTreeJson&a='+new Date(),
				baseParams: {sjjg_Id:JGID},
				clearOnLoad : false,
				preloadChildren : false,
				requestMethod : "GET"
			}),   
			root: new Ext.tree.AsyncTreeNode( {
			    id:JGID,
				text : JG_MC,
				draggable : false,
				expanded : true
			}),
			listeners : {
				beforeload :function(node){
					if ('ynode-39' != node.attributes.id){
						this.loader.baseParams.sjjg_Id = node.attributes.id;
					}
				}
			}
		});
	    tree.on('dblclick',function(node){  
		     Ext.get('search.pid').dom.value=node.attributes.id;
		}); 
	    tree.getRootNode().expand(); 
	    //������
	    var form1 = new Ext.form.FormPanel({
	        title:'��������(Ҫ��ĳһ�����������޸ġ�����ɾ����������˫��ѡ����һ����)',
			renderTo:'tree-ct1',
			method:'POST', 	//�ύ����
			url:'/basearchives/organ/organManage.shtml',	
			onSubmit:Ext.emptyFn,
	        submit:function(){
	            if (Ext.get('actionType').dom.value=='del'){
	        	    this.getEl().dom.action='/basearchives/organ/organManage.shtml?actionType=del';
	        	}
	        	this.getEl().dom.submit();
	        },
	        items: [tree,{
		        	name:'search.pid',
		        	value:'',
		        	xtype:'hidden'
	        		}
	        ],
	        buttons: [
	        <tt:authority value="AddOrganManage">
	        {
	            text: '�޸�',
	            handler: function(){
                    if(Ext.get('search.pid').dom.value==""||Ext.get('search.JGID').dom.value==""){
                        Ext.MessageBox.alert('��ʾ', '��˫��ѡ��ĳһ���������޸�!');
                    }
                    else{
	            	    parent.addTab('�޸Ļ�������','editOrgan','/basearchives/organ/organManage.shtml?actionType=edit&search.pid='+Ext.get('search.pid').dom.value,'NO');
	            	}
	            }
	        },
	        </tt:authority>
	        <tt:authority value="DelOrganManage">	        
	        {
	            text:'ɾ��',
	            handler:function(){
	               if(Ext.get('search.pid').dom.value==""||Ext.get('search.JGID').dom.value==""){
                        Ext.MessageBox.alert('��ʾ', '��˫��ѡ��ĳһ��������ɾ��!');
                    }
                    else{
                        /*�����������
	                    Ext.Msg.prompt('��ʾ', '������', function(btn, text){
						    if (btn == 'ok'){
						    }
						});
						*/
						Ext.MessageBox.confirm('��ʾ', '�Ƿ�ȷ��ɾ����', function(btn) {
						    if (btn == 'yes'){
								 var url = '/basearchives/organ/organManage.shtml?actionType=del&search.pid='+Ext.get('search.pid').dom.value;
		                         try{
						             var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
						             oXMLDom.async = false ;
						             oXMLDom.load(url); 
						             var root;
						             if (oXMLDom.parseError.errorCode != 0) {
							             return;
						             } else {
							         root = oXMLDom.documentElement;
						             }
						             if (null != root){
							             var rowSet = root.selectNodes("//delete");
							             var val=rowSet.item(0).selectSingleNode("value").text
							             if (1 == val){
								             Ext.MessageBox.alert('��ʾ', 'ɾ������������Ϣ�������ɹ���', function(btn) {
								             	  parent.document.ifrm_OrganManage.window.location.reload();
								             });
							             }else if(7==val){
							                 Ext.MessageBox.alert('��ʾ', '���������¼�����,����ɾ����');
							             }
							             else if(8==val){
							                 Ext.MessageBox.alert('��ʾ', '��Ա�����Ѿ�ʹ�ô˻���,����ɾ��!');
							             }
							             else if(9==val){
							                 Ext.MessageBox.alert('��ʾ', '������ʲ���Ϣ����,����ɾ��');
							             }else if(6==val){
							                 Ext.MessageBox.alert('��ʾ', '�������й�������Ա,����ɾ����');
							             }else{
							             	 Ext.MessageBox.alert('��ʾ', 'ɾ������,������!');
							             }
						             }
					             }catch(e){ 
						             Ext.MessageBox.alert(e);
					             }						       
						    }
						});
						/*�����ֿ������ְ�ť��
						Ext.Msg.show({
						   title:'ɾ��ȷ��?',
						   msg: '���Ƿ�ȷ��ɾ��������?',
						   buttons: Ext.Msg.YESNO,
						   fn: deldata(),
						   animEl: 'elId',
						   icon: Ext.MessageBox.QUESTION
						});
						*/
	            	}//end else
	            }
	        },
	        </tt:authority>
	        {
	            text: '���',
	            handler: function(){
		          parent.addTab('��ӻ���','editOrgan','/basearchives/organ/organManage.shtml?actionType=new','NO');
		        }
	        }
	        
	        ]
	        
	       //html:'123'
		});
		//form1.getEl().center(); 
	}); 
</script>  
</body>
