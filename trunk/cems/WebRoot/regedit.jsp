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
<body>
<div align="center" >
	<table border="4" cellpadding="0" style="border-collapse: collapse" width="969" id="table3" height="648" bordercolor="#FFFFFF" cellspacing="0">
		<tr>
			<td valign="top">
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table4">
				<tr>
					<td>
					<img border="0" src="images/top1.jpg" width="518" height="76"><img border="0" src="images/top2.jpg" width="443" height="76"></td>
					<td>��</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="961" id="table5" background="images/nav.jpg" height="40">
				<tr>
					<td width="145" align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">��ҳ</font></b></td>
					<td align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">��ҵƷ��</font></b></td>
					<td align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">��ҵ�Ļ�</font></b></td>
					<td align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">���Ŷ�̬</font></b></td>
					<td width="167" align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">��Ʒ����</font></b></td>
					<td width="157" align="center"><b>
					<font color="#FFFFFF" style="font-size: 9pt">ר��Ӫ��</font></b></td>
				</tr>
			</table>
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table6" height="272">
				<tr>
					<td valign="top" bgcolor="#FFFFFF">
					<div align="center">
						<table border="0" width="933" id="table11" cellpadding="0" style="border-collapse: collapse" height="100%" bgcolor="#FFFFFF">
							<tr>
								<td height="18"></td>
							</tr>
							<tr>
								<td height="55">
								<img border="0" src="images/zhucelogo.jpg" width="191" height="55"></td>
							</tr>
							<tr>
								<td height="41">
								<img border="0" src="images/zhuce01.jpg" width="933" height="41"></td>
							</tr>
							<tr>
								<td background="images/zhuce02.jpg">
								<div align="center">
<form  method='POST' name='form1' action='/frontlogin.do?action=regedit'  id="form1">								
<TABLE height=502 width=619 border=0 id="table12" cellpadding="0" style="border-collapse: collapse" bordercolor="#C0C0C0">
  <TBODY>
  <TR>
    <TD width="95"></TD>
    <TD width="524"></TD></TR>
  <TR>
    <TD colSpan=2><s:actionerror theme="ems" /><s:actionmessage theme="ems" /></TD></TR>
  <TR>
    <TD align=left colSpan=2><b><font size="2" color="red">������� </font></b> </TD></TR>
  <TR align="left">
    <TD width="95"><font size="2">�û���:</font></TD>
    <TD width="524"><s:textfield id="pcode" name="search.pcode"  ></s:textfield><font size="2"> <FONT color=red>
	*</FONT> 
    </font> 
        <div id="pcodeTip" style="display: inline "></div>
    </TD>
    </TR>
  <TR align="left">
    <TD width="95"><font size="2">����:</font></TD>
    <TD width="524"><s:password id="ppasswd" name="search.ppasswd"></s:password> <font size="2"> <FONT 
      color=red>*</FONT> </font> 
       <div id="ppasswdTip" style="display: inline "></div>
      </TD>
    </TR>
  <TR align="left">
    <TD width="95"><font size="2">ȷ������:</font></TD>
    <TD width="524"><s:password id="preppasswd" name="search.preppasswd"></s:password><font size="2"> <FONT 
      color=red>*</FONT> </font>
    <div id="preppasswdTip" style="display: inline "></div>  
       </TD>
    </TR>
  <TR align="left">
    <TD width="95"><font size="2">����:</font></TD>
    <TD width="524"> <s:textfield id="pname" name="search.pname" ></s:textfield><font size="2"> <FONT color=red>*</FONT> 
	</font>
	<div id="pnameTip" style="display: inline "></div>
	 </TD>
    </TR>
  <TR align="left">
    <TD width="95"><font size="2">�̶��绰:</font></TD>
    <TD width="524"><s:textfield id="ptel" name="search.ptel" ></s:textfield><font size="2"> </font> </TD>
    <div id="ptelTip" style="display:inline"></div>
    </TR>
  <TR align="left">
    <TD width="95"><font size="2">�ֻ�:</font></TD>
    <TD width="524"><s:textfield id="pmobile" name="search.pmobile"></s:textfield><font size="2"> <FONT color=red>*</FONT> 
	</font> 
	<div id="pmobileTip" style="display: inline "></div>
	</TD>
    </TR>
  <TR align="left">
    <TD rowSpan=2 width="95"><font size="2">��ַ:</font></TD>
    <TD width="524"><font size="2">ʡ��: </font>
	<select id="pprovince" name="search.pprovince" onchange="changeCombo('pcity','pprovince','cityvalue')"></select>
	<font size="2"> ���У�</font>
	<select id="pcity" name="search.pcity" onchange="changeCombo('pcounty','pcity','countyvalue')"></select>
	<font size="2"> �ء�����</font>
	<select id="pcounty" name="search.pcounty"></select>
	<font size="2"> </font> </TD>
    </TR>
  <TR align="left">
    <TD width="524"><font size="2">��ϸ��ַ: </font> 
    <s:textfield id="paddress"  name="search.paddress" size="40"> </s:textfield>
	<font size="2"><FONT color=red>*</FONT> </font>
