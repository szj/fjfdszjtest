<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link rel="stylesheet" type="text/css" href="public/css/ext-all.css"/>
<script type="text/javascript" src="public/js/adapter/ext-base.js"></script>
<script type="text/javascript" src="public/js/widgets/MessageBox.js"></script>
<script type="text/javascript">
//	alert("��½��ʱ�������µ�½��");
	Ext.MessageBox.alert("ϵͳ��ʾ","��½��ʱ�������µ�½��",function(btn, text){
		self.parent.location= "<%=request.getContextPath()%>";
    });
	
	
</script>
</head>
<body>

</body>
</html>