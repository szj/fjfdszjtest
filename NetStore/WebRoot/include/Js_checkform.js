function CheckEmpty(Field, FieldTitle)
{
	if (Field.value == "")
	{
		alert("����\"" + FieldTitle + "\"һ������������.");
		Field.focus();
		return false;
	}
		
	return true;
}

function CheckBothEmpty(Field1, Field2, FieldTitle)
{
	if (Field1.value == "" && Field2.value == "")
	{
		alert("\"" + FieldTitle + "\"���ܶ�Ϊ��");
		return false;
	}

	return true;
}
	
function CheckInteger(Field, FieldTitle)
{
	if (Field.value != "")
	{
		for (i = 0; i < Field.value.length; i++)
		{
			ch = Field.value.charAt(i);
				
			if (ch < '0' || ch > '9') {
				alert("\"" + FieldTitle + "\"��ֻ����������.");
				Field.focus();
				return	false;
			}
		}
	}
		
	return true;
}

function CheckDate(Field, FieldTitle)
{
	if (Field.value != "")
	{
		for (i = 0; i < Field.value.length; i++)
		{ 
			ch = Field.value.charAt(i);
			if ( i == 4 || i == 7 )
			   {
			   	if ( ch != '-' ) {
			        	alert("\"" + FieldTitle + "\"�����ڸ�ʽ����.");
			        	Field.focus();
			        	return	false;
			   	}
			   } 	
			else if ( i == 10  )
			   {
			   	if ( ch != ' ' ) {
			        	alert("\"" + FieldTitle + "\"�����ڸ�ʽ����.");
			        	Field.focus();
			        	return	false;
			   	}
			   } 	
			else if ( i == 13 || i == 16  )
			   {
			   	if ( ch != ':' ) {
			        	alert("\"" + FieldTitle + "\"�����ڸ�ʽ����.");
			        	Field.focus();
			        	return	false;
			   	}
			   } 		
			else
			   {
			   	if ( ch < 0 || ch > 9 ) {
			        	alert("\"" + FieldTitle + "\"�����ڸ�ʽ����.");
			        	Field.focus();
			        	return	false;
			   	}
			   } 				   		   			   
		}
	}
	
	return true;
}

function CheckDay(Field, FieldTitle)
{
	if (Field.value != "")
	{
		for (i = 0; i < Field.value.length; i++)
		{ 
			ch = Field.value.charAt(i);
			if ( i == 4 || i == 7 )
			   {
			   	if ( ch != '-' ) {
			        	alert("\"" + FieldTitle + "\"�����ڸ�ʽ����.");
			        	Field.focus();
			        	return	false;
			   	}
			   } 		
			else
			   {
			   	if ( ch < 0 || ch > 9 ) {
			        	alert("\"" + FieldTitle + "\"�����ڸ�ʽ����.");
			        	Field.focus();
			        	return	false;
			   	}
			   } 				   		   			   
		}
	}
	
	return true;
}

function CheckPhone(Field, FieldTitle)
{
	if (Field.value != "")
	{
		for (i = 0; i < Field.value.length; i++)
		{
			ch = Field.value.charAt(i);
				
			if ( (ch < '0' || ch > '9') && ch != '-'  && ch != '(' && ch != ')' && ch != '_' ) {
				alert("\"" + FieldTitle + "\"��ֻ�ܵ绰���������Լ�(��)��-��_����.");
				Field.focus();
				return	false;
			}
		}
	}
		
	return true;
}

function CheckReal(Field, FieldTitle)
{
	if (Field.value != "")
	{
		DotNum = 0;
		ch = Field.value;
		if (ch=='.')
		   {
				alert("\"" + FieldTitle + "\"�в���û���� .");
				Field.focus();
				return false;		   	
		   }	
		for (i = 0; i < Field.value.length;  i++)
		{
			ch = Field.value.charAt(i);
				
			if ((ch < '0' || ch > '9') && ch != '.') 
			{
				alert("\"" + FieldTitle + "\"��ֻ����������.");
				Field.focus();
				return false;
			}
				
			if (ch == '.')
			{
				if (DotNum > 0) 
				{
					alert("\"" + FieldTitle + "\"��ֻ������һ��С����.");
					Field.focus();
					return false;
				}
			DotNum++;			
			}
		}
	}
		
	return	true;
}

