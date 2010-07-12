var roleFields=[
  {label:"��ɫID",name:"priv_id",hidden:true,hide:true},
  {label:"��ɫ����",name:"priv_name"},
  {label:"��ɫ״̬",name:"priv_status",xtype:"combo",code:"STATUS"},
  {label:"��ɫ����",name:"priv_type",xtype:"combo",hide:"all",code:"PRIVILEGE_TYPE"},
  {label:"��ɫ����",  name:"priv_desc"}
];

var privFields=[
  {label:"��ɫID",name:"priv_id",hidden:true,hide:true},
  {label:"Ȩ��ID",name:"child_priv_id",hidden:true,hide:true},
  {label:"Ȩ������",name:"priv_name"},
  {label:"Ȩ��״̬",name:"priv_status",xtype:"combo",code:"STATUS"},
  {label:"Ȩ������",name:"priv_type",xtype:"combo",code:"PRIVILEGE_TYPE"},
  {label:"Ȩ������",name:"priv_desc"}
];

var gggFields=[
  {label:"Ȩ��ID",name:"priv_id",hidden:true,hide:true},
  {label:"Ȩ������",name:"priv_name"},
  {label:"Ȩ��״̬",name:"priv_status",xtype:"combo",code:"STATUS"},
  {label:"Ȩ������",name:"priv_type",xtype:"combo",code:"PRIVILEGE_TYPE"},
  {label:"Ȩ������",name:"priv_desc"}
];

	function getFormAction(fm, lb, urls, params) {
		var pms = fm.getValues();
		if (params)
			pms = Ext.apply(pms, params);
		return {
			url : toURL(nvl(urls, fm.url)),
			params : pms,
			success : function(form, action) {
				var rt = action.result.data;
				if (rt.errorCode == "00") {
					Ext.Msg
							.alert(lb + "�ɹ�",
									"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ݱ���ɹ�!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
					saveButton.disable();
					resetButton.disable();
					cancelButton.disable();
					load("app_system_role_list");

				} else {
					Ext.Msg.alert(lb + "ʧ��",
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ԭ��"
									+ rt.errorMessage);
				}
			},
			failure : function(form, action) {
				if (action.failureType == "client") {
					Ext.Msg
							.alert("����У��ʧ��",
									"����û�а���Ҫ���������룬������ƶ�����ɫ�ı�������鿴У����Ϣ��");
					return;
				}
				Ext.Msg.alert("����ʧ��", "ϵͳ����ʧ�ܣ�����ϵ����Ա!");
			}
		};
	}
	var saveButton = new Ext.Button( {
		disabled : true,
		text : "&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;",
		handler : function() {
			simpleForm.getForm().doAction("submit",
					getFormAction(simpleForm.getForm(), "��������"));

		}
	});

	var resetButton = new Ext.Button( {
		disabled : true,
		text : "&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;",
		handler : function() {
			simpleForm.getForm().getEl().dom.reset();
		}
	});

	var cancelButton = new Ext.Button( {
		disabled : true,
		text : "&nbsp;&nbsp;&nbsp;ȡ��&nbsp;&nbsp;&nbsp;",
		handler : function() {
			simpleForm.getForm().getEl().dom.reset();
			saveButton.disable();
			resetButton.disable();
			this.disable();
		}
	});
	var simpleForm = createFormPanel( {
		title : "������Ϣ",
		id : "app_system_role_form",
		cols : 2,
	
		region : "center",

		split : true,
		items : roleFields,
		buttons : [ saveButton, resetButton, cancelButton ]
	});

var roleList=createPageGrid({
       	   title: "��ɫ�б�",
       	   id:"app_system_role_list",
       	   urls:"/privilege_info.pages.go?priv_type=01",
           split:true,
           page:true,
           region:"center", 
       	   items:roleFields,
       	   filter:true,
       	   rowclick:function(){
       	       var pm={};
       	       pm={role_id:getSelectedData("app_system_role_list").priv_id};
       	       pm["start"]=0;
       	       pm["limit"]=10;
       	       getCmp("app_system_role_map").getStore().baseParams=pm;
       	       getCmp("app_system_role_map").getStore().load();
			simpleForm.getForm().setValues(getData("app_system_role_list"));
       	   },		createFunction : function() {
			//simpleForm.getForm().getEl().dom.reset();
			simpleForm.getForm().setValues({priv_type:"01",priv_id:"",priv_name:"",priv_desc:""});
			simpleForm.getForm().url = "privilege_info.insert.go";

			saveButton.enable();
			resetButton.enable();
			cancelButton.enable();
		},
		modifyFunction : function() {
			if (!list.getSelectionModel().getSelected()) {
				Ext.Msg.alert("ϵͳ��ʾ", "��ѡ��һ����¼�޸�!");
				return;
			}
			simpleForm.getForm().url =  "privilege_info.modify.go";
			saveButton.enable();
			resetButton.enable();
			cancelButton.enable();
		},
		deleteFunction : function() {
			if (!list.getSelectionModel().getSelected()) {
				Ext.Msg.alert("ϵͳ��ʾ", "������ѡ��һ����¼ɾ��!");
				return;
			}
			simpleForm.getForm().url ="privilege_info.delete.go";
			simpleForm.getForm().doAction("submit",
					getFormAction(simpleForm.getForm(), "ɾ������"));
			// list.getStore().load();
		}
   });
   
var privList=createPageGrid({
       	   title: "Ȩ���б�",
       	   id:"app_system_role_map",
       	   urls:"/app/system/system_role_priv_map_pages.do",
       	   firstLoad:false,
           split:true,
           page:true,
 
           region:"center", 
       	   items:privFields,
       	   filter:false,
           createFunction:function(){
              var a=getSelectedData("app_system_role_list");
              var b={};
              if(!a.priv_id){ $alt("��ѡ��һ����ɫ����");return;}
              b["priv_type"]="00";
              b["role_id"]=a.priv_id;
              var w=createFormWindow({
                  id:"app_system_role_map_f",
                  action:"privilege_rela.insert.go?priv_type=00",
                  label:"���Ȩ��",
                  cols:1,
                  items:[
                    {label:"Ȩ������",name:"priv_name",xtype:"trigger",
                     columns:gggFields,tableURL:"/app/system/system_role_priv_select.do",
                     getData : function(){return b;},
                     map:{priv_id:"child_priv_id"},
                     readOnly:true
                    },
                    {label:"Ȩ��ID",name:"child_priv_id",hidden:true,hide:true},
                    {label:"��ɫ",name:"priv_id",hidden:true,hide:true},
                    {label:"Ȩ������",name:"priv_desc",hidden:true,xtype:"textarea",readOnly:true}
                  ]
                  
                });
              w.show(this);
              getCmp("app_system_role_map_f_win_form").getForm().setValues({priv_id:a.priv_id});  
              
              w.on("beforedestroy",function(){load("app_system_role_map");});
           },
           deleteFunction:function(){
              var gd=getCmp("app_system_role_map");
              if(!gd.getSelectionModel().getSelected()){
                 $alt("��ѡ��һ������ɾ��");
                 return;
              }
              var b=getSelectedData("app_system_role_map");
              Ext.Ajax.request(getAjaxRequest(
                                              "/app/system/system_role_priv_map_del.do",
                                              b,
                                              function(rt){
                                                gd.getStore().load();
                                              }
                                              ));
           }
   });
   
return [roleList,{xtype:"tabpanel", split        : true,height:200,bodyStyle:"padding:2px",region:"south",activeTab:0,items:[simpleForm,privList]}];