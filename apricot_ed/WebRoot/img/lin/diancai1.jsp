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
 /* ȫ��CSS���� */
body { text-align: center; font-family:"����", arial;margin:0; padding:0; background: #FFF; font-size:25px; color:#000;}

/* 2�� */
.divArea{margin:0 auto; width:1000px;background:url("images/bg.gif");}
.divArea .Col1{float:left; width:1000px;}
 /* ���ѡ� */
.naTab{clear:both;border-bottom:1px #CCCCCC solid;}
.naTab .TabTitle{ height:40px; clear:both;overflow:hidden;}
.naTab .TabTitle ul{margin:0; padding:0;}
.naTab .TabTitle li{ list-style-type:none; padding:6px 0 2px;cursor:pointer;}
.naTab .TabTitle .active{ float:left;width:130px;background:url("images/bg5_6_1.gif");}
.naTab .TabTitle .normal{ float:left;width:130px;background:url("images/bg5_6_2.gif");}
.naTab .TabContent {padding:10px;}

.none {display:none;}
 
 .anniu{width:80px;height:60px;}
 
 
 
  </style>
 <script type="text/javascript">
function nTabs(tabObj,obj){
	var tabList = document.getElementById(tabObj).getElementsByTagName("li");
	for(i=0; i <tabList.length; i++)
	{
		if (tabList[i].id == obj.id)
		{
			document.getElementById(tabObj+"_Title"+i).className = "active"; 
    		document.getElementById(tabObj+"_Content"+i).style.display = "block";
		}else{
			document.getElementById(tabObj+"_Title"+i).className = "normal"; 
			document.getElementById(tabObj+"_Content"+i).style.display = "none";
		}
	} 
}
</script>
  
  
  
  
  
<body>
	<br />
<!-- ���ݿ�ʼ -->
<div class="divArea">
  <!-- left -->
  <div class="Col1">
    <!-- ���ֿ�ʼ -->
    <div class="naTab" id="naTab" style="height:177px;">
      <div class="TabTitle">
        <ul>
          <li id="naTab_Title0" onclick="nTabs('naTab',this);" class="active"><a href="javascript:void(0);">����</a></li>
          <li id="naTab_Title1" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">��ˮ</a></li>
          <li id="naTab_Title2" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">ơ��</a></li>
          <li id="naTab_Title3" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">��ǰС��</a></li>
          <li id="naTab_Title4" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">����</a></li>
          <li id="naTab_Title5" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">���</a></li>
          <li id="naTab_Title6" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">����</a></li>
          <li id="naTab_Title7" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">ţ��</a></li>
          <li id="naTab_Title8" onclick="nTabs('naTab',this);" class="normal"><a href="javascript:void(0);">ˮ��</a></li>      
        </ul>
      </div>
      <%Food_info food_info;  
		List list=new ArrayList();
		list=(List)request.getAttribute("caidan");  %>
		
		<form id="form" name="form" method="post" action="/apricot_ed/servlet/diancai1">
		
		
      <div class="TabContent">
        <div id="naTab_Content0">
        
        <%
    	for(int i=0;i<list.size();i++)
		{
		food_info=(Food_info)list.get(i);
		if(food_info.getFOOD_TYPE().equals("00"))
		{
		%><table><tr><td><%out.println(food_info.getFOOD_NAME());%></td>
		<td><%out.println(food_info.getFOOD_PRICE());%></td>
		<td><input name="<%=food_info.getFOOD_ID()%>" type="text" size="5" value="1"/></td>
		<td><input name="diancaicheckbox" type="checkbox" value="<%=food_info.getFOOD_ID()%>" /></td></tr></table>
		<% 
		}
		}
        %>
        

        </div>
        <div id="naTab_Content1" class="none">
         <%
    	for(int i=0;i<list.size();i++)
		{
		food_info=(Food_info)list.get(i);
		if(food_info.getFOOD_TYPE().equals("04"))
		{
		%><table><tr><td><%out.println(food_info.getFOOD_NAME());%></td>
		<td><%out.println(food_info.getFOOD_PRICE());%></td>
		<td><input name="<%=food_info.getFOOD_ID()%>" type="text" size="5" value="1"/></td>
		<td><input name="diancaicheckbox" type="checkbox" value="<%=food_info.getFOOD_ID()%>" /></td></tr></table>
		<% 
		}
		}
        %>
        
        </div>
        <div id="naTab_Content2" class="none">
           <%
    	for(int i=0;i<list.size();i++)
		{
		food_info=(Food_info)list.get(i);
		if(food_info.getFOOD_TYPE().equals("05"))
		{
		%><table><tr><td><%out.println(food_info.getFOOD_NAME());%></td>
		<td><%out.println(food_info.getFOOD_PRICE());%></td>
		<td><input name="<%=food_info.getFOOD_ID()%>" type="text" size="5" value="1"/></td>
		<td><input name="diancaicheckbox" type="checkbox" value="<%=food_info.getFOOD_ID()%>" /></td></tr></table>
		<% 
		}
		}
        %>


       </div>
      </div>
      <br><input  class="anniu" type="submit"   value="��˽���"   onclick="window.close()">
      </form>
      
      <!-- ���ֽ��� -->
    </div>
  </div>
</div>
<!-- ���ݽ��� -->
	
	
	
	
	
	
	
	
</body>
</html>