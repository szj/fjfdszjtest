<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<%
	//定义全局变量
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" src='<%=path%>/js/date.js'></script>
<title></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #147233;
}
-->
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="23" background="images/main_25.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="181" height="23" background="images/main_24.gif">&nbsp;</td>
        <td><div align="right" class="STYLE1">今天是：<script language="javascript">getdate();</script></div></td>
        <td width="25"><img src="images/main_27.gif" width="25" height="23" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
