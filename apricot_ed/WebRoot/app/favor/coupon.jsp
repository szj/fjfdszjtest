  var foodFields=[
  {label:"��ƷID",name:"food_id",hide:"all"},
  {label:"��Ʒ����",name:"food_name"},
  {label:"��Ʒ����",name:"food_price"},
  {label:"��Ʒ����",  name:"food_type",xtype:"combo",code:"FOOD_TYPE"}

];
var listField=[
{label:"�����Ż�ȯID",name:"cp_id",allowBlank:false,hide:"all"},
{label:"�Ż�ȯ����",name:"cp_name",allowBlank:false},
      {label:"�����Ż�ȯ���",name:"cp_num",allowBlank:false,id:"cpnum2",
      	 listeners:{
       			"render":function(){
       				var a=Ext.getCmp("cpnum2");
       				a.disable();
       			}
       		}
      },
      {label:"�ۿ۱���",name:"cp_disct",allowBlank:false,maxLength:2,maxLengthText:"���볬����������",id:"cpdisct1",emptyText:"����85��,����85",
      		listeners:{
      		"blur":function(){
      		var a=Ext.getCmp("cpdisct1");
      		var b=Ext.getCmp("cpcash1");
      			if(a.getValue()!=0){
      				b.setValue(0);
      				b.disable(true);
      			}else{
      				b.setValue();
      				b.enable(false);
      			}
      		}
      	}
      	
      },
      {label:"�Żݽ��",name:"cp_cash",allowBlank:false,id:"cpcash1",
      		listeners:{
      		"blur":function(){
      		var a=Ext.getCmp("cpdisct1");
      		var b=Ext.getCmp("cpcash1");
      			if(b.getValue()!=0){
      				a.setValue(0);
      				a.disable(true);
      			}else{
      				a.setValue();
      				a.enable(false);
      			}
      		}
      	}
      },
       {label:"�Ƿ�����",name:"cp_oper",id:"cp_opm",allowBlank:false,xtype:"combo",code:"COUPON_GIVE",
       		listeners:{
       			"select":function(){
       				var a=Ext.getCmp("cp_opm");
		      		var b=Ext.getCmp("pricem");
		      		if(a.getValue()==0){
		      			b.setValue("0.00");
	      				b.disable();
		      		}else{
		      			b.setValue();
      					b.enable(false);
		      		}
       			}
       		}
       
       },
      {label:"���ۼ۸�",name:"cp_money",id:"pricem"},
      {label:"״̬",name:"cp_status",xtype:"combo",allowBlank:false,code:"COUPON_STATUS"},
      //{label:"��Ʒ����",name:"cond_type",id:"condtype1",xtype:"combo",code:"FOOD_TYPE"},
     //  {label:"��Ʒ����",name:"food_name",readOnly:true,xtype:"trigger",columns:foodFields,checkbox:true,singleSelect:false,afterRowClick:function(){},buttons:[{text:"ȷ��",handler:function(){getCmp("dialogWindow_xudahu111").destroy();}}],map:{food_id:"scope_value"},tableURL:"/rule/value/all1.do",getData:function(){return {scope_value:Ext.getCmp("condtype1").getValue()};}},
      
      {label:"��������",name:"pb_time",xtype:"datetime"},
      {label:"��ʼʱ��",name:"start_time",xtype:"datetime"},
      {label:"��ֹʱ��",name:"end_time",allowBlank:false,xtype:"datetime"}
     
     //{label:"��������",name:"is_full",xtype:"combo",code:"IS_FULL"},
    //  {label:"���",name:"cond_value"},
     // {label:"����(��)",name:"send_num"}
   ];
