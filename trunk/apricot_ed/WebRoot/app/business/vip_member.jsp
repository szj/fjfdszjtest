var vipCardFields=[
      {label:"VIP��ʶ",name:"vip_id",allowBlank:false,hide:"all"},
      {label:"VIP����",name:"vip_card_no",allowBlank:false},
      {label:"VIP����",name:"vip_level",allowBlank:false,xtype:"combo",code:"VIP_LEVEL"},
      {label:"VIP����ۿ���",name:"vip_discount",allowBlank:false}
];

var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}
];

var listField=[
      {label:"��Ա���",name:"cust_id",allowBlank:false},
      {label:"��Ա����",name:"cust_name",allowBlank:false},
      {label:"�Ա�",name:"cust_sex",allowBlank:false,xtype:"combo",code:"SEX",width:50},
      {label:"���֤",name:"cust_id_card"},
      {label:"��ϵ�绰",name:"cust_phone",allowBlank:false},
      {label:"����",name:"cust_birthday",xtype:"date"},
      {label:"��Ա����",name:"vip_no",allowBlank:false},
      {label:"VIP����",name:"vip_level",allowBlank:false,xtype:"combo",code:"vip_level2"},
      {label:"�ۿ���",name:"vip_discount",allowBlank:false},
      {label:"����",name:"cum_point",allowBlank:false},
      {label:"״̬",name:"cust_state",allowBlank:false,code:"CUST_STATUS"},
      {label:"��ע",name:"cust_memo",hide:"form"}
   ];
var orderFields=[
      {label:"������",name:"order_no",hide:"form",width:120},
      {label:"������",name:"order_id",hide:"all"},
      {label:"��λ���",name:"set_no",hide:"all"},
      {label:"��λ����",name:"balcony_name",width:80},
      {label:"��������",name:"order_type",hide:"form",xtype:"combo",code:"ORDER_TYPE",width:60},
      {label:"��������",name:"man_count",width:60},
      {label:"�µ�ʱ��",name:"order_time",xtype:"datetime",width:110},
      {label:"ȡ��ʱ��",name:"can_order_time",xtype:"datetime",width:110},
      {label:"����״̬",name:"order_status",hide:"form",xtype:"combo",code:"ORDER_STATUS",width:60},
      {label:"�Ż�ǰ���(��)",name:"total"},
      {label:"�Żݺ���(��)",name:"pay_total"},
      {label:"�Ż�ȯ���(��)",name:"youhui_total"},
      {label:"�ֽ��շ�(��)",name:"fact_pay_total"},
      {label:"ˢ���շ�(��)",name:"fact_pay_card"},
      {label:"��û���",name:"gain_point"},
      {label:"���ѻ���",name:"use_point"},
      {label:"�߲˴���",name:"hurry_times",value:"0",hide:"form",width:60}
   ];
   
var addField=[
      
      {label:"��Ա���",name:"cust_id",allowBlank:false,hide:"all"},
      {label:"��Ա����",name:"cust_name",allowBlank:false},
      {label:"�Ա�",name:"cust_sex",allowBlank:false,xtype:"combo",code:"SEX",value:"1"},
      {label:"���֤",name:"cust_id_card"},
      {label:"��ϵ�绰",name:"cust_phone",allowBlank:false},
      {label:"����",name:"cust_birthday",readOnly:true,xtype:"date"},
      {label:"��Ա����",name:"vip_no",readOnly:true,xtype:"trigger",table:"vip_card",getData:function() {return {vip_status:"0",cAndAndAnd:true};},columns:vipCardFields,map:{vip_card_no:"vip_no"}},
      {label:"VIP������",name:"vip_level",hide:"all"},
      {label:"VIP������",name:"vip_level_text",allowBlank:false,readOnly:true,
      listeners:{
      	"select":function(){
      		var d = getFormValues("app_busi_vipmember_win_form",["vip_level"]);
      		alert(d.vip_level);
      		doSyncRequest("/vip/vip_card_getdiscount.do",d,
      		function(dt){
      			
      			setFormValues("app_busi_vipmember_win_form",{"vip_discount":dt[0]})
      		}
      		);
      	}
      }
      },
      {label:"�ۿ���",name:"vip_discount",readOnly:true},
//      {label:"״̬",name:"cust_state",allowBlank:false,value:"0A",xtype:"combo",code:"MEMBER_STATUS",hide:"form"},
      {label:"��ע",name:"cust_memo"},
      {label:"����ʱ��",name:"create_date",allowBlank:false,xtype:"datetime",readOnly:true,value:new Date()},
      {label:"����Ա",name:"create_staee",hide:"form"},
     ��{label:"����Ա",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields,map:{staff_id:"create_staee"}}

   ];

