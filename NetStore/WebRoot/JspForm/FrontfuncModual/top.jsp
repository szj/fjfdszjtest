<%@ page language="java"%>
<%@ page contentType="text/html;charset=gbk"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<jsp:directive.page import="com.qzgf.NetStore.dao.IIndexFirstDAO" />
<jsp:directive.page import="java.util.List" />
<jsp:directive.page import="com.qzgf.NetStore.dao.impl.IndexFirstDAO" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>��ҳ����</title>
		<link href="<%=request.getContextPath()%>/css/header01.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/index.css"
			type="text/css" rel="stylesheet" />
		<link href="<%=request.getContextPath()%>/css/catalog.css"
			type="text/css" rel="stylesheet" />
		<script type="text/javascript"> 
 	
 		function searchV(obj)
 		{
 	
		document.forms[0].action='<%=request.getContextPath()%>/search.do';
		document.forms[0].submit();
		}
</script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="<%= request.getContextPath()%>/images/test/images/css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<form action="search.do" method="post">
	<table width="98%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="30%" height="80"></td>
    <td width="68%" valign="top" align="right"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0" class="table2">
      <tr>
        <td background="<%= request.getContextPath()%>/images/test/images/header_line_bg.gif"><div align="center">
									
									
												<a id="MyBuyCar"
													href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/cart.do?status=goModifyCart"><font
													color="blue"><Strong>���ﳵ</Strong> </font> </a>
										
												<a
													href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/register.jsp">���û�ע��</a>
										
												<a
													href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/login.jsp">�û���¼</a>
											
												<a href="#">��������</a>
											
												�������ߣ�0595-22333666
										
								
      </div></td>
      </tr>
      
    </table>

    <img src="<%= request.getContextPath()%>/images/test/images/BBD.GIF" width="637" height="54" /></td>
  </tr>
</table>

<div align="center">
  <table width="98%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="3" height="30" background="<%= request.getContextPath()%>/images/test/images/top.GIF" bgcolor="#FFFFFF"><img src="<%= request.getContextPath()%>/images/test/images/tipl.GIF" width="3" height="30" /></td>
      <td background="<%= request.getContextPath()%>/images/test/images/top.GIF" bgcolor="#FFFFFF"><div align="left">
        <table height="30" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="100">&nbsp;</td>
              <td width="100"><table width="100" height="30" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="3"><img src="<%= request.getContextPath()%>/images/test/images/bjleft.GIF" width="3" height="30" /></td>
                    <td background="<%= request.getContextPath()%>/images/test/images/bjb.GIF" class="mulu"><div align="center">
                    <a
												href="<%=request.getContextPath()%>/indexFirst.do?status=exec"><span>�̳���ҳ</span>
											</a></div></td>
                    <td width="3"><img src="<%= request.getContextPath()%>/images/test/images/bjrig.GIF" width="3" height="30" /></td>
                  </tr>
              </table></td>
              <td width="10">&nbsp;</td>
              <td width="100" class="mulu2"><div align="center"><a
												href="<%=request.getContextPath()%>/search.do?catalogName=0"><span>���ٷ���</span>
											</a></div></td>
              <td width="10" class="mulu2"><div align="center"></div></td>
              <td width="100" class="mulu2"><div align="center"><a
												href="<%=request.getContextPath()%>/indexFirst.do?status=moreNewProduct"><span>�����ϼ�</span>
											</a></div></td>
              <td width="10" class="mulu2"><div align="center"></div></td>
              <td width="100" class="mulu2"><div align="center"><a
												href="<%=request.getContextPath()%>/indexFirst.do?status=specialPrice"><span>�ؼ۴���</span>
											</a></div></td>
              <td width="10" class="mulu2"><div align="center"></div></td>
              <td width="100" class="mulu2"><div align="center"><a
												href="<%=request.getContextPath()%>/indexFirst.do?status=productNewsShow"><span>��Ʒ����</span>
											</a></div></td>
              <td width="10" class="mulu2"><div align="center"></div></td>
              <td width="100" class="mulu2"><div align="center"><a
												href="<%=request.getContextPath()%>/JspForm/FrontfuncModual/account.do?status=queryOrderByCondition"><span>�ҵ��ʻ�</span>
											</a></div></td>
            </tr>
          </table>
      </div></td>
      <td width="3" background="<%= request.getContextPath()%>/images/test/images/top.GIF" bgcolor="#FFFFFF"><img src="<%= request.getContextPath()%>/test/images/tipr.GIF" width="3" height="30" /></td>
    </tr>
  </table>
  <table width="98%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="36" background="<%= request.getContextPath()%>/images/test/images/bja.GIF" bgcolor="#009900"><div align="center">
        <table width="98%" height="36" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td><div align="center">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td><span class="name">��Ʒ����: </span>
												<input name="searchContent" id="searchContent" type="text"
													size="50" maxlength="50" class="txt" value="���������Ʒ����"
													onfocus="if(this.value==this.defaultValue){this.value='';}"
													onblur="if(this.value==''){this.value=this.defaultValue;}"
													onKeyDown="if (event.keyCode==13)return PageBar.submitSearchForm();" />

												<%
													IIndexFirstDAO FR = new IndexFirstDAO();
													@SuppressWarnings("unchecked")
													List productList = FR.topProduct();
													request.setAttribute("productList", productList);
												%>
												
												<input type="button" name="search" onclick="searchV(this)"
													value="�߼�����" /></td>
                      <td>&nbsp;</td>
                      <td> [�߼�����] <font color="#FFFFFF">&nbsp;&nbsp;&nbsp;���������ؼ���&nbsp;&nbsp;&nbsp;&nbsp;���������ؼ���&nbsp;&nbsp;&nbsp;&nbsp;���������ؼ���&nbsp;&nbsp;&nbsp;&nbsp;���������ؼ���</font></td>
                    </tr>
                              </table>
              </div></td>
            </tr>
          </table>
      </div></td>
    </tr>
  </table>
</div>


	</form>
	
	</body>
</html>
