<%@ page language="java" errorPage="/error.jsp" pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%request.setCharacterEncoding("GBK");%>
<%@ include file="/common/taglibs.jsp"%>
<ww:action name="'select'" id="select"></ww:action>
<%--
	 * ���̶���
--%>

<form methd='POST' name='form1' action='/system/flower/flowerInfo.shtml'>
<script>
	var fm2 = new Ext.form.BasicForm('form1'); 
</script>
	<table class='simple' style='width: 80%' align='center'>
		<thead>
			<tr>
				<th colspan='4'>���̶���</th>
			</tr>
		</thead>
		<tbody>
		    <tr>
				<td align='right'>���̱��:</td>				
				<td>
					<tt:TextField name="search.flowerdefineCode" value="search.flowerdefine_code" width="150" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>
				<td align='right'>��������:</td>
				<td>					
					<tt:TextField name="search.flowerdefineName" value="search.flowerdefine_name" width="150" cssClass="check" verify='string' required='true' shade='true' requiredColor='#ffffff'/>
				</td>				
			</tr>
            <tr>
            	<td align='right'>�汾:</td>
				<td>					
					<tt:TextField name="search.flowerdefineVersion" value="search.flowerdefine_version" width="150" cssClass="check" verify='int+' required='true' shade='true' requiredColor='#ffffff'/>���ð汾����ߵ�
				</td>	
				<td align='right'>��������:</td>
				<td>
					<tt:ComboBox name="search.cityId" value="search.city_id" cssClass="check" shade="true" requiredColor="#ffffff" verify="empty" required="true"
							sql="'select city_id id, city_name text from td_city where city_id in (select city_id from tf_staff_city  where  staff_id=' + #session['UserInfo'].staffId+')'" />
				</td>				
			</tr>
            <tr>
            	<td align='right'>������Աѡ��:</td>
				<td colspan="3"> 
				    <input name="search.attemperCode" type="hidden" value="<ww:property value="search.attemper_code"/>">
					 <tt:TextArea name="search.attemperName" value="search.attemper_name" width="400" height="50" verify='string' required='true' msg='����д������Ա'  readonly="readonly" /><a onclick="fun_add(0)" href="javascript:void(0)"  style="color:red">ѡ��</a>
				</td>			
			</tr>			
		</tbody>
	</table>
	<br>
	<table class='simple' style='width: 80%' align='center' id="maintaindetailinfo">
		<thead>
			<tr>
				<th colspan='6'>���̽��������Ϣ</th>
			</tr>
		</thead>
		<tbody id="maintaintbody">
			<tr>				
				<td align='center'>��������</td>
				<td align='center'>�����Ƿ�����</td>
				<td align='center'>�Ƿ�ͬһ����</td>
				<td align='center'>�Ƿ����</td>
				<td align='center'>������Ա</td>	
				<td align='center'>
					<a style="cursor: hand" onclick="add_maintaindetail();">���</a>
				</td>
			</tr>
	<tt:setProperty name="#select.dynamicSql" value="\"select '1' id, '��' text union select '0' id, '��' text\""/>
	<ww:if test="flowerNodeList!= null&&flowerNodeList.size()>0">
       	  <input type="hidden" name="flowerNode.num" value="<ww:property value="flowerNodeList.size()"/>">
       	  <ww:iterator value="flowerNodeList" status="flowerNode">               		
        	<tr>   
        		<td  valign="top" align='center'>
					<input class='text_input check' verify='string' required='true' requiredColor='#ffffff' shade='true' name="flowerNode.flowernodeName" type="text" value="<ww:property value="flowernode_name"/>" size="10">
				</td>
				<td  valign="top" align='center'>	
				    		<select name='flowerNode.isFlowmust'>	
								<ww:iterator value="#select.selectList">
									<option value="<ww:property value="id"/>" <ww:if test="id.equals(''+is_flowmust)">selected</ww:if>><ww:property value="text"/></option>
								</ww:iterator>
							</select>
				</td>
				<td  valign="top" align='center'>
						<select name='flowerNode.isSamedep'>	
								<ww:iterator value="#select.selectList">
									<option value="<ww:property value="id"/>" <ww:if test="id.equals(''+is_samedep)">selected</ww:if>><ww:property value="text"/></option>
								</ww:iterator>
						</select>
				</td>
				<td  valign="top" align='center'>
						<select name='flowerNode.isFlowers'>	
								<ww:iterator value="#select.selectList">
									<option value="<ww:property value="id"/>+is_flowers" <ww:if test="id.equals(''+is_flowers)">selected</ww:if>><ww:property value="text"/></option>
								</ww:iterator>
						</select>
				</td>
				<td  valign="top" align='center'>					
					<input name="flowerNode.approveCodearray" type="hidden" value="<ww:property value="approve_codearray"/>">
					<tt:TextArea name="flowerNode.approveCodearrayname" value="approve_codearrayname" verify='string' required='true' msg='����д������Ա' readonly='readonly'/><a onclick="fun_add(1)" href="javascript:void(0)"  style="color:red">ѡ��</a>
				</td>		 
				<td  align="center" align='center'>
					<a onclick='del_maintaindetail();' style='cursor: hand'>ɾ��</a>
				</td>
       		</tr>
       		</ww:iterator>   
       	</ww:if>
		<ww:else> 
			<input type="hidden" name="flowerNode.num" value="1"><%--�������̽���¼��--%>
        	<tr>   
        		<td  valign="top" align='center'>
					<input class='text_input check' verify='string' required='true' requiredColor='#ffffff' shade='true' name="flowerNode.flowernodeName" type="text" value="<ww:property value="flowernode_name"/>" size="10">
				</td>
				<td  valign="top" align='center'>	
				    		<select name='flowerNode.isFlowmust'>	
								<ww:iterator value="#select.selectList">
									<option value="<ww:property value="id"/>" <ww:if test="id.equals(''+is_flowmust)">selected</ww:if>><ww:property value="text"/></option>
								</ww:iterator>
							</select>
				</td>
				<td  valign="top" align='center'>
						<select name='flowerNode.isSamedep'>	
								<ww:iterator value="#select.selectList">
									<option value="<ww:property value="id"/>" <ww:if test="id.equals(''+is_samedep)">selected</ww:if>><ww:property value="text"/></option>
								</ww:iterator>
						</select>
				</td>
				<td  valign="top" align='center'>
						<select name='flowerNode.isFlowers'>	
								<ww:iterator value="#select.selectList">
									<option value="<ww:property value="id"/>" <ww:if test="id.equals(''+is_flowers)">selected</ww:if>><ww:property value="text"/></option>
								</ww:iterator>
						</select>
				</td>	
				<td  valign="top" align='center'>					
					<input name="flowerNode.approveCodearray" type="hidden" value="<ww:property value="approve_codearray"/>">
					<tt:TextArea name="flowerNode.approveCodearrayname" value="approve_codearrayname"  verify='string' required='true' msg='����д������Ա' readonly='readonly'/><a onclick="fun_add(0)" href="javascript:void(0)"  style="color:red">ѡ��</a>
				</td>		 
				<td  align="center" align='center'>
					<a onclick='del_maintaindetail();' style='cursor: hand'>ɾ��</a>
				</td>
       		</tr>      
		</ww:else>
		</tbody>
		<TFOOT id="maintaindetailTfoot">
		</TFOOT>
	</table>
	
	<input type='hidden' name='search.flowerdefineId' value='<ww:property value="search.flowerdefine_id"/>' />
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

