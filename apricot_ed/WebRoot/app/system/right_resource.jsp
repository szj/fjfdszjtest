var rightFields=[
      {label:"Ȩ��ID",name:"priv_id",allowBlank:false,hide:"all"},
      {label:"Ȩ������",name:"priv_name",allowBlank:false},
      {label:"Ȩ��״̬",name:"priv_status",width:40,allowBlank:false,code:"STATUS"},
      {label:"Ȩ������",name:"priv_type",width:40,allowBlank:false,code:"PRIV_TYPE"},
      {label:"Ȩ������",name:"priv_desc"}
   ];
   
var resourceField=[
      {label:"Ȩ����ԴID",name:"res_priv_id",hide:"all"},
      {label:"Ȩ��ID",name:"priv_id",allowBlank:false,hide:"all"},
      {label:"��ԴID",name:"res_id",allowBlank:false,hide:"all"},
      {label:"��Դ����",name:"res_name",allowBlank:false},
      {label:"��Դ״̬",name:"res_status",width:40,allowBlank:false,code:"RES_STATUS"},
      {label:"��Դ����",name:"res_type",width:40,code:"RES_TYPE"},
      {label:"��Դ��������",name:"res_lable"},
      {label:"��Դ·��",name:"res_path",width:200},
      {label:"������ԴID",name:"parent_res_id",hide:"all"}
   ]; 
var selectResourceField=[
      {label:"��ԴID",name:"res_id",allowBlank:false,hide:"all"},
      {label:"��Դ����",name:"res_name",allowBlank:false},
      {label:"��Դ״̬",name:"res_status",allowBlank:false},
      {label:"��Դ����",name:"res_type"},
      {label:"��Դ��������",name:"res_lable"},
      {label:"��Դ·��",name:"res_path"}
   ]; 

var resourceEditField=[
      {label:"Ȩ��ID",name:"priv_id",hide:"all"},
      {label:"��ԴID",name:"res_id",hide:"all"},
      {label:"��Դ����",name:"res_lable",xtype:"trigger",tableURL:"/staff/res_notin.do",getData:gData,columns:selectResourceField},
      {label:"��������",name:"oper_type",value:"00",allowBlank:false,xtype:"combo",code:"OPER_TYPE"},
      {label:"��������",name:"is_promission",value:"1",allowBlank:false,xtype:"combo",code:"IS_PROMISSION"},
      {label:"��ԴȨ��ID",name:"res_priv_id",allowBlank:false,hide:"all"}
   ];     

function gData(){
   var d=getData("system_resource_grid",["priv_id"]);
   return d;
}

var staffGrid=createPageGrid({
     id           : "system_resource_grid",
     title        : "Ȩ���б�",
     items        : rightFields,
     urls         : "/privilege_info.pages.go?priv_type=00",
     region       : "west",
     split        : true,
     width        : 300,
     page         : true,
     rowclick     : function(){
                       var d=getData("system_resource_grid",["priv_id"]);
                       load("system_staffrole_grid",d);
                    }
});


var rolegrid=createPageGrid({
     id           : "system_staffrole_grid",
     title        : "��Դ�б�",
     items        : resourceField,
     urls         : "/staff/res_all.do",
     firstLoad    : false,
     page         : true,
     filter       : false,
     split        : true,
     region       : "center",
     createFunction : function(){
                         var w=createFormWindow({
                            id       : "system_staffrole_grid_edit",
                            title    : "�����Դ",
                            items    : resourceEditField,
                            cols     : 1,
                            width    : 400,
                            height   : 300,
                            action   : "privilege_respirce_map.insert.go",
                            close    : cLoadEvent("system_staffrole_grid"),
                            data     : getData("system_resource_grid",["priv_id"])
                         });
                         w.show(this);
                      },
                      
     deleteFunction : function(o){
                            var d=getData("system_staffrole_grid","res_priv_id");
                            doPost("privilege_respirce_map.delete.go",d,cLoadEvent("system_staffrole_grid"));
                       }             
});

return [staffGrid,rolegrid];   


