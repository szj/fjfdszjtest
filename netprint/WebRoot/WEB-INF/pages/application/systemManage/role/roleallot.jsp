<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%> 
<%@ include file="/common/taglibs.jsp"%>
<head>
	<script type="text/javascript" src="/themes/default/treeRes/XMLSelTree.js"></script>
	<link type="text/css" rel="stylesheet" href="/themes/default/treeRes/XMLSelTree.css" />
</head>

<body>
	<table width="80%" align="center">
		<tr>
			<td height="25" align='center'>ְ��Ȩ�����ƣ�${param.roleName}</td>
		</tr>
	</table>
	<br>
	<form name="form1" action="/system/role/roleInfo.shtml" method="post">
		<table width="80%" align="center">
		    <TBODY>
			<tr>
				<td>
					<DIV id="SrcDiv" onselectstart="selectstart()"></DIV>
				</td>
			</tr>
			<tr>
				<td align="center">
					<tt:authority value="TJJSXX">
						<input type="hidden" name="actionType" value="allot"/>
						<input type="hidden" name="search.roleId" value="${param.roleId}"/>
						<input type="hidden" name="superId" value="${param.superId}"/>
						<input type="submit" class="InputBtn" value="�� ��" />
					</tt:authority>
				</td>
			</tr>
			</TBODY>
		</table>
	</form>
	
	<SCRIPT LANGUAGE=javascript>
		<!--
		var m_sXMLFile	= "/system/role/roleInfo.shtml?actionType=menuTreeJson&superId=Root&search.roleId=${param.roleId}";						// ���˵����ļ�(�ɸ�ΪTreeNode.asp)
		var m_sXSLPath	= "/themes/default/treeRes/";						// xsl�ļ����·��
		var m_oSrcDiv	= SrcDiv;								// HTML���(�˵��������˵��ڴ�������ʾ)
		
		
		function window.onload()
		{
			InitTree(m_sXMLFile, m_sXSLPath, m_oSrcDiv,false,true,true);
		}
		
		/************************************************
		** GoLink(p_sHref, p_sTarget)
		************************************************/
		function GoLink(p_sHref, p_sTarget)
		{
			var sHref	= p_sHref;
			var sTarget	= p_sTarget;
			window.open(sHref, sTarget);
		}
		//-->
	</SCRIPT>
</body>
<%-- Ext�� ��Ϊ�����ӳټ��ع��ܲ��ʺ���Ȩ����ʹ����������
<head>
	<script type="text/javascript" src="/js/TreeCheckNodeUI.js"></script>
</head>
<body>
<br>
<br>
<div style="wdith:98%" align="center">
	ְ��Ȩ�����ƣ�${param.roleName}
</div>
<br>
<div id="tree-ct"></div>
<script>  
	Ext.BLANK_IMAGE_URL = '/ext/resources/images/default/s.gif';   
	Ext.onReady(function(){   
	    var tree = new Ext.tree.TreePanel({   
			width:'100%',   
			height:400,   
			checkModel: 'cascade',   
			onlyLeafCheckable: false,   
			animate: false,   
			rootVisible: true,   
			autoScroll:true,   
			loader: new Ext.tree.TreeLoader({   
			    dataUrl:'/system/role/roleInfo.shtml?actionType=menuTreeJson&search.roleId=${param.roleId}',
				baseParams: {superId:'Root'},
				clearOnLoad : false ,
				preloadChildren : false,
				requestMethod : "GET",
			    baseAttrs: { uiProvider: Ext.tree.TreeCheckNodeUI }   
			}),   
			root: new Ext.tree.AsyncTreeNode( {
				text : 'ϵͳ����',
				draggable : false,
				expanded : true
			}),
			listeners : {
				beforeload :function(node){
					if ('ynode-7' != node.attributes.id)
						this.loader.baseParams.superId = node.attributes.id;
				}
			}
	    });   
	    /*	����¼����ɸ�����Ҫ�����ٲ�
	    tree.on("check",function(node,checked){
	    	alert(node.id+" = "+checked)
	    }); 
	    */
	    tree.getRootNode().expand(); 
	    
	    //������
	    var form1 = new Ext.form.FormPanel({
			renderTo:'tree-ct',
			method:'POST', 	//�ύ����
			url:'/system/role/roleInfo.shtml',	
			onSubmit:Ext.emptyFn,
	        submit:function(){
	        	this.getEl().dom.action='/system/role/roleInfo.shtml';
	        	this.getEl().dom.submit();
	        },
	        items: [tree,{
	        	name:'search.checkDate',
	        	xtype:'hidden'
	        },{
	        	name:'actionType',
	        	value:'allot',
	        	xtype:'hidden'
	        },{
	        	name:'search.roleId',
	        	value:'${param.roleId}',
	        	xtype:'hidden'
	        }],
	        buttons: [{
	            text: '����',
	            handler: function(){
	            	document.all('search.checkDate').value = tree.getChecked();//tree�������ȴ�����.
	            	form1.form.submit(); 
	            }
	        }]
		});  
		
		form1.getEl().center();
	});   
</script>  


</body>
--%>
