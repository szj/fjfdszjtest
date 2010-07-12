var wofields=[
	{label:"������",name:"order_no",hide:"form",width:120,readOnly:true},
    {label:"������",name:"order_id",hide:"all"},
    {label:"���˺�",name:"pay_id",hide:"all"},
    {label:"��������",name:"order_type",hide:"form",xtype:"combo",code:"ORDER_TYPE",width:60},
    {label:"��������",name:"prearrange_name"},
    {label:"��ϵ�绰",name:"prearrange_phone"},
    {label:"VIP����",name:"vip_card_no"},
    {label:"���",name:"total"},
    {label:"����",name:"gain_point"},
    {label:"��ע",name:"order_reseon",xtype:"textarea"},
    {label:"��¼��",name:"staff_id",hide:"all"},
    {label:"��¼��",name:"staff_name"}
];

var staffFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"}
];

var writeOffsgrid=createPageGrid({
   id:"app_write_offs",
   title:"�����б�",
   urls:"/order/write_offs_order_pages.do",
   items:wofields,
   region: "center",
   createFunction : newAddWindow
   /**
   modifyFunction : newEditWindow,
   deleteFunction : function(){
	                    var d=getData("app_write_offs");
	                    doPost("/order/write_offs_order_delete.do",d,cLoadEvent("app_write_offs"));
	               }*/
});

function newAddWindow()
{
	var woAddFields=[
		{label:"��Ȩ���ʺ�",name:"loginname",allowBlank:false,blankText:'�ʻ�����Ϊ��'},
		{label:"����",name:"password",allowBlank:false,blankText:'���벻��Ϊ��',inputType:"password"},
	    {label:"��������",name:"prearrange_name",id:"prearrange_name_add"},
       	{label:"��ϵ�绰",name:"prearrange_phone",id:"prearrange_phone_add",listeners:{"blur":function(){
	      	doGet("/vip/vip_member_selectPhone.do?custPhone="+getValue("prearrange_phone_add"),null,function(date){
	      	var vipNO=Ext.getCmp("vip_card_no_add");
	      	var userName=Ext.getCmp("prearrange_name_add");
	      	if(date["vip_no"] == NaN)
	      	{
	      	}
	      	else
	      	{
	      		vipNO.setValue(date["vip_no"]);
	      		userName.setValue(date["cust_name"]);
	      	}
	      	})
	      }}},
	       {label:"VIP����",name:"vip_card_no",id:"vip_card_no_add",listeners:{"blur":function(){
	       	doGet("/vip/vip_member_selectVipCard.do?custVipNo="+getValue("vip_card_no_add"),null,function(date){
	       	var phone=Ext.getCmp("prearrange_phone_add");
	      	var userName=Ext.getCmp("prearrange_name_add");
	      	if(date["cust_phone"] == NaN)
	      	{
	      	}
	      	else
	      	{
	      		phone.setValue(date["cust_phone"]);
	      		userName.setValue(date["cust_name"]);
	      	}
	       	})
	       }}},
	    {label:"���",name:"total",allowBlank:false},
	    {label:"����",name:"gain_point",allowBlank:false},
	    {label:"��ע",name:"order_reseon",xtype:"textarea"}
	];
	var w=createFormWindow({
       id       : "write_offs_order_add",
       title    : "���",
       items    : woAddFields,
       cols     : 1,
       width    : 400,
       height   : 300,
       action   : "/order/write_offs_order_add.do",
       close    : cLoadEvent("app_write_offs")
    });
    w.show(this);
}
function newEditWindow()
{
	var woEditFields=[
		{label:"������",name:"order_no",hide:"all"},
    	{label:"������",name:"order_id",hide:"all"},
		{label:"���˺�",name:"pay_id",hide:"all"},
		{label:"��Ȩ���ʺ�",name:"loginname",allowBlank:false,blankText:'�ʻ�����Ϊ��'},
		{label:"����",name:"password",allowBlank:false,blankText:'���벻��Ϊ��',inputType:"password"},
	    {label:"��������",name:"prearrange_name",id:"prearrange_name_edit"},
       	{label:"��ϵ�绰",name:"prearrange_phone",id:"prearrange_phone_edit",listeners:{"blur":function(){
	      	doGet("/vip/vip_member_selectPhone.do?custPhone="+getValue("prearrange_phone_edit"),null,function(date){
	      	var vipNO=Ext.getCmp("vip_card_no_edit");
	      	var userName=Ext.getCmp("prearrange_name_edit");
	      	if(date["vip_no"] == NaN)
	      	{
	      	}
	      	else
	      	{
	      		vipNO.setValue(date["vip_no"]);
	      		userName.setValue(date["cust_name"]);
	      	}
	      	})
	      }}},
	       {label:"VIP����",name:"vip_card_no",id:"vip_card_no_edit",listeners:{"blur":function(){
	       	doGet("/vip/vip_member_selectVipCard.do?custVipNo="+getValue("vip_card_no_edit"),null,function(date){
	       	var phone=Ext.getCmp("prearrange_phone_edit");
	      	var userName=Ext.getCmp("prearrange_name_edit");
	      	if(date["cust_phone"] == NaN)
	      	{
	      	}
	      	else
	      	{
	      		phone.setValue(date["cust_phone"]);
	      		userName.setValue(date["cust_name"]);
	      	}
	       	})
	       }}},
	    {label:"���",name:"total",allowBlank:false},
	    {label:"����",name:"gain_point",allowBlank:false},
	    {label:"��ע",name:"order_reseon",xtype:"textarea"}
	];
	var w=createFormWindow({
       id       : "write_offs_order_modify",
       title    : "���",
       items    : woEditFields,
       cols     : 1,
       width    : 400,
       height   : 300,
       action   : "/order/write_offs_order_modify.do",
       data     : getData("app_write_offs"),
       close    : cLoadEvent("app_write_offs")
    });
    w.show(this);
}
return[writeOffsgrid];