var updateMemberField=[
      
      {label:"��Ա���",name:"cust_id",allowBlank:false,hide:"all"},
      {label:"��Ա����",name:"cust_name",allowBlank:false},
      {label:"�Ա�",name:"cust_sex",allowBlank:false,xtype:"combo",code:"SEX",value:"1"},
      {label:"���֤",name:"cust_id_card",allowBlank:false},
      {label:"��ϵ�绰",name:"cust_phone",allowBlank:false},
      {label:"����",name:"cust_birthday",allowBlank:false,readOnly:true,xtype:"datetime"},
//      {label:"��Ա����",name:"vip_no",readOnly:true},
//      {label:"������",name:"vip_level",readOnly:true,xtype:"combo",code:"VIP_LEVEL"},
//      {label:"�ۿ���",name:"vip_discount",readOnly:true},
      {label:"״̬",name:"cust_state",allowBlank:false,value:"1",xtype:"combo",code:"MEMBER_STATUS",hide:"all"},
      {label:"��ע",name:"cust_memo"},
      {label:"�޸�ʱ��",name:"MODIFY_TIME",allowBlank:false,xtype:"datetime",readOnly:true,value:new Date()},
      {label:"����Ա",name:"MODIFY_STAEE",hide:"form"},
     ��{label:"����Ա",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields,map:{staff_id:"MODIFY_STAEE"}}

   ];



var updateCardField=[
      
      {label:"��Ա���",name:"cust_id",readOnly:true,allowBlank:false,hide:"all"},
      {label:"��Ա����",name:"cust_name",readOnly:true,allowBlank:false,hide:"all"},
      {label:"�Ա�",name:"cust_sex",readOnly:true,hide:"all",allowBlank:false,xtype:"combo",code:"SEX",value:"1"},
      {label:"���֤",name:"cust_id_card",readOnly:true,allowBlank:false,hide:"all"},
      {label:"��ϵ�绰",name:"cust_phone",readOnly:true,allowBlank:false,hide:"all"},
      {label:"����",name:"cust_birthday",allowBlank:false,readOnly:true,xtype:"datetime",hide:"all"},
      {label:"��Ա����",name:"vip_no",readOnly:true},
        {label:"VIP����",name:"vip_level",allowBlank:false,xtype:"combo",code:"VIP_LEVEL",
      listeners:{
      	"select":function(){
      		var d = getFormValues("app_busi_vipmember_win_form",["vip_level"]);
      		doSyncRequest("/vip/vip_card_getdiscount.do",d,
      		function(dt){
      			setFormValues("app_busi_vipmember_win_form",{"vip_discount":dt[0]})
      		}
      		);
      	}
      }
      },
      {label:"�ۿ���",name:"vip_discount",readOnly:true},
      {label:"״̬",name:"cust_state",allowBlank:false,value:"1",xtype:"combo",code:"MEMBER_STATUS",hide:"all"},
      {label:"��ע",name:"cust_memo"},
      {label:"�޸�ʱ��",name:"MODIFY_TIME",allowBlank:false,xtype:"datetime",readOnly:true,value:new Date()},
      {label:"����Ա",name:"MODIFY_STAEE",hide:"form"},
     ��{label:"����Ա",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields,map:{staff_id:"MODIFY_STAEE"}}

   ];
   
