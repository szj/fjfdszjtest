<%@ page contentType="text/html; charset=GB2312" language="java" import="java.sql.*" import="java.util.*"import="com.apricot.app.bean.*" errorPage="" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'diancai.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
   <style type="text/css">
  body{background:#eeefff;}
 .ding{background:url(img/ming.gif); height:25px;padding-top:4px;text-align:center;}
 .shou{background:#eeefff;text-align:left;}
 .color{color:red;TEXT-DECORATION:NONE;}
  </style>
<body>
    <%  
        String food_type=null;
        food_type=(String)request.getAttribute("food_type");

        String ORDER_ID=(String)session.getAttribute("ORDER_ID"); 
        System.out.println("dsds="+food_type);
        System.out.println("dsdsss="+ORDER_ID);
    %>
    <div class="shou">
	        <div class=ding>���ϵͳ</div>
	          ��ѡ��˵����ͣ�<br>        
	         <a href="/apricot_ed/servlet/diancai?food_type=00"><div <%if(food_type.equals("00")){%>class="color"<%}%>>����</div></a>&nbsp&nbsp&nbsp	    
	         <a href="/apricot_ed/servlet/diancai?food_type=01"><div <%if(food_type.equals("01")){%>class="color"<%}%>>��ǰС��</div></a>&nbsp&nbsp&nbsp
	         <a href="/apricot_ed/servlet/diancai?food_type=02"><div <%if(food_type.equals("02")){%>class="color"<%}%>>���</div></a>&nbsp&nbsp&nbsp
	         <a href="/apricot_ed/servlet/diancai?food_type=03"><div <%if(food_type.equals("03")){%>class="color"<%}%>>������</div></a>&nbsp&nbsp&nbsp
	         <a href="/apricot_ed/servlet/diancai?food_type=04"><div <%if(food_type.equals("04")){%>class="color"<%}%>>��ˮ</div></a>&nbsp&nbsp&nbsp
	         <a href="/apricot_ed/servlet/diancai?food_type=05"><div <%if(food_type.equals("05")){%>class="color"<%}%>>ơ��</div></a>&nbsp&nbsp&nbsp
	         <a href="/apricot_ed/servlet/diancai?food_type=99"><div <%if(food_type.equals("99")){%>class="color"<%}%>>����</div></a>&nbsp&nbsp&nbsp
    </div>
    <br>
    <form id="form" name="form" method="post" action="/apricot_ed/servlet/diancai">
    <table>
    <tr><td>��Ʒ����</td><td>��Ʒ����</td><td>��Ʒ����</td><td>ѡ��</td></tr>
    <%
    	Food_info food_info;  
		List list=new ArrayList();
		list=(List)request.getAttribute("caidan"); 
		
	
    	for(int i=0;i<list.size();i++)
		{
		food_info=(Food_info)list.get(i);
		%><tr><td><%out.println(food_info.getFOOD_NAME());%></td>
		<td><%out.println(food_info.getFOOD_PRICE());%></td>
		<td><input name="<%=food_info.getFOOD_ID()%>" type="text" size="5" value="1"/></td>
		<td><input name="diancaicheckbox" type="checkbox" value="<%=food_info.getFOOD_ID()%>" /></td></tr>
		<% 
		}
        %>
     </table>
     <br><input type="submit" value="ȷ��">
     </form>
     <br>
     <input   type=button   value=��˽���   onclick="window.close()">
    <a href ="" onClick="parent.history.back(); return false;" onMouseOver="self.status='����' ;return true;">����</a> 
	<!-- ��SRC���ͼƬ��Ϊ�����ǰ��ͼƬ��-->                  
	<a href ="" onClick="parent.history.forward(); return false;" onMouseOver="self.status='ǰ��'; return true;">ǰ��</a> 
</body>
</html>