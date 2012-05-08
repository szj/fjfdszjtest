
	 /********************************************
	 * 文件名称：oracle.js
	 * 功能描述：oracle的sql语句方言
	 * 创建日期：2008-07-21
	 * author：codeslave
     * 修改日期:2012-02-22
     * 将like条件强制加%%。
     * 增加normalConditionLike(objTemp, strType);
	 *********************************************/

// 生成like查询条件内容
function likeCondition(objTemp, strType, strCondition)
{
    //var strTemp = normalCondition(objTemp, strType);
    var strTemp = normalConditionLike(objTemp, strType);
	return " " + strCondition + strTemp;
}

// 生成in或not in查询条件内容
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
			strReturn = strReturn.substring(0, strReturn.length - 1); // 除去最后一个豆号
			return " " + strCondition.replace("_", " ") + " ( " + strReturn + " )";
		}
		strTemp = " ''"; // 空值处理
	}
	else 
	{
		strTemp = normalCondition(objTemp, strType);
		if(strTemp != " ''")
		{
			strTemp = strTemp.substring(2, strTemp.length - 1); // 除去两边的单引号
			var arrTemp = strTemp.split(',');
			for(var i = 0; i < arrTemp.length; i++)
			{
				if(arrTemp[i] != null)
					strReturn += "'" + arrTemp[i] + "',"
			}
			strReturn = strReturn.substring(0, strReturn.length - 1); // 除去最后一个豆号
			return " " + strCondition.replace("_", " ") + " ( " + strReturn + " )";
		} 
	}
	strReturn = strTemp;
	return " " + strCondition.replace("_", " ") + " ( " + strReturn + " )";
}

// 生成between的查询条件内容
function betweenCondition(objTemp1, objTemp2, strType, strCondition)
{
	strTemp1 = normalCondition(objTemp1, strType);
	strTemp2 = normalCondition(objTemp2, strType);
	return " " + strCondition + strTemp1 + " and" + strTemp2;
}

// 生成is查询条件内容
function isCondition(objTemp, strType, strCondition)
{
	var strTemp = objTemp.value;
	strTemp = strTemp.trim();
	return strTemp==""?" " + strCondition + " null":" " + strCondition + " " + strTemp;
}

// 生成一般查询条件内容
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
// 为like专用2012-02-22
function normalConditionLike(objTemp, strType) {
    var strTemp = objTemp.value;
    strTemp = strTemp.trim();
    if (strType == "date")
        return strTemp == "" ? " ''" : " to_date('" + strTemp + "','yyyy-MM-dd')";
    else if (strType == "datetime")
        return strTemp == "" ? " ''" : " to_date('" + strTemp + "','yyyy-MM-dd hh24:mi:ss')";
    return strTemp == "" ? " ''" : " '%" + strTemp + "%'";
}