var listField1=[
 	  {label:"�Ż�ȯ����",name:"cp_name",allowBlank:false},
      {label:"��������",name:"pb_time",allowBlank:false,value:new Date().dateFormat("Y-m-d H:i:s")},
      {label:"�Ż�ȯ���",name:"cp_num",id:"cpnum1",
       listeners:{
       			"blur":function(){
       				var a=Ext.getCmp("cpnum1");
       				doGet("/fav/coupon_info.check.do?cp_num="+a.getValue(),"",function(dt){
       					if(dt["flag"]=="YES"){
       						return true;
       					}else{	
       					$alt("�Ż�ȯ����Ѵ��ڣ�");
       					}
       				});
       			}
       		},
       	invalidText:'�Ż�ȯ����Ѿ���ע�ᣡ' 
       		
       },
      {label:"��ʼʱ��",name:"start_time",allowBlank:false,xtype:"datetime"},
      {label:"��ֹʱ��",name:"end_time",allowBlank:false,xtype:"datetime"},
      {label:"��ʼ���",name:"start_no"},
      {label:"��ֹ���",name:"end_no",allowBlank:false},
      {label:"״̬",name:"cp_status",xtype:"combo",allowBlank:false,code:"COUPON_STATUS"},
      {label:"�ۿ۱���",name:"cp_disct",allowBlank:false,maxLength:2,maxLengthText:"���볬����������",emptyText:"����85��-����85",id:"cpdisct2",
      		listeners:{
      		"blur":function(){
      		var a=Ext.getCmp("cpdisct2");
      		var b=Ext.getCmp("cpcash2");
      			if(a.getValue()!=0){
      				b.setValue(0);
      				b.disable(true);
      			}else{
      				b.setValue();
      				b.enable(false);
      			}
      		}
      	}
      
      },
      {label:"�Żݽ��",name:"cp_cash",allowBlank:false,id:"cpcash2",
	      listeners:{
	      		"blur":function(){
	      		var a=Ext.getCmp("cpdisct2");
	      		var b=Ext.getCmp("cpcash2");
	      			if(b.getValue()!=0){
	      				a.setValue(0);
	      				a.disable(true);
	      			}else{
	      				a.setValue();
	      				a.enable(false);
	      			}
	      		}
	      	}
      	},
      {label:"�Ƿ�����",name:"cp_oper",allowBlank:false,xtype:"combo",code:"COUPON_GIVE",id:"cp_opo",
      	listeners:{
       			"select":function(){
       				var a=Ext.getCmp("cp_opo");
		      		var b=Ext.getCmp("priceo");
		      		if(a.getValue()==0){
		      			b.setValue("0.00");
	      				b.disable();
		      		}else{
		      			b.setValue();
      					b.enable(false);
		      		}
       			}
       		}
      },
    	 {label:"���ۼ۸�",name:"cp_money",allowBlank:false,id:"priceo"}
    //  {label:"��Ʒ����",name:"cond_type",id:"condtype2",xtype:"combo",code:"FOOD_TYPE"},
   	//   {label:"��Ʒ����",name:"food_name",readOnly:true,xtype:"trigger",columns:foodFields,checkbox:true,singleSelect:false,afterRowClick:function(){},buttons:[{text:"ȷ��",handler:function(){getCmp("dialogWindow_xudahu111").destroy();}}],map:{food_id:"scope_value"},tableURL:"/rule/value/all1.do",getData:function(){return {scope_value:Ext.getCmp("condtype2").getValue()};}},
    
   	//  {label:"��������",name:"is_full",xtype:"combo",code:"IS_FULL"},
   	 // {label:"���",name:"cond_value"},
     // {label:"����(��)",name:"send_num"}
   ];
   function checkname(){
   var a=Ext.getCmp("cpnum");
   			doGet("/fav/coupon_info.check.do?cpnum="+a.getValue(),"",function(dt){
       				alert(dt["flag"]);
       					if(dt["flag"]=="YES"){
       						return true;
       					}else{	
       					return false;
       					}
       				});
   }
  
 var singlelistField1=[
 	  {label:"�Ż�ȯ����",name:"cp_name",allowBlank:false},
      {label:"��������",name:"pb_time",allowBlank:false,value:new Date().dateFormat("Y-m-d H:i:s")},
      {label:"��ʼʱ��",name:"start_time",allowBlank:false,xtype:"datetime"},
      {label:"��ֹʱ��",name:"end_time",allowBlank:false,xtype:"datetime"},
       {label:"�Ż�ȯ���",name:"cp_num",id:"cpnum",
       listeners:{
       			"blur":function(){
       				var a=Ext.getCmp("cpnum");
       				doGet("/fav/coupon_info.check.do?cpnum="+a.getValue(),"",function(dt){
       					if(dt["flag"]=="YES"){
       						return true;
       					}else{	
       					$alt("�Ż�ȯ����Ѵ��ڣ�");
       					}
       				});
       			}
       		},
       	invalidText:'�Ż�ȯ����Ѿ���ע�ᣡ' 
       		
       },
      {label:"״̬",name:"cp_status",xtype:"combo",allowBlank:false,code:"COUPON_STATUS"},
      {label:"�ۿ۱���",name:"cp_disct",maxLength:2,maxLengthText:"���볬����������",emptyText:"����85��-����85",allowBlank:false,id:"cpdisct",
      	listeners:{
      		"blur":function(){
      		var a=Ext.getCmp("cpdisct");
      		var b=Ext.getCmp("cpcash");
      			if(a.getValue()!=0){
      				b.setValue(0);
      				b.disable(true);
      			}else{
      				b.setValue();
      				b.enable(false);
      			}
      		}
      	}
      },
      {label:"�Żݽ��",name:"cp_cash",allowBlank:false,id:"cpcash",
      			listeners:{
      		"blur":function(){
      		var a=Ext.getCmp("cpdisct");
      		var b=Ext.getCmp("cpcash");
      			if(b.getValue()!=0){
      				a.setValue(0);
      				a.disable(true);
      			}else{
      				a.setValue();
      				a.enable(false);
      			}
      		}
      	}
      },
      {label:"�Ƿ�����",name:"cp_oper",id:"cp_op",allowBlank:false,xtype:"combo",code:"COUPON_GIVE",
      listeners:{
      		"select":function(){
	      		var a=Ext.getCmp("cp_op");
	      		var b=Ext.getCmp("price");
	      		if(a.getValue()==0){
	      			b.setValue("0.00");
	      			b.disable();
	      		}else{
	      			b.setValue();
	      			b.enable();
	      		}
      		}
      	}},
      {label:"���ۼ۸�",name:"cp_money",id:"price",allowBlank:false}
   	//  {label:"��Ʒ����",name:"cond_type",id:"condtype",xtype:"combo",code:"FOOD_TYPE"},
   	 //  {label:"��Ʒ����",name:"food_name",readOnly:true,xtype:"trigger",columns:foodFields,checkbox:true,singleSelect:false,afterRowClick:function(){},buttons:[{text:"ȷ��",handler:function(){getCmp("dialogWindow_xudahu111").destroy();}}],map:{food_id:"scope_value"},tableURL:"/rule/value/all1.do",getData:function(){return {scope_value:Ext.getCmp("condtype").getValue()};}},
      //  {label:"��������",name:"is_full",xtype:"combo",code:"IS_FULL"},
   	  //{label:"���",name:"cond_value"},
     // {label:"����(��)",name:"send_num"}
   ];  
 var addFunc=function(){
     createFormWindow({
        id        : "app_fav_coupon",
        label     : "�����Ż�ȯ",
        items     : singlelistField1,
        height	  :380,
        cols      : 1,
        action    : "/fav/coupon_info.insert.do",
        close     : cLoadEvent("app_fav_coupon")
     
     }).show();
 }
 
 var modFunc=function(){
      var d=getData("app_fav_coupon");
      createFormWindow({
        id        : "app_fav_coupon",
        label     : "�޸��Ż�ȯ",
        height	  :380,
        items     : listField,
        cols      : 1,
        action    : "coupon_info.modify.go",
        data      : d,
        close     : cLoadEvent("app_fav_coupon")
     
     }).show();
 }
 var multiadd=function(){
     createFormWindow({
        id        : "app_fav_coupon",
        label     : "���������Ż�ȯ",
        items     : listField1,
        height	  : 440,
        cols      : 1,
        action    : "/fav/coupon_info.insert1.do",
        close     : cLoadEvent("app_fav_coupon")
     
     }).show();
 }
 var delFunc=function(){
    var d=getData("app_fav_coupon",["cp_id"]);
     doPost("coupon_info.delete.go",d,cLoadEvent("app_fav_coupon"));
 }
   var toolBars=[ {text:"��������",iconCls:"gridmultiadd",handler:multiadd},"-",
   "��ѯ����","&nbsp;","-",
       	                  createField({name:"cp_num",width:70,emptyText:"��ʼ���"}),
       	                  "&nbsp;",
       	                  createField({name:"cp_num1",width:70,emptyText:"��ֹ���"}),
       	                   "-",
       	                  createField({name:"cp_name",width:70,emptyText:"�Ż�ȯ����"}),
      	                  "-",
       	                  createField({name:"cp_oper",width:70,xtype:"combo",code:"COUPON_GIVE",emptyText:"�Ƿ�����"}),
       	                  "-",
       	                  createField({name:"pb_time",xtype:"datetime",format:"Y-m-d",code:"ORDER_TYPE",width:70,emptyText:"��������"}),
       	                  "-",
       	                  createField({name:"start_time",xtype:"datetime",format:"Y-m-d",width:70,emptyText:"��ʼʱ��"}),
       	                  "-",
       	                  createField({name:"end_time",xtype:"datetime",format:"Y-m-d",width:70,emptyText:"��ֹʱ��"}),
       	                  "-",
       	                  createField({name:"cp_status",code:"COUPON_STATUS",xtype:"combo",width:70,emptyText:"״̬"}),
       	                  "&nbsp;",
       	                  createField({name:"orderQuery",xtype:"button",pressed:true,iconCls:"gridBarItemQuery",label:"GO",width:60,handler:goClick})
       	                  
       	                  ];
 	             
 var grid=createPageGrid({
     id            : "app_fav_coupon",
     label         : "�Ż�ȯ�б�",
     region        : "center",
     items         : listField,
     filter        : false,
     page          : true,
     urls          : "/fav/coupon_info.pages.do",
     createFunction: addFunc,
     modifyFunction: modFunc,
     deleteFunction: delFunc,
     toolBarFields :toolBars
 
 });
 function goClick(){
   var dt={};

   for(var i=0;i< toolBars.length;i++){
   	   var o=toolBars[i];
  
   	   if(typeof o == "object"){
   	       if(o.getName && o.getValue){
   	       
   	          dt[o.getName()]=o.getValue();
   	          
   	       }
   	   }
   	}
    
   load("app_fav_coupon",dt);

}
 return [grid];
   