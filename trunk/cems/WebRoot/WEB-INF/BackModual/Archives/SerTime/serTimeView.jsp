<%@page contentType="text/html; charset=gbk"%>
<%@taglib uri="/WEB-INF/util.tld" prefix="qzgf"%>
<%@taglib uri="/WEB-INF/struts-tags.tld" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
  //����ȫ�ֱ���
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<body>
<center>
   <table width="90%" height="190" border="1">
   <tr>
   <td colspan="3"> 
       <strong>���ϼļ�</strong>
   </td>
   </tr>
    <tr>
	<td>
		<s:actionerror theme="ems" />
	</td>
	<td>
		<s:actionmessage theme="ems" />
	</td>
  </tr>
   <tr> 
   <td>��ϵ��:</td>
   <td>
   <s:property value="%{order.NAME}"/>
   </td>
   <td><div id="pnameTip" style="width:250px"></div></td>
   </tr>   
   
   <tr> 
   <td>�̶��绰:</td>
   <td>
   ����:
   <s:property value="%{order.AREACODE}"/>
   �绰����:
   <s:property value="%{order.TEL}" />
   </td>
   <td><div id="ptelTip" style="width:250px"></div></td>
   </tr>
   
   <tr> 
   <td>�ֻ�:</td>
   <td>
   <s:property  value="%{order.MOBILE}"/>
   </td>
   <td><div id="pmobileTip" style="width:250px"></div></td>
   </tr>

 
   <tr> 
   <td rowspan="2">ȡ����ַ:</td>
   <td>
                         ʡ��:<s:property value="PROVINCENAME"/>
                        ���У�<s:property value="CITYNAME"/>
					  �ء�����<s:property value="COUNTYNAME"/>
   </td>
   <td rowspan="2"><div id="paddressTip" style="width:250px"></div></td>
   </tr>
   <tr> 
   <td>
      ��ϸ��ַ:
      <s:property value="%{order.ADDRESS}"/>
   </td>
   </tr>    
 
   
   <tr> 
   <td>�ʼ�����:</td>
   <td>
   <s:property value="%{order.MAILTYPENAME}"/>
   </td>
   <td><div id="pmailtypeTip" style="width:250px"></div></td>
   </tr>  
 
   <tr> 
   <td>ԤԼʱ��:</td>
   <td>
   <s:property  value="%{order.BOOKINGTIME}"/>
   </td>
   <td><div id="pbookingtimeTip" style="width:250px"></div></td>
   </tr>   

   <tr> 
   <td>�ļ�����:</td>
   <td>
   <s:property value="%{order.ORDERINGNUM}"/>
   </td>
   <td><div id="porderingnumTip" style="width:250px"></div></td>
   </tr>   
   
   <tr> 
   <td>��Ʒ����:</td>
   <td>
   <s:property value="%{order.ORDERINGWEIGHT}"/>(ǧ��)
   </td>
   <td><div id="porderingweightTip" style="width:250px"></div></td>
   </tr>
   
   <tr> 
   <td>�ͻ�Ҫ��:</td>
   <td>
   <s:property value="%{order.CLIENTREMARK}"/>
   </td>
   <td><div id="pclientremarkTip" style="width:250px"></div></td>
   </tr>     

   <tr> 
   <td>�ռ��˵�ַ:</td>
   <td>
                         ʡ��:<s:property value="%{order.RECPROVINCENAME}"/>
                        ���У�<s:property value="%{order.RECCITYNAME}"/>
   </td>
   <td><div id="precaddressTip" style="width:250px"></div></td>
   </tr>
 </table>
</center>
</body>
</html>