<div id="paddressTip" style="display: inline "></div>	
</TD>
	
	</TR>
  <TR>
    <TD align=left colSpan=2><font size="2" color="red"><b>��ѡ���</b></font><font size="2">
	</font> </TD></TR>
  <TR align="left">
    <TD width="95"><font size="2">��λ����:</font></TD>
    <TD width="524"><s:textfield id="punit" name="search.punit"></s:textfield><font size="2"> </font>
    <div id="punitTip" style="display: inline "></div>
     </TD>
    </TR>
  <TR align="left">
    <TD width="95"><font size="2">��������:</font></TD>
    <TD width="524"><s:textfield id="pemail" name="search.pemail"></s:textfield><font size="2"> </font>
    <div id="pemailTip" style="display: inline "></div>
     </TD>
    </TR>
  <TR align="left">
    <TD width="95"><font size="2">��֤�룺</font></TD>
    <TD width="524"><s:textfield id="pverifycode" name="search.pverifycode"  size="6" maxlength="4" ></s:textfield>
    <font size="2"> <IMG  id=imgcode title=�����壿����һ�� style="CURSOR: pointer" 
      onclick="document.getElementById('imgcode').src='/authimg?action='+Math.random();" 
      alt=�����壿����һ�� src="/authimg" border=0> 
      <FONT color=red>*</FONT> </font>
     <div id="pverifycodeTip" style="display: inline "></div> 
       </TD>
    </TR>
  <TR>
    <TD align="center" colSpan=2>
													<input type="button" onclick="javascript:save()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
													<input type="button" onclick="javascript:reset()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
												    <input type="button" onclick="javascript:history.go(-1)" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
	</TD>
	</TR>
	</TBODY></TABLE>
</form>	
	</div>
  <p>
  </td>
  </tr>
							<tr>
								<td>
								<img border="0" src="images/zhuce03.jpg" width="933" height="7"></td>
							</tr>
							<tr>
								<td>��</td>
							</tr>
						</table>
					</div>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" style="border-collapse: collapse" width="100%" id="table10" background="images/di.jpg" height="27">
				<tr>
					<td valign="middle"><span style="font-size: 4pt"><br>
					</span><span style="font-size: 9pt">&nbsp;<font color="#FFFFFF">All 
					rights reserved. 2009&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					����֧�� by </font><font color="#02687F">Ȫ���йڷ���Ϣ�Ƽ����޹�˾</font></span></td>
				</tr>
			</table>
			</td>
		</tr>
	</table>
</div>
<script type="text/javascript">
//ǰ̨�ű���֤   onclick="javascript:isExist(this);" 

//��������
	function save(){
	    if($.formValidator.pageIsValid()){
			document.forms[0].submit();
		}else
		{
		  return false;
		}
	}
	
	 //��������
	function reset(){
			document.forms[0].reset();
			return true;
	}

