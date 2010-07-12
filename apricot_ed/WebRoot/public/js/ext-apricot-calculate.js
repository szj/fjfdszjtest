/*
 * Apricot JS Library 1.1
 * Copyright(c) 2006-2008, Apricot JS, LLC.
 * xu.dahu@hotmail.com
 */

/**
 * ��һ���ļ�������Ҫ����ʹ��������ü���������������
 */

function cCalculatePanel(orderNo, cb) {
	var topFields = [ {
		label : "������",
		name : "order_no",
		value : orderNo[0] != null ? orderNo[0] : orderNo,
		readOnly : true
	}, {
		label : "VIP����",
		name : "vip_card_no",
		readOnly : true
	},
	//      {label:"�Ż�ȯ����",name:"cp_num"},
			{
				label : "�����������",
				name : "mincost_type",
				value : orderNo[2] != null ? orderNo[2] : "",
				xtype : "combo",
				readOnly : true,
				code : "MINCOST_TYPE"
			}, {
				label : "������ѽ��",
				name : "mincost_money",
				value : orderNo[1] != null ? orderNo[1] : "",
				xtype : "number",
				readOnly : true
			}, {
				label : "��������",
				name : "man_count",
				value : orderNo[3] != null ? orderNo[3] : "",
				xtype : "number",
				readOnly : true
			}, {
				label : "�ܽ��",
				name : "total",
				xtype : "number",
				readOnly : true
			},

			{
				label : "ʹ�û���",
				id : "point_check",
				name : "point_check",
				xtype : "checkbox",
				handler : changeState
			}, {
				label : "�ܻ���",
				name : "cum_point",
				xtype : "number",
				value : orderNo[4] != null ? orderNo[4] : "",
				readOnly : true
			}, {
				label : "��������",
				id : "fact_pay_point",
				name : "fact_pay_point",
				xtype : "number",
				readOnly : true
			}, {
				label : "�������",
				name : "fact_point",
				xtype : "number",
				readOnly : true
			}, {
				label : "���ֶһ����",
				name : "point_money",
				xtype : "number",
				readOnly : true
			}, {
				label : "��������",
				name : "order_type",
				value : orderNo[5],
				xtype : "combo",
				code : "ORDER_TYPE",
				width : 60
			}, {
				label : "�Ż�ȯ���",
				name : "youhui_total",
				value : "0",
				xtype : "number"
			},

			{
				label : "Ӧ�ս��",
				name : "pay_total",
				xtype : "number",
				readOnly : true
			}, {
				label : "�ֽ�֧��",
				name : "fact_pay_total",
				xtype : "number",
				format : "#0.00"
			}, {
				label : "ˢ��֧��",
				name : "fact_pay_card",
				xtype : "number",
				format : "#0.00"
			},

			{
				label : "������",
				name : "return_total",
				xtype : "number",
				readOnly : true
			}, {
				label : "��������",
				name : "dis_point",
				xtype : "number",
				readOnly : true
			}
	//      {label:"�Ż�ȯ���",name:"cp_num"},

	];
	function changeState() {

		if (Ext.getCmp("point_check").getValue() == true) {
			Ext.getCmp("fact_pay_point").getEl().dom.readOnly = false;
		} else {
			Ext.getCmp("fact_pay_point").setValue(0);
			Ext.getCmp("fact_pay_point").getEl().dom.readOnly = true;
		}
	}
	var ruleFields = [ {
		label : "����ID",
		name : "price_id",
		hide : "all"
	}, {
		label : "��������",
		name : "rule_name"
	}, {
		label : "���÷�Χ",
		name : "rule_scope"
	}, {
		label : "����ֵ",
		name : "rule_value"
	} ];
	var favConpou = [ {
		label : "�Ż�ȯ���",
		name : "cp_num",
		hide : "all"
	}, {
		label : "�Ż�ȯ����",
		name : "cp_name"
	}, {
		label : "�Żݽ��",
		name : "cp_cash"
	}, {
		label : "�ۿ۱���",
		name : "cp_disct"
	}, {
		label : "����(ÿ��)Ԫ",
		name : "cond_value"
	}, {
		label : "����(��)",
		name : "send_num"
	}, {
		label : "��ʼʱ��",
		name : "start_time",
		hide : "all"
	}, {
		label : "��ֹʱ��",
		name : "end_time"
	} ];
	var foodFields = [ {
		label : "��Ʒ����",
		name : "food_name"
	}, {
		label : "��Ʒ����",
		name : "food_count"
	}, {
		label : "��Ʒ����",
		name : "food_price"
	}, {
		label : "��λ����",
		name : "balcony_name"
	} ];
	var toolBars = [ "����(ÿ��)Ԫ", "&nbsp;", createField( {
		name : "pay_money",
		code : "COND_VALUE",
		id : "pay_money1",
		xtype : "combo",
		width : 70
	}), createField( {
		name : "orderQuery",
		xtype : "button",
		pressed : true,
		iconCls : "gridBarItemQuery",
		label : "GO",
		width : 60,
		handler : goClick
	}) ];
	function goClick() {
		var dt = {};

		for ( var k = 0; k < toolBars.length; k++) {
			var o = toolBars[k];

			if (typeof o == "object") {
				if (o.getName && o.getValue) {

					dt[o.getName()] = o.getValue();

				}
			}
		}

		load("calculate_panel_f", dt);
		// grid.getStore().baseParams=dt;
		// grid.getStore().load();
	}
	function calculate() {
		var d = new Array();
		d.push(getFormValues("calculate_panel_a"));

		// d.push(getFormValues("win1"));

		var opP = getDataArrayStr("calculate_panel_b", [ "price_id" ]);
		d.push(opP);
		if (opP.length > 1) {
			$alt("��ѡ�Ż�ֻ��ѡ��һ�����ܣ���ȡ��һ��");
			return;
		}
		//alert(d);
		d = d.concat(getAllData("calculate_panel_c", [ "price_id" ]));
		// alert(Ext.urlEncode(d));
		doGet(
				"/calculate_calc.do",
				d,
				function(dt) {
					if (dt == 88888888) {
						$alt("�Ż�ȯ�����ڻ���ʹ�ù��ģ���");
					} else {

						/**
						    if(dt.fact_pay_total==''||dt.fact_pay_total==0)
						    {
						    	dt["return_total"]=0;
						    }
						    else
						    {
						    	dt["return_total"]=((Number(dt.fact_pay_total)+Number(dt.fact_pay_card)+Number(dt.youhui_total))-Number(dt.pay_total)).toFixed(2);
						    }
						 */
						dt["return_total"] = ((Number(dt.fact_pay_total)
								+ Number(dt.fact_pay_card) + Number(dt.youhui_total)) - Number(dt.pay_total))
								.toFixed(2);

						dt["fact_point"] = Number(dt.cum_point)
								+ Number(dt.dis_point)
								- Number(dt.fact_pay_point);
						getCmp("calculate_panel_a").getForm().setValues(dt);
						if (dt.mincost_type == 1) {
							if (dt.total < (dt.man_count * dt.mincost_money)) {
								$alt("�˾����ѽ��δ�ﵽ������ѱ�׼��");
							}
						} else if (dt.mincost_type == 2) {
							if (dt.total * 1 < dt.mincost_money * 1) {
								$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
							}
						}
						if (dt.cum_point < dt.fact_pay_point) {
							$alt("���ѻ��������ܴ����ܻ�������");
						}
						if (dt.isCan == "0") {
							$alt("���򻥳⣬����ȷ��");
						}
					}
				});

	}
	;

	function payoff() {
		doGet("/fav/coupon_info.check.do", getFormValues("calculate_panel_a"),
				function(dt) {
					if (dt["flag"] == "YES") {
						$alt("�Ż�ȯ�����ڻ���ʹ�ù���!!");
					} else {
						var d = getFormValues("calculate_panel_a");
						if (d.return_total < 0) {
							$alt("�ͻ�����û����ȫ���ˣ���ȷ�ϣ�");
							return;
						}

						if (!d.total || !d.return_total) {
							$alt("��û����ѣ����ܽ��ˣ�");
							return;
						}

						if (d.mincost_money != "0.00") {
							if (d.mincost_type == 1) {
								if (d.total < (d.man_count * d.mincost_money)) {
									$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
									return;
								}
							} else {
								if (d.total * 1 < d.mincost_money * 1) {
									$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
									return;
								}
							}
							if (dt.cum_point < dt.fact_pay_point) {
								$alt("���ѻ��������ܴ����ܻ�������");
								return;
							}
						}

						doPost("/calculate_payoff.do", d, function() {
							removeHandler("calculate_panel_a_but1");
							removeHandler("calculate_panel_a_but2");
							removeHandler("calculate_panel_a_but3");
						});
					}
				});

	}

	function favCon() {
		var simple = new Ext.FormPanel(
				{
					id : 'win1',
					labelWidth : 85,
					baseCls : 'x-plain',
					defaults : {
						width : 150,
						bodyBorder : false
					},
					defaultType : 'textfield',
					items : [ {
						fieldLabel : '�Ż�ȯ���',
						name : 'cp_num',
						//anchor:'95%',
						allowBlank : false,
						blankText : 'ʵ��ȯ��Ų���Ϊ��'
					} ],

					buttons : [
							{
								text : 'ʹ��',
								//handler:calculate
								handler : function() {
									//doGet("/calculate_calc.do",getFormValues("win1"),function(dt){});
								var d = new Array();
								d.push(getFormValues("calculate_panel_a"));
								d.push(getFormValues("win1"));
								// alert(getDataArrayStr("calculate_panel_b",["price_id"]));
								d.push(getDataArrayStr("calculate_panel_b",
										[ "price_id" ]));
								// alert(d);
								d = d.concat(getAllData("calculate_panel_c",
										[ "price_id" ]));
								// alert(d)
								doGet(
										"/calculate_calc.do",
										d,
										function(dt) {
											if (dt == 88888888) {
												$alt("�Ż�ȯ����ʹ�ù��ģ���");
											} else {

												dt["return_total"] = (dt.fact_pay_total - dt.pay_total)
														.toString()
														.replace(
																/^(\d+\.\d{2})\d*$/,
																"$1");
												dt["fact_point"] = Number(dt.cum_point)
														+ Number(dt.dis_point)
														- Number(dt.fact_pay_point);
												getCmp("calculate_panel_a")
														.getForm()
														.setValues(dt);
												if (dt.mincost_money != "0.00") {
													if (dt.mincost_type == 1) {
														if (dt.total < (dt.man_count * dt.mincost_money)) {
															$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
														}
													} else {
														if (dt.total < dt.mincost_money) {
															$alt("�����ܽ��δ�ﵽ������ѱ�׼��");
														}
													}
												}
												if (dt.cum_point < dt.fact_pay_point) {
													$alt("���ѻ��������ܴ����ܻ�������");
												}
												if (dt.isCan == "0") {
													$alt("���򻥳⣬����ȷ��");
												}

											}
										});
							}
							}, {
								text : '�ر�',
								handler : function() {
									getCmp("win").destroy();
								}
							} ]
				});

		win = new Ext.Window( {
			id : 'win',
			title : '�Ż�ȯʹ��',
			layout : 'fit',
			width : 300,
			height : 150,
			plain : true,
			bodyStyle : 'padding:5px;',
			maximizable : false,
			closeAction : 'close',
			closable : false,
			collapsible : true,
			plain : true,
			modal : true,
			buttonAlign : 'center',
			items : simple
		});
		
		
		win.show();

	}

	function printOrder() {
		doGet("/print/printOrder.do", getFormValues("calculate_panel_a"),
				function(dt) {
					if (dt["flag"] == 0) {
						alert("��ӡ�ɹ�");
					} else {
						alert(dt["flag"]);
					}

				})
	}
	function bookFee() {
		doGet("/keepaccount_calc.do",
				null,
				function(dt) {
					if (dt["kai_accounts"] == 0) {
						//?????
				var simple = new Ext.FormPanel(
						{
							id : 'win1',
							labelWidth : 75,
							baseCls : 'x-plain',
							defaults : {
								width : 150
							},
							defaultType : 'textfield',
							items : [ {
								fieldLabel : '�ʻ�',
								name : 'name',
								//anchor:'95%',
								allowBlank : false,
								blankText : '�ʻ�����Ϊ��'
							}, {
								inputType : 'password',
								fieldLabel : '����',
								//anchor:'95%',
								name : 'pws',
								allowBlank : false,
								blankText : '���벻��Ϊ��'
							} ],

							buttons : [
									{
										text : '��Ȩ',
										handler : function() {
											var d = {};
											d = Ext.apply(d,
													getFormValues("win1"));
											doPost(
													"/checklogin.do",
													getFormValues("win1"),
													function(rt) {
														getCmp("win").destroy();

														try {
															d = Ext
																	.apply(
																			d,
																			getFormValues("calculate_panel_p"));
														} catch (e) {
															toPanel
																	.activate("calculate_panel_p");
															$alt("����д������Ϣ,Ȼ���ټ���");
														}
														d = Ext
																.apply(
																		d,
																		getFormValues("calculate_panel_a"));
														if (d.book_man == ""
																|| !d.book_man) {
															$alt("����д������Ϣ,Ȼ���ټ���.");
															return;
														}
														doPost(
																"/calculate_bookbill.do",
																d,
																function() {
																	removeHandler("calculate_panel_a_but1");
																	removeHandler("calculate_panel_a_but2");
																	removeHandler("calculate_panel_a_but3");
																});
													}, false);
										}
									}, {
										text : '�ر�',
										handler : function() {
											getCmp("win").destroy();
										}
									} ]
						});

				win = new Ext.Window( {
					id : 'win',
					title : '���˵�½',
					layout : 'fit',
					width : 300,
					height : 150,
					plain : true,
					bodyStyle : 'padding:5px;',
					maximizable : false,//??????
					closeAction : 'close',
					closable : false,//??????
					collapsible : true,//?????
					plain : true,
					modal : true,
					buttonAlign : 'center',
					items : simple
				// ????????????????????
						});
				win.show();// ???????

			} else {
				var d = {};
				try {
					d = Ext.apply(d, getFormValues("calculate_panel_p"));
				} catch (e) {
					toPanel.activate("calculate_panel_p");
					$alt("����д������Ϣ,Ȼ���ټ���.");
				}
				d = Ext.apply(d, getFormValues("calculate_panel_a"));
				if (d.book_man == "" || !d.book_man) {
					$alt("����д������Ϣ,Ȼ���ټ���.");
					return;
				}
				doPost("/calculate_bookbill.do", d, function() {
					removeHandler("calculate_panel_a_but1");
					removeHandler("calculate_panel_a_but2");
					removeHandler("calculate_panel_a_but3");
				});
			}
		});

	}

	var buttons = [ {
		text : "���",
		handler : calculate,
		id : "calculate_panel_a_but1"
	}, {
		text : "�շ�",
		handler : payoff,
		id : "calculate_panel_a_but2"
	}, {
		text : "����",
		handler : bookFee,
		id : "calculate_panel_a_but3"
	},{text:"ȥ����ͷ",handler:function(){
		var d=getFormValues("calculate_panel_a",["pay_total","return_total"]);
		if(!d.pay_total) return;
		var v=d.pay_total-parseInt(d.pay_total);
	
		d.pay_total=parseInt(d.pay_total);
		if(!isNull(d.return_total) ){
		d.return_total=parseFloat(d.return_total)+v;
		}
		getCmp("calculate_panel_a").getForm().setValues(d);
	}},
	// {text:"�����Ż�ȯ",handler:favCon,id:"dis"},
			{
				text : "��ӡ",
				handler : printOrder,
				id : "calculate_panel_a_but4"
			}, {
				text : "�ر�",
				handler : function() {
					getCmp("calculate_panel_w").destroy();
				}
			} ];

	var calcPanel = new Ext.FormPanel( {
		labelAlign : 'top',
		frame : true,
		id : "calculate_panel_a",
		title : "������Ϣ",
		width : 800,
		height : 240,
		split : true,
		region : "north",
		labelAlign : "left",
		bodyStyle : "padding:2px",
		layout : 'column',
		items : [ {

			xtype : 'fieldset',
			title : '������Ϣ',
			collapsible : true,
			height : 200,
			defaults : {
				width : 120
			},
			defaultType : 'textfield',
			columnWidth : .333,
			layout : 'form',
			items : [ createField( {
				label : "������",
				name : "order_no",
				value : orderNo[0] != null ? orderNo[0] : "���󶩵�",
				readOnly : true
			}), createField( {
				label : "VIP����",
				name : "vip_card_no",
				readOnly : true
			}),  createField({
				label : "�����������",
				name : "mincost_type",
				value : orderNo[2] != null ? orderNo[2] : "",
				xtype : "combo",
				editable : true,
				code : "MINCOST_TYPE"
			}), createField( {
				label : "������ѽ��",
				name : "mincost_money",
				value : orderNo[1] != null ? orderNo[1] : "",
				readOnly : true
			}), createField( {
				label : "��������",
				name : "man_count",
				value : orderNo[3] != null ? orderNo[3] : "",
				readOnly : true
			}), createField( {
				label : "�ܽ��",
				name : "total",
				readOnly : true
			}), createField( {
				label : "��������",
				name : "order_type",
				value : orderNo[5],
				xtype : "textfield",
				readOnly : true
			})

			]
		}, {
			xtype : 'fieldset',
			title : '������Ϣ',
			collapsible : true,
			height : 200,
			defaults : {
				width : 100
			},
			defaultType : 'textfield',
			columnWidth : .333,
			layout : 'form',
			items : [ {
				fieldLabel : "ʹ�û���",
				id : "point_check",
				name : "point_check",
				boxLabel : "",
				xtype : "checkbox",
				handler : changeState
			}, {
				fieldLabel : "�ܻ���",
				name : "cum_point",
				readOnly : true
			}, {
				fieldLabel : "��������",
				id : "fact_pay_point",
				name : "fact_pay_point",
				readOnly : true
			}, {
				fieldLabel : "�������",
				name : "fact_point",
				readOnly : true
			}, {
				fieldLabel : "���ֶһ����",
				name : "point_money",
				readOnly : true
			}, {
				fieldLabel : "�Ż�ȯ���",
				name : "youhui_total",
				value : "0"
			} ]
		}, {
			xtype : 'fieldset',
			title : '������Ϣ',
			collapsible : true,
			height : 200,
			defaults : {
				width : 100
			},
			defaultType : 'textfield',
			columnWidth : .333,
			layout : 'form',
			items : [ {
				fieldLabel : "Ӧ�ս��",
				name : "pay_total",
				readOnly : true
			}, {
				fieldLabel : "�ֽ�֧��",
				name : "fact_pay_total",
				value : 0,
				format : "#0.00"
			}, {
				fieldLabel : "ˢ��֧��",
				name : "fact_pay_card",
				value : 0,
				format : "#0.00"
			}, {
				fieldLabel : "������",
				name : "return_total",
				readOnly : true
			}, {
				fieldLabel : "��������",
				name : "dis_point",
				readOnly : true
			}, {
				fieldLabel : "��ӡ����",
				name : "print_count",
				value : 1
			} ]
		} ]

	});

	/**
	 * var calcPanel=createFormPanel({ id : "calculate_panel_a", title : "������Ϣ",
	 * cols : 3, width : 800, height : 240, split : true, items : topFields,
	 * labelWidth : 80, region : "north" });
	 */
	var bookPanel = createFormPanel( {
		id : "calculate_panel_p",
		title : "������Ϣ",
		cols : 1,
		height : 180,
		split : true,
		items : [ {
			label : "��ϵ��",
			name : "book_man",
			allowBlank : false
		}, {
			label : "��ϵ�绰",
			name : "book_phone"
		}, {
			label : "����ԭ��",
			name : "book_desc",
			code : "ACCOUT_REA",
			xtype : "combo"
		}, {
			label : "Ԥ�ƽ���ʱ��",
			name : "book_date",
			xtype : "datetime"
		}, {
			label : "��ע",
			name : "book_remarks",
			xtype : "textarea"
		} ],
		labelWidth : 80,
		region : "north"
	});

	var optionPanel = cGroupGrid( {
		id : "calculate_panel_b",
		title : "��ѡ�ۿ�",
		items : ruleFields,
		collapsible : true,
		selectFirst : true,
		sync : true,
		url : "/calculate_rules.do?price_type=2&order_no=" + orderNo[0],
		split : true,
		afterLoad : calculate,
		rowclick : calculate,
		//    	groupField    : "rule_name",
		region : "center"
	});

	// {bodyBorder:false,frame:false,layout:"border",style:"padding:2px",items:[toPanel,tabPanel]}

	var mustOptionPanel = cGroupGrid( {
		id : "calculate_panel_c",
		title : "��ѡ�ۿ�",
		items : ruleFields,
		region : "south",
		sync : true,
		url : "/calculate_rules.do?price_type=1&order_no=" + orderNo[0],
		split : true,
		groupField : "rule_name",
		selectFirst : false,
		afterLoad : calculate,
		collapsible : true
	});

	var noSumitFoodPanel = createPageGrid( {
		id : "calculate_panel_d",
		title : "δ�ϵĲ�",
		items : foodFields,
		urls : "/calculate_details.do?serving_flag=0&order_no=" + orderNo[0],
		region : "center",
		filter : false
	});
	var sumitFoodPanel = createPageGrid( {
		id : "calculate_panel_e",
		title : "���ϵĲ�",
		items : foodFields,
		urls : "/calculate_details.do?serving_flag=1&order_no=" + orderNo[0],
		region : "center",
		filter : false
	});
	var favCouponPanel = createPageGrid( {
		id : "calculate_panel_f",
		title : "�Ż�ȯ����",
		items : favConpou,
		urls : "/fav/coupon_info.pages1.do",
		region : "center",
		//toolBarFields :toolBars,
		filter : false
	});

	var tabPanel = new Ext.TabPanel( {
		items : [ optionPanel, mustOptionPanel, noSumitFoodPanel,
				sumitFoodPanel ],
		region : "center",
		height : 300,
		activeTab : 0
	});

	var toPanel = new Ext.TabPanel( {
		items : [ calcPanel, bookPanel ],
		activeTab : 0,
		height : 270,
		split : true,
		region : "north",
		bodyBorder : false
	});

	var win = new Ext.Window( {
		title : "�ͻ�����",
		items : [ {
			bodyBorder : false,
			frame : false,
			layout : "border",
			style : "padding:2px",
			items : [ toPanel, tabPanel ]
		} ],
		width : 768,
		height : 580,
		id : "calculate_panel_w",
		modal : true,
		layout : "fit",
		hideBorders : true,
		bodyBorder : false,
		buttons : buttons
	});

	// win.on("show",calculate);
	if (cb)
		win.on("beforedestroy", cb);
	
	doGet("/order/order_getlinkman.do",{order_no:orderNo[0]},function(dt){
	
		getCmp("calculate_panel_p").getForm().setValues(dt);
	});
	return win;
}

