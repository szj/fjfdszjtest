	
	/********************************************
	 * �ļ����ƣ�check.js
	 * �������������ݼ��
	 * �������ڣ�2008-07-21
	 * @author��codeslave
	 * @version 0.4
	 *********************************************/

// �ı����
function checkS(objTemp,strTemp,strText,action)
{
  var bool = true;
  var actions = action.split('|');
  for(var i = 0;i < actions.length;i++)
  {
    if(actions[i] == "checknull")
    {
      bool = checkNull(objTemp,strTemp,strText);
      if(bool == false)
        return bool;
    }    if(actions[i] == "checkpintnumber")
    {
      bool = checkPositiveIntNumber(objTemp,strTemp,strText);
      if(bool == false)
        return bool;
    }
    if(actions[i] == "checkintnumber")
    {
      bool = checkIntNumber(objTemp,strTemp,strText);
      if(bool == false)
        return bool;
    }
    if(actions[i] == "checknumber")
    {
      bool = checkNumber(objTemp,strTemp,strText);
      if(bool == false)
        return bool;
    }
    if(actions[i] == "checkdate")
    {
      bool = checkDate(objTemp,strTemp,strText);
      if(bool == false)
        return bool;
    }
  }
  return bool;
}

// ����Ƿ�Ϊ��ֵ
function checkNull(objTemp,strTemp,strText)
{
	var temp = strTemp;
	temp = temp.trim();	if(temp == "")
	{
		alert(strText + "����Ϊ��");
		return false;
	}
	else
		return true;
}

// ����Ƿ�Ϊ����
function checkPositiveIntNumber(objTemp,strTemp,strText)
{
	var result=strTemp.match(/^(-|\+)?\d+$/);
	if(result == null)
  {
    alert(strText + "����������");    objTemp.focus();
    return false;
  }
  return true;
}

// ����Ƿ�Ϊ������
function checkIntNumber(objTemp,strTemp,strText)
{	var result=strTemp.match(/^\d+$/);
  if(result == null)
  {
    alert(strText + "������������");    objTemp.focus();
    return false;
  }
  return true;
}

// ����Ƿ�Ϊ����
function checkNumber(objTemp,strTemp,strText)
{
  if(isNaN(strTemp))
  {
    alert(strText + "����������");    objTemp.focus();
    return false;
  }
  else
    return true;
}

// ����Ƿ�Ϊ����
function checkDate(objTemp,strTemp,strText)
{
  if(isDateString(strTemp) == false)
  {
    alert(strText + "�����ڸ�ʽ�������һ���Ϸ�������")    objTemp.focus();
    return false;
  }
  else
    return true;
}

/******************************����Ϊ��ǿ���ܺ���******************************/

// ȥ���ַ�������β�Ŀո�
String.prototype.trim=function()
{
	return this.replace(/(^\s*)|(\s*$)/g, "");
}

// ȥ���ַ��������Ŀո�
String.prototype.ltrim=function()
{
	return this.replace(/(^\s*)/g, "");
}


// ȥ���ַ������Ҳ�Ŀո�
String.prototype.rtrim=function()
{
	return this.replace(/(\s*$)/g, "");
}

// ȥ���ַ�������β��%
String.prototype.trimPS=function()
{
	return this.replace(/(^%*)|(%*$)/g, "");
}

// ȥ���ַ���������%
String.prototype.ltrimPS=function()
{
	return this.replace(/(^%*)/g, "");
}

// ȥ���ַ������Ҳ��%
String.prototype.rtrimPS=function()
{
	return this.replace(/(%*$)/g, "");
}

/******************************����Ϊ���亯��******************************/

// �ж����ں���
function isDateString(sDate)
{
  var iaMonthDays = [31,28,31,30,31,30,31,31,30,31,30,31];
  var iaDate = new Array(3);
  var year, month, day;
  if (arguments.length != 1) return false;
  iaDate = sDate.toString().split("-");
  if (iaDate.length != 3) return false;
  if (iaDate[1].length > 2 || iaDate[2].length > 2) return false;
  year = parseFloat(iaDate[0]);
  month = parseFloat(iaDate[1]);
  day=parseFloat(iaDate[2]);
  if (year < 1900 || year > 2100) return false;
  if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1]=29;
  if (month < 1 || month > 12) return false;
  if (day < 1 || day > iaMonthDays[month - 1]) return false;
  return true;
}

// ����ı��ĳ���(������Ϊ�����ַ�)
function checkTextLength(strTemp,textName,textLength)
{
  var str = strTemp;
  num=str.length;
  var arr=str.match(/[^\\\\\\\\\\\\\\\\x00-\\\\\\\\\\\\\\\\x80]/ig);
  if(arr!=null)num+=arr.length;
  if(parseInt(num) > parseInt(textLength))
  {
    alert(textName + "�ĳ��Ȳ��ܴ���" + textLength);
    return false;
  }
  else
    return true;
}
