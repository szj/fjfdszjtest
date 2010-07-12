var wFields=[
  {label:"����ID",name:"sf_id",hidden:true,hide:true},
  {label:"��������",name:"sf_name",query:true},
  {label:"�����ַ",  name:"sf_addr"}
];
var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}

];
var mFields=[
  {label:"����ID",name:"sf_id",hidden:true,hide:true},
  {label:"��������",name:"sf_name",xtype:"trigger",table:"storefront_info",columns:wFields},
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"},
  {label:"��ϵ�绰",  name:"staff_phone"},
  {label:"��ͥסַ",  name:"staff_addr"},
  {label:"����",  name:"staff_birthday"},
  {label:"��ɫID",  name:"role_id",value:"0",hidden:true,hide:true},
  {label:"��½����",  name:"staff_password",hidden:true}

];


function passwordReset(){
   var fld=[
       {label:"������",width:60,name:"accounts_password",table:"staff_info",emptyText:"����������",inputType:"password"},
       {label:"Ա��ID",name:"staff_id",hide:"all"}
   ];
   var d=getData("app_system_staff1_table","staff_id");
   var w=createFormWindow({
       id        : "staff_password_reset",
       label     : "��������",
       items     : fld,
       data      : d,
       action    : "/staff/keepaccounts.do",
       height    : 125,
       cols      : 1,
       width     : 280
   });
   
   w.show();
}

function accountsadd(){
    	var buyOrderListFields=[
      {label:"����������",name:"staff_name",xtype:"trigger",table:"staff_info",columns:staffFields},
       {label:"Ա��ID",name:"staff_id",hide:"all"}
   ];
      var d=getData("app_system_staff1_table","staff_id");
   var w=createFormWindow({
       id        : "accounts_add",
       label     : "��Ǽ����û�",
       items     : buyOrderListFields,
       action    : "/staff/addkeepaccounts.do",
       data      : d,
       height    : 125,
       cols      : 1,
       width     : 280
   });
   
   w.show();
   w.on("beforedestroy",function(){reload("app_system_staff1_table");});
}
function kai_accounts(){
   doGet("/kai_account.do",null,function(dt){ $alt("�ɹ��������˹���.");});
}
function close_accounts(){
   doGet("/close_account.do",null,function(dt){ $alt("�ɹ��رռ��˹���.");});
}

return createTableForm1({
   id:"app_system_staff1",
   tableTitle:"����Ա���б�",
   horizontal:true,
   tableURL:"/app/system/staff_pages1.do",
   deleteURL:"/staff/staff_delete.do",
   table:"staff_info",
   formCols:2,
   items:mFields,
   horizontal:false,
   toolBar :[{text:"���",iconCls:"gridItemAdd",handler:accountsadd},"-",
   			 {text:"��������",iconCls:"password",handler:passwordReset},"-",
   			 {text:"�������˹���",iconCls:"gridItemAdd",handler:kai_accounts},"-",
   			 {text:"�رռ��˹���",iconCls:"gridItemAdd",handler:close_accounts}
   			]
});
