function createTableForm2(obj){
   function getFormAction(fm,lb,urls,params){
      var pms=fm.getValues();
      if(params) pms=Ext.apply(pms,params);
      return {
         url:toURL(nvl(urls,fm.url)),
         params:pms,
         success:function(form,action){
            var rt=action.result.data;
            if(rt.errorCode=="00"){
              Ext.Msg.alert(lb+"�ɹ�","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ݱ���ɹ�!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
              list.getStore().load();
            }else{
              Ext.Msg.alert(lb+"ʧ��","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ԭ��"+rt.errorMessage);
            }  
         },
         failure:function(form,action){
              if(action.failureType=="client"){
                 Ext.Msg.alert("����У��ʧ��","����û�а���Ҫ���������룬������ƶ�����ɫ�ı�������鿴У����Ϣ��"); 
                 return;
              }
              Ext.Msg.alert("����ʧ��","ϵͳ����ʧ�ܣ�����ϵ����Ա!"); 
         }
      };
   }
 
   var simpleForm = createFormPanel({
       title: obj.formTitle,
       id:obj.id+"_form",
       cols:nvl(obj.formCols,2),
       //region:(obj.horizontal==true)?"east":"south",
       region:"center",
       height:300,
       width:nvl(obj.width,300),
       split:true,
       editable:obj.editable,
       items: obj.items
   });

   var list=createPageGrid({
       	   title:obj.tableTitle,
       	   id:obj.id+"_table",
       	   urls:nvl(obj.tableURL,obj.table+".pages.go"),
           split:true,
           page:true,
           height:600,
           width:nvl(obj.width,600),
           firstLoad:nvl(obj.firstLoad,true),
           region:(obj.horizontal==true)?"west":"north", 
           toolBarFields : obj.toolBar, 
       	   items:obj.items,
       	  
       	   rowclick:(obj.rowclick)?obj.rowclick:function(){if(obj.onRowClick) obj.onRowClick(list);simpleForm.getForm().loadRecord(list.getSelectionModel().getSelected());}
   });
   
   return [list,simpleForm];
}


