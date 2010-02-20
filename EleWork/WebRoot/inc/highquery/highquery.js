
	 /********************************************
	 * �ļ����ƣ�highquery.js
	 * �����������߼���ϲ�ѯ�ؼ�
	 * �������ڣ�2008-07-22
	 * @author��codeslave
	 * @version 0.4
	 *********************************************/

// ����
function HQConfig()
{
	this.dialect = "oracle"; // ����
	//this.basePath = ""; // ����·��
	this.version = "0.4"; // �汾
}

var HQConfig = new HQConfig();

// ����js
var $import = function(s)
{   
	var script = document.createElement("script");
	script.setAttribute("type", "text/javascript");
	script.setAttribute("src", s);
	try   
	{
		document.getElementsByTagName("head")[0].appendChild(script);   
	}
	catch(e)   
	{
	}
};

// ���Ŀ¼�ı�����Ҫ��Ӧ�ı�
$import("highquery/calendar.js");
$import("highquery/check.js");
$import("highquery/hqconfig.js");
$import("highquery/" + HQConfig.dialect + ".js");

/******************************����Ϊ��ʼ������******************************/

var autoId = 0; // ��������

// ����ֶ�ʵ�������
function FieldList()
{
	this.fields = [];
}

// ���ʵ�巽��
FieldList.prototype.add = function(field)
{
	this.fields[this.fields.length] = field;
};

var FieldList = new FieldList();

// �ֶ�ʵ��
function Field(name, alias, type, length, event)
{
	this.name = name; // �ֶ���
	this.alias = alias; // ����
	this.type = type; // ����
	this.length = length; // ����
	this.event = event; // �¼�(��Ҫ����ѡ�����������)
}

// ȡ��һ���ѯ������html�ļ�(����)��
function getDateHtml(ContentId)
{
	var strHtml = "<input type='button' class='HQ_BUTTON' onClick=selDate('" + ContentId + "') value='ѡ��'>";
	strHtml += "<input type='button' class='HQ_BUTTON' onClick=clearContent('" + ContentId + "') value='���'>";
	return strHtml;
}

// ȡ��in��not in��ѯ������html�ļ�(����)��
function getDateInHtml(ContentId)
{
	var strHtml = "<input type='button' class='HQ_BUTTON' onClick=selDateIn('" + ContentId + "') value='ѡ��'>";
	strHtml += "<input type='button' class='HQ_BUTTON' onClick=clearContent('" + ContentId + "') value='���'>";
	return strHtml;
}

// ȡ��һ���ѯ������html�ļ�(����ʱ��)��
function getDateTimeHtml(ContentId)
{
	var strHtml = "<input type='button' class='HQ_BUTTON' onClick=selDateTime('" + ContentId + "') value='ѡ��'>";
	strHtml += "<input type='button' class='HQ_BUTTON' onClick=clearContent('" + ContentId + "') value='���'>";
	return strHtml;
}

// ȡ��in��not in��ѯ������html�ļ�(����ʱ��)��
function getDateTimeInHtml(ContentId)
{
	var strHtml = "<input type='button' class='HQ_BUTTON' onClick=selDateTimeIn('" + ContentId + "') value='ѡ��'>";
	strHtml += "<input type='button' class='HQ_BUTTON' onClick=clearContent('" + ContentId + "') value='���'>";
	return strHtml;
}

// ȡ��like��ѯ������html�ı���
function getLikeHtml(id) 
{
	var strHtml = "<select id='darkSign_" + id + "'><option value='0'>%</option><option value='1'>_</option></select>";
	strHtml += "&nbsp;<span id='darkB_" + id + "' onClick=addDarkSign('b') style='font-weight: bold;cursor: hand'>����</span>" + 
		"&nbsp;<span id='darkL_" + id + "' onClick=addDarkSign('l') style='font-weight: bold;cursor: hand'>��</span>" + 
		"&nbsp;<span id='darkR_" + id + "' onClick=addDarkSign('r') style='font-weight: bold;cursor: hand'>��</span>";
	return strHtml;
}

// ȡ��is��ѯ������html�ı���
function getIsHtml(id) 
{
	var strHtml = "<span id='null_" + id + "' onClick=document.getElementById('bContent_" + id + "').value='null'" + 
		" style='font-weight: bold;cursor: hand'>��</span>" + 
		"&nbsp;<span id='notNull_" + id + "' onClick=document.getElementById('bContent_" + id + "').value='not&nbsp;null'" + 
		" style='font-weight: bold;cursor: hand'>��</span>";
	return strHtml;
}

// ȡ�ô��¼���ѯ������html�ı���
function getEventHtml(ContentId, hibContentId, event) 
{
	var strHtml = "<input type='button' class='HQ_BUTTON' onClick=executeEvent('" + ContentId + "','" + hibContentId + "','" + event + "') value='ѡ��'>";
	strHtml += "<input type='button' class='HQ_BUTTON' onClick=\"clearContent('" + ContentId + "');clearContent('" + hibContentId + "');\"" + 
		"value='���'>";
	return strHtml;
}

