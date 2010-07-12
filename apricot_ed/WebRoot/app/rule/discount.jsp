var priceListField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"�ۿ�����",name:"price_name",width:200},
      {label:"����ID",name:"sf_id",hide:"all"},
      {label:"��������",name:"price_type",code:"PRICE_TYPE"},
      {label:"��Ч��ʼ����",name:"eff_date"},
      {label:"��Ч��������",name:"exp_date"},
      {label:"����״̬",name:"price_state" ,code:"PRICE_STATE"}
   ];
 
 var priceFormField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"�ۿ�����",name:"price_name"},
      {label:"��������",name:"price_type",xtype:"combo",code:"PRICE_TYPE"},
      {label:"��Ч��ʼ����",name:"eff_date",xtype:"date"},
      {label:"��Ч��������",name:"exp_date",xtype:"date"},
      {label:"����״̬",name:"price_state",xtype:"combo",code:"PRICE_STATE"}
   ];
 
 
 var priceValueListField=[
      {label:"ֵID",name:"value_id",hide:"all"},
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"�ۿ�ֵ��λ",name:"price_unit",width:200,xtype:"combo",code:"PRICE_UNIT"},
      {label:"�ۿ�ֵ",name:"price_value"},
      {label:"�ۿ�ֵ����",name:"price_value_desc",width:200}
   ];
   
 var priceCondListField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"����ID",name:"cond_id",hide:"all"},
      {label:"������",name:"cond_type",code:"COND_TYPE",xtype:"combo"},
      {label:"����������",name:"cond_op",code:"COND_OP",xtype:"combo"},
      {label:"����ֵ",name:"cond_value"},
      {label:"����ֵ����",name:"cond_value_text"},
      {label:"�����Ƿ�ر�",name:"cond_must",code:"COND_MUST",xtype:"combo"}
   ];
 
 var priceScopeListField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"��Χ����",name:"scope_type",code:"SCOPE_TYPE",xtype:"combo"},
      {label:"��Χֵ",name:"scope_value",allowBlank:false,code:"SCOPE_VALUE"},
      {label:"��ʼʱ��",name:"start_time",xtype:"time",value:"00:00"},
      {label:"����ʱ��",name:"end_time",xtype:"time",value:"23:59"},
      {label:"��ΧID",name:"scope_id",hide:"all"}
      
   ];

 var priceFoodTypeField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"��Χ����",name:"scope_type",hide:"all"},
      {label:"��Ʒ����",name:"scope_value",code:"FOOD_TYPE",xtype:"combo"},
      {label:"��ʼʱ��",name:"start_time",xtype:"time",value:"00:00"},
      {label:"����ʱ��",name:"end_time",xtype:"time",value:"23:59"},
      {label:"��ΧID",name:"scope_id",hide:"all"}
   ];
 var foodFields=[
  {label:"��ƷID",name:"food_id",hide:"all"},
  {label:"��Ʒ����",name:"food_name"},
  {label:"��Ʒ����",name:"food_price"},
  {label:"��Ʒ����",  name:"food_type",xtype:"combo",code:"FOOD_TYPE"}

];
 var priceFoodIdField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"��Χ����",name:"scope_type",hide:"all"},
      {label:"��Χ����",name:"scope_value",hide:"all"},
      {label:"��Ʒ����",name:"food_name",readOnly:true,xtype:"trigger",columns:foodFields,checkbox:true,singleSelect:false,afterRowClick:function(){},buttons:[{text:"ȷ��",handler:function(){getCmp("dialogWindow_xudahu111").destroy();}}],map:{food_id:"scope_value"},tableURL:"/rule/value/all1.do",getData:function(){return {scope_value:getData("app_business_rule_discount_3",["scope_value"]).scope_value};}},
      {label:"��ʼʱ��",name:"start_time",xtype:"time",value:"00:00"},
      {label:"����ʱ��",name:"end_time",xtype:"time",value:"23:59"},
      {label:"��ΧID",name:"scope_id",hide:"all"}
   ];
 var setFields=[
  {label:"��λ��",name:"set_no",hide:"all",readOnly:true},
  {label:"��λ��",name:"balcony_code",hide:"all",readOnly:true},
  {label:"¥��",name:"dining_floor",readOnly:true},
  {label:"����λ��",name:"belong_to_text",readOnly:true},
   {label:"����λ��",name:"belong_to",readOnly:true,hide:"all"},
  {label:"��λ����",name:"balcony_name",readOnly:true},
  {label:"��λ״̬",name:"man_num",readOnly:true},
  {label:"�����������",name:"mincost_type",readOnly:true,code:"MINCOST_TYPE"},
  {label:"������ѽ��",name:"mincost_money",readOnly:true}
];  
 var BelongToField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"����ID",name:"cond_id",hide:"all"},
      {label:"������",name:"cond_type",value:"setbelong",hide:"form"},
      {label:"����������",name:"cond_op",value:"=",hide:"form"},
      {label:"����ֵ",name:"cond_value",xtype:"combo",code:"BELONG_TO" ,znName:"cond_value_text"},
      {label:"λ������",name:"cond_value_text",hide:"all"},
      {label:"�����Ƿ�ر�",name:"cond_must",code:"COND_MUST",xtype:"combo"}
   ];
   
   
    var FoodTypeField=[
      {label:"�ۿ�ID",name:"price_id",hide:"all"},
      {label:"����ID",name:"cond_id",hide:"all"},
      {label:"������",name:"cond_type",hide:"form"},
      {label:"����������",name:"cond_op",value:"=",code:"COND_OP",xtype:"combo"},
      {label:"�˽�",name:"cond_value"},
      {label:"�˽�",name:"cond_value_text",hide:"form"},
      {label:"�����Ƿ�ر�",name:"cond_must",code:"COND_MUST",xtype:"combo"}
   ];
   

   