function CheckMaxLength(Field, MaxLength, FieldTitle)  
{  
	if (Field.value != "")  
	{  
		if (Field.value.length > MaxLength)  
		{  
			alert("\"" + FieldTitle + "\"��������ַ��벻Ҫ����" + MaxLength + "�ַ�.");  
			Field.focus();  
			return false;  
		}  
	}  
			  
	return true;  
}
	  
function CheckMinLength(Field, MinLength, FieldTitle)  
{  
	if (Field.value != "")  
	{  
		if (Field.value.length < MinLength)  
		{  
			alert("\"" + FieldTitle + "\"��������ַ��벻Ҫ����" + MinLength + "�ַ�.");  
			Field.focus();  
			return false;  
		}  
	}  
			  
	return true;  
}  
	
function CheckOption(Field, FieldTitle) 
{
	for (i = 0; i < Field.length; i++)
		if (Field[i].checked)
			return true;
				
	alert("��ѡ��\"" + FieldTitle + "\"�е�ֵ.");
	return false;
}
	//�˺��������ж�Email��ַ�Ƿ���ȷ
function CheckEmail(Field)
{
   // there must be >= 1 character before @, so we
   // start looking at character position 1
   // (i.e. second character)
   var i = 1;
   var len = Field.value.length;
	if (len > 50)
	{
		window.alert("email��ַ���Ȳ��ܳ���50λ!");
		return false;
	}
	pos1 = Field.value.indexOf("@");
	pos2 = Field.value.indexOf(".");
	pos3 = Field.value.lastIndexOf("@");
	pos4 = Field.value.lastIndexOf(".");
	//check '@' and '.' is not first or last character
	if ((pos1 <= 0)||(pos1 == len-1)||(pos2 <= 0)||(pos2 == len-1))  
	{
		window.alert("��������Ч��E-mail��ַ��");
		return false;
	}
	else
	{
		//check @. or .@
		if( (pos1 == pos2 - 1) || (pos1 == pos2 + 1) 
		  || ( pos1 != pos3 )  //find two @
		  || ( pos4 < pos3 ) ) //. should behind the '@'  		
		{
			window.alert("��������Ч��E-mail��ַ��");
			return false;
		}
	}
	return true;
}
	
function CheckMustLength(Field, MustLength, FieldTitle)  
{  
	if (Field.value != "")  
	{  
		if (Field.value.length != MustLength)  
		{  
			alert("\"" + FieldTitle + "\"�������ֵ������" + MustLength + "λ.");  
			Field.focus();  
			return false;  
		}  
	}  
			  
	return true;  
}  
	  
function CheckIntRange(field,prompt,min,max) {  
	if ( ! CheckInteger(field,prompt) )  
		return	false;  
	ival = parseInt(field.value);  
	if ( ival < min || ival > max ) {  
		alert(prompt + " ֻ��Ϊ " + min + " �� " + max + " ֮�����");  
		field.focus();  
		return	false;  
	}  
	return	true;  
}  


function CheckConfirm(type)
{
	if(confirm("�Ѿ��������, �˶���ȷ, ȷ���ύ?")) {
		return true;
	} else {
		return false;
	}
}
function numberPoint()
{
var char = String.fromCharCode(event.keyCode)
var re = /[0-9.]/g
event.returnValue = char.match(re) != null ? true : false
}
function number()
{
var char = String.fromCharCode(event.keyCode)
var re = /[0-9]/g
event.returnValue = char.match(re) != null ? true : false
}