// ȡ�ô��¼���ѯ������html�ı�(����in��not in��ѯ)��
function getEventInHtml(ContentId, hibContentId, event) 
{
	var strHtml = "<input type='button' class='HQ_BUTTON' onClick=executeEventIn('" + ContentId + "','" + hibContentId + "','" + event + "') value='ѡ��'>";
	strHtml += "<input type='button' class='HQ_BUTTON' onClick=\"clearContent('" + ContentId + "');clearContent('" + hibContentId + "');\"" + 
		"value='���'>";
	return strHtml;
}

// ��ʼ���ֶ��б�
function initField(id)
{
	var strField = "<select onChange='changeField()' id='field_" + id + "'>";
	var arrField = FieldList.fields;
	for(var i = 0; i < arrField.length; i++)
	{
		strField += "<option value='" + arrField[i].name + "'>" + arrField[i].alias + "</option>"
	}
	strField += '</select>';
	return strField;
}

// ��ʼ�������������������
function initJoin(id)
{
	var strJoin = "<select id='join_" + id + "'><option value='and'>AND</option><option value='or'>OR</option></select>";
	return strJoin;
}

// ��ʼ�������������
function initCondition(id)
{
	var strCondition = "<select onChange='changeCondition()' id='condition_" + id + "'>" + 
		"<option value='='>=</option><option value='<'><</option>" + 
		"<option value='<='><=</option><option value='>'>></option>" +
		"<option value='>='>>=</option><option value='<>'><></option>" +
		"<option value='in'>IN</option><option value='not_in'>NOT IN</option>" + 
		"<option value='between'>BETWEEN</option><option value='is'>IS</option>" +
		"<option value='like'>LIKE</option></select>";
	strCondition += "<span id='signPanel_" + id + "'></span>" // ��Ų�ѯ���ţ���Ҫ����like��is��ѯ
	return strCondition;
}

// ��ʼ���������ݡ�
function initContent(id)
{
	var strContent = "<input class='HQ_TEXT' id='bContent_" + id + "' maxLength=" + FieldList.fields[FieldList.fields.length - 1].length + ">";
	strContent += "<input type='hidden' class='HQ_TEXT' id='hibBContent_" + id + "'>";
	strContent += "<span id='bChoicePanel_" + id + "'></span>"; // ��ŵ�һ���ı��ؼ���"ѡ��"��"���"��ť
	strContent += "<span id='eContentPanel_" + id + "'></span>"; // ��ŵڶ����ı��ؼ����Լ�eChoicePanel�������ڲ���"ѡ��"��"���"��ť
	return strContent;
}

// ��ʼ���ؼ�
function initHighQuery()
{
	strHtml = "<table id='highQuery' class='HQ_TABLE'>" + 
		"<th class='HQ_TH'>����</th>" +
		"<th class='HQ_TH'>������</th>" +
		"<th class='HQ_TH'>�ֶ�</th>" +
		"<th class='HQ_TH'>�����</th>" +
		"<th class='HQ_TH'>����</th>" +
		"<th class='HQ_TH'>������</th>" +
		"<th class='HQ_TH'>����</th>" +
		"</table>";

	var objHighQueryPanel = document.getElementById("highQueryPanel");
	if(objHighQueryPanel != null)
	{
		objHighQueryPanel.innerHTML = strHtml;
		// ��ʼ����һ�С�
		initFristRow();
	} 
	else
		alert("û�з���highQueryPanel��");
}

// ��ʼ����һ�С�
function initFristRow()
{
	highQuery.insertRow();
	var newRow = highQuery.rows[highQuery.rows.length - 1];
	
	newRow.id = "row_" + autoId;

	newRow.insertCell();
	newRow.cells[0].className = "HQ_TD";
	newRow.cells[0].innerHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

	newRow.insertCell();
	newRow.cells[1].className = "HQ_TD";
	newRow.cells[1].innerHTML = "<span id='lParenthesisPanel_" + autoId + "' style='font-weight: bold;'></span>"; // ���������
	
	newRow.insertCell();
	newRow.cells[2].className = "HQ_TD";
	newRow.cells[2].innerHTML = initField(autoId);
	
	newRow.insertCell();
	//newRow.cells[3].width = 200;
	newRow.cells[3].className = "HQ_TD";
	newRow.cells[3].innerHTML = initCondition(autoId);
	
	newRow.insertCell();
	newRow.cells[4].className = "HQ_TD";
	newRow.cells[4].innerHTML = initContent(autoId);

	newRow.insertCell();
	newRow.cells[5].className = "HQ_TD";
	newRow.cells[5].innerHTML = "<span id='rParenthesisPanel_" + autoId + "' style='font-weight: bold;'></span>"; // ���������
	
	newRow.insertCell();
	newRow.cells[6].className = "HQ_TD";
	newRow.cells[6].innerHTML = "<input type='button' class='HQ_BUTTON' value='+(' onClick=addParenthesis('" + autoId + "','l')>&nbsp;" + 
		"<input type='button' class='HQ_BUTTON' value='+)' onClick=addParenthesis('" + autoId + "','r')>&nbsp;" +
		"<input type='button' class='HQ_BUTTON' value='-(' onClick=removeParenthesis('" + autoId + "','l')>&nbsp;" +
		"<input type='button' class='HQ_BUTTON' value='-)' onClick=removeParenthesis('" + autoId + "','r')>&nbsp;" +
		"<input type='button' class='HQ_BUTTON' value='��������' onClick='addRow()'>";
	
	var objField = document.getElementById("field_" + autoId); // ȡ�õ�ǰ���ֶ�ѡ��ؼ�����
	if(objField.options.length > 0)
		objField.options.selectedIndex = objField.options.length - 1; // ѡ���ֶ��б�����һ��"��ѡ��һ���ֶ�"

	autoId += 1; // autoId��1
}