var CDRField=[
	{label:"�ۿ�ID",name:"price_id",hide:"all"},
	{label:"�ۿ�����",name:"price_name"},
	{label:"������",name:"vip_level",xtype:"combo",code:"VIP_LEVEL"},
	{label:"��ϵ����",name:"relat_type",xtype:"combo",code:"relat_type",value:"0"}
]

var CDRField1=[
	{label:"�ۿ�ID",name:"price_id",hide:"all"},
//	{label:"�ۿ�����",name:"price_name"},
	{label:"������",name:"vip_level",xtype:"combo",code:"VIP_LEVEL"},
	{label:"��ϵ����",name:"relat_type",xtype:"combo",code:"relat_type"}
]
 
 var priceList=createPageGrid({
     id         : "app_business_rule_discount_1",
     title      : "�ۿ۹����б�",
     region     : "north",
     items      : priceListField,
     urls       : "/rule/price_plan_define.pages.go",
     page       : true,
     collapsible: true,
     filter     : false,
     split      : true,
     height     : 400,
     width      : 400,
     createFunction : function(e){
                          var v=createFormWindow({
                                   items    : priceFormField,
                                   width    : 400,
                                   height   : 300,
                                   cols     : 1,
                                   id       : "app_business_rule_discount_1",
                                   label    : "��ӹ���",
                                   action   : "/rule/create.do"
                                });
                           
                           v.show(this);     
                           v.on("beforedestroy",function(){reload("app_business_rule_discount_1");});
                      },
     modifyFunction : function(e){
                          var d=getData("app_business_rule_discount_1");
                          
                          if(d.price_state!="1"){
                             $alt("��û��ѡ��һ������������û��ѡ����Ч״̬�Ĺ������޸ģ���ȷ������ѡ��");
                             return;
                          } 
 
                          var v=createFormWindow({
                                   items    : priceFormField,
                                   width    : 400,
                                   height   : 300,
                                   cols     : 1,
                                   id       : "app_business_rule_discount_1",
                                   label    : "�޸Ĺ���",
                                   action   : "/rule/modify.do",
                                   close    : function(){reload("app_business_rule_discount_1");},
                                   data     : d
                                });
                           
                           v.show();   
                      },
      toolBarFields  : [
                  {text:"����",iconCls:"gridItemGo",handler:function(){setPriceState("2");}},
                  "-",
                  {text:"ͣ��",iconCls:"gridItemDel",handler:function(){setPriceState("1");}},
                  "-",
                  {text:"���û����ϵ",iconCls:"gridmultiadd",handler:function(){setCDR();}},
                  "-",
                  {text:"�鿴�����ϵ",iconCls:"gridmultiadd",handler:function(){showCDR();}}
                  
                  ],
      
      rowclick       : function(){
                           var d=getData("app_business_rule_discount_1",["price_id"]);
                           load("app_business_rule_discount_3",d);
                           load("app_business_rule_discount_4",d);
                           load("app_business_rule_discount_5",d);
                       }                                 
                      
  });
   
 function setPriceState(st){
    var d=getData("app_business_rule_discount_1",["price_id","price_state"]);
    d.price_state=st;
    doPost("/rule/modify.do",d,function(){reload("app_business_rule_discount_1");});
 }
 
 function setCDR(){
 	var d = getData("app_business_rule_discount_1");
 	var v=createFormWindow({
                                   items    : CDRField,
                                   width    : 400,
                                   height   : 200,
                                   cols     : 1,
                                   id       : "app_business_rule_discount_1",
                                   label    : "�޸Ĺ���",
                                   action   : "/rule/setRelet.do",
                                   close    : function(){reload("app_business_rule_discount_1");},
                                   data     : d,
                                   afterRowClick:function(){}
                                });
                           
                           v.show();  
 }
 
