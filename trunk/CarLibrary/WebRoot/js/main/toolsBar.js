Ext.onReady(function() {
			header = new Ext.Panel( {
				border : true,
				region : 'north',
				layout:'anchor',
				height : 90,
				items : [{
					xtype:"box",
					border : true,
					el:"header",
            		anchor: 'none -23'
					},
					new Ext.Toolbar({items:[/* '���²�ѯ:',
											{
												xtype:"textfield",
												width:200,
												id:"search"
											},{
												text:"����",
												cls:"x-btn-text-icon",
												icon:"images/search.gif"
											},*/"->",/*{
												text:"WebQQ",
												cls:"x-btn-text-icon",
												icon:"images/qq/im.gif",
												handler:function(){
													onlineWindow.show();
												}
											},"-",{
												text:'��Ϣ����',
												cls:"x-btn-text-icon",
												icon:"images/OnlineMessageManager.gif",
												handler:OnlineMessageManager.config,
												scope:OnlineMessageManager
											},*/{
												text:"��������",
												cls:"x-btn-text-icon",
												icon:"images/key.gif",
												handler:changePassword
											},"",{
												text:"ע���û�",
												cls:"x-btn-text-icon",
												icon:"images/stop.gif",
												handler:logout
											}/*,"-","����Ƥ��:",{
												xtype:"combo",
												transform:"skins",
												lazyRender:true,
												triggerAction:"all",
												listeners:{"select":function(c){
													changeSkin(c.getValue());
												}
											}
										}*/]
									})
					]
			});
			changeSkin = function(value) {
				Ext.util.CSS
						.swapStyleSheet('window',
								'/plugins/extjs/ext-2.0/resources/css/' + value
										+ '.css');
			};
			menu = new MenuPanel();
			main = new MainPanel();
//			var currentUser=new Ext.Toolbar.TextItem(OnlineMessageManager.me.name);	
			bottom=	new Ext.Toolbar({id:"bottom",frame:true,region:"south",height:25,items:["��ǰ�û���",currentUser,new Ext.Toolbar.Fill(),"��Ȩ���С�<font color=blue>������ͨ��Ϣ�Ƽ����޹�˾</font>��������"]});
			bottom.currentUser=currentUser;
			var viewport = new Ext.Viewport( {
				layout : 'fit',
				items : [{id:"desktop",layout:"border",items:[header, menu, main,bottom]}]
			});
///�ж��Ƿ��¼	login();
						// OnlineMessageManager.openMessage({sender:OnlineMessageManager.me,content:"����һ��",inputTime:new Date()});
			//MettingManager.joinMeeting(1);
//			OnlineMessageManager.start.call(OnlineMessageManager);
			/***************
			setTimeout(function() {
				Ext.get('loading').remove();
				Ext.get('loading-mask').fadeOut( {
					remove : true
				});				
				photoPreview = new Ext.Resizable('photoPreview', {
		            wrap:true,
		            pinned:true,
		            minWidth:50,
		            minHeight: 50,
		            preserveRatio: true,
		            handles: 'all',
		            draggable:true,
		            dynamic:true
		        });
		       // document.body.insertBefore(customEl.dom,
				// document.body.firstChild);
		        photoPreview.el.on('dblclick', function(){
		            photoPreview.el.hide(true);
		        });
				photoPreview.el.hide();
				
				// var panel=new
				// Ext.Panel({renderTo:"msgPanel",title:"��ʾ",frame:true,width:400,height:200});
				// panel.hide();
			}, 300);
			*****************/
		})