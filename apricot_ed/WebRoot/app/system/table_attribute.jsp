var wFields=[
  {label:"��̬����ID",name:"attr_id",hidden:true,hide:true},
  {label:"��̬��������",name:"attr_name",query:true},
  {label:"��̬����",  name:"attr_code"}
];
var mFields=[
  {label:"ӳ��ID",name:"tab_attr_id",hidden:true,hide:true},
  {label:"��̬����ID",name:"attr_id",hidden:true,hide:true},
  {label:"����",name:"table_name",allowBlank:false},
  {label:"�ֶ���",  name:"table_column",allowBlank:false},
  {label:"��̬��������",  name:"attr_name",allowBlank:false,readOnly:true,xtype:"trigger",table:"sys_attribute",columns:wFields},
  {label:"��̬���ݱ���",  name:"attr_code",allowBlank:false,readOnly:true}

];
return createTableForm({
   id:"app_system_table_attribute_value",
   tableTitle:"��ֵ̬�б�",
   formTitle:"��ֵ̬��Ϣ",
   horizontal:true,
   tableURL:"/app/system/sys_table_attribute_pages.do",
   table:"sys_table_attribute",
   formCols:1,
   items:mFields,
   horizontal:false,
   onRowClick:function(f){}
});
