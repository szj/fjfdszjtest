<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page contentType="text/html; charset=GB2312"%>
<HTML>
<HEAD>
<TITLE>����</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<!--
  �벻Ҫɾ����ΰ�Ȩ��Ϣ --><!--
  �������� ���Ǿ�Ʒ
  http://www.asp888.net ��������վ
-->
<STYLE type=text/css>
  .normal {
  BACKGROUND: #c1da90
  }
  .today {
  FONT-WEIGHT: bold; BACKGROUND: white
  }
  .satday {
  BACKGROUND: #e2f3c0; COLOR: green
  }
  .sunday {
  BACKGROUND: #a8c373; COLOR: red
  }
  .days {
  FONT-WEIGHT: bold; FONT-SIZE: 12px; BACKGROUND: #a8c373
  }
</STYLE>
<LINK href="../inc/mm.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript type="text/JavaScript">
//�����·�,�������ʾӢ���·ݣ��޸������ע��
/*var months = new Array("January?, "February?, "March",
"April", "May", "June", "July", "August", "September",
"October", "November", "December");*/
var months = new Array("һ��", "����", "����",
"����", "����", "����", "����", "����", "����",
"ʮ��", "ʮһ��", "ʮ����");
var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31,
30, 31, 30, 31);
//������ �������ʾ Ӣ�ĵģ��޸������ע��
/*var days = new Array("Sunday", "Monday", "Tuesday",
"Wednesday", "Thursday", "Friday", "Saturday");*/
var days = new Array("��","һ", "��", "��","��", "��", "��");
function getDays(month, year) {
//�������δ������жϵ�ǰ�Ƿ��������
if (1 == month)
return ((0 == year % 4) && (0 != (year % 100))) ||
(0 == year % 400) ? 29 : 28;
else
return daysInMonth[month];
}

function getToday() {
//�õ��������,��,��
this.now = new Date();
this.year = this.now.getFullYear();
this.month = this.now.getMonth();
this.day = this.now.getDate();
}


today = new getToday();

function newCalendar() {

today = new getToday();
var parseYear = parseInt(document.all.year
[document.all.year.selectedIndex].text);
var newCal = new Date(parseYear,
document.all.month.selectedIndex, 1);
var day = -1;
var startDay = newCal.getDay();
var daily = 0;
if ((today.year == newCal.getFullYear()) &&(today.month == newCal.getMonth()))
day = today.day;
var tableCal = document.all.calendar.tBodies.dayList;
var intDaysInMonth =getDays(newCal.getMonth(), newCal.getFullYear());
for (var intWeek = 0; intWeek < tableCal.rows.length;intWeek++)
for (var intDay = 0;intDay < tableCal.rows[intWeek].cells.length;intDay++)
{
var cell = tableCal.rows[intWeek].cells[intDay];
if ((intDay == startDay) && (0 == daily))
daily = 1;
if(day==daily)
//���죬���ý����Class
cell.className = "today";
else if(intDay==6)
//����
cell.className = "sunday";
else if (intDay==0)
//����
cell.className ="satday";
else
//ƽ��
cell.className="normal";

if ((daily > 0) && (daily <= intDaysInMonth))
{
cell.innerText = daily;
daily++;
}
else
cell.innerText = "";
}
}

function resetCalendar() {
today = new getToday();
var parseYear = parseInt(document.all.year
[document.all.year.selectedIndex].text);
var newCal = new Date(parseYear,
document.all.month.selectedIndex, 1);
var day = -1;
var startDay = newCal.getDay();
var daily = 0;
if ((today.year == newCal.getFullYear()) &&(today.month == newCal.getMonth()))
day = today.day;
var tableCal = document.all.calendar.tBodies.dayList;
var intDaysInMonth =getDays(newCal.getMonth(), newCal.getFullYear());
for (var intWeek = 0; intWeek < tableCal.rows.length;intWeek++)
for (var intDay = 0;intDay < tableCal.rows[intWeek].cells.length;intDay++)
{
var cell = tableCal.rows[intWeek].cells[intDay];
if ((intDay == startDay) && (0 == daily))
daily = 1;
if(day==daily)
//���죬���ý����Class
cell.className = "normal";
else if(intDay==6)
//����
cell.className = "sunday";
else if (intDay==0)
//����
cell.className ="satday";
else
//ƽ��
cell.className="normal";

if ((daily > 0) && (daily <= intDaysInMonth))
{
cell.innerText = daily;
daily++;
}
else
cell.innerText = "";
}
}

