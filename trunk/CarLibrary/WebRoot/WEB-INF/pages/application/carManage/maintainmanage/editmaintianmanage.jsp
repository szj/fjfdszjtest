<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK"
	contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>

<form methd='POST' name='form1' action='/carmanage/maintainmanage/maintainManage.shtml'>
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>	
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
					<tt:ComboBox name="search.nurseType" value="search.nurse_type" verify="empty" required="true" editable="true"
						sql="select para_value id, para_value_desc text from td_system_para where para_type = 'NURSE_PARA'  and para_name = 'NURSE_TYPE'"/>
			    </td>
			    <td align='right' width="17%">
					�������:
				</td>
				<td width="33%">
					<c:if test="${param.actionType == 'new'}">
						<tt:ComboBox name="search.carNoId" value="search.car_no_id+'|'+search.car_no_code" verify="empty" required="true" editable="true" 
							onchange="fun_carFixing(this.value);ajaxGetGPSCarMileage(this.value);"
							sql="\"select distinct concat(car_no_id, '|', car_no_code) id, 
										 car_no_code text 
									from tf_car_info 
								   where city_id in (select city_id 
								   					   from tf_staff_city  
								   					  where staff_id=\" + #session['UserInfo'].staffId+\")\""/>
					</c:if>
					<c:if test="${param.actionType == 'edit'}">
						<input type='hidden' name='search.carNoId' value='<ww:property value="search.car_no_id"/>'/>
						<ww:property value="search.carNoId"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td>
					<tt:DateFiled name="search.nurseDate" value="search.nurse_date" verify='string' required='true'/>
				</td>
				<td align='right'>
					�������:
				</td>
				<td>
					<tt:TextField name="search.nurseMileage" value="search.nurse_mileage" verify='double+' required='true'/> ��λ������
				</td>
			</tr>
			<tr>
				<td align='right'>�������:</td>
				<td>
					<tt:TextField name="search.nurseCharge" value="search.nurse_charge" verify='double+' required='true'/> ��λ��Ԫ
				</td>
			</tr>
			<tr>
				<td align='right'>
					��;:
				</td>
				<td colspan="3">
					<tt:TextArea name="search.purpose" value="search.purpose" width="400" height="50" required='true' msg='����д������;��'/>
				</td>
			</tr> 
			<tr>
				<td align='right'>��ע</td>
				<td colspan="3">
					<tt:TextArea name="search.memo" value="search.memo" width="400" height="50"/>
				</td>
			</tr>
			<tr>
				<td align='right'>
					��������:
				</td>
				<td colspan="3">
					<tt:ComboBox name="search.cityId" value="search.city_id" verify="empty" required="true"
							sql="'select city_id id, city_name text from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'" />
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
				<th colspan='4'>Ҫ�������豸</th>
			</tr>
		</thead>
		<tr>
			<td align='center' width='8%'><a href='javascript:chk_fixingAll()'>[ѡ��]</a></td>
			<td align='center' width='20%'>�豸����</td>
			<td align='center' width='20%'>�豸����</td>
			<td align='center'>�豸��ע</td>
		</tr>
		<input type='hidden' name='search.carFixingNum' value='0'/>
		<tbody id='carFixingBody'>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
		<tfoot id='carFixingFoot'>
		</tfoot>
	</table>
	<input type='hidden' name='search.nurseId' value='<ww:property value="search.nurse_id"/>'/>
	<input type='hidden' name='actionType' value='<ww:property value="action"/>' />
</form>
<table style='width: 80%' align='center'>
	<tr>
		<td id="buttonTD1" align='right' width='48%'></td>
		<td>
			&nbsp;
		</td>
		<td id="buttonTD2" align='left' width='48%'></td>
	</tr>
</table>

<script language="javascript">
	Ext.get('form1').un("submit", fm2.onSubmit, fm2);
	var saveButton =new Ext.Button({
        text: '�� ��',
        handler: function(){
        	if (fm2.isValid()) {
        		var chkFlag = false;
        		var carFixingNum = 0;
        		if ($('search.carFixingNum').value > 1){
        			var obj = document.all('search.fixingId');
					for (var i=0; i<$('search.carFixingNum').value; i++){
						if (obj[i].checked){
							carFixingNum ++;
							chkFlag = true;
						}
					}
        		}else if ($('search.carFixingNum').value == 1){
        			if (document.all('search.fixingId').chekced){
        				chkFlag = true;
        			}
        		}else{
        			Ext.Msg.show({
	 					title:'��Ϣ',
						msg: '�ó���û����Ҫ�������豸����ѡ����������!',
						modal : true,
						buttons: Ext.Msg.OK
	 				});
	 				return;
        		} 
        		
        		$('search.carFixingNum').value = carFixingNum;
        		
        		if (!chkFlag){
        			Ext.Msg.show({
	 					title:'��Ϣ',
						msg: '����ѡ��һ��Ҫ�������豸!',
						modal : true,
						buttons: Ext.Msg.OK
	 				});
	 				return;
        		}
        		
	        	Ext.Msg.show({
				 	title:'��ȷ��һ��',
				 	modal : false,
				 	msg: '��ȷ��������ȷ��?',
				 	buttons: Ext.Msg.OKCANCEL,
				 	fn: function(btn, text){
						if (btn == 'ok'){
					 		document.form1.submit();
					 	} 
				 	},
				 	animEl: 'buttonTD1'
			 	});
        	} else {
        		Ext.Msg.show({
 					title:'��Ϣ',
					msg: '����д���������ύ!',
					modal : true,
					buttons: Ext.Msg.OK
 				});
        	}
        }
    }).render(document.all.buttonTD1);
    
    new Ext.Button({
        text: '�� ��',
        handler: function(){
        	document.form1.reset();
        }
    }).render(document.all.buttonTD2);

	function ajaxGetGPSCarMileage(carNoCode){
    	carNoCode = carNoCode.substring(carNoCode.indexOf('|')+1, carNoCode.length);
    	var url = '/basearchives/car/ajaxGetGPSCarMileage.shtml?search.carNoCode='+carNoCode;
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
				var rowSet = root.selectNodes("//GPSCarMileage");
				if (rowSet.length > 0){
					document.all("search.nurseMileage").value = rowSet.item(0).selectSingleNode("value").text;
				}else{
					alert('��ȡ�������ʱ���������ԣ�');
				}
			}
		}catch(e){ 
			alert(e);
		}
    }
    
	function chk_fixingAll(){
		if ($('search.carFixingNum').value > 1){
			var obj = document.all('search.fixingId');
			for (var i=0; i<$('search.carFixingNum').value; i++){
				obj[i].checked = true;
			}
		}else if ($('search.carFixingNum').value == 1){
			document.all('search.fixingId').chekced = true;
		}
	}
	
	//��ȡ�������豸��Ϣ
	function fun_carFixing(carNoId, nurseId){
		<c:if test="${param.actionType == 'new'}">
			carNoId = carNoId.substring(0, carNoId.indexOf("|"));
		</c:if>
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
				$('search.carFixingNum').value = 0;
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
		var num = Math.floor(document.form1('search.carFixingNum').value);
		num = num + 1;
		document.form1('search.carFixingNum').value = num;
		
		var oBody = $(carFixingBody);
		document.all("carFixingTab").insertBefore(oBody,document.all("carFixingFoot"));
		var myTR =oBody.insertRow();
		var myTD1 = myTR.insertCell();
		myTD1.innerHTML = "<div align='center'><input type='checkbox' name='search.fixingId' value='"+fixingId+"' "+(checked == 1? 'checked' : '')+"/></div>";
		var myTD2 = myTR.insertCell();
		myTD2.innerHTML = "<div align='center'>"+fixingCode+"</div>";
		var myTD3 = myTR.insertCell();
		myTD3.innerHTML = "<div align='center'>"+fixingName+"</div>";
		
		var myTD4 = myTR.insertCell();
		myTD4.innerHTML = "<div align='center'>"+memo+"</div>";
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
	
	<c:if test="${param.actionType == 'edit'}">
		fun_carFixing('<ww:property value="search.car_no_id"/>', '<ww:property value="search.nurse_id"/>');
	</c:if>
	<c:if test="${param.optType == 'homepage'}">
		fun_carFixing('<ww:property value="search.car_no_id+'|'+search.car_no_code"/>', '<ww:property value="search.nurse_id"/>');
		ajaxGetGPSCarMileage('<ww:property value="search.car_no_id+'|'+search.car_no_code"/>');
	</c:if>
</script>