<%@ page language="java"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>��վ�̳�</title>

	<link rel="stylesheet"
		href="<%=request.getContextPath() %>/css/css.css" type="text/css" />
 
<script type="text/javascript">
 var mkbh='';
Ext.BLANK_IMAGE_URL = '<%=request.getContextPath()%>/include/ext/resources/images/default/tree/s.gif';
    var tree;
    Ext.onReady(function(){
    
     tree = new Ext.tree.TreePanel({
   
    el:'tree-ct',
    width:200,
    height:700,
    animate: true,
    rootVisible: true,
    autoScroll:true,
    loader: new Ext.tree.TreeLoader({
       dataUrl:'../../productModify.do?status=getTree'
    }),
    root:new Ext.tree.AsyncTreeNode({
      text: '��Ʒ����',
      id:'0',
      type: 'root'
    })
  });

tree.on("click",function(node){
     Ext.get("id").dom.value=node.id;
       alert(node.id);
         Ext.get(node.attributes.link).dom.src ='<%=request.getContextPath()%>/indexFirst.do?status=someGoodsShow&catalogId='+node.id;
     if(node.isLeaf()){        
          

            node.attributes.url="<%=request.getContextPath()%>/indexFirst.do?status=someGoodsShow&catalogId=";
            alert(node.attributes.url+node.id);
            var tab = tabPanel.getItem(node.id);               
             
            if(!tab){   
                tab = tabPanel.add({   
                    id:node.id,   
                    iconCls:'icon_ppt',   
                    xtype:'panel',   
                    title:node.text,   
                    closable:true,   
                    html:"<iframe id='"+ node.attributes.link +"'  src='"+node.attributes.url+"'" + node.id+ "' frameborder=0 width=100% height=100%></iframe>"  
                });  
               
            }else{   
              
                Ext.get(node.attributes.link).dom.src ='<%=request.getContextPath()%>/indexFirst.do?status=someGoodsShow&catalogId='+node.id; 
              
            }   
            tabPanel.setActiveTab(tab);              
            return true;        
        }else{   

        node.toggle();   
     }   

    });
  
   tree.on("checkchange",function(node,checked){
     	 var curnode = node;
     	 
		 for (var i=0;i<node.getDepth();i++){
  			curnode = curnode.parentNode;
    		if (typeof node.parentNode.getUI().checkbox != 'undefined'){
   				curnode.getUI().checkbox.checked = true;
  				curnode.attributes.checked = true; 
  			}
  	     }
       });
  
  
   tree.render();
   

     root.expand();
 
  
});
	function GetCheckedToJgbhlist(){ 
					var checkedNodes = tree.getChecked();//tree�������ȴ�����. 
					for(var i=0;i<checkedNodes.length;i++)
					{  
					  document.all.jgbhlist.length=document.all.jgbhlist.length+1;
						document.all.jgbhlist.options[i].value=checkedNodes[i].id;
						document.all.jgbhlist.options[i].text=checkedNodes[i].text;
						
					} 
				for (i=0;i<document.all.jgbhlist.options.length;i++){
			    	document.all.jgbhlist.options[i].selected=true;
			    }
		 
	}
	function saveAll(){
	  
	 GetCheckedToJgbhlist();
	  document.forms[0].action='<%=request.getContextPath()%>/jsjbxxwh.do?status=saveAll';
	  
	  document.forms[0].submit();
	}
</script>


</head>
<body class="CurHome">
<form>
<center>
<div>
 <jsp:include flush="true" page="top.jsp" />  
 </div>
 <div align="center">
 

<table border="0" width="98%"cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="<%= request.getContextPath()%>/images/test/images/ad/Ad_1.JPG" width="100%" height="45"/></td>
  </tr>
  <tr>
    <td height="4"></td>
  </tr>