$(document).ready(function(){
	//���ñ���
	$("body").css("background-img","url('images/bg.jpg')");


	$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){
	   if($("#ptel").val()==""&&$("#pmobile").val()=="")
	   {
		   alert('�绰���ֻ�����һ��');
		   return false;	   
	   }else
	   {
		   alert('ȷ�ϱ���!');
		   return true;
	   }
	}});
	$("#pcode").formValidator({onfocus:"�û�������6���ַ�,���40���ַ�",oncorrect:"��"}).inputValidator({min:6,max:40,onerror:"��������û����Ƿ�,��ȷ��"})//.regexValidator({regexp:"username",datatype:"enum",onerror:"�û�����ʽ����ȷ"})
	.ajaxValidator({
	    type : "get",
		url : "frontlogin.do",
		data:"action=isExist",
		datatype : "xml",
		success : function(data){
		    root = data.documentElement;
		    var rowSet = root.selectNodes("//delete");
            if( rowSet.item(0).selectSingleNode("value").text == "0" )
			{
                return true;
			}
            else
			{
                return false;
			}
		},
		buttons: $("#saveId"),
		error: function(){alert("������û�з������ݣ����ܷ�����æ��������");},
		onerror : "���û��������ã�������û���",
		onwait : "���ڶ��û������кϷ���У�飬���Ժ�..."//function(){alert($("#pcode").val());}
	});
	



	$("#ppasswd").formValidator({onfocus:"���벻��Ϊ��,�ҳ���Ϊ6~20���ַ�",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�������߲����пշ���"},onerror:"���벻��Ϊ��,��ȷ��"});
	$("#preppasswd").formValidator({onfocus:"�����������һ��",oncorrect:"��"}).inputValidator({min:6,max:20,empty:{leftempty:false,rightempty:false,emptyerror:"�ظ��������߲����пշ���"},onerror:"�ظ����벻��Ϊ��,��ȷ��"}).compareValidator({desid:"ppasswd",operateor:"=",onerror:"�������벻һ��,��ȷ��"});

	$("#pname").formValidator({onfocus:"���20���ַ�",oncorrect:"��"}).inputValidator({min:1,max:20,onerror:"�����Ƿ�,��ȷ��"});
	$("#ptel").formValidator({onfocus:"�绰�����С��ͨ,��059512345678",oncorrect:"��"}).regexValidator({regexp:"^$|^\\d{10,12}$",onerror:"�绰�����ʽ����ȷ"});
	$("#pmobile").formValidator({onfocus:"�ֻ���",oncorrect:"��"}).regexValidator({regexp:"^$|^(13|15|18)[0-9]{9}$",onerror:"�ֻ������ʽ����ȷ"});
	$("#pprovince").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
	$("#pcity").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
	$("#pcounty").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
	$("#paddress").formValidator({onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
	$("#pverifycode").formValidator({onfocus:"��֤��",oncorrect:"��"}).inputValidator({min:1,max:4,onerror:"��֤��Ϊ4λ"});
	$("#pemail").formValidator({onfocus:"��������",oncorrect:"��"}).regexValidator({regexp:"emailex",datatype:"enum",onerror:"���������ʽ����ȷ"});	
});

//2009-12-01
//ʡ,��,������
//����˵��:chCombo�仯�ؼ���id
//		  srcCombo����仯�Ŀؼ�id
//		  action�¼�����
function changeCombo(chCombo,srcCombo,action)
{
	var cdsales=new ActiveXObject("Microsoft.XMLDOM"); //����XmlDom����
    cdsales.async=false; //ʹ���첽����
    var parmid='';
    if(srcCombo!='')
    {
      parmid=document.getElementById(srcCombo).value
    }
    cdsales.load("<%=path%>/archives/area.do?action="+action+"&search.pid="+parmid);
     var bi;
     if(cdsales.documentElement!=null)
         bi=cdsales.documentElement.selectNodes("NODE");
    if(bi!=null&&bi.length>0)
    {
       //Ĭ����
       document.getElementById(chCombo).options.length = bi.length+1;   
       document.getElementById(chCombo).options[0].value ="0";//����ֵ
	   document.getElementById(chCombo).options[0].text = "��ѡ��";//��ʾֵ
       for(var i=1;i<bi.length+1;i++){     
	   			document.getElementById(chCombo).options[i].value = bi[i-1].selectSingleNode("THE_CODE").text;//����ֵ
	   			document.getElementById(chCombo).options[i].text =  bi[i-1].selectSingleNode("THE_NAME").text;//��ʾֵ
       }
    }else{
       document.getElementById(chCombo).options.length = 1;   
       document.getElementById(chCombo).options[0].value ="0";//����ֵ
	   document.getElementById(chCombo).options[0].text = "��ѡ��";//��ʾֵ
    }
}
//��ʼ����Ϣ
changeCombo('pprovince','','provincevalue');
//document.getElementById('pprovince').options[12].selected;
//Ĭ�ϸ���ʡ
document.getElementById('pprovince').value="350000";
changeCombo('pcity','pprovince','cityvalue');
changeCombo('pcounty','pcity','countyvalue');
</script>
</body>
</html>