/******************************����Ϊ������ɾ����******************************/

// �����һ�С�
function addRow()
{
	highQuery.insertRow();
	var newRow = highQuery.rows[highQuery.rows.length - 1];

	newRow.id = "row_" + autoId;
	
	newRow.insertCell();
	newRow.cells[0].className = "HQ_TD";
	newRow.cells[0].innerHTML = initJoin(autoId);
	
	newRow.insertCell();
	newRow.cells[1].className = "HQ_TD";
	newRow.cells[1].innerHTML = "<span id='lParenthesisPanel_" + autoId + "' style='font-weight: bold;'></span>"; // ���������

	newRow.insertCell();
	newRow.cells[2].className = "HQ_TD";
	newRow.cells[2].innerHTML = initField(autoId);
	
	newRow.insertCell();
	newRow.cells[3].className = "HQ_TD";
	newRow.cells[3].innerHTML = initCondition(autoId);
	
	newRow.insertCell();
	newRow.cells[4].className = "HQ_TD";
	newRow.cells[4].innerHTML = initContent(autoId);
	
	newRow.insertCell();
	newRow.cells[5].className = "HQ_TD";
	newRow.cells[5].innerHTML = "<span id='rParenthesisPanel_" + autoId + "' style='font-weight: bold;'></span>"; // ���������

	newRow.insertCell();
	newRow.cells[6].className = "HQ_TD";
	newRow.cells[6].innerHTML = "<input type='button' class='HQ_BUTTON' value='+(' onClick=addParenthesis('" + autoId + "','l')>&nbsp;" + 
		"<input type='button' class='HQ_BUTTON' value='+)' onClick=addParenthesis('" + autoId + "','r')>&nbsp;" +
		"<input type='button' class='HQ_BUTTON' value='-(' onClick=removeParenthesis('" + autoId + "','l')>&nbsp;" +
		"<input type='button' class='HQ_BUTTON' value='-)' onClick=removeParenthesis('" + autoId + "','r')>&nbsp;" +
		"<input type='button' class='HQ_BUTTON' value='ɾ��' onClick=removeRow('" + newRow.id + "')>";
	
	var objField = document.getElementById("field_" + autoId); // ȡ�õ�ǰ���ֶ�ѡ��ؼ�����
	if(objField.options.length > 0)
		objField.options.selectedIndex = objField.options.length - 1; // ѡ���ֶ��б�����һ��"��ѡ��һ���ֶ�"

	autoId += 1; // autoId��1
}

// ɾ���С�
function removeRow(rowId)
{
	var trRow = document.getElementById(rowId);
	trRow.removeNode(true);
}

