<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
<body>
<br>
<br>
<form name="form1" method="post" action='/netprint/emsmail/emsmailupload.shtml' class="formcheck" onsubmit="return checkSubmit();" enctype="multipart/form-data">
<table><tr><td>EMS�ʼ���������</td>
<td>
<input type="file"  name="upload"  id="upload" onpropertychange="if(!/(xls)/.test(this.value.substr(this.value.lastIndexOf('.')+1))){Ext.MessageBox.alert('��ʾ','���Ͳ�֧��');}"/>
</td> 
<td><input type="button"  name="buttonName"  id="buttonId" value="�ϴ�" onclick="selectupload()" /></td>
<td>
<div id="waitlog" style="display:none" >
������,��ȴ�......<img src="/images/extanim32.gif">
</div>
</td>
</tr>
</table>
<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
</form>

<font color="red">
ע��:
<br>
1.�Ƿ񱣼�:��������"��","��"����ѡ��.
<br>
2.�ʼ�����:��������"�ź�","�ļ�","��Ʒ"����ѡ��.
<br>
3.ģ������
<a href="http://print.yzyogo.com/model.xls">����</a>
<br>
˵��:������������������¼,��һ��Ϊ��Ϣ��ȫ��д��,��������Ϊ��ʡ�Բ������Ϣ.
</font>
<script>
function selectupload(){
    //Ext.getCmp("DivLogin").getEl().dom.style.display='none'
     Ext.get('waitlog').dom.style.display='block';
   	document.form1.submit();
}
</script>
</body>
</html>