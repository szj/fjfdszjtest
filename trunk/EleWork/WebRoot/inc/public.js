/*
  ������д���ֶ�
  ����:qsy
*/
var
  // �����ֶ�
  mustFillArray=[];
  mustFillCaptionArray=[];
  // ����Ϊ�����ֶ�
  mustIntArray=[];
  mustIntCaptionArray=[];
  mustFloatArray=[];
  mustFloatCaptionArray=[];

  pageType="";

  // ��ǰ����ֵ
  seqn="";
  // ��ǰģʽ
  mode="";
  // ��ǰ�������ֵ
  detailSeqn="";

  //
  ownValidate=false;

/*
  ����:��¼������¼��ѡ
  ����:qsy
*/
function doWhich(){
        var i=0;
            // ����
            if (document.theForm.radio.length==null){
                document.theForm.hWhich.value=document.theForm.radio.value;
            }
            // ����
            else{
              while(true){
                if(document.theForm.radio[i].checked){
                  document.theForm.hWhich.value=document.theForm.radio[i].value;
                  break;
                }
                i++;
              }
            }
}
/*
  ����:ѡ��һ����Ϣ
  ����:qsy
*/
function doChoose(myArray){
   window.returnValue=myArray;
   self.close();
}

/*
  ����:����
  ����:qsy
*/
function doFind() {
  if (parames==""){
    formSubmit(curPage+parames+"?mode=query");
  }
  else{
    formSubmit(curPage+parames+"&mode=query");
  }
}


/*
  ����:����
  ����:qsy
*/
function doAdd()
{
  formSubmit(curPage+findparames+"&mode=add");
}

/*
  ����:�༭
  ����:qsy
*/
function doEdit()
{
  if (document.theForm.hWhich.value=="") {
    alert("��ѡ��һ����¼!");
    return false;
  }
  seqn=document.theForm.hWhich.value;
  formSubmit(curPage+findparames+"&mode=edit"+"&seqn="+seqn);
}

/*
  ����:ɾ��
  ����:qsy
*/
function doDel()
{
  if (document.theForm.hWhich.value=="") {
    alert("��ѡ��һ����¼!");
    return false;
  }
  if (confirm("ȷ��Ҫɾ����?")){
  seqn=document.theForm.hWhich.value;
  formSubmit(curPage+findparames+"&mode=del"+"&seqn="+seqn);
  }
}
/*
  ����:�쿴
  ����:qsy
*/
function doView()
{
  if (document.theForm.hWhich.value=="") {
    alert("��ѡ��һ����¼!");
    return false;
  }
  seqn=document.theForm.hWhich.value;
  formSubmit(curPage+findparames+"&mode=view"+"&seqn="+seqn);
}
/*
  ����:��ӡ
  ����:qsy
*/
function doDetailPrint()
{
  window.open(curPage+findparames+"&mode=query&action=print&filename=wlprint.pdf&seqn="+seqn);
}
function doPrint()
{
//  a = curPage.indexOf(".faces");
//  window.open(curPage.substring(0,a)+"_print.faces"+findparames+"&mode=query&filename=dummy.pdf");
  if (pageType=="masterDetail"){
    if (document.theForm.hWhich.value=="") {
      alert("��ѡ��һ����¼!");
      return false;
    }
    seqn=document.theForm.hWhich.value;
    window.open(curPage+findparames+"&mode=query&action=print&filename=wlprint.pdf"+"&seqn="+seqn);
  }
  else {
    //window.open(curPage+findparames+"&mode=query&action=print&filename=wlprint.pdf");
    //window.open(curPage+findparames+"&mode=query&action=print&filename=wlprint.pdf");
    window.open(curPage+findparames+"&action=print");
  }
}
function doQryPrint()
{

//  a = curPage.indexOf(".faces");
//  window.open(curPage.substring(0,a)+"_print.faces"+findparames+"&mode=query&filename=dummy.pdf");
  window.open(curPage+findparames+"&mode=query&action=print&filename=wlprint.pdf");
}
/*
  ����:У��
  ����:qsy
*/
function doValidate(){
  for (var index = 0; index < mustFillArray.length; index++) {
    sValue=document.theForm(mustFillArray[index]).value;
    if (sValue==""){
      alert(mustFillCaptionArray[index]+"����Ϊ�գ�");
      return false;
    }
  }
  for (var index = 0; index < mustIntArray.length; index++) {
    sValue=document.theForm(mustIntArray[index]).value;
    if (!isValidInt(sValue)){
      alert(mustIntCaptionArray[index]+"����Ϊ����!");
      return false;
    }
  }
  for (var index = 0; index < mustFloatArray.length; index++) {
    sValue=document.theForm(mustFloatArray[index]).value;
    if (!isValidDecimal(sValue)){
      alert(mustFloatCaptionArray[index]+"����Ϊ����!");
      return false;
    }
  }

  if (ownValidate) {
       if (!doMyValidate()){
         return false;
       }
  }
  return true;
}

