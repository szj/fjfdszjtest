<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//����ȫ�ֱ���
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<script type="text/javascript" src="<%=path%>/js/comm.js"></script>
		<link href="<%=path%>/css/mapFortune.css" rel="stylesheet" type="text/css" />
		<link href="<%=path%>/css/css1.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/js/pageList.js"></script>
	</head>
	<body>
		<div id="f_bg">
			<div id="f_tabs">
				<ul>
					<li id="tab1" class="f_tabClass1">
						<a href="javascript:;" onclick="loadDefaultList('<%=path%>/archives/user.do?action=listdetail',1,3);">ȫ��</a>
					</li>
					<li id="tab2" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultList('<%=path%>/archives/user.do?action=listdetail&search.pbill_type=0',2,3);">�����</a>
					</li>
					<li id="tab3" class="f_tabClass2">
						<a href="javascript:;" onclick="loadDefaultList('<%=path%>/archives/user.do?action=listdetail&search.pbill_type=1',3,3);">�����</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="f_main">
			<div id="defaultlist"></div>
		</div>
<script language="javascript" type="text/javascript">	
		    //����Ĭ��ҳ��    
		    $(document).ready(function(){
		    	loadDefaultList('<%=path%>/archives/user.do?action=listdetail',1,3);
		    });
</script>		    		
	</body>
</html>