function showCDR(){
 	var d = getData("app_business_rule_discount_1",["price_id","vip_level"]);
 	var v=createGridWindow({
          columns  : CDRField1,
          width    : 400,
          height   : 300,
          cols     : 1,
          id       : "app_business_rule_discount_1",
          label    : "�鿴����",
          tableURL : "/rule/showRelet.do",
          data	   : d         
                                  
                                });
   v.show();  
 }
 //�ж��Ƿ���ԶԼ�¼���б༭
 function ruleEditCheck(){
    var d=getData("app_business_rule_discount_1",["price_state"]);
    if(d.price_state=="1") return true;
    $alt("ֻ��ѡ��һ����Ч�Ĺ�����ܽ������ã���Ч�������õĹ��������ã�");
    return false;
 } 
 
 //�������ڶ���
function cWin(o){
   return function(){
      if(!ruleEditCheck()) return;
      var d=getData("app_business_rule_discount_1",["price_id"]);
      if(o.data)Ext.apply(d,o.data);
      var v=createFormWindow({
          items   : o.items,
          width   : nvl(o.width,300),
          height  : nvl(o.height,200),
          cols    : 1,
          id      : o.self,
          label   : o.label,
          action  : o.action,
          close   : function(){reload(o.self);},
          data    : d
      });
      v.show();
   }   
 }