function cGroupGrid(obj) {
	function getColumns(arr) {
		var cols = new Array();
		if (obj.checkbox == true)
			cols.push(new Ext.grid.CheckboxSelectionModel());
		for ( var i = 0; i < arr.length; i++) {
			var o = arr[i];
			var cfg = {
				id : o.id,
				header : o.label,
				dataIndex : ((o.code) ? (o.name + "_text") : o.name),
				width : nvl(o.width, 100),
				sortable : nvl(o.sortable, false)
			};
			if (o.hidden == true || o.hide == "grid" || o.hide == "all") {
				cfg["hidden"] = true;
				// continue;
			}

			cols.push(cfg);
		}

		return cols;
	}

	function getFields(arr) {
		var cols = new Array();

		for ( var i = 0; i < arr.length; i++) {
			var o = arr[i];
			cols.push(o.name);
			if (o.code)
				cols.push(o.name + "_text");
		}

		return cols;
	}

	function getReaderFields(arr) {
		var cols = new Array();

		for ( var i = 0; i < arr.length; i++) {
			var o = arr[i];
			cols.push( {
				name : o.name
			});
			if (o.code)
				cols.push( {
					name : o.name + "_text"
				});
		}

		return cols;
	}

	var store = new Ext.data.GroupingStore( {
		reader : new Ext.data.ArrayReader( {}, getReaderFields(obj.items)),
		url : toURL(obj.url),
		autoLoad : true,
		sortInfo : {
			field : obj.items[0].name,
			direction : "ASC"
		},
		groupField : obj.groupField
	});
	// store.load();

	store.on("load", function(e) {
		if (obj.selectFirst == true)
			getCmp(obj.id).getSelectionModel().selectFirstRow();
		if (obj.afterLoad)
			obj.afterLoad();
	});

	var grid = new Ext.grid.GridPanel( {
		store : store,
		selModel : new Ext.grid.RowSelectionModel( {
			singleSelect : false
		}),//�������
		columns : getColumns(obj.items),
		id : obj.id,
		split : obj.split,
		deferRowRender : false,
		title : obj.title,
		collapsible : obj.collapsible,
		view : new Ext.grid.GroupingView( {
			forceFit : true,
			groupTextTpl : '{text}'
		}),
		region : obj.region,
		sm : (obj.checkbox == true) // ����Ҳ����
		? new Ext.grid.CheckboxSelectionModel()
				: undefined,
		animCollapse : false,
		width : obj.width,
		height : obj.height
	});

	if (obj.rowclick) {
		grid.on("rowclick", obj.rowclick);
	}

	return grid;
}