// ����������ѯ��䡣
function interpreter()
{
	var arrReturn = new Array();
	var strCondition = "";
	var strAliasCondition = "";
	var isNoProblem = true;
	
	// �﷨���
	if(!checkExpression())
	{
		isNoProblem = false;
		arrReturn[0] = "";
		arrReturn[1] = "";
		return arrReturn;
	}

	for(var i = 1; i < highQuery.rows.length; i++)
	{
		var id = highQuery.rows[i].id.split("_")[1];
		var objField = document.getElementById("field_" + id); // ȡ���ֶ�ѡ��ؼ�����
		var objCondition = document.getElementById("condition_" + id); // ȡ�����������ѡ��ؼ�����
		var objBContent = document.getElementById("bContent_" + id); // ȡ�õ�һ�����������ļ��ؼ�����
		var objHibBContent = document.getElementById("hibBContent_" + id); // ȡ�õ�һ�����������ļ��ؼ�����(���ص�)
		var objLParenthesisPanel = document.getElementById("lParenthesisPanel_" + id); // ȡ��������������
		var objRParenthesisPanel = document.getElementById("rParenthesisPanel_" + id); // ȡ��������������
		var isHasEvent = FieldList.fields[objField.selectedIndex].event == ""?false:true; // �Ƿ����¼�
		var strType = FieldList.fields[objField.selectedIndex].type; // �������
		var strAlias = FieldList.fields[objField.selectedIndex].alias; // �ֶα���

		if(i > 1) // ������ǵ�һ��������Ҫ����������������(AND,OR)��
		{
			var objJoin = document.getElementById("join_" + id); // ���������������
			strCondition += " " + objJoin.value + " ";
			strAliasCondition +=  " " + objJoin.value + " ";
		}

		// ����������
		strCondition += objLParenthesisPanel.outerText;
		strAliasCondition += objLParenthesisPanel.outerText;
			
		if(objField.value != "") // �ֶ��Ƿ�Ϊ��
		{
			strCondition += objField.value;
			strAliasCondition += strAlias;
		}
		else
		{
			isNoProblem = false;
			alert("��ѡ�������д��ڲ���ȷ���ֶ���������ѡ��һ����Ч�ֶ�����");
			objField.focus();
			arrReturn[0] = "";
			arrReturn[1] = "";
			return arrReturn;
		}

		switch(objCondition.value)
		{
			case "like": // ��ѯ����Ϊlikeʱ
				if(checkDataLike(objBContent, strAlias, emendationType(strType))) 
				{
					strCondition += likeCondition(objBContent, strType, objCondition.value);
					strAliasCondition += likeCondition(objBContent, strType, objCondition.value);
				}
				else
					isNoProblem = false;
				break;
			case "in": // ��ѯ����Ϊinʱ
				if(checkDataIn((isHasEvent?objHibBContent:objBContent), strAlias, emendationType(strType)))
				{
					strCondition += inCondition((isHasEvent?objHibBContent:objBContent), strType, objCondition.value);
					strAliasCondition += inCondition(objBContent, strType, objCondition.value);
				}
				else
					isNoProblem = false;
				break;
			case "not_in": // ��ѯ����Ϊnot inʱ
				if(checkDataIn((isHasEvent?objHibBContent:objBContent), strAlias, emendationType(strType)))
				{
					strCondition += inCondition((isHasEvent?objHibBContent:objBContent), strType, objCondition.value);
					strAliasCondition += inCondition(objBContent, strType, objCondition.value);
				}
				else
					isNoProblem = false;
				break;
			case "between": // ��ѯ����Ϊbetweenʱ
				var objEContent = document.getElementById("eContent_" + id); // between��ѯʱ�Ż���ֵĵڶ����������ݶ���
				var objHibEContent = document.getElementById("hibEContent_" + id); // between��ѯʱ�Ż���ֵĵڶ����������ݶ���(���ص�)
				if(checkDataBetween((isHasEvent?new Array(objHibBContent, objHibEContent):new Array(objBContent, objEContent)), strAlias, emendationType(strType)))
				{
					strCondition += betweenCondition((isHasEvent?objHibBContent:objBContent), (isHasEvent?objHibEContent:objEContent), strType, objCondition.value);
					strAliasCondition += betweenCondition(objBContent, objEContent, strType, objCondition.value);
				}
				else
					isNoProblem = false;
				break;
			case "is": // ��ѯ����Ϊisʱ
				if(checkDataIs(objBContent, strAlias, "checknull"))
				{
					strCondition += isCondition(objBContent, strType, objCondition.value);
					strAliasCondition += isCondition(objBContent, strType, objCondition.value);
				}
				else
					isNoProblem = false;
				break;
			default: // ��ѯ����Ϊ����ʱ
				if(checkDataNormal((isHasEvent?objHibBContent:objBContent), strAlias, emendationType(strType)))
				{
					strCondition += " " + objCondition.value + normalCondition((isHasEvent?objHibBContent:objBContent), strType);
					strAliasCondition +=  " " + objCondition.value + normalCondition(objBContent, strType);
				}
				else
					isNoProblem = false;
				break;
		}
		if(isNoProblem != true)
		{
			arrReturn[0] = "";
			arrReturn[1] = "";
			return arrReturn;
		}

		// ����������
		strCondition += objRParenthesisPanel.outerText;
		strAliasCondition += objRParenthesisPanel.outerText;
	}
	arrReturn[0] = strAliasCondition;
	arrReturn[1] = strCondition;
	return arrReturn;
}

/******************************����Ϊ�ֶ�������⺯��******************************/

// �������ͷ�����ӦУ������Ŀ��
function emendationType(strType)
{
	if(strType == 'number')
	{
		return "checknumber";
	}
	else if(strType == 'date' || strType == 'datetime')
	{
		return "";
	}
	return "";
}

/******************************����ΪУ������**********************************/

// �﷨У��
function checkExpression()
{
	var strLParenthesis = "";
	var strRParenthesis = "";

	for(var i = 1; i < highQuery.rows.length; i++)
	{
		var id = highQuery.rows[i].id.split("_")[1];
		var objLParenthesisPanel = document.getElementById("lParenthesisPanel_" + id); // ȡ��������������
		var objRParenthesisPanel = document.getElementById("rParenthesisPanel_" + id); // ȡ��������������
		strLParenthesis += objLParenthesisPanel.outerText;
		strRParenthesis += objRParenthesisPanel.outerText;
	}

	if(strLParenthesis.length != strRParenthesis.length)
	{
		alert("\"(\"��\")\"����������Ӧ�����飡");
		return false;
	}
	return true;
}