</table>
<div align="center">
  <table width="98%" border="0" cellpadding="0" cellspacing="0" >
    <tr>
      <td width="200" rowspan="2" ><div align="left">
        <table width="100%"  border="0" cellpadding="0" cellspacing="0" bgcolor="#C1E2B8">
          <tr>
            <td  class="login" >
            <img src="<%=request.getContextPath() %>/upload/mg.jpg"  height="80%" width="200" border="0"/>
            </td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10"></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <td >
             
            	  <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C0CDAC">
          <tr>
            <td height="26" background="<%= request.getContextPath()%>/images/test/images/bjd.gif"><div align="left"><span class="mulu2">&nbsp;&nbsp;��Ʒ����</span></div></td>
          </tr>
          <tr>
            <td height="300" bgcolor="#FFFFFF"><div align="center"> <br />
              <table width="180" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td>
                    

	
	 <logic:present name="productCatalogList">
       <bean:define id="result" name="productCatalogList"  type="java.util.List" />
				<logic:iterate id="item" name="result" indexId="rowNum">
				
				 <logic:equal  name="item" property="parentId" value="0">
				 <div align="left">
                 <h4><font color="#1f7ff0">${item.catalogName}</font></h4>
                 </div> 
                 </logic:equal>
				 
				<logic:notEqual name="item" property="parentId" value="0">
				<a href="<%=request.getContextPath()%>/indexFirst.do?status=someGoodsShow&catalogId=${item.id}">
				${item.catalogName}
				</a>
				<br/>
				  </logic:notEqual>
	            </logic:iterate>
    </logic:present>
    	
	
	 

    	
                    
                    
                    </td>
                  </tr>
                  </table>
              <br />
            </div></td>
          </tr>
        </table>
            
               </td>
          </tr>
         
        </table>
      </div></td>
      <td width="10" ></td>
      <td width="800" ><table width="100%" height="200" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="320" height="200">
          <script language="JavaScript" src="<%= request.getContextPath()%>/images/test/flash.js" type="text/javascript">
          </script>
          </td>
          <td width="10"></td>
          <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#C0CDAC">
            <tr>
              <td height="26" background="<%= request.getContextPath()%>/images/test/images/bjd.gif"><div align="left"><span class="mulu2">&nbsp;&nbsp;��빫��</span></div></td>
            </tr>
            <tr>
              <td height="171" bgcolor="#FFFFFF"><div align="left">
                <table cellspacing="0" cellpadding="5">
                    <tr>
                      <td><div align="left">[<a href="#">�</a>]<a title="���±��⣺�ն��������ֳɹ������׶��̸�ҵ��  ���ߣ��ն��������ְ칫��  ����ʱ�䣺2008-7-17 10:51:38" href="#" target="_blank">�ն��������ֳɹ������׶��̸�ҵ��</a></div></td>
                      </tr>
                    <tr>
                      <td><div align="left">[<a href="#">����</a>]<a title="���±��⣺�й��������������ն����������Ҵ��֧����ʽ����  ���ߣ�δ֪  ����ʱ�䣺2008-7-17 10:18:04" href="#" target="_blank">�й��������������ն����������Ҵ��֧����ʽ����</a></div></td>
                      </tr>
                    <tr>
                      <td><div align="left">[<a href="#">�</a>]<a title="���±��⣺�ն�������ʽ������ͨΥ�洦��֪ͨ��Ͷ��ҵ��  ���ߣ��ն��ְ칫��  ����ʱ�䣺2008-7-17 10:03:09" href="#" target="_blank">�ն�������ʽ������ͨΥ�洦��֪ͨ��Ͷ��ҵ��</a></div></td>
                      </tr>
                    <tr>
                      <td><div align="left">[<a href="#">����</a>][��ͼ]<a title="���±��⣺ʡ��˾��ܾ����ն���������  ���ߣ���ӳ��  ����ʱ�䣺2007-12-7 8:22:39" href="#" target="_blank">ʡ��˾��ܾ����ն���������</a></div></td>
                      </tr>
                    <tr>
                      <td><div align="left">[<a href="#">�</a>]<a title="���±��⣺������������������Ϊ���˾����ռĻ������  ���ߣ��  ����ʱ�䣺2007-12-6 16:07:54" href="#" target="_blank">������������������Ϊ���˾����ռĻ������</a></div></td>
                      </tr>
                
                    <tr>
                      <td><div align="left">[<a href="#">�</a>][��ͼ]<a title="���±��⣺ʡ��˾�������ܾ����ն��������Ӳ칤��  ���ߣ�����  ����ʱ�䣺2007-10-24 9:30:17" href="#" target="_blank">ʡ��˾�������ܾ����ն��������Ӳ칤��</a></div></td>
                      </tr>
                      </table>
              </div></td>
            </tr>
          </table></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td colspan="2" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="10"></td>
        </tr>
      </table>
        <table width="100%" border="1" cellpadding="0" cellspacing="0">
        <tr>
          <td width="7" valign="top" ></td>
          <td valign="top" ><div align="center">
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="3" rowspan="2"><img src="<%= request.getContextPath()%>/images/test/images/left.GIF" width="3" height="33" /></td>
                  <td height="2" bgcolor="#23980C"></td>
                  <td width="3" rowspan="2"><img src="<%= request.getContextPath()%>/images/test/images/right.GIF" width="3" height="33" /></td>
                </tr>
                <tr>
                  <td><div align="left" class="css14">�����ϼ�</div></td>
                </tr>
              </table>
            <table width="98%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="160">
                  <div id="browse_main">
	<div class="goods_pic">
	  <%
  //ServletContext   servletContext   =   pageContext.getServletContext();   
  //String   realPath   =   servletContext.getRealPath("/");

  String name2=request.getContextPath()+"/upload/smallPic"; 
        %>
           <logic:present name="newsGoodsList">
            <bean:define id="result" name="newsGoodsList"  type="java.util.List" />
				<logic:iterate id="item" name="result" indexId="rowNum">
	
			
	<div class="detail">
	<div class="goods">
	   <table  onmouseover="this.style.backgroundColor='#FF4FAE'" onmouseout="this.style.backgroundColor=''" width="80"  cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
       <tr><td  bgcolor="#ffffff" height="80" align="center">
	<a href="<%=request.getContextPath()%>/indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
	<img src="<%=name2 %>\<bean:write name="item" property="smallPath"/>" width="100" height="100" border="0"/></a>
	     </td></tr>
         </table>
	</div>
	
	 <h2>
	 <a href="<%=request.getContextPath()%>/indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
				<font color="#FF6600">${item.productName}</font></a>
	 </h2>
	</div>
			
			
			</logic:iterate>
			</logic:present>


