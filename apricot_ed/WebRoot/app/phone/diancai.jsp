<%@ page contentType="text/html; charset=GB2312" language="java" import="java.sql.*" import="java.util.*"import="com.apricot.app.pda.*" errorPage="" %>
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
  body{background:#ccc;}
 .ding{background:url(phone_img/12.gif); color:white;height:25px;padding-top:4px;text-align:center;}
 .shou{background:#ccc;text-align:left;}
 .color{color:red;TEXT-DECORATION:NONE;}
 .anniu{color:white;background:url(phone_img/12.gif);width:80px;height:35px;}
 .di{text-align:center;font-size:20px;margin-left:170px;}
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
	         <table>  
	         <tr>      
	         <td><a href="/apricot_ed/servlet/diancai00?food_type=00"><div <%if(food_type.equals("00")){%>class="color"<%}%>>����</div></a>&nbsp&nbsp&nbsp	</td>    
	         <td><a href="/apricot_ed/servlet/diancai00?food_type=01"><div <%if(food_type.equals("01")){%>class="color"<%}%>>��ǰС��</div></a>&nbsp&nbsp&nbsp</td>
	         <td><a href="/apricot_ed/servlet/diancai00?food_type=02"><div <%if(food_type.equals("02")){%>class="color"<%}%>>���</div></a>&nbsp&nbsp&nbsp</td>
	         <td><a href="/apricot_ed/servlet/diancai00?food_type=03"><div <%if(food_type.equals("03")){%>class="color"<%}%>>������</div></a>&nbsp&nbsp&nbsp</td>
	         <td><a href="/apricot_ed/servlet/diancai00?food_type=04"><div <%if(food_type.equals("04")){%>class="color"<%}%>>��ˮ</div></a>&nbsp&nbsp&nbsp</td>
	         <td><a href="/apricot_ed/servlet/diancai00?food_type=05"><div <%if(food_type.equals("05")){%>class="color"<%}%>>ơ��</div></a>&nbsp&nbsp&nbsp</td>
	         <td><a href="/apricot_ed/servlet/diancai00?food_type=99"><div <%if(food_type.equals("99")){%>class="color"<%}%>>����</div></a>&nbsp&nbsp&nbsp</td>
             </tr> 
             </table>  
    </div>
    
    <br>
    <form id="form" name="form" method="post" action="/apricot_ed/servlet/diancai00">
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
     <br><input class="anniu" type="submit" value="ȷ��">
     </form>
   
     <a class="di" href="/apricot_ed/servlet/chexunjieguo">�������</a>
     <br>�ѵ�˵�<br>
     <% //����Ϣ
        Order_list order_list;  
		List list1=new ArrayList();
		list1=(List)request.getAttribute("dingdanxinxi"); 
		if(list1.size()!=0){  
	%>
        <table><tr><td>����</td><td>����</td><td>��ǰ�۸�</td><td>����</td></tr>
    <%
		for(int i=0;i<list1.size();i++)
		{
		order_list=(Order_list)list1.get(i);
	%>
		<tr><td><%out.println(order_list.getFood_info().getFOOD_NAME());%></td>
		<td><%out.println(order_list.getFOOD_COUNT());%></td>
		<td><%out.println(order_list.getFood_info().getFOOD_PRICE());%></td><td><a href="/apricot_ed/servlet/DelOrderDetail?OrderId=<%=ORDER_ID %>&OrderListId=<%=order_list.getFood_info().getORDER_LIST_ID() %>">ɾ��</a></td></tr><%
		}
		}
        %>
        </table>
   <!--<a href ="" onClick="parent.history.back(); return false;" onMouseOver="self.status='����' ;return true;">����</a>  --> 
	<!-- ��SRC���ͼƬ��Ϊ�����ǰ��ͼƬ��-->                  
	 <!--<a href ="" onClick="parent.history.forward(); return false;" onMouseOver="self.status='ǰ��'; return true;">ǰ��</a>  --> 
</body>
</html>