<%@page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="/error.jsp" %>
<%@include file="/common/taglibs.jsp"%>

<script language="javascript" src="/themes/default/js/optiontransferselect.js"></script>
<ww:action name="'select'" id="select"></ww:action>
<ww:set name="role" value="''"/>
<ww:set name="roleId" value="''"/>
<ww:iterator value="roleList">
	<ww:if test="0==checked">
		<ww:set name="role" value="#role+\"<option value='\"+ role_id +\"'>\"+role_name+\"</option>\""/>
	</ww:if>
	<ww:elseif test="1==checked">
		<ww:set name="roleId" value="#roleId+\"<option value='\"+ role_id +\"'>\"+role_name+\"</option>\""/>
	</ww:elseif>
</ww:iterator>

<form action="/system/manage/manager.shtml?actionType=roleAllot" method="post" onsubmit="customOnsubmit();">

<br>
<div style="wdith:98%" align="center">
	<INPUT type="hidden" name="userInfo.staffId" value="<ww:property value='userInfo.staffId'/>">
	<INPUT type="hidden" name="userInfo.staffNo" value="<ww:property value='userInfo.staffNo'/>">
	<INPUT type="hidden" name="userInfo.staffName" value="<ww:property value='userInfo.staffName'/>">
	��Ա���ţ�${param['userInfo.staffNo']}&nbsp;&nbsp;��Ա������${param['userInfo.staffName']}
</div>
<br>

<table width="400"  border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td rowspan="2" align="center">
    	<select name="leftSideCartoonCharacters" size="15" id="exampleSubmit_leftSideCartoonCharacters" multiple="multiple">
    		<option value="headerKey">--- δ����Ľ�ɫ ---</option>
    		<option value=""></option>
			<ww:property value="#role"/>
		</select>
	</td>
    <td align="center"><INPUT type="button" value="&lt;&lt;" name="gl" onclick="moveSelectedOptions(document.getElementById('exampleSubmit_rightSideCartoonCharacters'), document.getElementById('exampleSubmit_leftSideCartoonCharacters'), false, 'doubleHeaderKey', '')" ></td>
    <td rowspan="2" align="center">
    	<select name="roleId" size="15"	multiple="multiple" id="exampleSubmit_rightSideCartoonCharacters">
    		<option value="doubleHeaderKey">--- �ѷ���Ľ�ɫ ---</option>
		    <option value=""></option>
			<ww:property value="#roleId"/>
		</select>
	</td>
  </tr>
  <tr>
    <td align="center"><INPUT type="button" value="&gt;&gt;" name="gr" onclick="moveSelectedOptions(document.getElementById('exampleSubmit_leftSideCartoonCharacters'), document.getElementById('exampleSubmit_rightSideCartoonCharacters'), false, 'headerKey', '')" /></td>
  </tr>
  <tr>
    <td colspan="3" height="40" align="center">
    	<INPUT type="submit" value="����">&nbsp;
  	</td>
  </tr>
</table>
</form>
<br>
<div>
	<font color="red">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ע:��ǰ��Ա�ɽ��Լ�������"�Զ����ɫ"�������������Ա,<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ҳ�ɽ��Լ���ӵ�е�"ϵͳĬ�Ͻ�ɫ"�������������Ա
	</font>
</div>
<script language="javascript" src="/themes/default/js/optiontransferselect.js"></script>
<script language="javascript">
	function customOnsubmit() {
		// Code that will auto-select optiontransferselect elements upon containing form submission
		// auto-select optiontrasferselect (left side) with id exampleSubmit_leftSideCartoonCharacters
		//var selectObj = document.getElementById("exampleSubmit_leftSideCartoonCharacters");
		//selectAllOptions(selectObj);
		//selectUnselectMatchingOptions(selectObj, null, "unselect", false, "key");
		//selectUnselectMatchingOptions(selectObj, "headerKey", "unselect", false, "key");
		// auto-select optiontransferselect (right side) with id exampleSubmit_rightSideCartoonCharacters
		var doubleSelectObj = document.getElementById("exampleSubmit_rightSideCartoonCharacters");
		selectAllOptions(doubleSelectObj);
		selectUnselectMatchingOptions(doubleSelectObj, null, "unselect", false, "key");
		selectUnselectMatchingOptions(doubleSelectObj, "doubleHeaderKey", "unselect", false, "key")
	}
</script>