// ����У��(like��ѯר��)��
function checkDataLike(objTemp, strText, action)
{
	var strTemp = objTemp.value;
	//if(strTemp == "" || action == "checkdate")
	//	return true;
	strTemp = strTemp.replace(/\%/g, "");
	strTemp = strTemp.replace(/\_/g, "");
	if(strTemp == "")
		return true;
	return checkS(objTemp, strTemp, strText, action);
}

// ����У��(in��not in��ѯר��)��
function checkDataIn(objTemp, strText, action)
{
	var strTemp = objTemp.value;
	var temps = strTemp.split(',');
	var boolOK = true;
	for(var i = 0; i < temps.length; i++)
	{
		if(temps[i] != "")
			boolOK = checkS(objTemp, temps[i], strText, action);
		if(boolOK == false)
			break;
	}
	return boolOK;
}

// ����У����(between��ѯר��)
function checkDataBetween(objTemp, strText, action)
{
	var strTemp = new Array(objTemp[0].value, objTemp[1].value);
	var boolOK = true;
	for(var i = 0; i < objTemp.length; i++)
	{
		if(strTemp[i] != "")
			boolOK = checkS(objTemp[i], strTemp[i], strText, action);
		if(boolOK == false)
			break;
	}
	return boolOK;
}

// ����У����(is��ѯʱ��)
function checkDataIs(objTemp, strText, action)
{
	var strTemp = objTemp.value;
	return checkS(objTemp, strTemp, strText, action);
}

// ����У����(һ���ѯʱ��)
function checkDataNormal(objTemp, strText, action)
{
	var strTemp = objTemp.value;
	if(strTemp == "")
		return true;
	return checkS(objTemp, strTemp, strText, action);
}

/******************************����Ϊ��������******************************/

// �ı���ѡ�ֶ�ʱ����Ӧ�ı���档
function changeField()
{
	var objField = window.event.srcElement; // ȡ���ֶ�ѡ��ؼ�
	var id = objField.id.split("_")[1];
	var trRow = document.getElementById("row_" + id); // ȡ���ж���
	var objCondition = document.getElementById("condition_" + id); // ȡ�����������ѡ��ؼ�����
	var objSignPanel = document.getElementById("signPanel_" + id); // ȡ�ò�ѯ����������
	var objBChoicePanel = document.getElementById("bChoicePanel_" + id); // ȡ�õ�һ�������ı�"ѡ��"������
	var objEContentPanel = document.getElementById("eContentPanel_" + id); // ȡ�õڶ��������ı�������
	var objBContent = document.getElementById("bContent_" + id); // ȡ�õ�һ�����������ļ��ؼ�����
	var objHibBContent = document.getElementById("hibBContent_" + id); // ȡ�õ�һ�����������ļ��ؼ�����(���ص�)
	var isDate = FieldList.fields[objField.selectedIndex].type == "date"?true:false;
	var isDateTime = FieldList.fields[objField.selectedIndex].type == "datetime"?true:false;
	var isHasEvent = FieldList.fields[objField.selectedIndex].event == ""?false:true; // �Ƿ����¼�
	var event = !isHasEvent?"":FieldList.fields[objField.selectedIndex].event; // ȡ���¼�
	objBContent.value = "";
	objHibBContent.value = "";
	objBContent.maxLength = FieldList.fields[objField.selectedIndex].length; // �����ֶγ��ȸı��ı��ؼ��ĳ���
	
	// �����Ӧ���ֶ�������date��datetime���ֻ��������¼�����ʱ,ɾ��like��ѯ����
	if(isDate || isDateTime || isHasEvent) 
	{
		var conditionTemp = objCondition.value;
		if(objCondition.options[objCondition.length-1].value == "like")
		{
			objCondition.options.remove(objCondition.options[objCondition.length-1].index)
			objSignPanel.innerHTML = ""; // �����ѯ�����������
		}
		if(conditionTemp != "like")
			objCondition.value = conditionTemp;
	}
	else 
	{
		if(objCondition.options[objCondition.length-1].value != "like")
		{
			objCondition.options.add(new Option('LIKE', 'like'));
		}
	}
	
	// ���ݿؼ���ֻ�����Դ���
	if(isDate || isDateTime || objCondition.value == "is" || isHasEvent)
		objBContent.setAttribute("readOnly", "true");
	else 
		objBContent.setAttribute("readOnly", "");
	
	switch(objCondition.value)
	{
		case "like": // ��ѯ����Ϊlikeʱ
			objSignPanel.innerHTML = getLikeHtml(id);
			objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
			break;
		case "in": // ��ѯ����Ϊinʱ
			objBContent.maxLength = '2147483647'; // ��Ϊ���ֵ
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
				objBChoicePanel.innerHTML = isDate?getDateInHtml("bContent_" + id):getDateTimeInHtml("bContent_" + id);
			else if(isHasEvent) // ������¼�����
				objBChoicePanel.innerHTML = getEventInHtml("bContent_" + id, "hibBContent_" + id, event);
			else
				objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
			break;
		case "not_in": // ��ѯ����Ϊnot inʱ
			objBContent.maxLength = '2147483647'; // ��Ϊ���ֵ
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
				objBChoicePanel.innerHTML = isDate?getDateInHtml("bContent_" + id):getDateTimeInHtml("bContent_" + id);
			else if(isHasEvent) // ������¼�����
				objBChoicePanel.innerHTML = getEventInHtml("bContent_" + id, "hibBContent_" + id, event);
			else
				objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
			break;
		case "between": // ��ѯ����Ϊbetweenʱ
			var objEContent = document.getElementById("eContent_" + id); // between��ѯʱ�Ż���ֵĵڶ����������ݶ���
			var objHibEContent = document.getElementById("hibEContent_" + id); // between��ѯʱ�Ż���ֵĵڶ����������ݶ���(���ص�)
			var objEChoicePanel = document.getElementById("eChoicePanel_" + id); // between��ѯʱ�Ż���ֵĵڶ��������ı�"ѡ��"������
			objEContent.value = ""; // �����ѯ����ʹ����betweenʱ�����Ԫ�ؾʹ���
			objHibEContent.value = ""; // �����ѯ����ʹ����betweenʱ�����Ԫ�ؾʹ���
			objEContent.maxLength = objBContent.maxLength;
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
			{
				objEContent.setAttribute("readOnly", "true");
				objBChoicePanel.innerHTML = isDate?getDateHtml("bContent_" + id):getDateTimeHtml("bContent_" + id);
				objEChoicePanel.innerHTML = isDate?getDateHtml("eContent_" + id):getDateTimeHtml("eContent_" + id);
			}
			else if(isHasEvent) // ������¼�����
			{
				objEContent.setAttribute("readOnly", "true");
				objBChoicePanel.innerHTML = getEventHtml("bContent_" + id, "hibBContent_" + id, event);
				objEChoicePanel.innerHTML = getEventHtml("eContent_" + id, "hibEContent_" + id, event);
			}
			else
			{
				objEContent.setAttribute("readOnly", "");
				objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
				objEChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵڶ��������ı�"ѡ��"�������(�����Ƿ����)
			}
			break;
		case "is": // ��ѯ����Ϊisʱ
			objSignPanel.innerHTML = getIsHtml(id);
			objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
			break;
		default: // ��ѯ����Ϊ����ʱ
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
				objBChoicePanel.innerHTML = isDate?getDateHtml("bContent_" + id):getDateTimeHtml("bContent_" + id);
			else if(isHasEvent) // ������¼�����
				objBChoicePanel.innerHTML = getEventHtml("bContent_" + id, "hibBContent_" + id, event);
			else
				objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
			break;
	}
}

