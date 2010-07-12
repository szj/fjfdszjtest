var attrFields=[
  {label:"��̬����ID",name:"attr_id",hidden:true,hide:true},
  {label:"��̬��������",name:"attr_name"},
  {label:"��̬����",  name:"attr_code"},
  {label:"��Ӧ���",  name:"attr_table"},
  {label:"��Ӧ�ֶ�",  name:"attr_field"}

];

var attrValueFields=[
  {label:"��̬����ֵID",name:"attr_value_id",hidden:true,hide:true},
  {label:"��̬����ID",name:"attr_id",hidden:true,hide:true},
  {label:"��̬����ֵ",name:"attr_value"},
  {label:"��̬��������",  name:"attr_desc"},
  {label:"��̬��������",  name:"attr_sort"}

];

var attrList=createPageGrid({
       	   title: "��̬�����б�",
       	   id:"app_system_attriute_list",
       	   urls:"/sys_attribute.pages.go",
           split:true,
           page:true,
           height:400,
           width:600,
           region:"west", 
       	   items:attrFields,
       	   filter:true,
       	   createFunction:function(){
                var w=createFormWindow({cols:1,label:"��̬����",items:attrFields,id:"app_system_attriute_list",action:"sys_attribute.insert.go"});
                w.show(this);
                w.on("beforedestroy",function(){attrList.getStore().load();});
       	   	},
       	   modifyFunction:function(){
                var w=createFormWindow({cols:1,
                  label:"��̬����",items:attrFields,id:"app_system_attriute_list",
                  action:"sys_attribute.modify.go"});
                  
                w.show(this);
                getCmp("app_system_attriute_list_win_form").getForm().setValues(getSelectedData("app_system_attriute_list"));
                w.on("beforedestroy",function(){attrList.getStore().load();});
       	   	},
       	   deleteFunction:function(){
                Ext.Ajax.request(getAjaxRequest("/app/system/sys_attribute_delete.do",getSelectedData("app_system_attriute_list"),function(f,a){
                    attrList.getStore().load();
                }));
       	   },
       	   rowclick:function(){
       	       var pm={};
       	       pm=Ext.apply(pm,getSelectedData("app_system_attriute_list"));
       	       pm["start"]=20;
       	       pm["limit"]=1;
       	       load("app_system_attribute_value_table",pm);
       	   }
   });

var attrValueTableForm=createTableForm({
   id:"app_system_attribute_value",
   tableTitle:"��ֵ̬�б�",
   formTitle:"��ֵ̬��Ϣ",
   horizontal:true,
   tableURL:"app/system/sys_attribute_value_pages.do",
   table:"sys_attribute_value",
   firstLoad:false,
   formCols:1,
   items:attrValueFields,
   horizontal:false,
   rowclick:function(){
      var pm={};
      pm=Ext.apply(pm,getSelectedData("app_system_attriute_list"));
      
      pm=Ext.apply(pm,getSelectedData("app_system_attribute_value_table"));
      getCmp("app_system_attribute_value_form").getForm().setValues(pm);
   }
});
   
   

var attrValue=new Ext.Panel({
    bodyBorder:false,
    layout:"border",
    region:"center",
    items:attrValueTableForm
});


return [attrList,attrValue];