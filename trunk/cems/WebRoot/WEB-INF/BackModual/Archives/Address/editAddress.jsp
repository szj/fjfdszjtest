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
<script type="text/javascript" src="js/comm.js"></script>
<html>
	<body>
		<center>
			<form method='POST' name='form1' action='/archives/address.do'
				id="form1">
				<table class="table6" width="100%" border="1" cellpadding="3"
					cellspacing="0">
					<tr>
						<td colspan="3">
							<strong>ȡ����ַ</strong>
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
						<td rowspan="2">
							ȡ����ַ:
						</td>
						<td>
							ʡ��:
							<select id="pprovinceName" name="search.pprovince"
								onchange="changeCombo('pcityName','pprovinceName','cityvalue')">
							</select>
							���У�
							<select id="pcityName" name="search.pcity"
								onchange="changeCombo('pcountyName','pcityName','countyvalue')">
							</select>
							�ء�����
							<select id="pcountyName" name="search.pcounty">
							</select>
						</td>
					</tr>
					<tr>
						<td>
							��ϸ��ַ:
							<s:textfield id="paddressName" name="search.paddress"
								value="%{address.ADDRESS}"></s:textfield>
							<font color="red">*</font>
							<div id="paddressTip" style="display: inline "></div>
						</td>
					</tr>

					<tr>
						<td>
							�Ƿ�Ĭ�ϵ�ַ:
						</td>
						<td>
							<select name="search.pischeck" id="pischeckName">
								<option value="">
									��ѡ��
								</option>
								<option value="0"
									<s:if test="%{address.ISCHECK==0}">selected</s:if>>
									��
								</option>
								<option value="1"
									<s:if test="%{address.ISCHECK==1}">selected</s:if>>
									��
								</option>
							</select>
							<font color="red">*</font>
							<div id="pischeckTip" style="display: inline "></div>
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center">
							<s:hidden value="%{address.ID}" name="search.pid" id="pid"></s:hidden>
							<s:hidden value="%{action}" name="action" id="action"></s:hidden>
							<input type="button" onclick="saveAddress()" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
							<input type="reset" id="btnreset" name="btnreset" value="����" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
							<input type="button" onclick="javascript:closeAddressPage();" value="�ر�" class="outStyle" onmouseover="this.className='overStyle'"  onmouseout="this.className='outStyle'" />
						</td>
					</tr>
				</table>
			</form>
			<div id="messageDiv"></div>
		</center>
		<script type="text/javascript">
  //s:select id="pclientbalance"  name="search.pclientbalance" list="clientbalanceList" headerKey="-1" headerValue="---��ѡ��---" listKey="ID" listValue="NAME" key="ID">s:select
    //��֤
    $(document).ready(function(){
		$.formValidator.initConfig({formid:"form1",onerror:function(msg){alert(msg)},onsuccess:function(){return true;}});
		$("#paddressName").formValidator({tipid:"paddressTip",onfocus:"ȡ����ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ȡ����ַ����Ϊ��"});
		$("#pprovinceName").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��,��ȷ��"});
		$("#pcityName").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��"});
		$("#pcountyName").formValidator({tipid:"paddressTip",onfocus:"ͨ�ŵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"ͨ�ŵ�ַ����Ϊ��"});
		$("#pischeckName").formValidator({tipid:"pischeckTip",onfocus:"�Ƿ�Ĭ�ϵ�ַ",oncorrect:"��"}).inputValidator({min:1,onerror:"�Ƿ�Ĭ�ϵ�ַ����Ϊ��"});
	});
	

		
		function closeAddressPage() {
		  
		  $("#addressDiv").html("") ;
		  $("#addressDiv").hide() ;
		  
		 
		}
		function saveAddress(){
  			var pischeck=$("#pischeckName").val();
  			if(pischeck==null||pischeck==""){
  				alert("����ѡ���Ƿ�Ĭ�ϵ�ַ��");
  				return false;
  			}
  			var pars="action="+$("#action").val()+"&search.pprovince="+$("#pprovinceName").val()+"&search.pcity="+$("#pcityName").val()
  				+"&search.pcounty="+$("#pcountyName").val()+"&search.paddress="+$("#paddressName").val()+"&search.pischeck="+$("#pischeckName").val()+"&search.pid="+$("#pid").val();
		  	$.get("/archives/address.do",pars,function(res){
   				$('#messageDiv').hide();
			    $('#messageDiv').html(res);
			    var jsonMsgObj = new JsonMsgObj($('#messageDiv').text());
			  	var codeid = jsonMsgObj.getCodeid();
			  	alert(jsonMsgObj.getMessage());
			  	if (codeid == "0") {
	  				$.get("/archives/address.do",{action:'frame',date:new Date()},showResult1);
	  				function showResult1(data){
		  				$('#addressList').html(data); 
	  				}
			  	}
  			});
		}
		

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
changeCombo('pprovinceName','','provincevalue');
//document.getElementById('pprovince').options[12].selected;
//Ĭ�ϸ���ʡ
document.getElementById('pprovinceName').value="350000";
<s:if test="%{action=='update'}">
document.getElementById('pprovinceName').value=<s:property value="%{address.PROVINCE}"/>;
</s:if>
changeCombo('pcityName','pprovinceName','cityvalue');
<s:if test="%{action=='update'}">
document.getElementById('pcityName').value=<s:property value="%{address.CITY}"/>;
</s:if>
changeCombo('pcountyName','pcityName','countyvalue');
<s:if test="%{action=='update'}">
document.getElementById('pcountyName').value=<s:property value="%{address.COUNTY}"/>;
</s:if>
	</script>
	</body>
</html>