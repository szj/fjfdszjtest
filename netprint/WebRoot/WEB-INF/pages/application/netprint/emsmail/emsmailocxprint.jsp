<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<script language="javascript">

function btn1Clk()
{
    //alert("hello");
	//��һ������Ϊ�����ļ����ƣ��ڶ��ֶ�Ϊ�ϱ߾࣬�����ֶ�Ϊ��߾࣬���Ĳ���Ϊbase64������
	edit1.value=aa.printdata('x',0,0,document.all("RMVIEWER_DATA").value);

}
function btn2Clk()
{//����Ϊ�����ļ�����
	edit2.value=aa.reportdesign('x',document.all("RMVIEWER_DATA").value);

}
</script>
<body onload="btn1Clk();">
<textarea id='RMVIEWER_DATA' style='display:none'>
<ww:property value="base64str" />
</textarea>
<INPUT TYPE="text" NAME="edit1"><input type="button" onclick="btn1Clk()" value="��ӡ"></input>
<INPUT TYPE="text" NAME="edit2"><input type="button" onclick="btn2Clk()" value="���"></input>

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
