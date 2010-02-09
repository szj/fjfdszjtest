<%@ page language="java" pageEncoding="gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
  <head>
    <html:base /> 
<title>��Ʒ�������</title>
    
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/include/ext/resources/css/ext-all.css" />
 	<script type="text/javascript" src="<%=request.getContextPath()%>/include/ext/adapter/ext/ext-base.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/include/ext/ext-all.js"></script>

  <link rel="stylesheet" href="<%=request.getContextPath() %>/css/css.css" type="text/css"/>

 <script type="text/javascript">
	function addProductManage(obj){
	    var context=document.getElementById("addProductSmallNameID").value;
	    if(context!="")
	    {
		document.forms[0].action='../../productManage.do?status=addSmall';
		document.forms[0].submit();
		alert('�ɹ��������Ʒ����.');
		}
		else
		{
		alert('Ҫ��ӵ���Ʒ���಻��Ϊ��.');
		}
	}
	
	function saveProduct(obj){
		document.forms[0].action='../../productManage.do?status=saveSmall';
		document.forms[0].submit();
		alert('�����޸ĳɹ�.');
	}
 </script>
 
 <script type="text/javascript">
 function selectSmallClass(obj)
 {
 document.forms[0].action='../../productManage.do?status=smallClass';	
 document.forms[0].submit();
 }
 
 
 
 
 
 
 
  Ext.onReady(function(){
	
	var comboxWithTree = new Ext.form.ComboBox({   
        store:new Ext.data.SimpleStore({fields:[],data:[[]]}),   
        editable:false,
        renderTo: 'combo',
        mode: 'local',   
        triggerAction:'all',   
        maxHeight: 200,   
        tpl: "<tpl for='.'><div style='height:200px'><div id='tree'></div></div></tpl>",   
        selectedClass:'',   
        onSelect:Ext.emptyFn   
    });   
    var tree = new Ext.tree.TreePanel({   
        loader: new Ext.tree.TreeLoader({
           dataUrl:'../../productModify.do?status=getTree'
        }), 
        border:false,
        rootVisible: true,  
        root:new Ext.tree.AsyncTreeNode({text: '��Ʒ����',id:'0'})
      });   
      tree.on('click',function(node){ 
          comboxWithTree.setValue(node.text);
          Ext.get("id").dom.value=node.id;
          Ext.get("catalogName").dom.value=node.text;  
          selectSmallClass();//������id
          comboxWithTree.collapse();  
            
      });   
    comboxWithTree.on('expand',function(){   
        tree.render('tree');   
      });
    comboxWithTree.render('comboxWithTree'); 
    <%
   if (request.getAttribute("catalogName")!=null) {
   %>
      comboxWithTree.setValue("<%=request.getAttribute("catalogName") %>");
   <%
   }
    %>
});
  </script>
 
 
  <script type="text/javascript">
   function checkname(str){
  // var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
  // xmlDoc.load("productManage.do?status=isDelete&id="+str);
  // objLst = xmlDoc.getElementsByTagName("list"); 
 //if (objLst.item(0).childNodes(0).text == "exist")
 //{
  //alert("����Ʒ������������,����ɾ��.");
  //return false;
 //}
  
  if(confirm("ȷ��Ҫɾ����ǰ��¼��"))
  {
  return true;
  }
   
   
 }
   </script>
</head>
<body background="<%=request.getContextPath()%>/images/bg.gif">
  <form action="/productChild.do" method="post">
  <center>
      <table class="tbl" width="780"  cellspacing="0" cellpadding="0" border="0" >
    	   <tr>
    	   <td colspan="4" bgcolor="#009CD6"  background="../../images/newsystem/th2.gif" class="txt_b"  align="center">��Ʒ�������</td>
    	   </tr>
    	   
    	   <tr>
    	   <td class="main" align="left" valign="top">
    	   ѡ����Ʒ����
  <div id="combo"></div>
  <input type="hidden" name="id" id="id" value="<%=request.getAttribute("id") %>"/>
  <input type="hidden" name="catalogName" id="catalogName" value="<%=request.getAttribute("catalogName") %>"/>
            </td>
    	   <td colspan="3" class="main"  align="center">
    	      <table border="0" class="tbl"  width="500">
    	      	<tr>
    				
    					<td class="main" align="center">
    					��������
    					</td>
    					<td class="main" align="center">
    				      ����
    					</td>
    				</tr> 
    		    <logic:present name="productSmallList">
    			 <logic:iterate id="item" name="productSmallList">
    			 <tr>
    			 <td class="main" align="center">
    			 <input type="hidden" id="HctgNameId" name="HctgName" value="${item.id}"/>
    			 <input type="text"  name="ctgName" value="${item.catalogName}"/>
    			 </td>
    			 <td class="main" align="center">
    			 <a onclick='return  confirm("ȷ��Ҫɾ����ǰ��¼��");' 
    			 href="<%=request.getContextPath()%>/productManage.do?status=deleteSmall&cId=${item.id}&id=<%=request.getAttribute("id") %>">ɾ��</a>
    			 </td>
    			 </tr>
    			 </logic:iterate>
    			</logic:present>
    			
    			<tr>
    			<td colspan="3" class="main"  align="center">
    			<input type="button" name="save" value="�����޸�"  onclick="saveProduct(this)" class="button"/>
    			<input type="reset" name="reWrite" value="����" class="button"/>
    			</td>
    			</tr>
    	      
    	      </table>
    	   </td>
    	   </tr>
    	   
    			
    		</table>
    		
    	<br/>	
    	<div>
    	<table class="tbl" width="780"  cellspacing="0" cellpadding="0" border="0" >
    	<tr>
    	<td bgcolor="#009CD6"  background="../../images/newsystem/th2.gif" class="txt_b"  align="center">�����Ʒ����</td>
    	</tr>
    	<tr>
    	<td class="main" align="center">�����Ʒ����
    	<input type="text" id="addProductSmallNameID" name="addProductSmallName" />
    	<input type="button" name="save" value="�� ��"  onclick="addProductManage(this)"  class="button"/>
    	</td>
    	</tr>
    	</table>
    	</div>
  </center>
  </form>
</body>
</html:html>