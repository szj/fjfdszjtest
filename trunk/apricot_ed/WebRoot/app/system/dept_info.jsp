

var deptFields=[
 	{label:"����ID",name:"dept_id",hide:true,hidden:true},
	{label:"��������",name:"dept_name"},
	{label:"�ϼ�����",name:"parent_id",hide:true,hidden:true},
	{label:"�ϼ�����",name:"parent_name"}
];

var mFields=[

  {label:"����ID",name:"dept_id",hide:true,hidden:true},
  {label:"��������",name:"dept_name"},
  {label:"����״̬",name:"is_valid",xtype:"combo",code:"STATUS"},
  {label:"�ϼ�����",name:"parent_id",hide:"all"},
  {label:"�ϼ�����",name:"parent_name",xtype:"trigger",tableURL:"/app/system/getParent_id.do",table:"dept_info",getData:function() {return {dept_id:getFormValues("app_system_staff_form",["dept_id"]).dept_id};},columns:deptFields,map:{dept_name:"parent_name",dept_id:"parent_id",parent_id:"temp",parent_name:"temp"}},
  {label:"���Ų�������",name:"path_code",hide:"all"},
  {label:"���ϼ�����",name:"temp",hide:true,hidden:true}
  
];


return createTableForm({
   id:"app_system_staff",
   tableTitle:"�����б�",
   formTitle:"������Ϣ",
   horizontal:true,
   tableURL:"/app/system/dept_info_pages.do",
   addURL:"/app/system/dept_info/add.do",
   modifyURL:"/app/system/dept_info/modify.do",
   table:"dept_info",
   formCols:2,
   items:mFields,
   horizontal:false,
 
   OnRowClick:function(){}

});