/*
  ����:����
  ����:qsy
*/
function doSave()
{
  if (!(doValidate())) {
    return false;
  }

  aquerystring="";
  if (findparames==""){
    aquerystring="?action=save";
  }
  else{
    aquerystring="&action=save";
  }

  aquerystring=aquerystring+"&mode="+mode  ;
  if (seqn!=""){
    aquerystring=aquerystring+"&seqn="+seqn;
  }
  formSubmit(curPage+findparames+aquerystring);
}
/*
  ����:������
  ����:qsy
*/
function doAction(actionname)
{
  if ((actionname=="SaveAttemper") || (actionname=="Attemper")){
     if (!(doValidate())) {
         return false;
     }
  }


  aquerystring="";
  if (findparames==""){
    aquerystring="?action="+actionname;
  }
  else{
    aquerystring="&action="+actionname;
  }

  aquerystring=aquerystring+"&mode="+mode  ;
  if (seqn!=""){
    aquerystring=aquerystring+"&seqn="+seqn;
  }
  formSubmit(curPage+findparames+aquerystring);
}


/*
  ����:�굥����
  ����:qsy
*/
function doDetailAdd()
{
  formSubmit(curPage+detailParames+"&detailMode=add");
}

/*
  ����:�굥�༭
  ����:qsy
*/
function doDetailEdit()
{
  if (document.theForm.hWhich.value=="") {
    alert("��ѡ��һ����¼!");
    return false;
  }
  detailSeqn=document.theForm.hWhich.value;
  formSubmit(curPage+detailParames+"&detailMode=edit"+"&detailSeqn="+detailSeqn);
}

/*
  ����:�굥�鿴
  ����:qsy
*/
function doDetailView()
{
  if (document.theForm.hWhich.value=="") {
    alert("��ѡ��һ����¼!");
    return false;
  }
  detailSeqn=document.theForm.hWhich.value;
  formSubmit(curPage+detailParames+"&detailMode=view"+"&detailSeqn="+detailSeqn);
}


/*
  ����:�굥ɾ��
  ����:qsy
*/
function doDetailDel()
{
  if (document.theForm.hWhich.value=="") {
    alert("��ѡ��һ����¼!");
    return false;
  }
  detailSeqn=document.theForm.hWhich.value;
  formSubmit(curPage+detailParames+"&detailMode=del"+"&detailSeqn="+detailSeqn);
}
/*
  ����:�굥����
  ����:qsy
*/
function doDetailSave()
{
  if (!(doValidate())) {
    return false;
  }
  aquerystring="";
  if (parames==""){
    aquerystring="?action=save";
  }
  else{
    aquerystring="&action=save";
  }
//  aquerystring=aquerystring+"&mode=edit&detailMode="+mode;
  if (detailSeqn!=""){
    aquerystring=aquerystring+"&detailSeqn="+detailSeqn;
  }
  formSubmit(curPage+detailParames+aquerystring);
}

