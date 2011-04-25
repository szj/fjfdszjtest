
LayoutExt = function(){   
  
    var Viewport = Ext.Viewport;   

    var root;   
    var layout;   

    return {   
        init: function(){   
            root = this;   
            Ext.state.Manager.setProvider(new Ext.state.CookieProvider());   
            layout = new Viewport({   
                layout: 'border',   
                items: [        
                {   
                    region: 'north', 
                    contentEl: 'north',    
                    title: '��ʾ������', 
                    split: false,
                    collapsible: true,  
                    height: 300,
                    html:"<iframe id='warningLogIframe' name='warningLogIframe' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=toAddPage' width='100%' height='100%' frameborder=0/>" ,
                    margins: '0 0 0 0'    
                },
                 new Ext.TabPanel({   
                                    region: 'center',   
                                    deferredRender: false,
                                     split: false,  
                                    activeTab: 0, 
                                    items: [{   
                                        contentEl: 'hyxx',   
                                        title: '������Ϣ',   
                                        closable: false,
                                        html:"<iframe id='hyxxId' name='hyxxName' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=hyxxGridList' width='100%' height='100%' frameborder=0/>" , 
                                        autoScroll: true 
                                    },{   
                                        contentEl: 'znxx',   
                                        title: '��Ů��Ϣ',
                                        html:"<iframe id='znxxId' name='znxxName' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=znxxGridList' width='100%' height='100%' frameborder=0/>" ,  
                                        autoScroll: true  
                                    }, {   
                                        contentEl: 'jyxx',   
                                        title: '������Ϣ',   
                                        html:"<iframe id='jyxxId' name='jyxxName' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=jyxxGridList' width='100%' height='100%' frameborder=0/>" ,  
                                        autoScroll: true  
                                    }, {   
                                        contentEl: 'zjxx',   
                                        title: '֤����Ϣ',  
                                        html:"<iframe id='zjxxId' name='zjxxName' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=zjxxGridList' width='100%' height='100%' frameborder=0/>" ,  
                                         
                                        autoScroll: true  
                                    }, {   
                                        contentEl: 'scxx',   
                                        title: '������Ϣ',  
                                        html:"<iframe id='hyxxId' name='hyxxName' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=newScxxGridList' width='100%' height='100%' frameborder=0/>" ,  
                                        autoScroll: true  
                                    }, {   
                                        contentEl: 'jlxx',   
                                        title: '������Ϣ',   
                                         html:"<iframe id='jlxxId' name='jlxxName' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=jlxxGridList' width='100%' height='100%' frameborder=0/>" ,  
                                        autoScroll: true  
                                    }, {   
                                        contentEl: 'clxx',   
                                        title: '������Ϣ',   
                                        html:"<iframe id='hyxxId' name='hyxxName' src='/ippfManage/baseInfo/BaseInfo.shtml?actionType=newClxxGridList' width='100%' height='100%' frameborder=0/>" ,  
                                        autoScroll: true  
                                    }]   
                 })   
                ]   
            });   
        }   
    };   
}   
();   

Ext.onReady(LayoutExt.init, LayoutExt, true);  
