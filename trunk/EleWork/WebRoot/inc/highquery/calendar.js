
	/********************************************
	 * �ļ����ƣ�check.js
	 * ���������������ڿؼ�
	 * �������ڣ�2008-07-21
	 * @author��codeslave
	 * @version 0.4
	 *********************************************/

// �����ڿؼ�(����)
function showDateForm(d)
{
  var arg = new Object();
  arg.str_datetime = d;
  arg.time_comp = false;
  var rtn = window.showModalDialog('highquery/calendar.htm', arg, 'dialogWidth=210px;dialogHeight=220px;status:no;scroll=no;');
  return (rtn == null ? "" : rtn);
}

// �����ڿؼ�(����ʱ��)
function showDateTimeForm(d)
{
  var arg = new Object();
  arg.str_datetime = d;
  arg.time_comp = true;
  var rtn = window.showModalDialog('highquery/calendar.htm', arg, 'dialogWidth=210px;dialogHeight=220px;status:no;scroll=no;');
  return (rtn == null ? "" : rtn);
}