/*
  ����:�ṩ������Ϣ(���Ʒ,�ֿ�)��ѡ�����,����ѡ��
  @param sField    String ʹ���ֶ�
  @param sDisField String ��ʾ�ֶ�
  @param facename  String jspҳ��
  @param selname   String ѡ������
  @param selFillCompArray  Array ����ֶ���д�ؼ�
  @param selFillIndexArray Array ����ֶ���д����
  ����:qsy
*/
function selectseqn(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam){
 if (facename==='selectReceiveUnit'){
 selectseqnwindow(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam,'800','550');
 }
 else
 {
 selectseqnwindow(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam,'520','550');
 }
}
function selectseqnwindow(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam,swidth,sheight){
  if (sDisField==''){
    sDisField=sField;
  }
var
  sValue=document.theForm(sDisField).value;
  if (sValue=="����ѡ��") {
      sValue="";
  }
var
  surl="../inc/"+facename+".faces?"+selname+"="+sValue+sparam;
  sReturn=window.showModalDialog(surl,"asd",'dialogHeight:'+sheight+'px;dialogWidth:'+swidth+'px;status:no;help:no;');

  if(sReturn!=null){
    if (sDisField!="") {
      document.all(sDisField).value=sReturn[2];
    }
    document.all(sField).value=sReturn[0];
    for (var index = 0;
    index < selFillCompArray.length; index++) {
      document.theForm(selFillCompArray[index]).value=sReturn[selFillIndexArray[index]];
    }
  }
  else
  {
    if (sDisField!="") {
      document.all(sDisField).value="";
    }
    document.all(sField).value="";
    for (var index = 0; index < selFillCompArray.length; index++) {
      document.theForm(selFillCompArray[index]).value="";
    }
  }


}
/*
  ����:�ṩ������Ϣ(���Ʒ,�ֿ�)��ѡ�����,����ѡ��
  @param sField    String ʹ���ֶ�
  @param sDisField String ��ʾ�ֶ�
  @param facename  String jspҳ��
  @param selname   String ѡ������
  @param selFillCompArray  Array ����ֶ���д�ؼ�
  @param selFillIndexArray Array ����ֶ���д����
  ����:qsy
  �޸�:szj�����Ƕ�ѡ����  2008-06-09
*/
function selectseqnex(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam){
 if (facename==='selectReceiveUnit'){
 selectseqnwindowex(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam,'800','550');
 }
 else
 {
 selectseqnwindowex(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam,'520','550');
 }
}
function selectseqnwindowex(sField,sDisField,facename,selname,selFillCompArray,selFillIndexArray,sparam,swidth,sheight){
  if (sDisField==''){
    sDisField=sField;
  }
var
  sValue=document.theForm(sDisField).value;
  if (sValue=="����ѡ��") {
      sValue="";
      document.all(sDisField).value="";
      document.all(sField).value="";
  }
var
  surl="../inc/"+facename+".faces?"+selname+"="+sValue+sparam;
  sReturn=window.showModalDialog(surl,"asd",'dialogHeight:'+sheight+'px;dialogWidth:'+swidth+'px;status:no;help:no;');

  if(sReturn!=null){
    if (sDisField!="") {
      if(document.all(sDisField).value.indexOf(","+sReturn[2]+",")>0||document.all(sDisField).value.indexOf(sReturn[2]+",")==0)
      {
       	if(document.all(sDisField).value.indexOf(sReturn[2]+",")==0)
      	document.all(sDisField).value=document.all(sDisField).value.replace(sReturn[2]+",","");
      	else if(document.all(sDisField).value.indexOf(","+sReturn[2]+",")>0)
      	document.all(sDisField).value=document.all(sDisField).value.replace(","+sReturn[2]+",",",");
      }
      else
      {
      	document.all(sDisField).value+=sReturn[2]+",";
      }
    }
    if(document.all(sField).value.indexOf(","+sReturn[0]+",")>0||document.all(sField).value.indexOf(sReturn[0]+",")==0)
    {
       	if(document.all(sField).value.indexOf(sReturn[0]+",")==0)
      	document.all(sField).value=document.all(sField).value.replace(sReturn[0]+",","");
      	else if(document.all(sField).value.indexOf(","+sReturn[0]+",")>0)
      	document.all(sField).value=document.all(sField).value.replace(","+sReturn[0]+",",",");
    }
    else
    {
    	document.all(sField).value+=sReturn[0]+",";
    }
  }
  else
  {
    if (sDisField!="") {
      document.all(sDisField).value="";
    }
    document.all(sField).value="";
    for (var index = 0; index < selFillCompArray.length; index++) {
      document.theForm(selFillCompArray[index]).value="";
    }
  }
}

function selectVal(values,selname){
var
  sValue=document.theForm(selname).value;
  if (sValue=="����ѡ��") {
      sValue="";
  }
var
  surl="../inc/selVal.faces?values="+values+"&"+selname+"="+sValue;
  sReturn=window.showModalDialog(surl,"asd",'dialogHeight:80px;dialogWidth:40px;status:no;help:no;');

  if(sReturn!=null){
    document.all(selname).value=sReturn[0];
  }
}