function cGroupGridJson(obj) {
	function getColumns(arr) {
		var cols = new Array();
		if (obj.checkbox == true)
			cols.push(new Ext.grid.CheckboxSelectionModel());
		for ( var i = 0; i < arr.length; i++) {
			var o = arr[i];
			var cfg = {
				id : o.id,
				header : o.label,
				dataIndex : ((o.code) ? (o.name + "_text") : o.name),
				width : nvl(o.width, 100),
				sortable : nvl(o.sortable, false)
			};
			if (o.hidden == true || o.hide == "grid" || o.hide == "all") {
				cfg["hidden"] = true;
				// continue;
			}

			cols.push(cfg);
		}

		return cols;
	}

	function getFields(arr) {
		var cols = new Array();

		for ( var i = 0; i < arr.length; i++) {
			var o = arr[i];
			cols.push(o.name);
			if (o.code)
				cols.push(o.name + "_text");
		}

		return cols;
	}

	var store = new Ext.data.GroupingStore( {
		reader : new Ext.data.JsonReader( {
			fields : getFields(obj.items),
			root : 'rowSet',
			totalProperty : 'totalCount'
		}),
		url : toURL(obj.url),
		sortInfo : {
			field : obj.items[0].name,
			direction : "ASC"
		},
		groupField : obj.groupField
	});
	store.load();
	if (obj.selectFirst == true)
		store.on("load", function(e) {
			getCmp(obj.id).getSelectionModel().selectFirstRow();
		});

	var grid = new Ext.grid.GridPanel( {
		store : store,
		selModel : new Ext.grid.RowSelectionModel( {
			singleSelect : true
		}),
		columns : getColumns(obj.items),
		id : obj.id,
		split : obj.split,
		deferRowRender : false,
		title : obj.title,
		collapsible : obj.collapsible,
		view : new Ext.grid.GroupingView( {
			forceFit : true,
			groupTextTpl : '{text}  (����: {[values.rs.length]}) '
		}),
		region : obj.region,
		animCollapse : false,
		width : obj.width,
		height : obj.height,
		bbar : obj.toolBarFields

	});

	return grid;
}