// �ı����������ʱ����Ӧ�ı���档
function changeCondition()
{
	var objCondition = window.event.srcElement; // ȡ�����������ѡ��ؼ�����
	var id = objCondition.id.split("_")[1];
	var trRow = document.getElementById("row_" + id); // ȡ���ж���
	var objField = document.getElementById("field_" + id); // ȡ���ֶ�ѡ��ؼ�����
	var objSignPanel = document.getElementById("signPanel_" + id); // ȡ�ò�ѯ����������
	var objBChoicePanel = document.getElementById("bChoicePanel_" + id); // ȡ�õ�һ�������ı�"ѡ��"������
	var objEContentPanel = document.getElementById("eContentPanel_" + id); // ȡ�õڶ��������ı�������
	var objBContent = document.getElementById("bContent_" + id); // ȡ�õ�һ�����������ļ��ؼ�����
	var objHibBContent = document.getElementById("hibBContent_" + id); // ȡ�õ�һ�����������ļ��ؼ�����(���ص�)
	var isDate = FieldList.fields[objField.selectedIndex].type == "date"?true:false;
	var isDateTime = FieldList.fields[objField.selectedIndex].type == "datetime"?true:false;
	var isHasEvent = FieldList.fields[objField.selectedIndex].event == ""?false:true; // �Ƿ����¼�
	var event = !isHasEvent?"":FieldList.fields[objField.selectedIndex].event; // ȡ���¼�
	objBContent.maxLength = FieldList.fields[objField.selectedIndex].length; // �����ֶγ��ȸı��ı��ؼ��ĳ���
	
	// ����ı����ݳ��ȴ�����󳤶�(ͨ��������in��ѯʱ)��������ݻ������������Ϊ"is"
	if(objBContent.value.length > objBContent.maxLength || objCondition.value == "is")
	{
		objBContent.value = "";
		objHibBContent.value = "";
	}
	
	// ���ݿؼ���ֻ�����Դ���
	if(isDate || isDateTime || objCondition.value == "is" || isHasEvent)
		objBContent.setAttribute("readOnly", "true");
	else 
		objBContent.setAttribute("readOnly", "");

	switch(objCondition.value)
	{
		case "like": // ��ѯ����Ϊlikeʱ
			objSignPanel.innerHTML = getLikeHtml(id);
			objEContentPanel.innerHTML = ""; // ���between��ѯ�ĵڶ����ı��������(�����Ƿ����)
			break;
		case "in": // ��ѯ����Ϊinʱ
			objBContent.maxLength = '2147483647'; // ��Ϊ���ֵ
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
				objBChoicePanel.innerHTML = isDate?getDateInHtml("bContent_" + id):getDateTimeInHtml("bContent_" + id);
			else if(isHasEvent) // ������¼�����
				objBChoicePanel.innerHTML = getEventInHtml("bContent_" + id, "hibBContent_" + id, event);
			else
				objBChoicePanel.innerHTML = "";
			objSignPanel.innerHTML= ""; // �����ѯ�����������(�����Ƿ����)
			objEContentPanel.innerHTML = ""; // ���between��ѯ�ĵڶ����ı��������(�����Ƿ����)
			break;
		case "not_in": // ��ѯ����Ϊnot inʱ
			objBContent.maxLength = '2147483647'; // ��Ϊ���ֵ
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
				objBChoicePanel.innerHTML = isDate?getDateInHtml("bContent_" + id):getDateTimeInHtml("bContent_" + id);
			else if(isHasEvent) // ������¼�����
				objBChoicePanel.innerHTML = getEventInHtml("bContent_" + id, "hibBContent_" + id, event);
			else
				objBChoicePanel.innerHTML = "";
			objSignPanel.innerHTML= ""; // �����ѯ�����������(�����Ƿ����)
			objEContentPanel.innerHTML = ""; // ���between��ѯ�ĵڶ����ı��������(�����Ƿ����)
			break;
		case "between": // ��ѯ����Ϊbetweenʱ
			var maxLen = objBContent.maxLength;
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
			{
				objBChoicePanel.innerHTML = isDate?getDateHtml("bContent_" + id):getDateTimeHtml("bContent_" + id);
				objEContentPanel.innerHTML = "--<input class='HQ_TEXT' id='eContent_" + id + "' readOnly maxLength='" + maxLen + "'>" +
					"<input type='hidden' class='HQ_TEXT' id='hibEContent_" + id + "'>" +
					"<span id='eChoicePanel_" + id + "'>" + (isDate?getDateHtml("eContent_" + id):getDateTimeHtml("eContent_" + id)) + "</span>";
			}
			else if(isHasEvent) // ������¼�����
			{
				objBChoicePanel.innerHTML = getEventHtml("bContent_" + id, "hibBContent_" + id, event);
				objEContentPanel.innerHTML = "--<input class='HQ_TEXT' id='eContent_" + id + "' readOnly maxLength='" + maxLen + "'>" +
					"<input type='hidden' class='HQ_TEXT' id='hibEContent_" + id + "'>" +
					"<span id='eChoicePanel_" + id + "'>" + getEventHtml("eContent_" + id, "hibEContent_" + id, event) + "</span>";
			}
			else
			{
				objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
				objEContentPanel.innerHTML = "--<input class='HQ_TEXT' id='eContent_" + id + "' maxLength='" + maxLen + "'>" + 
					"<input type='hidden' class='HQ_TEXT' id='hibEContent_" + id + "'>" + 
					"<span id='eChoicePanel_" + id + "'></span>";
			}
			objSignPanel.innerHTML= ""; // �����ѯ�����������(�����Ƿ����)
			break;
		case "is": // ��ѯ����Ϊisʱ
			objSignPanel.innerHTML = getIsHtml(id);
			objBChoicePanel.innerHTML = ""; // ���(date��datetime�����¼��ֶ�)��ѯʱ���µĵ�һ�������ı�"ѡ��"�������(�����Ƿ����)
			objEContentPanel.innerHTML = ""; // ���between��ѯ�ĵڶ����ı��������(�����Ƿ����)
			break;
		default: // ��ѯ����Ϊ����ʱ
			if(isDate || isDateTime) // �����Ӧ���ֶ�������date��datetimeʱ,���û�ѡ������
				objBChoicePanel.innerHTML = isDate?getDateHtml("bContent_" + id):getDateTimeHtml("bContent_" + id);
			else if(isHasEvent) // ������¼�����
				objBChoicePanel.innerHTML = getEventHtml("bContent_" + id, "hibBContent_" + id, event);
			objSignPanel.innerHTML= ""; // �����ѯ�����������(�����Ƿ����)
			objEContentPanel.innerHTML = ""; // ���between��ѯ�ĵڶ����ı��������(�����Ƿ����)
			break;
	}
}

