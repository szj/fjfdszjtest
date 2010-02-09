<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>

	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					����±���������Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align='right' width="17%">
					��������:
				</td>
				<td width="33%">
					<ww:property value="search.nurseType"/>
			    </td>
			    <td align='right' width="17%">
					�������:
				</td>
				<td width="33%">
					<ww:property value="search.carNoId"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td>
					<ww:property value="search.nurse_date"/>
				</td>
				<td align='right'>
					�������:
				</td>
				<td>
					<ww:property value="search.nurse_mileage"/> ��λ������
				</td>
			</tr>
			<tr>
				<td align='right'>�������:</td>
				<td>
					<ww:property value="search.nurse_charge"/> ��λ��Ԫ
				</td>
			</tr>
			<tr>
				<td align='right'>
					��;:
				</td>
				<td colspan="3">
					<ww:property value="search.purpose"/>
				</td>
			</tr>
			<tr>
				<td align='right'>��ע</td>
				<td colspan="3">
					<ww:property value="search.memo"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td colspan="3">
					<ww:property value="search.cityId"/>
				</td>	
			</tr>
			<tr>
				<td align='right'>������:</td>
				<td>
					<ww:property value="search.create_man_name "/>
				</td>
				<td align='right'>����ʱ��:</td>
				<td>
					<ww:property value="search.create_date"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>�༭��:</td>
				<td>
					<ww:property value="search.editor_man_name"/>
				</td>
				<td align='right'>�༭ʱ��:</td>
				<td>
					<ww:property value="search.editor_date"/>
			    </td>
			</tr>
			<tr>
				<td align='right'>ִ����:</td>
				<td>
					<ww:property value="search.execute_man_name"/>
				</td>
				<td align='right'>ִ��ʱ��:</td>
				<td>
					<ww:property value="search.execute_date"/>
			    </td>
			</tr>
		</tbody>
	</table>
	<div style="color:red">
		&nbsp;&nbsp;&nbsp;&nbsp;ע����������̡�Ϊ�ǼǱ�������ʱ��������ֵ��
	</div>
	<br>
	<table id='carFixingTab' class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='3'>Ҫ�������豸</th>
			</tr>
		</thead>
		<tr>
			<td align='center' width='20%'>�豸����</td>
			<td align='center' width='20%'>�豸����</td>
			<td align='center'>�豸��ע</td>
		</tr>
		<tbody id='carFixingBody'>
			<tr>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
		<tfoot id='carFixingFoot'>
		</tfoot>
	</table>
<script>
	//��ȡ�������豸��Ϣ
	function fun_carFixing(carNoId, nurseId){
		if(carFixingBody.hasChildNodes()) {   
	        while(carFixingBody.childNodes.length > 0) {         //�ж��ж����У�����������   
	            carFixingBody.removeChild(carFixingBody.childNodes[0]); //�Ƴ�����(��)Ԫ��   
	        }   
	    }   

		var url = '/basearchives/car/ajaxCarInfo.shtml?search.carNoId='+carNoId+'&search.nurseId='+nurseId;
		try{
			var oXMLDom	= new ActiveXObject("Msxml.DOMDocument");
			oXMLDom.async = false ;
			oXMLDom.load(url); 
			var root;
			if (oXMLDom.parseError.errorCode != 0) {
				var myErr = oXMLDom.parseError;
				return;
			} else {
				root = oXMLDom.documentElement;
			}
			if (null != root){
				var rowSet = root.selectNodes("//carFixing");
				for (var i=0; i<rowSet.length; i++){
					fun_addrow(rowSet.item(i).selectSingleNode("fixingId").text, 
							   rowSet.item(i).selectSingleNode("fixingCode").text, 
							   rowSet.item(i).selectSingleNode("fixingName").text, 
							   rowSet.item(i).selectSingleNode("memo").text,
							   rowSet.item(i).selectSingleNode("checked").text);
				}
			}
		}catch(e){ 
			alert(e);
		}
	}
	
	function fun_addrow(fixingId, fixingCode, fixingName, memo, checked){
		if (checked == 'null'){
			return;
		}
		
		var oBody = $(carFixingBody);
		document.all("carFixingTab").insertBefore(oBody,document.all("carFixingFoot"));
		var myTR =oBody.insertRow();
		var myTD1 = myTR.insertCell();
		myTD1.innerHTML = "<div align='center'>"+fixingCode+"</div>";
		var myTD2 = myTR.insertCell();
		myTD2.innerHTML = "<div align='center'>"+fixingName+"</div>";
		
		var myTD3 = myTR.insertCell();
		myTD3.innerHTML = "<div align='center'>"+memo+"</div>";
	}
	
	// ɾ����
	function del_row(){
		if (!confirm('��ȷ���Ƿ�ɾ����ɾ��������ݽ��޷��ָ�!')){
			return;
		}
		
		var num = Math.floor(document.form1('search.carFixingNum').value);
		num = num-1;
		document.form1('search.carFixingNum').value = num;
		
	   	event.cancelBubble=true;
	   	var the_obj = event.srcElement;
	   	var the_td	= get_Element(the_obj,"td");
	   	var the_tr	= the_td.parentElement;
	   	cur_row = the_tr.rowIndex;
	   	document.all.carFixingTab.deleteRow(cur_row);
	}
	
	// ���ϸ���������
	function get_Element(the_ele,the_tag){
	   the_tag = the_tag.toLowerCase();
	   if(the_ele.tagName.toLowerCase()==the_tag)return the_ele;
	   while(the_ele=the_ele.offsetParent){
	     if(the_ele.tagName.toLowerCase()==the_tag)return the_ele;
	   }
	   return(null);
	}
	
	fun_carFixing('<ww:property value="search.car_no_id"/>', '<ww:property value="search.nurse_id"/>');
</script>