</div>
</div>	
			<div align="right">
<a href="<%=request.getContextPath()%>/indexFirst.do?status=moreNewProduct">
				<font color="#Fc66f0">����</font></a>
				</div>
                  </td>
                </tr>
              </table>
              
              
              
          </div>
              <div align="center">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="3" rowspan="2"><img src="<%= request.getContextPath()%>/images/test/images/left.GIF" width="3" height="33" /></td>
                    <td height="2" bgcolor="#FE8F02"></td>
                    <td width="3" rowspan="2"><img src="<%= request.getContextPath()%>/images/test/images/right.GIF" width="3" height="33" /></td>
                  </tr>
                  <tr>
                    <td><div align="left" class="css14">�Ƽ�����</div></td>
                  </tr>
                </table>
                <table width="98%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="160">
                     <div id="browse_main">
	
	<div class="goods_pic">
	
           <logic:present name="releseList">
            <bean:define id="result" name="releseList"  type="java.util.List" />
            <logic:iterate id="item" name="result" indexId="rowNum">
    <div class="detail">

	<table  onmouseover="this.style.backgroundColor='#FF4FAE'" onmouseout="this.style.backgroundColor=''" width="100"  
cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
       <tr>
       <td  bgcolor="#ffffff" height="100" align="center">
	<a href="<%=request.getContextPath()%>/indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
	<img src="<%=name2 %>\<bean:write name="item" property="smallPath"/>" width="100" height="100" border="0"/></a>
	     </td></tr>
         </table>
         

	
	 <h2>
	 <a href="<%=request.getContextPath()%>/indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
				<font color="#FF6600">${item.productName}</font></a>
	 </h2>
	</div>
            
            
            
			</logic:iterate>
			</logic:present>
			
<div class='emptybox'></div>
</div>
</div>	
<div align="right">
<a href="<%=request.getContextPath()%>/indexFirst.do?status=moreReleaseProduct">
				<font color="#Fc66f0">����</font></a>
				</div>
                    
                    </td>
                  </tr>
                </table>
              </div>
            <div align="center">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="3" rowspan="2"><img src="<%= request.getContextPath()%>/images/test/images/left.GIF" width="3" height="33" /></td>
                    <td height="2" bgcolor="#23980C"></td>
                    <td width="3" rowspan="2"><img src="<%= request.getContextPath()%>/images/test/images/right.GIF" width="3" height="33" /></td>
                  </tr>
                  <tr>
                    <td><div align="left" class="css14">�ؼ�����</div></td>
                  </tr>
                </table>
                <table width="98%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="160">
                            
    <div id="browse_main">
	
	<div class="goods_pic">
	
            <logic:present name="specialPriceList">
            <bean:define id="result" name="specialPriceList"  type="java.util.List" />
<logic:iterate id="item" name="result" indexId="rowNum">
				<div class="detail">
	<div class="goods">
	
	<table  onmouseover="this.style.backgroundColor='#FF4FAE'" onmouseout="this.style.backgroundColor=''" width="100"  

cellspacing="1" cellpadding="2" bgcolor="#e1e1e1" border="0">
       <tr><td  bgcolor="#ffffff" height="100" align="center">
	<a href="<%=request.getContextPath()%>/indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
	<img src="<%=name2 %>\<bean:write name="item" property="smallPath"/>" width="100" height="100" border="0"/></a>
	     </td></tr>
         </table>
         
	</div>
	
	 <h2>
	 <a href="<%=request.getContextPath()%>/indexFirst.do?status=onlyGoodsShow&productId=${item.productId}">
				<font color="#FF6600">${item.productName}</font></a>
	 </h2>
	</div>
			
			
			</logic:iterate>
			</logic:present>
			
<div class='emptybox'></div>
</div>
</div>	
<div align="right">
  <a href="<%=request.getContextPath()%>/indexFirst.do?status=specialPrice">
				<font color="#Fc66f0">����</font></a>
				</div>
                    </td>
                     </tr>
                        </table>
                      
                      
                      
                      
                        
                    </div>
                    </td>
                  </tr>
                </table>
           </td>
          </tr>
 </div>
<div align="center">
<jsp:include flush="true" page="bottom.jsp" /> 
</div>
</center>
</form>
</body>
</html>