/******************************����ΪӦ�ú���******************************/

// ���ģ����ѯ���š�
function addDarkSign(strFlag)
{
	var id = window.event.srcElement.id.split("_")[1];
	var objBContent = document.getElementById("bContent_" + id); // ȡ�õ�ǰ�ĵ�һ�����������ļ��ؼ�����
	var objDarkSign = document.getElementById("darkSign_" + id); // ȡ�õ�ǰ�ı��ѡ��ؼ�����('%','_')

	if(objBContent.value != "")
	{
		if(objDarkSign.value == "0")
		{
			if(strFlag == 'b')
			{
				objBContent.value = objBContent.value.trimPS();	// ����������ߵ�"%"
				objBContent.value = "%" + objBContent.value + "%"; // ����ģ����
			}
			else if(strFlag == 'l')
			{
				objBContent.value = objBContent.value.trimPS(); // ����������ߵ�"%"
				objBContent.value = "%" + objBContent.value; // ���ģ����
			}
			else if(strFlag == 'r')
			{
				objBContent.value = objBContent.value.trimPS(); // ����������ߵ�"%"
				objBContent.value = objBContent.value + "%"; // �ұ�ģ����
			}
		}
		else if(objDarkSign.value == "1")
		{
			if(strFlag == 'b')
			{
				objBContent.value = "_" + objBContent.value + "_"; // ����ģ����
			}
			else if(strFlag == 'l')
			{
				objBContent.value = "_" + objBContent.value; // ���ģ����
			}
			else if(strFlag == 'r')
			{
				objBContent.value = objBContent.value + "_"; // �ұ�ģ����
			}
		}

	}
}

