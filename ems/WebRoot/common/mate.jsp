<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%
  //����ȫ�ֱ���
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="/common/taglibs.jsp"%>
<meta name="author" content="@qzgf Group Develop" />
<meta name="Copyright" content="�ڷ�����">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta http-equiv=Content-Language content=zh-cn>
<!-- ����jquery����ʽ,��ui�� -->

<link type="text/css" href="<%=path%>/css/jquery-ui-1.7.custom.css" rel="stylesheet" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>

<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.7.custom.min.js"></script>

<script type="text/javascript" src="<%=path%>/js/jquery.form.js"></script>

<!-- ������֤js,����֤��ʽ�� -->
<link type="text/css" href="<%=path%>/css/validator.css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/js/formValidator.js"></script>
<script type="text/javascript" src="<%=path%>/js/formValidatorRegex.js"></script>
<!-- ����tablesorter -->
<link type="text/css" href="<%=path%>/css/table/style.css" rel="stylesheet" />
<script type="text/javascript" src="<%=path%>/js/jquery.tablesorter.js"></script>
<!--����js���-->
<script type="text/javascript" src="<%=path%>/js/jutil.js"></script>
<!--վ����Ϣ��-->
<script type="text/javascript" src="<%=path%>/js/jmessage.js"></script>
<!--ȷ��js-->
<script type="text/javascript" src="<%=path%>/js/jquery.alerts.js"></script>
<link href="<%=path%>/css/jquery.alerts.css" rel="stylesheet"
	type="text/css" media="screen"/ >
