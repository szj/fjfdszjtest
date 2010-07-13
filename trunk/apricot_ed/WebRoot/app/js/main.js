Ext.ux.TabCloseMenu = function(){
    var tabs, menu, ctxItem;
    this.init = function(tp){
        tabs = tp;
        tabs.on('contextmenu', onContextMenu);
    }
   
    function onContextMenu(ts, item, e){
        if(!menu){ // create context menu on first right click
            menu = new Ext.menu.Menu([{
                id: tabs.id + '-close',
                text: '�ر�����',
                handler : function(){
                    tabs.items.each(function(item){
                    	     if(item.id=="myTaskList") return;
                             tabs.remove(item);
                    });
                    addWindow({id:"blank",title:"�հ�ҳ"});
                }
            },{
                id: tabs.id + '-close-others',
                text: '�ر���������',
                handler : function(){
                    tabs.items.each(function(item){
                        if(item.closable && item != ctxItem){
                            tabs.remove(item);
                        }
                    });
                }
            },"-",{
                id: tabs.id + '-refresh',
                text: 'ˢ�µ�ǰҳ',
                handler : function(){ 
                	var o=Ext.apply({},getCmp(ctxItem.id));
                    tabs.remove(ctxItem);
                    addWindow({url:o.urn,text:o.title,id:o.id});
                    
                	
                	
                }
            }]);
        }
        ctxItem = item;
        var items = menu.items;
        items.get(tabs.id + '-close').setDisabled(!item.closable);
        var disableOthers = true;
        tabs.items.each(function(){
            if(this != item && this.closable){
                disableOthers = false;
                return false;
            }
        });
        items.get(tabs.id + '-close-others').setDisabled(disableOthers);
        menu.showAt(e.getPoint());
    }
};
  /**
   * ������߶���(mainSiderBar_xudahu)
   */
  var mainSiderBar_xudahu=new Ext.tree.TreePanel({
     region:"west",
     title:"����",
     split:true,
     collapsible:true,
     width:150,
     useArrows:true,
     autoScroll:true,
     animate:true,
     enableDD:true,
     containerScroll: true,
     rootVisible : false,
     dataUrl:toURL("/staff/menus.do"),
     //dataUrl:toURL("/app/js/menu.js"),
     root: {
         nodeType: 'async',
         text: 'Ext JS',
         draggable:false,
         expandable:true,
         expanded:true,
         id:'source'
     }
  });
  //չ�����нڵ�
  mainSiderBar_xudahu.expandAll();
  
  /**
   * �����м�����(mainContent_xudahu)
   */
  
  var mainContent_xudahu=new Ext.TabPanel({
  	 region:"center",
  	 bodyBorder:false,
  	 split:true,
     id:"mainContent_xudahu",
     defaults:{autoScroll: true},
     resizeTabs:true,
     activeTab:0,
     layoutOnTabChange:true,
     onStripMouseDown : function(e){
         if(e.button != 0){
             return;
         }
         e.preventDefault();
         var t = this.findTargets(e);
         if(t.close){
             this.remove(t.item);
             if(this.items.length==0) addWindow({id:"blank",title:"�հ�ҳ"});
             return;
         }
         if(t.item && t.item != this.activeTab){
             this.setActiveTab(t.item);
         }
     },

     items:[{title:"�հ�ҳ",id:"blank_tab"}],
     plugins:new Ext.ux.TabCloseMenu()
  });
  
  

  
  //�����´�����Ӻ���
  function addWindow(obj){
      var tabId=((obj.id)?obj.id:"blank")+"_tab";
      var aTab;
      if(obj.url){
          aTab=new Ext.Panel({
    	       id:tabId,
             title:"&nbsp;&nbsp;"+obj.text+"&nbsp;&nbsp;",
             autoLoad:{url:toURL(obj.url+"?id="+tabId),autoScroll:true,scripts:true},
             layout:"fit",
             region:"center",
             closable:true,
             bodyBorder:false,
             autoScroll:true,
             style:"padding:4px",
             urn:obj.url
          });
        
     }else{
        aTab={id:tabId,title:"&nbsp;&nbsp;�հ�ҳ&nbsp;&nbsp;"};
     }   
     if(tabId!=="blank_tab") mainContent_xudahu.remove("blank_tab");
     
      
     if(!mainContent_xudahu.getItem(tabId)){
           mainContent_xudahu.add(aTab);
      }   
      mainContent_xudahu.activate(tabId);
  }
  
  
  
  //����Ŀ¼������¼�
  mainSiderBar_xudahu.on("click",function(node,obj){
      var obj=node.attributes;
      var tabId=((obj.id)?obj.id:"blank")+"_tab";
      if(mainContent_xudahu.getItem(tabId)){
          mainContent_xudahu.activate(tabId);
      }else {
          if(node.attributes.leaf==true && obj.url){
            if(mainContent_xudahu.items.length>6){
               Ext.MessageBox.alert('ϵͳ����', '���ֻ�ܴ�7�����ڣ���ر�һЩ���ڡ�');
               return;
            }
            addWindow(obj);
          }  
      }
  });
  /**
   * ������ͼ
   */
  function documentReady(){
    Ext.QuickTips.init();
    //����һ���µ���ͼ
    var mainViewer=new Ext.Viewport({
  	    layout:"border",
  	    hideBorders:true,
  	   
  	    items:[
  	        {region:"north",hideBorders:true,height:32,autoLoad:{url:"app/banner.jsp",scripts:true}},
  	        {region:"center",layout:"border",items:[mainSiderBar_xudahu,mainContent_xudahu]},
  	    		{region:"south",hideBorders:true,height:25,autoLoad:{url:"app/footer.jsp",scripts:true}}
  	    ]
  	});

  };