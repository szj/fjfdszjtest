<link rel="stylesheet" type="text/css" href="/theme/1/style.css">
<script src="../inc/js/ccorrect_btn.js"></script>
  
<html>
<head>
<title>�鿴����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script src="../inc/mytable.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function MyLoad()
{
    MyTimer();
}

TimeStart=20;

function MyTimer()
{
   if(TimeStart==0)
      window.close();

   if(document.getElementById("TimeShow"))
      document.getElementById("TimeShow").innerHTML=TimeStart;
   TimeStart--;

   var timer=setTimeout("MyTimer()",1000);
}

function gotoURL(URL,SMS_ID,open_window)
{
   var xmlHttp=getXMLHttpObj();
   xmlHttp.open("GET","sms_submit.php?DEL=0&SMS_ID="+SMS_ID,true);
   xmlHttp.send(null);
   if(opener&&opener.parent.leftmenu)
      opener.parent.leftmenu.openURL(URL,open_window);
   else
   {
      mytop=(screen.availHeight-500)/2-30;
      myleft=(screen.availWidth-780)/2;
      window.open(URL,"oa_sub_window","height=500,width=780,status=0,toolbar=no,menubar=no,location=no,scrollbars=yes,top="+mytop+",left="+myleft+",resizable=yes");
   }
   parent.opener.document.getElementById("new_sms").innerHTML="";
   window.close();
}
</SCRIPT>
</head>

<body class="bodycolor" topmargin="0" leftmargin="0" onload="MyLoad();">


<table width="100%" align="center">
    <tr>
      <td>
        <table border="0" cellspacing="0" width="100%" cellpadding="3" class="TableHeader">
          <tr><td>
            <img src="/images/sms_type7.gif" alt="������"  align="absmiddle" height="20"> ������         </td>
         <td class="small" align="right">
      ��<span class="big4">2</span>���¶���
      ����<span id="TimeShow" style="color:#FF0000;FONT-WEIGHT: bold;"></span>&nbsp;���ر�
         </td></tr>
        </table>
      </td>
    </tr>
    <tr class="TableData">
      <td>
        <table border="0" cellspacing="0" width="100%" cellpadding="5" class="small">
          <tr><td style="COLOR:#0000FF">
      <u title="���ţ����������" style="cursor:hand">ϵͳ����Ա</u>&nbsp;&nbsp;2008-06-25 09:24:23</td>
          <td style="COLOR:#0000FF" align="right">�����ˣ�ϵͳ����Ա</td>
          </tr>
          <tr height="70" valign="top"><td colspan="2">
          ������ת�����ѣ�����(2008-06-05 09:02:36)          </td></tr>
          <tr class="TableControl" nowrap><td colspan="2">
      <div align="right">
      <a href="sms_submit.php?SMS_ID=7&DEL=0"> ��֪����</a>&nbsp;&nbsp;
      <a href="sms_submit.php?SMS_ID=7&DEL=0&TO_ID=admin&TO_NAME=ϵͳ����Ա&ISPIRIT=&I_VER="> �ظ�</a>&nbsp;&nbsp;
      <a href="javascript:gotoURL('%2Fgeneral%2Fworkflow%2Flist%2Fprint%3FRUN_ID%3D7%26FLOW_ID%3D3','7',1);" title="����鿴��������"> �鿴����</a>&nbsp;&nbsp;
      <a href="sms_submit.php?SMS_ID=7&DEL=1"> ɾ��</a>&nbsp;&nbsp;
      </div>
          </td></tr>
        </table>
      </td>
    </tr>
</table>
</body>
</html>
