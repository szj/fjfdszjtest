var mFields=[
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code"},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE"},
  {label:"Ա������",  name:"staff_name"},
  {label:"��ϵ�绰",  name:"staff_phone"},
  {label:"��ͥסַ",  name:"staff_addr"},
  {label:"����",  name:"staff_birthday"}
];


var roleFields=[
      {label:"Ա��Ȩ��id",name:"staff_priv_id",allowBlank:false,hide:"all"},
      {label:"Ա��ID",name:"staff_id",allowBlank:false,hide:"all"},
      {label:"Ȩ��ID",name:"priv_id",allowBlank:false,hide:"all"},
      {label:"Ȩ������",name:"priv_name",allowBlank:false},
      {label:"Ȩ��״̬",name:"priv_status",allowBlank:false,code:"STATUS"},
      {label:"Ȩ������",name:"priv_type",allowBlank:false,code:"PRIV_TYPE"},
      {label:"Ȩ������",name:"priv_desc"}
   ];



var staffGrid=createPageGrid({
     id           : "system_staff_grid",
     title        : "Ա���б�",
     items        : mFields,
     urls         : "/staff_info.pages.go",
     region       : "west",
     split        : true,
     width       : 300,
     page         : true,
     rowclick     : function(){
                       var d=getData("system_staff_grid");
                       load("system_staffrole_grid",{staffid:d.staff_id});
                    }
});


var rolegrid=createPageGrid({
     id           : "system_staffrole_grid",
     title        : "��ɫ�б�",
     items        : roleFields,
     urls         : "/staff/role_all.do",
     firstLoad    : false,
     page         : true,
     filter       : false,
     split        : true,
     region       : "center",
     createFunction : editGrid({
                         data   : {staffid:"-1"},
                         title  : "��ӽ�ɫ",
                         action : function(o){
                            var d=getData("system_staff_grid",["staff_id"]);
                            d["priv_id"]=o.priv_id;
                            doPost("staff_role_map.insert.go",d,cLoadEvent("system_staffrole_grid"));
                         }
                      }),
                      
     deleteFunction : function(o){
                            var d=getData("system_staffrole_grid","staff_priv_id");
                            doPost("staff_role_map.delete.go",d,cLoadEvent("system_staffrole_grid"));
                       }             
});


function editGrid(o){

   return function(){
      var oo=Ext.apply({},o);
      var ab=getData("system_staff_grid",["staff_id"]);
      oo.data.staffid=ab["staff_id"];
      var d={};
      var w=createGridWindow({
       id        : "staffrow_edit",
       tableURL  : "staff/role_notin.do",
       columns   : roleFields,
       label     : oo.title,
       data      : oo.data,
       afterRowClick:function(a){Ext.apply(d,a);}
      });
      w.addButton({text:"����",handler:function(){oo.action(d);w.destroy();}});
      w.show();
   }
}



return [staffGrid,rolegrid];   


