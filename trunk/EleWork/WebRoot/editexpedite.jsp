<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>

<ww:action name="'select'" id="select"></ww:action>
<%--
	 * �ɳ�����
 	 * @author fangzl 
--%>

<form methd='POST' name='form1' action='/carmanage/expedite/expedite.shtml' class="formcheck" onsubmit="return checkSubmit();">
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>
					������ɳ���Ϣ
				</th>
			</tr>
		</thead>
		<tbody>
		    <tr>
				<td align='right'>
					�ɳ���:					
				</td>				
				<td>
					<SELECT NAME="search.expediteMan" onchange="editSms(0)">
						<OPTION value="">---��ѡ��---</OPTION>
						<tt:setProperty name="#select.dynamicSql" value="'select distinct staff_info_id id, staff_name text from tf_staff_info  where state = 1 and city_id in (select city_id   from tf_staff_city    where staff_id=' + #session['UserInfo'].staffId+')'"/>
						<ww:iterator value="#select.selectList" status="staffList">
							<OPTION value="<ww:property value="id"/>"><ww:property value="text"/></OPTION>
						</ww:iterator>
					</SELECT>
					 
				</td>
				<td align='right'>
					�ɳ�����:
				</td>
				<td>
					<tt:DateFiled name="search.expediteDate" value="search.expedite_date" cssClass="check" verify='date' required='true' shade='true' requiredColor='#ffffff'/>
				</td>				
			</tr>
			<tr>
				<td align='right' width="17%">
					�ó���:
				</td>
				<td>
					<SELECT NAME="search.useCarMan" onchange="editSms(1)">
						<OPTION value="">---��ѡ��---</OPTION>
						<ww:iterator value="#select.selectList">
							<OPTION value="<ww:property value="id"/>"><ww:property value="text"/></OPTION>
						</ww:iterator>
					</SELECT>
					
				</td>
				<td align='right' width="17%">
					�ó�����:
				</td>
				<td width="33%">
					<tt:ComboBox name="search.deptId" value="search.dept_id" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true" editable="true"
						sql="'SELECT dept_id id, dept_name text FROM TF_DEPT_INFO M WHERE M.STATE=1'"/>
				</td>				
			</tr>
			<tr>				
				<td align='right' width="17%">
					�������:
				</td>
				<td width="33%">
					<tt:ComboBox name="search.carNoId" value="search.car_no_id" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true" editable="true"
						sql="'select distinct car_no_id id, car_no_code text 
							   from tf_car_info 
							  where state = 1
							    and city_id in (select city_id 
							    				  from tf_staff_city  
							    				 where staff_id=' + #session['UserInfo'].staffId+')'"/>
				</td>
				<td align='right'>
					��ʻԱ:
				</td>
				<td>
					<SELECT NAME="search.driver" onchange="editSms(2)">
						<OPTION value="">---��ѡ��---</OPTION>
						<ww:iterator value="#select.selectList">
							<OPTION value="<ww:property value="id"/>"><ww:property value="text"/></OPTION>
						</ww:iterator>
					</SELECT>
					
				</td>
				
			</tr>
			<tr>				
				<td align='right'>
					��ʼ���:
				</td>
				<td>				 
					<tt:TextField name="search.initMileage" value="search.init_mileage" width="200" cssClass="check" verify='double+' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right'>
					Ԥ�ƻس�ʱ��:
				</td>
				<td>
					<tt:DateFiled name="search.intendingDate" value="search.intending_date" cssClass="check" verify='date' required='true' shade='true' requiredColor='#ffffff'/>
				</td>	
								
			</tr>
            <tr>   
				<td align='right'>
					�ó�����:
				</td>
				<td>
					<tt:TextField name="search.useExcuse" value="search.use_excuse" width="200" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right'>
					��������:
				</td>
				<td >
					<tt:ComboBox name="search.cityId" value="search.city_id" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true"
							sql="'select city_id id, city_name text from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'" />
				</td>				
			</tr>			
		</tbody>
	</table>
	<table class='simple' style='width: 80%' align='center'
		id="maintaindetailinfo">
		<thead>
			<tr>
				<th colspan='10'>
					���ŷ���
				</th>
			</tr>
		</thead>
		<tbody id="maintaintbody">
			<tr>		
				<td align='center'>
					������Ա
				</td>	
				<td align='center'>
					���ͺ���
				</td>	
				<td align='center'>
					��������
				</td>
			</tr>
			<tr>	
				<td  valign="top" align='center'>				
					<input name='search.smsManId'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsMobileNo'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsContext' type='text' size='50'>
				</td>	
			</tr>
			<tr>	
				<td  valign="top" align='center'>				
					<input name='search.smsManId'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsMobileNo'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsContext' type='text' size='50'>
				</td>	
			</tr>
			<tr>	
				<td  valign="top" align='center'>				
					<input name='search.smsManId'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsMobileNo'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsContext' type='text' size='50'>
				</td>	
			</tr>
						<tr>	
				<td  valign="top" align='center'>				
					<input name='search.smsManId'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsMobileNo'  type='text' size='11'>
				</td>
				<td  valign="top" align='center'>
					<input name='search.smsContext' type='text' size='50'>
				</td>	
			</tr>
		</tbody>
		<TFOOT id="maintaindetailTfoot">
		</TFOOT>
	</table>
	<input type='hidden' name='search.expediteCarId'
		value='<ww:property value="search.expedite_car_id"/>' />
	<input type='hidden' name='actionType'
		value='<ww:property value="action"/>' />
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
		new Ext.Button({
	        text: '�� ��',
	        handler: function(){
	        	document.form1.submit();
	        }
	    }).render(document.all.buttonTD1);
	    new Ext.Button({
	        text: '�� ��',
	        handler: function(){
	        	document.form1.reset();
	        }
	    }).render(document.all.buttonTD2);

function editSms(rownum){
	 alert(rownum);
		document.all("search.smsManId")[rownum].value="gan";
	 

}
function add_maintaindetail(){	 
		var oBody=document.all("maintaintbody");//mobileTbody
		document.all("maintaindetailinfo").insertBefore(oBody,document.all("maintaindetailTfoot"));
		var myTR =oBody.insertRow();		
		var myTD2=myTR.insertCell();				
			myTD2.innerHTML="<div align='center'><input name='search.smsManId'  type='text' size='11'></div>";			 
		var myTD3=myTR.insertCell();	
			myTD3.innerHTML="<div align='center'><input name='search.smsMobileNo'  type='text' size='11'></div>";
		var myTD4=myTR.insertCell();	
			myTD4.innerHTML="<div align='center'><input name='search.smsContext' type='text' size='50'></div>"; 
		var myTD11=myTR.insertCell();		
			myTD11.innerHTML="<div align='center'>"+
						"	<a onclick='del_maintaindetail();' style='cursor:hand'>ɾ��</a>"+
						"</div>";
	}
 function del_maintaindetail(){	 
	   	event.cancelBubble=true;
	   	var the_obj = event.srcElement;
	   	var the_td	= get_Element(the_obj,"td");
	   	var the_tr	= the_td.parentElement;
	   	cur_row = the_tr.rowIndex;
	   	document.all.maintaindetailinfo.deleteRow(cur_row);
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
</script>