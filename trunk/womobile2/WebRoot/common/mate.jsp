<%@ page language="java" errorPage="/error.jsp" contentType="text/html;charset=GBK"%>
<%
  //����ȫ�ֱ���
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ include file="/common/taglibs.jsp"%>
<title>��ͨ���ƶ�����ƽ̨</title>
<meta name="author" content="@qzgf Group Develop" />
<meta name="Copyright" content="">
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv=Content-Language content=zh-cn>

<link type="text/css" href="<%=path%>/css/btn.css" rel="stylesheet"  charset="UTF-8"/>

<!-- ����jquery����ʽ,��ui�� -->

<link type="text/css" href="<%=path%>/css/jquery-ui-1.7.custom.css" rel="stylesheet"  charset="UTF-8" />

<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js" charset="UTF-8"></script>

<script type="text/javascript" src="<%=path%>/js/jquery-ui-1.7.custom.min.js" charset="UTF-8"></script>

<script type="text/javascript" src="<%=path%>/js/jquery.form.js" charset="UTF-8"></script>

<!-- ������֤js,����֤��ʽ�� -->
<link type="text/css" href="<%=path%>/css/validator.css" rel="stylesheet"  charset="UTF-8"/>
<script type="text/javascript" src="<%=path%>/js/formValidator.js" charset="UTF-8"></script>
<script type="text/javascript" src="<%=path%>/js/formValidatorRegex.js" charset="UTF-8"></script>
<!-- ����tablesorter -->
<link type="text/css" href="<%=path%>/css/tab.css" rel="stylesheet"  charset="UTF-8"/>
<!--����js���-->
<script type="text/javascript" src="<%=path%>/js/jutil.js" charset="UTF-8"></script>

<!--ȷ��js-->
<script type="text/javascript" src="<%=path%>/js/jquery.alerts.js" charset="UTF-8"></script>
<link href="<%=path%>/css/jquery.alerts.css" rel="stylesheet"
	type="text/css" media="screen"  charset="UTF-8"/>
<link href="<%=path%>/css/mapFortune.css" rel="stylesheet" type="text/css"  media="screen" charset="UTF-8"/>