function getDate() {
var sDate;

//��δ��봦������������
if ("TD" == event.srcElement.tagName)
if ("" != event.srcElement.innerText)
{
 var monthStr = document.all.month.value;
 var dateStr = event.srcElement.innerText;
  if (monthStr.length==1) monthStr = "0" + monthStr;
  if (dateStr.length==1) dateStr = "0" + dateStr;
sDate = document.all.year.value +  monthStr + dateStr ;
document.all("ret").value=sDate
}
}
</SCRIPT><META content="MSHTML 6.00.2800.1492" name=GENERATOR>
</HEAD>
<BODY bgColor=#f0f9df leftMargin=3 topMargin=3 scroll=no onload=newCalendar()>
<INPUT type=hidden value="" name=ret>
<TABLE id=calendar cellSpacing=1 cellPadding=0 width="100%" border=0>
  <THEAD>
    <TR>
      <TD align=middle colSpan=3>
        <SELECT id=month onchange=newCalendar()>
<SCRIPT language=JavaScript type="text/JavaScript">
for (var intLoop = 0; intLoop < months.length;intLoop++)
document.write("<OPTION VALUE= " + (intLoop + 1) + " " +(today.month == intLoop ?"Selected" : "") + ">" + months[intLoop]);
</SCRIPT>        </SELECT>
      </TD>
      <TD>&nbsp;</TD>
      <TD align=middle colSpan=3>
        <SELECT id=year onchange=newCalendar()>
<SCRIPT language=JavaScript  type="text/JavaScript">
for (var intLoop = today.year-50; intLoop < (today.year + 30);
intLoop++)
document.write("<OPTION VALUE= " + intLoop + " " +
(today.year == intLoop ?
"Selected" : "") + ">" +
intLoop);
</SCRIPT>        </SELECT>
      </TD>
    </TR>
    <TR class=days align=middle>
<SCRIPT language=JavaScript  type="text/JavaScript">
document.write("<TD class=satday width=14%>" + days[0] + "</TD>");
for (var intLoop = 1; intLoop < days.length-1;intLoop++)
document.write("<TD >" + days[intLoop] + "</TD>");
document.write("<TD class=sunday>" + days[intLoop] + "</TD>");
</SCRIPT>    </TR>
  </THEAD>
  <TBODY id=dayList ondblclick=javascript:getDate();doOk(); onclick=javascript:getDate()>
<SCRIPT language=JavaScript  type="text/JavaScript">
for (var intWeeks = 0; intWeeks < 6; intWeeks++) {
document.write("<TR style='cursor:hand' align=center>");
for (var intDays = 0; intDays < days.length;intDays++)
document.write('<TD  width=14%  onmousedown="Javascript:doChangeColor()" id="id'+intWeeks+"_"+intDays+'"></TD>');
document.write("</TR>");
}
</SCRIPT>    <TR>
      <TD colSpan=7>&nbsp;</TD>
    </TR>
  </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=1 width="100%" border=0>
  <TBODY>
    <TR>
      <TD bgColor=#cccccc height=1>      </TD>
    </TR>
    <TR>
      <TD align=middle>
        <INPUT onclick=Javascript:doOk(); type=button value="ȷ ��">
        <INPUT type=hidden name=txtValue>
        <INPUT onclick=Javascript:cancel(); type=button value="ȡ ��">
      </TD>
    </TR>
  </TBODY>
</TABLE>
<SCRIPT language=JavaScript  type="text/JavaScript">
window.returnValue="";
function cancel() {
window.close();
}
function doChangeColor(){
if (event.srcElement.tagName=="TD"){
    var sValue=document.all("txtValue").value
   if(document.all(event.srcElement.id).innerText!=""){
     resetCalendar();
     if (sValue!=""){
       document.all(sValue).style.background="#CFF488";
      }
     event.srcElement.style.background="white";
     document.all("txtValue").value=event.srcElement.id;
    }
 }

}

function doOk(){
  if(document.all("ret").value==""){
    curdate = new Date();
 var monthStr = curdate.getMonth()+1;
//    alert(monthStr);
 var dateStr = curdate.getDate();
//    alert(dateStr);
    alert("��ѡ��ʱ��")
    return false;
  }
   window.returnValue=document.all("ret").value;
   self.close();
}
</SCRIPT></BODY>
</HTML>
