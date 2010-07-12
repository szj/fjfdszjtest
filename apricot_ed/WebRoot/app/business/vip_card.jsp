var setRateField=[
      {label:"VIP����",name:"vip_level",xtype:"combo",code:"VIP_LEVEL"},
      {label:"VIP����ۿ���",name:"vip_discount"}
   ];
   

   
var listField=[
      {label:"VIP��ʶ",name:"vip_id",allowBlank:false,hide:"all"},
      {label:"VIP����",name:"vip_card_no",allowBlank:false},

        {label:"VIP����",name:"vip_level",allowBlank:false,xtype:"combo",code:"VIP_LEVEL",
      listeners:{
      	"select":function(){
      		var d = getFormValues("app_busi_vipcard_win_form",["vip_level"]);
      		doSyncRequest("/vip/vip_card_getdiscount.do",d,
      		function(dt){
      			
      			setFormValues("app_busi_vipcard_win_form",{"vip_discount":dt[0]})
      		}
      		);
      	}
      }
      },
      {label:"VIP����ۿ���",name:"vip_discount",allowBlank:false},

      {label:"VIP״̬",name:"vip_status",allowBlank:false,code:"VIP_STATUS"}
//      {label:"VIP����",name:"vip_point",hide:"form"}
   ];
   multiaddField=[
      {label:"VIP��ʶ",name:"vip_id",allowBlank:false,hide:"all"},
      {label:"VIP��ʼ���",name:"start_no",allowBlank:false},
      {label:"VIP�������",name:"end_no",allowBlank:false},

       {label:"VIP����",name:"vip_level",allowBlank:false,xtype:"combo",code:"VIP_LEVEL",
      listeners:{
      	"select":function(){
      		var d = getFormValues("app_busi_vipcard_win_form",["vip_level"]);
      		doSyncRequest("/vip/vip_card_getdiscount.do",d,
      		function(dt){
      			
      			setFormValues("app_busi_vipcard_win_form",{"vip_discount":dt[0]})
      		}
      		);
      	}
      }
      },
      {label:"VIP����ۿ���",readOnly:true,name:"vip_discount",allowBlank:false},

      {label:"VIP״̬",name:"vip_status",allowBlank:false,xtype:"combo",value:"0",code:"VIP_STATUS"}
//      {label:"VIP����",name:"vip_point",hide:"form"}
   ];
   var addField=[
      {label:"VIP��ʶ",name:"vip_id",allowBlank:false,hide:"all"},
      {label:"VIP����",name:"vip_card_no",allowBlank:false},

      {label:"VIP����",name:"vip_level",allowBlank:false,xtype:"combo",code:"VIP_LEVEL",
      listeners:{
      	"select":function(){
      		var d = getFormValues("app_busi_vipcard_win_form",["vip_level"]);
      		doSyncRequest("/vip/vip_card_getdiscount.do",d,
      		function(dt){
      			
      			setFormValues("app_busi_vipcard_win_form",{"vip_discount":dt[0]})
      		}
      		);
      	}
      }
      },
      {label:"VIP����ۿ���",readOnly:true,name:"vip_discount",allowBlank:false},
      {label:"VIP״̬",name:"vip_status",allowBlank:false,xtype:"combo",value:"0",code:"VIP_STATUS"}
//      {label:"VIP����",name:"vip_point",hide:"form"}
   ];
   var updateField=[
      {label:"VIP��ʶ",name:"vip_id",allowBlank:false,hide:"all"},
      {label:"VIP����",name:"vip_card_no",allowBlank:false},

        {label:"VIP����",name:"vip_level",allowBlank:false,xtype:"combo",code:"VIP_LEVEL",
      listeners:{
      	"select":function(){
      		var d = getFormValues("app_busi_vipcard_win_form",["vip_level"]);
      		doSyncRequest("/vip/vip_card_getdiscount.do",d,
      		function(dt){
      			
      			setFormValues("app_busi_vipcard_win_form",{"vip_discount":dt[0]})
      		}
      		);
      	}
      }
      },
      {label:"VIP����ۿ���",name:"vip_discount",readOnly:true,allowBlank:false},

      {label:"VIP״̬",name:"vip_status",allowBlank:false,xtype:"combo",code:"VIP_STATUS"}
//      {label:"VIP����",name:"vip_point",hide:"form"}
   ];

   
   
  	var setRate=function(){
     	createFormWindow({
        id        : "app_busi_vipcard",
        label     : "�����ۿ���",
        items     : setRateField,
        cols      : 1,
        action    : "/vip/vip_card_setRate.do",
        close     : cLoadEvent("app_busi_vipcard")
     
     }).show();
 }
 var multiaddFunc=function(){
     createFormWindow({
        id        : "app_busi_vipcard",
        label     : "��������VIP��",
        items     : multiaddField,
        cols      : 1,
        action    : "/vip/vip_card_insert_m.do",
        close     : cLoadEvent("app_busi_vipcard")
     
     }).show();
 }
   
 var addFunc=function(){
     createFormWindow({
        id        : "app_busi_vipcard",
        label     : "�����µ�VIP��",
        items     : addField,
        cols      : 1,
        action    : "/vip/vip_card_insert.do",
        close     : cLoadEvent("app_busi_vipcard")
     
     }).show();
 }
 
 var modFunc=function(){
      var d=getData("app_busi_vipcard");
      createFormWindow({
        id        : "app_busi_vipcard",
        label     : "�޸ĵ�VIP��",
        items     : updateField,
        cols      : 1,
        action    : "vip_card.modify.go",
        data      : d,
        close     : cLoadEvent("app_busi_vipcard")
     
     }).show();
 }
 
 var delFunc=function(){
     var d=getData("app_busi_vipcard",["vip_id","vip_status"]);
 //    d["vip_status"];
 //    alert(urlEncode(d));
//	alert(d["vip_status"]);
	if(d["vip_status"]=="0"||d["vip_status"]=="2"){
     	doPost("vip_card.delete.go",d,cLoadEvent("app_busi_vipcard"));
     }else{
     	$alt("ֻ��ɾ��δ���ź����𻵵�VIP��");
     }
 }
 

   
 var grid=createPageGrid({
     id            : "app_busi_vipcard",
     label         : "VIP���б�",
     region        : "center",
     items         : listField,
     filter        : false,
     page          : true,
     urls          : "vip_card.pages.go",
     createFunction: addFunc,
     modifyFunction: modFunc,
     deleteFunction: delFunc,
     toolBarFields :[
      {text:"��������",iconCls:"gridmultiadd",handler:multiaddFunc},
      {text:"���ÿ���",iconCls:"gridmultiadd",handler:setRate}
    ]
 
 });
 
 return [grid];
   