/*
function isInt(iNumber)
{

  if (isNaN(iNumber))
  {
	  return false;
  }
  else if (parseInt(iNumber))
  {
      return true;
  }
  else
  {
      return false;
  }


}

function isNumeric(iNumber,IsPlus)
{

 if (isNaN(iNumber))
 {
	 return false;
 }
 else if ((parseFloat(iNumber)>0 && IsPlus==1) ||(parseFloat(iNumber)<0 && IsPlus==-1)|| (IsPlus==0))
 {
    return true;
 }
 else
 {
 	 return false;
 }



}
*/
 function isEmpty(strData)
{
	if (strData=="")
	{
		return true;
	}

}

function formSubmit(strUrl)
{
   document.theForm.action=strUrl;
   document.theForm.submit();
}

function compareTwoDate(startDate,endDate,startDesc,endDesc){
/*
  �жϿ�ʼʱ��ͽ���ʱ��Ĵ�С
*/

  if(!isEmpty(startDate)){
       if(!isValidDate(startDate)){
         alert("�������"+startDesc+"��ʽ����ȷ,����ĸ�ʽӦΪYYYY-MM-DD");
         return false;
       }
   }

 if(!isEmpty(endDate)){
       if(!isValidDate(endDate)){
         alert("�������"+endDesc+"��ʽ����ȷ,����ĸ�ʽӦΪYYYY-MM-DD");
         return false;
       }
  }


   if(!isEmpty(startDate) && !isEmpty(endDate)){
         date1=returnDate(startDate);
         date2=returnDate(endDate);
         sStart=date1.getYear()+"";
         sEnd=date2.getYear()+"";

         if(date1.getMonth()<10){
          sStart+="0"+date1.getMonth();
         }
         else{
          sStart+=date1.getMonth();
         }

         if(date1.getDate()<10){
           sStart+="0"+date1.getDate();
         }
         else{
           sStart+=date1.getDate();
         }

         if(date2.getMonth()<10){
          sEnd+="0"+date2.getMonth();
         }
         else{
          sEnd+=date2.getMonth();
         }

         if(date2.getDate()<10){
           sEnd+="0"+date2.getDate();
         }
         else{
           sEnd+=date2.getDate();
         }

         if(parseInt(sStart)>parseInt(sEnd)){
           alert(startDesc+"����С��"+endDesc)
           return false;
         }

   }
	return true;

 }


  function returnDate(strValue){
 /*
   ����ʱ�����
 */
    var index=strValue.indexOf("-");
    var year=strValue.substring(0,index);
    strValue=strValue.substring(index+1,strValue.length);
    index=strValue.indexOf("-");
    var month=strValue.substring(0,index);
    var day=strValue.substring(index+1,strValue.length);
    return new Date(year,month,day);

 }

  function isValidDate(theField)
{
	var s1, s2, sDate, sMonth, sYear;
	var inDate = theField;
	if (inDate.substring(4,5)=="-"||inDate.substring(4,5)=="/")
	{
	  s1=4;
	}
	else
	{
	  return false;
	}

	if (inDate.substring(6,7)=="-"||inDate.substring(6,7)=="/")
	{
	 s2=6;
	 }
	else if (inDate.substring(7,8)=="-" || inDate.substring(7,8)=="/")
	{
	s2=7;
	}
	else
	{
	   return false;

	}

	if (isValidInt(inDate.substring(0,s1)))
	{
       sYear= parseInt(inDate.substring(0,s1));
	}
	else
	{
		return false;
	}

	if (isValidInt(inDate.substring(s1+1,s2)))
	{
      sMonth= inDate.substring(s1+1,s2);
	}
	else
	{
		return false;
	}

	if (isValidInt(inDate.substring(s2+1,inDate.length)))
	{
       sDate= inDate.substring(s2+1,inDate.length);
	}
	else
	{
		return false;
	}




	if (sMonth==1 || sMonth==3 || sMonth==5 || sMonth==7 || sMonth==8 || sMonth==10 || sMonth==12)
	{
		if (sDate>=1 && sDate<=31) { return true; }
		else {return false;}

	}
	if (sMonth==4 || sMonth==6 || sMonth==9 || sMonth==11)
	{
		if (sDate>=1 && sDate<=30) { return true; }
		else{ return false; }

	}
	if (sMonth==2)
	{
		if (sYear%4 == 0)
		{ if (sDate>=1 && sDate <= 29) { return true; }
		  else {return false;}
	        }
		else
		{ if (sDate>=1 && sDate <= 28) { return true; }
		   else{return false;}
		 }
	}
      return false;

}






