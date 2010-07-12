var wFields=[
  {label:"����ID",name:"sf_id",hidden:true,hide:true},
  {label:"��������",name:"sf_name",query:true},
  {label:"�����ַ",  name:"sf_addr"}
];

var deptFields=[
 	{label:"����ID",name:"dept_id",hidden:true,hide:true},
	{label:"��������",name:"dept_name"},
	{label:"�ϼ�����",name:"parent_id"},
	{label:"����·������",name:"path_code"}
];

var mFields=[
  {label:"����ID",name:"sf_id",hidden:true,hide:true},
  {label:"��������",name:"sf_name",allowBlank:false,xtype:"trigger",table:"storefront_info",columns:wFields},
  {label:"Ա��ID",name:"staff_id",hidden:true,hide:true},
  {label:"Ա������",name:"staff_code",allowBlank:false},
  {label:"Ա������",  name:"staff_type",xtype:"combo",code:"STAFF_TYPE",allowBlank:false},
  {label:"Ա������",  name:"staff_name",allowBlank:false},
  {label:"��������",name:"dept_id",hide:true},
  {label:"��������",name:"dept_name",allowBlank:false,xtype:"trigger",table:"dept_info",columns:deptFields,getData:function(){return{is_valid:1,cAndAndAnd:true}}},
  {label:"��ϵ�绰",  name:"staff_phone",allowBlank:false},
  {label:"��ͥסַ",  name:"staff_addr"},
  {label:"����",  name:"staff_birthday"},
  {label:"��ɫID",  name:"role_id",value:"0",hidden:true,hide:true},
  {label:"��½����",  name:"staff_password",hidden:true}

];


function passwordReset(){
   var fld=[
   	  
       {label:"������",width:60,name:"staff_password",emptyText:"����������",inputType:"password"},
       {label:"Ա��ID",name:"staff_id",hide:"all"}
   ];
   var d=getData("app_system_staff_table","staff_id");
   var w=createFormWindow({
       id        : "staff_password_reset",
       label     : "��������",
       items     : fld,
       data      : d,
       action    : "/staff/password_reset.do",
       height    : 125,
       cols      : 1,
       width     : 280
   });
   
   w.show();
}




var obj= {
   id:"app_system_staff",
   tableTitle:"Ա���б�",
   formTitle:"Ա����Ϣ",
   horizontal:true,
   tableURL:"/app/system/staff_pages.do",
   table:"staff_info",
   addURL:"/staff/add.do",
   modifyURL:"/staff/modify.do",
   formCols:2,
   items:mFields,
   horizontal:false,
   rowclick:function(){
      var d=getData("app_system_staff_table");
      d["staff_password"]="Ա�����벻�������޸�";
      setFormValues("app_system_staff_form",d);
      load("system_staffrole_grid",getData("app_system_staff_table",["staff_id"]));
   },
   toolBar :[{text:"��������",iconCls:"password",handler:passwordReset}]
};


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
					list.getStore().load();

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
			if (obj.checkValid
					&& !obj.checkValid(getFormValues(obj.id + "_form"))) {
				return;
			}
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
		title : obj.formTitle,
		id : obj.id + "_form",
		cols : nvl(obj.formCols, 2),
		//region:(obj.horizontal==true)?"east":"south",
		region : "center",
		height : 300,
		width : nvl(obj.width, 300),
		split : true,
		editable : obj.editable,
		items : obj.items,
		buttons : [ saveButton, resetButton, cancelButton ]
	});

	var list = createPageGrid( {
		title : obj.tableTitle,
		id : obj.id + "_table",
		urls : nvl(obj.tableURL, obj.table + ".pages.go"),
		split : true,
		page : true,
		height : 300,
		width : nvl(obj.width, 600),
		firstLoad : nvl(obj.firstLoad, true),
		region : (obj.horizontal == true) ? "west" : "north",
		toolBarFields : obj.toolBar,
		items : obj.items,
		createFunction : function() {
			simpleForm.getForm().getEl().dom.reset();

			simpleForm.getForm().setValues(list.getStore().baseParams);
			simpleForm.getForm().url = nvl(obj.addURL, obj.table + ".insert.go");
			if (obj.data)
				simpleForm.getForm().setValues(obj.data);
			saveButton.enable();
			resetButton.enable();
			cancelButton.enable();
		},
		modifyFunction : function() {
			if (!list.getSelectionModel().getSelected()) {
				Ext.Msg.alert("ϵͳ��ʾ", "��ѡ��һ����¼�޸�!");
				return;
			}
			simpleForm.getForm().url = nvl(obj.modifyURL, obj.table
					+ ".modify.go");
			saveButton.enable();
			resetButton.enable();
			cancelButton.enable();
		},
		deleteFunction : function() {
			if (!list.getSelectionModel().getSelected()) {
				Ext.Msg.alert("ϵͳ��ʾ", "������ѡ��һ����¼ɾ��!");
				return;
			}
			simpleForm.getForm().url = nvl(obj.deleteURL, obj.table
					+ ".delete.go");
			simpleForm.getForm().doAction("submit",
					getFormAction(simpleForm.getForm(), "ɾ������"));
			// list.getStore().load();
		},
		rowclick : (obj.rowclick) ? obj.rowclick : function() {
			if (obj.onRowClick)
				obj.onRowClick(list);
			
			simpleForm.getForm().loadRecord(
					list.getSelectionModel().getSelected());
				
		    
		}
	});
	var roleFields=[
      {label:"Ա��Ȩ��id",name:"staff_priv_id",allowBlank:false,hide:"all"},
      {label:"Ա��ID",name:"staff_id",allowBlank:false,hide:"all"},
      {label:"Ȩ��ID",name:"priv_id",allowBlank:false,hide:"all"},
      {label:"Ȩ������",name:"priv_name",allowBlank:false},
      {label:"Ȩ��״̬",name:"priv_status",allowBlank:false,code:"STATUS"},
      {label:"Ȩ������",name:"priv_type",allowBlank:false,code:"PRIV_TYPE"},
      {label:"Ȩ������",name:"priv_desc"}
   ];
 function editGrid(o){

   return function(){
      var oo=Ext.apply({},o);
      var ab=getData("app_system_staff_table",["staff_id"]);
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
	var rolegrid=createPageGrid({
     id           : "system_staffrole_grid",
     title        : "Ա����ɫ",
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
                            var d=getData("app_system_staff_table",["staff_id"]);
                            d["priv_id"]=o.priv_id;
                            doPost("staff_role_map.insert.go",d,cLoadEvent("system_staffrole_grid"));
                         }
                      }),
                      
     deleteFunction : function(o){
                            var d=getData("system_staffrole_grid","staff_priv_id");
                            doPost("staff_role_map.delete.go",d,cLoadEvent("system_staffrole_grid"));
                       }             
});
	
	return [list,{xtype:"tabpanel", split        : true,region:"center",bodyStyle:"padding:2px",activeTab:0,items:[simpleForm,rolegrid]}];