var changeCardField=[
      
      {label:"��Ա���",name:"cust_id",readOnly:true,allowBlank:false,hide:"all"},
      {label:"��Ա����",name:"cust_name",readOnly:true,allowBlank:false,hide:"all"},
      {label:"�Ա�",name:"cust_sex",readOnly:true,hide:"all",allowBlank:false,xtype:"combo",code:"SEX",value:"1"},
      {label:"���֤",name:"cust_id_card",readOnly:true,allowBlank:false,hide:"all"},
      {label:"��ϵ�绰",name:"cust_phone",readOnly:true,allowBlank:false,hide:"all"},
      {label:"����",name:"cust_birthday",allowBlank:false,readOnly:true,xtype:"datetime",hide:"all"},
      {label:"��Ա����",name:"vip_no",readOnly:true,xtype:"trigger",table:"vip_card",getData:function() {return {vip_status:"0",cAndAndAnd:true};},columns:vipCardFields,map:{vip_card_no:"vip_no"}},
      {label:"VIP������",name:"vip_level_text",allowBlank:false,readOnly:true,
      listeners:{
      	"select":function(){
      		var d = getFormValues("app_busi_vipmember_win_form",["vip_level"]);
      		doSyncRequest("/vip/vip_card_getdiscount.do",d,
      		function(dt){
      			
      			setFormValues("app_busi_vipmember_win_form",{"vip_discount":dt[0]})
      		}
      		);
      	}
      }
      },
      {label:"�ۿ���",name:"vip_discount",readOnly:true},
      {label:"״̬",name:"cust_state",allowBlank:false,value:"1",xtype:"combo",code:"MEMBER_STATUS",hide:"all"},
      {label:"��ע",name:"cust_memo"},
      {label:"�޸�ʱ��",name:"MODIFY_TIME",allowBlank:false,xtype:"datetime",readOnly:true,value:new Date()},
      {label:"����Ա",name:"MODIFY_STAEE",hide:"form"},
     ��{label:"����Ա",name:"staff_name",readOnly:true,xtype:"trigger",table:"staff_info",columns:staffFields,map:{staff_id:"MODIFY_STAEE"}}

   ];


 var addFunc=function(){
     createFormWindow({
        id        : "app_busi_vipmember",
        label     : "�����µĻ�Ա",
        items     : addField,
        width	  : 350,
        height	  : 450,
        cols      : 1,
        action    : "/vip/vip_member_insert.do",
        close     : cLoadEvent("app_busi_vipmember")
     
     }).show();
 }
 
 var modFunc=function(){
      var d=getData("app_busi_vipmember");
      createFormWindow({
        id        : "app_busi_vipmember",
        label     : "�޸ĵĻ�Ա��Ϣ",
        items     : updateMemberField,
        cols      : 1,
        action    : "/vip/vip_member_modify.do",
        data      : d,
        close     : cLoadEvent("app_busi_vipmember")
     
     }).show();
 }
 
 var delFunc=function(){
     var d=getData("app_busi_vipmember");

     doPost("/vip/vip_member_delete.do",d,cLoadEvent("app_busi_vipmember"));
 }
 
  var cardaddFunc=function(){
  var d=getData("app_busi_vipmember");
  if(d.vip_no!=""){
  	$alt("���û�����VIP��");
  	return;
  }
  var d=getData("app_busi_vipmember");
      createFormWindow({
        id        : "app_busi_vipmember",
        label     : "��Ա������",
        items     : changeCardField,
        cols      : 1,
        action    : "customer_info.modify.go",
        data      : d,
        close     : cLoadEvent("app_busi_vipmember")
     
     }).show();
 }
 
var cardUpdateFunc=function(){
  var d=getData("app_busi_vipmember");
  if(d.vip_no==""){
  	$alt("���û���δ��VIP��,�����޸�");
  	return;
  }
      createFormWindow({
        id        : "app_busi_vipmember",
        label     : "��Ա�������޸�",
        items     : updateCardField,
        cols      : 1,
        action    : "/vip/vip_card_modify.do",
        data      : d,
        close     : cLoadEvent("app_busi_vipmember")
     
     }).show();
 }
 
  var cardLockFunc=function(){
  var d=getData("app_busi_vipmember");

     doPost("/vip/vip_card_lock.do",d,cLoadEvent("app_busi_vipmember"));
 }
  
   var cardUnLockFunc=function(){
 var d=getData("app_busi_vipmember");

     doPost("/vip/vip_card_unLock.do",d,cLoadEvent("app_busi_vipmember"));
 } 
  var cardChangeFunc=function(){
  var d=getData("app_busi_vipmember");
      createFormWindow({
        id        : "app_busi_vipmember",
        label     : "��Ա������",
        items     : changeCardField,
        cols      : 1,
        action    : "/vip/vip_card_change.do",
        data      : d,
        close     : cLoadEvent("app_busi_vipmember")
     
     }).show();
 } 
 
 var grid=createPageGrid({
     id            : "app_busi_vipmember",
     label         : "��Ա�б�",
     region        : "north",
     height        : 300,
     items         : listField,
     filter        : true,
     page          : true,
     urls          : "customer_info.pages.go",
     createFunction: addFunc,
     modifyFunction: modFunc,
     deleteFunction: delFunc,
     toolBarFields :[
      
      {text:"��Ա������",iconCls:"gridmultiadd",handler:cardaddFunc},
      "-",
//      {text:"�޸Ŀ�������Ϣ",iconCls:"gridmultiadd",handler:cardUpdateFunc},
//      "-",
      {text:"��Ա����ʧ",iconCls:"gridmultiadd",handler:cardLockFunc},
      "-",
      {text:"��Ա�����",iconCls:"gridmultiadd",handler:cardUnLockFunc},
      "-",
      {text:"��Ա������",iconCls:"gridmultiadd",handler:cardChangeFunc},
      "-",
      {text:"����Excel",handler:ExportExcel},
      "-"
    ],
    rowclick     : function(){
                       var d=getData("app_busi_vipmember",["vip_no"]);
                       load("app_busi_vipmember_order",d);
                    }
 
 });
 
function ExportExcel()
{
	doGet("/vip/vip_member_exportExcel.do",null,function(d){
	    alert(d["flag"]);
	})
}

 var orderGrid=createPageGrid({
     id            : "app_busi_vipmember_order",
     label         : "��Ա�����б�",
     region        : "center",
     items         : orderFields,
     filter        : false,
     page          : true,
     urls          : "/vip/vip_member_order.do"
 })

 return [grid,orderGrid];
   