function isValidDecimal(theField)
{


	var inStr=theField;
	var inLen=inStr.length;

	if (inLen == 0)
		return true;
	if (inLen == 1 && inStr==" ")
		return false;
	for(var i=0; i< inLen; i++)
	{
		var ch = inStr.substring(i,i+1)
        if ((ch<"0" || ch>"9") && ch!="." && ch!="-")
		{
			if (ch != "")
				return false;
		}
    }
	return true;
/*
	if (
        .isNaN(theField) || (theField.length == 0)){
	   return false;
	}
	else{
	  return true;
	}
		*/
}

function isValidInt(theField)
{
	var inStr=theField;
	var inLen=inStr.length;

	if (inLen == 0)
		return true;
	if (inLen == 1 && inStr==" ")
		return false;
	for(var i=0; i< inLen; i++)
	{
		var ch = inStr.substring(i,i+1)
        if (ch < "0" || ch > "9")
		{
			if (ch != "")
				return false;
		}
    }
	return true;
}

function openNewWindow(strFile,strTitle){//����
 window.open(strFile,strTitle,"toolbar=no,menubar=no,left=100,top=100,");
}


function selectDate(sField){
/*
����ѡ��
*/
var sValue=document.theForm(sField).value;//����
var
sReturn=window.showModalDialog("../inc/calendar.jsp?sValue="+sValue,"asd",'dialogHeight:210px;dialogWidth:260px;status:no;help:no;');

if(sReturn!=""){
 document.all(sField).value=sReturn;
}

}
function selectClient(sField){
/*
�ͻ�ѡ��
*/
var sValue=document.theForm(sField).value;//����
var
sReturn=window.showModalDialog("../inc/selectClient.faces?sValue="+sValue,"asd",'dialogHeight:420px;dialogWidth:520px;status:no;help:no;');

if(sReturn!=""){
 document.all(sField).value=sReturn;
}

}

function doSelectMemberForArray(sFieldName,sFieldID,sType){
/*
  ��������Ԫ�ص����
*/

   var sReturn=window.showModalDialog("/wuye/inc/selectmember.jsp?sType="+sType,"asd",'dialogHeight:280px;dialogWidth:320px;status:no;help:no;');
   if(sReturn!=""){
     var index=sReturn.indexOf("*");
     var name=sReturn.substring(0,index);
     sReturn=sReturn.substring(index+1,sReturn.length);
	 var aa=eval("document.theForm."+sFieldName);
     aa.value=name;
     var iType=parseInt(sType);
	 var bb=eval("document.theForm."+sFieldID);
     switch(iType){
     case 1:
        bb.value=sReturn;
        break;
     case 2:
       index=sReturn.lastIndexOf("?");
       bb.value=sReturn.substring(index+1,sReturn.length);
       break;
     case 3:
       index=sReturn.lastIndexOf("?");
       bb.value=sReturn.substring(index+1,sReturn.length);
       break;
     }
   }
  }


function doSelectMember(sFieldName,sFieldID,sType){
/*
  ��˾,���Ż�Ա��ѡ��(sType��ֵ 1:��˾,2:����,3:Ա��)
  sFieldNameΪ��ʾ�ֶ�����
  sFieldIDΪ�����ֶ�����
*/

   var sReturn = window.showModalDialog("/wuye/inc/selectmember.jsp?sType="+sType,"asd",'dialogHeight:280px;dialogWidth:320px;status:no;help:no;');
   if(sReturn!=""){
     var index=sReturn.indexOf("*");
     var name=sReturn.substring(0,index);
     sReturn=sReturn.substring(index+1,sReturn.length);
     document.all(sFieldName).value=name;
     var iType=parseInt(sType);
     switch(iType){
     case 1:
        document.all(sFieldID).value=sReturn;
        break;
     case 2:
       index=sReturn.lastIndexOf("?");
       document.all(sFieldID).value=sReturn.substring(index+1,sReturn.length);
       break;
     case 3:
       index=sReturn.lastIndexOf("?");
       document.all(sFieldID).value=sReturn.substring(index+1,sReturn.length);
       break;
     }
   }
  }


//---���µ���ҳ��
function winOpen( str ){
    window.open ( str, 'newwindow', 'height=500, width=800, top=20,left=20,scrollbar=yes,resize=yes,toolbar=no, menubar=no, location=no, status=no')
    //window.showModalDialog();
 }

 function procCurrency(money){
   if(money<0){
     money=0.00;
   }

   money=(Math.round(money*100.00)/100.00);
   return money;
 }