//����ToolBarItem
function cToolItem(o){
  return {
     text    : o.text,
     iconCls : o.iconCls,
     handler : cWin(o)
  };
} 
  
 var priceScopeList=createPageGrid({
     id         : "app_business_rule_discount_3",
     title      : "�ۿ۹�����Ӧ��Χ�б�",
     region     : "center",
     items      : priceScopeListField,
     filter     : false,
     urls       : "/rule/scope/all.do",
     firstLoad  : false,
     bodyBorder : true,
     split      : true,
     width      : 300,
     toolBarFields :[
    			
                      cToolItem({
                        text   : "��Ӳ�Ʒ����",
                        iconCls: "gridItemAdd",
                        self   : "app_business_rule_discount_3",
                        items  : priceFoodTypeField,
                        data   : {scope_type:"1"},
                        action : "/price_plan_scope.insert.go",
                        label  : "��ӹ�����Ӧ��Χ"
                      }),"-",
                      cToolItem({
                        text   : "���ָ����Ʒ",
                        iconCls: "gridItemAdd",
                        data   : {scope_type:"2"},
                        self   : "app_business_rule_discount_3",
                        items  : priceFoodIdField,
                       // action : "/price_plan_scope.insert.go",
                        action : "/rule/price_Insert.do",
                        label  : "��ӹ�����Ӧ��Χ"
                      }),"-",
                      
                      {
                        text   : "ɾ������Χ",
                        iconCls: "gridItemDel",
                        handler: function(){
                                              if(!ruleEditCheck()) return;
                                              if(!getData("app_business_rule_discount_3").scope_id){
                                                 $alt("��ѡ��һ����¼����ɾ��������");
                                                 return;
                                              }
                                              
                                              doPost("/price_plan_scope.delete.go",
                                                   getData("app_business_rule_discount_3"),
                                                   function(){reload("app_business_rule_discount_3");});
                                           }
                      }]             
  });
 
 var priceValueList=createPageGrid({
     id         : "app_business_rule_discount_4",
     title      : "�ۿ�ֵ�б�",
     region     : "center",
     items      : priceValueListField,
     firstLoad  : false,
     urls       : "/rule/value/all.do",
     filter     : false,
     bodyBorder : true,
     split      : true,
     width      : 300,
     toolBarFields :[
                      cToolItem({
                        text   : "����ۿ�ֵ",
                        iconCls: "gridItemAdd",
                        self   : "app_business_rule_discount_4",
                        items  : priceValueListField,
                        action : "/price_plan_value.insert.go",
                        label  : "����ۿ�ֵ"
                      }),"-",
                      {
                        text   : "ɾ���ۿ�ֵ",
                        iconCls: "gridItemDel",
                        handler: function(){
                                              if(!ruleEditCheck()) return;
                                              if(!getData("app_business_rule_discount_4").value_id){
                                                 $alt("��ѡ��һ����¼����ɾ��������");
                                                 return;
                                              }
                                              
                                              doPost("/price_plan_value.delete.go",
                                                   getData("app_business_rule_discount_4"),
                                                   function(){reload("app_business_rule_discount_4");});
                                           }
                      }]
  });
  
   
 var priceCondList=createPageGrid({
     id         : "app_business_rule_discount_5",
     title      : "�ۿ������б�",
     region     : "center",
     items      : priceCondListField,
     filter     : false,
     firstLoad  : false,
     urls       : "/rule/cond/all.do",
     bodyBorder : true,
     split      : true,
     width      : 300,
     toolBarFields :[
     	 cToolItem({
                        text   : "��Ӳ�λ����",
                        iconCls: "gridItemAdd",
                        data   : {cond_type:"setbelong",cond_op:"="},
                        self   : "app_business_rule_discount_5",
                        items  : BelongToField,
                       // action : "/price_plan_scope.insert.go",
                        action : "/price_plan_condition.insert.go",
                        label  : "��ӹ�����Ӧ��Χ"
                      }),"-",cToolItem({
                        text   : "��Ӳ˽�����",
                        iconCls: "gridItemAdd",
                        data   : {cond_type:"foodtype",cond_op:"="},
                        self   : "app_business_rule_discount_5",
                        items  : FoodTypeField,
                       // action : "/price_plan_scope.insert.go",
                        action : "/price_plan_condition.insert.go",
                        label  : "����ۿ�����"
                      }),"-",
                      cToolItem({
                        text   : "����ۿ�����",
                        iconCls: "gridItemAdd",
                        self   : "app_business_rule_discount_5",
                        items  : priceCondListField,
                        action : "/price_plan_condition.insert.go",
                        label  : "����ۿ�ֵ"
                      }),"-",
                      {
                        text   : "ɾ���ۿ�����",
                        iconCls: "gridItemDel",
                        handler: function(){
                                              if(!ruleEditCheck()) return;
                                              if(!getData("app_business_rule_discount_5").cond_id){
                                                 $alt("��ѡ��һ����¼����ɾ��������");
                                                 return;
                                              }
                                             
                                              doPost("/price_plan_condition.delete.go",
                                                   getData("app_business_rule_discount_5","cond_id"),
                                                   function(){reload("app_business_rule_discount_5");});
                                           }
                      }]
  });
  
  
 var priceEditPanel=new Ext.TabPanel({
  	 region           : "center",
  	 //bodyBorder     : false,
  	 //border         : false,
  	 hideBorders      : true,
  	 split            : true,
     defaults         : {autoScroll: true},
     resizeTabs       : true,
     activeTab        : 0,
     layoutOnTabChange: true,
     items      : [  
                    priceScopeList,
                    priceValueList,
                    priceCondList
                  ]
 })
 
 
 /** ��������޸İ�ť **/
 


 return [priceList,priceEditPanel];
