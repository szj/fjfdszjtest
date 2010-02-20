
	 /********************************************
	 * �ļ����ƣ�oracle.js
	 * ����������oracle��sql��䷽��
	 * �������ڣ�2008-07-21
	 * @author��codeslave
	 * @version 0.4
	 *********************************************/

// ����like��ѯ�������ݡ�
function likeCondition(objTemp, strType, strCondition)
{
	var strTemp = normalCondition(objTemp, strType);
	return " " + strCondition + strTemp;
}

// ����in��not in��ѯ�������ݡ�
function inCondition(objTemp, strType, strCondition)
{
	var strTemp = "";
	var strReturn = "";

	if(strType == "date" || strType == "datetime")
	{
		strTemp = objTemp.value.trim();
		if(strTemp != "")
		{
			
			var arrTemp = strTemp.split(',');
			for(var i = 0; i < arrTemp.length; i++)
			{
				if(strType == "date" && arrTemp[i] != null)
					strReturn += "to_date('" + arrTemp[i] + "','yyyy-MM-dd'),";
				else if(strType == "datetime" && arrTemp[i] != null)
					strReturn += "to_date('" + arrTemp[i] + "','yyyy-MM-dd hh24:mi:ss'),";
			}
			strReturn = strReturn.substring(0, strReturn.length - 1); // ��ȥ���һ������
			return " " + strCondition.replace("_", " ") + " ( " + strReturn + " )";
		}
		strTemp = " ''"; // ��ֵ����
	}
	else 
	{
		strTemp = normalCondition(objTemp, strType);
		if(strTemp != " ''")
		{
			strTemp = strTemp.substring(2, strTemp.length - 1); // ��ȥ���ߵĵ�����
			var arrTemp = strTemp.split(',');
			for(var i = 0; i < arrTemp.length; i++)
			{
				if(arrTemp[i] != null)
					strReturn += "'" + arrTemp[i] + "',"
			}
			strReturn = strReturn.substring(0, strReturn.length - 1); // ��ȥ���һ������
			return " " + strCondition.replace("_", " ") + " ( " + strReturn + " )";
		} 
	}
	strReturn = strTemp;
	return " " + strCondition.replace("_", " ") + " ( " + strReturn + " )";
}

// ����between�Ĳ�ѯ�������ݡ�
function betweenCondition(objTemp1, objTemp2, strType, strCondition)
{
	strTemp1 = normalCondition(objTemp1, strType);
	strTemp2 = normalCondition(objTemp2, strType);
	return " " + strCondition + strTemp1 + " and" + strTemp2;
}

// ����is��ѯ�������ݡ�
function isCondition(objTemp, strType, strCondition)
{
	var strTemp = objTemp.value;
	strTemp = strTemp.trim();
	return strTemp==""?" " + strCondition + " null":" " + strCondition + " " + strTemp;
}

// ����һ���ѯ�������ݡ�
function normalCondition(objTemp, strType)
{
	var strTemp = objTemp.value;
	strTemp = strTemp.trim();
	if(strType == "date")
		return strTemp==""?" ''":" to_date('" + strTemp + "','yyyy-MM-dd')";
	else if(strType == "datetime")
		return strTemp==""?" ''":" to_date('" + strTemp + "','yyyy-MM-dd hh24:mi:ss')";
	return strTemp==""?" ''":" '" + strTemp + "'";
}
