var mFields=[
  {label:"��ƷID",name:"food_id",hidden:true,hide:true},
  {label:"����",name:"food_name"},
  {label:"��Ʒ����",  name:"food_type",xtype:"combo",code:"FOOD_TYPE"},
  {label:"�۸�",  name:"food_price"}
];

var mFieldsSelected=[
  {label:"��ƷID",name:"food_id",hidden:true,hide:true},
  {label:"����",name:"food_name"},
  {label:"��Ʒ����",  name:"food_type",xtype:"combo",code:"FOOD_TYPE"},
  {label:"�۸�",  name:"food_price"},
  {label:"����",  name:"food_count"}
];

var payList=cCalculatePanelFast(["1","2","3","4","5"],"");



var attrValueTableForm=createTableFormNoButton({
   id:"food_menu_grid",
   tableTitle:"�˵��б�",
   formTitle:"��ѡ�˵�",
   horizontal:true,
   tableURL:"/food_info.pages.go",
   table:"sys_attribute_value",
   firstLoad:false,
   formCols:1,
   items:mFields,
   horizontal:false
});
   
   

var rightPart=new Ext.Panel({
    bodyBorder:false,
    layout:"border",
    region:"center",
    items:attrValueTableForm
});

return [rightPart,payList];   