<script type="text/javascript" src="/js/TreeField.js"></script>
<script language="javascript">
	Ext.get('form1').un("submit", fm2.onSubmit, fm2);
	var saveButton =new Ext.Button({
        text: '�� ��',
        handler: function(){
        	if (fm2.isValid() && document.form1.checkSubmit()) {
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
    
    var searchPlan = new Ext.Window();
    //2009-02-28
    //��Աѡ����
    function fun_add(flag){
            var the_obj = event.srcElement;
			var the_td	= get_Element(the_obj,"td");
			var the_tr	= the_td.parentElement;
			cur_row = the_tr.rowIndex-2;
		searchPlan.hidden = true;
		if (searchPlan.hidden){
			searchPlan = new Ext.Window({
		        title: '��ѯԱ����Ϣ',
		        width: 800,
		       	height:400,
		        layout: 'fit',
		        plain:true,
		        bodyStyle:'padding:5px;',
		        buttonAlign:'center',
		        items:[{
	                region:'center',
	                layout:'column',
	                baseCls:'x-plain',
	                autoScroll:true,
	                items:[{
			        	columnWidth:.33,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px 0 5px 5px',
	                    layout: 'form',
	                    labelWidth:60,
			        	items:[{
			        		xtype: 'textfield',
				            fieldLabel: 'Ա�����',
				            name: 'staffNo',
				            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        	}]
			        },{
			        	columnWidth:.33,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px 0 5px 5px',
	                    layout: 'form',
	                    labelWidth:60,
			        	items:[{
			        		xtype: 'textfield',
				            fieldLabel: 'Ա������',
				            name: 'staffName',
				            width:100  // ���ÿ�ȣ��ٷֱȵ���ӡ���
			        	}]
			        },{
			        	columnWidth:.33,
	                    baseCls:'x-plain',
	                    bodyStyle:'margin:0px 0px 0px 0px',
			        	buttons: [{
				            text: '��ѯ',
				            width:50,
				            handler: function(){
				            	document.all.EmployeeIframe.src="/system/manage/manager.shtml?search.action=extSearch"+
				            																				"&userInfo.staffNo="+document.all.staffNo.value+
				            																				"&userInfo.staffName="+document.all.staffName.value;
				            }
				        },{
				            text: 'ȷ��',
				            width:50,
				            handler: function(){
				            	if (document.all.EmployeeIframe.src ==''){
				            		Ext.MessageBox.alert('��ʾ', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ȳ�ѯ!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;', null);
				            		return;
				            	}
				            	
				            	var obj = document.EmployeeIframe.staffIds;
				            	if (obj.length > 1){
				            		var objValue = '';
				            		var staffId = '';
				            		var staffName = '';

				            		for (var i=0; i<obj.length; i++){
				            			if (obj[i].checked){
				            				objValue = obj[i].value;
				            				staffId = objValue.substring(0, objValue.indexOf('^'));
				            				staffName = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
				            				if(flag){
				            						fun_mchoose(staffId,staffName,cur_row);
				            				}
				            				else
				            					fun_attemperchoose(staffId,staffName);
				            			}
				            		}
				            	}else{
				            		if (obj.checked){
					            		var objValue = obj.value;
				            			var	staffId = objValue.substring(0, objValue.indexOf('^'));
				            			var	staffName = objValue.substring(objValue.indexOf('^') + 1, objValue.length);
				            			 if(flag)
				            			 {
				            						fun_mchoose(staffId,staffName,cur_row);
				            			 }
				            			 else
				            				 fun_attemperchoose(staffId,staffName);
		            				}
				            	}
				            	searchPlan.close();
				            }
				        }]
			        },{
			        	columnWidth:1,
	                    baseCls:'x-plain',
	                    bodyStyle:'padding:5px',
	                    items:[{
	                    	width:"100%",
	                    	height:"100%",
	                        html: "<iframe id='EmployeeIframe' name='EmployeeIframe' src=''width='100%' height='285' frameborder=0/>"
	                    }]
			        }]
		         }]
		    });
	    }
		searchPlan.show();
	}
    //������Ա��ѡ��
    function fun_mchoose(parmstaffId,parmstaffName,rownum){
       //Ա�����
       if(document.all("flowerNode.approveCodearray")[rownum].value.indexOf(parmstaffId+",")==0)
      	   document.all("flowerNode.approveCodearray")[rownum].value=document.all("flowerNode.approveCodearray")[rownum].value.replace(parmstaffId+",","");
       else if(document.all("flowerNode.approveCodearray")[rownum].value.indexOf(","+parmstaffId+",")>0)
      	   document.all("flowerNode.approveCodearray")[rownum].value=document.all("flowerNode.approveCodearray")[rownum].value.replace(","+parmstaffId+",",",");
       else 
           document.all("flowerNode.approveCodearray")[rownum].value+=parmstaffId+",";
       //Ա������
       if(document.all("flowerNode.approveCodearrayname")[rownum].value.indexOf(parmstaffName+",")==0)
      	   document.all("flowerNode.approveCodearrayname")[rownum].value=document.all("flowerNode.approveCodearrayname")[rownum].value.replace(parmstaffName+",","");
       else if(document.all("flowerNode.approveCodearrayname")[rownum].value.indexOf(","+parmstaffName+",")>0)
      	   document.all("flowerNode.approveCodearrayname")[rownum].value=document.all("flowerNode.approveCodearrayname")[rownum].value.replace(","+parmstaffName+",",",");
       else 
           document.all("flowerNode.approveCodearrayname")[rownum].value+=parmstaffName+",";
    }
    //������Ա��ѡ��
    function fun_attemperchoose(parmstaffId,parmstaffName){
       //Ա�����
       if(document.all("search.attemperCode").value.indexOf(parmstaffId+",")==0)
      	   document.all("search.attemperCode").value=document.all("search.attemperCode").value.replace(parmstaffId+",","");
       else if(document.all("search.attemperCode").value.indexOf(","+parmstaffId+",")>0)
      	   document.all("search.attemperCode").value=document.all("search.attemperCode").value.replace(","+parmstaffId+",",",");
       else 
           document.all("search.attemperCode").value+=parmstaffId+",";
       //Ա������
       if(document.all("search.attemperName").value.indexOf(parmstaffName+",")==0)
      	   document.all("search.attemperName").value=document.all("search.attemperName").value.replace(parmstaffName+",","");
       else if(document.all("search.attemperName").value.indexOf(","+parmstaffName+",")>0)
      	   document.all("search.attemperName").value=document.all("search.attemperName").value.replace(","+parmstaffName+",",",");
       else 
           document.all("search.attemperName").value+=parmstaffName+",";
    }
	//���������Ͳ˵�
	Ext.onReady(function(){
		Ext.QuickTips.init();
		
		//����
		var belongCompanyTree = new Ext.form.TreeField({
				minListHeight:200,
				dataUrl : '/basearchives/deptInfo/ajaxDeptInfo.shtml',
	            hiddenName : 'search.deptId',
	            valueField : 'id',
	            allowBlank:false,
	            blankText : '��ѡ���ó����ţ�',
	            treeRootConfig : {
	            	id:'',   
			        text : '��ѡ��',   
			        draggable:false  
	            },
	            displayValue:'<ww:property value="search.dept_name"/>',
	            value:'<ww:property value="search.dept_id"/>'
		});
		belongCompanyTree.render('deptDIV');	//�����ָ���Ķ�����
	});
	
    //�����ӱ���Ϣ
	function add_maintaindetail(){	 
		var rowNum = Math.floor(document.all("flowerNode.num").value);
		rowNum ++;
		document.all("flowerNode.num").value = rowNum;//roldInfo
		var oBody=document.all("maintaintbody");//mobileTbody
		document.all("maintaindetailinfo").insertBefore(oBody,document.all("maintaindetailTfoot"));
		var myTR =oBody.insertRow();		
		var myTD2=myTR.insertCell();				
			myTD2.innerHTML="<div align='center'><input class='text_input check' verify='string' required='true' requiredColor='#ffffff' shade='true' name='flowerNode.flowernodeName' type='text'   size='10'></div>";			 

														  
		var myTD3=myTR.insertCell();	
			myTD3.innerHTML="<div align='center'>"+
						  "<select name='flowerNode.isFlowmust'>"+
						  <ww:iterator value="#select.selectList">
						  	"<option value='<ww:property value="id"/>'><ww:property value="text"/></option>"+
						  </ww:iterator>
						  "</select>"+
						  "</div>";	
		var myTD4=myTR.insertCell();
			myTD4.innerHTML="<div align='center'>"+
						  "<select name='flowerNode.isSamedep'>"+
						  <ww:iterator value="#select.selectList">
						  	"<option value='<ww:property value="id"/>'><ww:property value="text"/></option>"+
						  </ww:iterator>
						  "</select>"+
			              "</div>";
		var myTD5=myTR.insertCell();	
			myTD5.innerHTML="<div align='center'>"+
						  "<select name='flowerNode.isFlowers'>"+
						  <ww:iterator value="#select.selectList">
						  	"<option value='<ww:property value="id"/>'><ww:property value="text"/></option>"+
						  </ww:iterator>
						  "</select>"+
			              "</div>";
		var myTD6=myTR.insertCell();
		

			myTD6.innerHTML="<div align='center'><input name='flowerNode.approveCodearray'  type='hidden'  size='18'>"+
			"<textarea class='text_input check' verify='String' required='true' requiredColor='#ffffff' shade='true' name='flowerNode.approveCodearrayname'  type='text'   size='70' readonly='readonly'></textarea><a onclick='fun_add(0)' href='javascript:void(0)'  style='color:red'>ѡ��</a></div>";
		var myTD11=myTR.insertCell();		
			myTD11.innerHTML="<div align='center'>"+
						"	<a onclick='del_maintaindetail();' style='cursor:hand'>ɾ��</a>"+
						"</div>";
	}
 	function del_maintaindetail(){	 
 		var num = Math.floor(document.all("flowerNode.num").value);
		num = num-1;
		document.all("flowerNode.num").value = num;		
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
  		if(the_ele.tagName.toLowerCase()==the_tag)
  			return the_ele;
   		while(the_ele=the_ele.offsetParent){
     		if(the_ele.tagName.toLowerCase()==the_tag)
     			return the_ele;
   		}
   		return(null);
	}
</script>