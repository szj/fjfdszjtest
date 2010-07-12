function createTableForm(obj) {
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
			if (obj.data){
				
				simpleForm.getForm().setValues(obj.data);
			}
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

	return [ list, simpleForm ];
}

function createTableFormNoButton(obj) {
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
		rowclick : (obj.rowclick) ? obj.rowclick : function() {
			if (obj.onRowClick)
				obj.onRowClick(list);
			simpleForm.getForm().loadRecord(
					list.getSelectionModel().getSelected());
		}
	});

	return [ list, simpleForm ];
}