<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<script language="javascript">
function btn1Clk()
{
	//printdata():��һ����Ϊ����ģ��汾�ţ��ڶ�������Ϊ����ģ���ļ�������������Ϊ�����ļ����ƣ������ֶ�Ϊ�ϱ߾࣬�����ֶ�Ϊ��߾࣬��������Ϊbase64������
    //printdataex():��һ����Ϊ����ģ��汾�ţ��ڶ�������Ϊ����ģ���ļ�������������Ϊ�����ļ����ƣ������ֶ�Ϊ�ϱ߾࣬�����ֶ�Ϊ��߾࣬��������Ϊҳ��,���߲���Ϊbase64������
	if (<ww:property value="search.printtype"/>==1 && <ww:property value="search.pagenum"/>==1){
	   aa.printdataex('10','http://print.yzyogo.com/x.fr3','x',<ww:property value="search.top_margin"/>,<ww:property value="search.left_margin"/>,<ww:property value="search.pagenum"/>,document.all("RMVIEWER_DATA").value);
	}else{
	   aa.printdataex('10','http://print.yzyogo.com/x.fr3','x',<ww:property value="search.top_marginex"/>,<ww:property value="search.left_marginex"/>,<ww:property value="search.pagenum"/>,document.all("RMVIEWER_DATA").value);
	}
	
	//edit1.value=aa.printxml('1.0','http://172.30.193.28:8080/x.fr3','x',0,0,'http://172.30.193.28:8080/my.xml');
}
function btn2Clk()
{
	//��һ����Ϊ����ģ��汾�ţ��ڶ�����Ϊ����ģ���ļ�����������Ϊ�����ļ����ƣ����Ĳ���Ϊ�����ļ�����
	edit2.value=aa.reportdesign('2','http://print.yzyogo.com/x.fr3','x',document.all("RMVIEWER_DATA").value);
}
</script>
<body onload="btn1Clk();">
<textarea id='RMVIEWER_DATA' style='display:none'>
<ww:property value="base64str"/>&nbsp; 
</textarea>
<!-- 
codebase="http://172.30.193.28:8080/netprintex.cab#version=1,0,0,0"
<INPUT TYPE="text" NAME="edit1"><input type="button" onclick="btn1Clk()" value="��ӡ"></input>
<INPUT TYPE="text" NAME="edit2"><input type="button" onclick="btn2Clk()" value="���"></input>
 -->
<br>
<OBJECT id="aa"
	  classid="clsid:40E8496C-E64A-4CC3-A380-99A93EBBF739"
	  width=0
	  height=0
	  align=center
	  hspace=0
	  vspace=0
>
</OBJECT>
</body>
