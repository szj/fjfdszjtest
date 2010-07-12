var sFields=[
  {label:"��ԴID",name:"res_id",hidden:true,hide:true},
  {label:"��Դ״̬",name:"res_status",xtype:"combo",code:"STATUS"},
  {label:"��Դ����",name:"res_type",xtype:"combo",code:"RES_TYPE"},
  {label:"��Դ����",name:"res_lable"}
  ];

var mFields=[
  {label:"��ԴID",name:"res_id",hidden:true,hide:true},
  {label:"��Դ����",name:"res_name"},
  {label:"��Դ״̬",name:"res_status",xtype:"combo",code:"STATUS"},
  {label:"��Դ����",name:"res_type",xtype:"combo",code:"RES_TYPE"},
  {label:"��Դ��������",name:"res_lable"},
  {label:"��Դ·��",  name:"res_path"},
  {label:"�ϼ���Դ",  name:"parent_res_id",hide:"all"},
  {label:"�ϼ���Դ",  name:"parent_res_name",readOnly:true,
                     data:{res_type:"02"},xtype:"trigger",
                     table:"resource_info",
                     keyName : "res_lable",
                     columns:sFields,
                     map:{res_id:"parent_res_id",res_lable:"parent_res_name"},
                     checkValid:function(o){
                         var d=getFormValues("app_system_staff_form");
                         if(d.res_id==o.res_id){
                           $alt("��ǰ��Դ����ѡ��������Ϊ�ϼ���Դ!");
                           return false;
                         }
                         return true;
                     }
  }
];







return createTableForm({
   id:"app_system_resource",
   tableTitle:"Ȩ����Դ�б�",
   formTitle:"Ȩ����Դ��Ϣ",
   horizontal:false,
   table:"resource_info",
   tableURL: "/resource/all.do",
   formCols:2,
   items:mFields,
   data : {res_status:"1",res_type:"02"}
});