//���"(" �� ")"
function addParenthesis(id, strFlag)
{
	if(strFlag == "l")
	{
		var objLParenthesisPanel = document.getElementById("lParenthesisPanel_" + id); // ȡ��������������
		objLParenthesisPanel.innerText = objLParenthesisPanel.outerText + "(";
	}
	else if(strFlag == 'r')
	{
		var objRParenthesisPanel = document.getElementById("rParenthesisPanel_" + id); // ȡ��������������
		objRParenthesisPanel.innerText = objRParenthesisPanel.outerText + ")";
	}
}

//ɾ��"(" �� ")"
function removeParenthesis(id, strFlag)
{
	if(strFlag == "l")
	{
		var objLParenthesisPanel = document.getElementById("lParenthesisPanel_" + id); // ȡ��������������
		if(objLParenthesisPanel.outerText.length > 0)
			objLParenthesisPanel.innerText = objLParenthesisPanel.outerText.substring(0, objLParenthesisPanel.outerText.length - 1);
	}
	else if(strFlag == 'r')
	{
		var objRParenthesisPanel = document.getElementById("rParenthesisPanel_" + id); // ȡ��������������
		objRParenthesisPanel.innerText = objRParenthesisPanel.outerText.substring(0, objRParenthesisPanel.outerText.length - 1);
	}
}

// ������ݡ�
function clearContent(ContentId)
{
	var objContent = document.getElementById(ContentId);
	objContent.value = "";
}

// ѡ���ѯ���ڡ�
function selDate(ContentId)
{
	var objContent = document.getElementById(ContentId);
	objContent.value = showDateForm();
}

// ѡ���ѯ����(in��not in��ѯר��)��
function selDateIn(ContentId)
{
	var objContent = document.getElementById(ContentId);
	if(objContent.value == "")
		objContent.value = showDateForm();
	else
	{
		var strTemp = showDateForm();
		objContent.value += (strTemp==""?strTemp:"," + strTemp);
	}
}

// ѡ���ѯ����ʱ�䡣
function selDateTime(ContentId)
{
	var objContent = document.getElementById(ContentId);
	objContent.value = showDateTimeForm();
}

// ѡ���ѯ����ʱ��(in��not in��ѯר��)��
function selDateTimeIn(ContentId)
{
	var objContent = document.getElementById(ContentId);
	if(objContent.value == "")
		objContent.value = showDateTimeForm();
	else
	{
		var strTemp = showDateTimeForm();
		objContent.value += (strTemp==""?strTemp:"," + strTemp);
	}
}

// ִ���¼�
function executeEvent(ContentId, hibContentId, event)
{
	var arrReturn = eval(event + "();");
	if(arrReturn != null && arrReturn.length == 2)
	{
		var objContent = document.getElementById(ContentId);
		var objHibContent = document.getElementById(hibContentId);
		objHibContent.value = arrReturn[0];
		objContent.value = arrReturn[1];
	}
}

// ִ���¼�(����in��not in��ѯ)
function executeEventIn(ContentId, hibContentId, event)
{
	var arrReturn = eval(event + "();");
	if(arrReturn != null && arrReturn.length == 2)
	{
		var objContent = document.getElementById(ContentId);
		var objHibContent = document.getElementById(hibContentId);
		if(objContent.value == "")
		{
			objHibContent.value = arrReturn[0];
			objContent.value = arrReturn[1];
		}
		else
		{
			objHibContent.value += "," + arrReturn[0];
			objContent.value += "," + arrReturn[1];
		}
	}
}
