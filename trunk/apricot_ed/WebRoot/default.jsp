<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="eating-apricot" prefix="xhtml" %>
<xhtml:html loginFilter="false">
<style>
<!--
html, body {
	background:#3d71b8 url(img/logon-background.jpg) no-repeat left top;
    font: normal 12px tahoma, arial, verdana, sans-serif;
	margin: 0;
	padding: 0;
	border: 0 none;
	overflow: hidden;
	height: 100%;
}
-->
</style>

<script language="javascript">
function documentReady(){
	  Ext.QuickTips.init();
    var simple = new Ext.FormPanel({
        labelWidth: 75, // label settings here cascade unless overridden
        url:'logon.do',
        frame:true,
        id : "logForm",
        title: '�û���¼',
        bodyStyle:'padding:5px 5px 0',
        width: 350,
        defaults: {width: 230},
        defaultType: 'textfield',
    
        items: [{
                fieldLabel: '��¼��',
                name: 'loginname',
                id:"loname",
                allowBlank:false,
                    listeners:{
                	"blur":function(){
                	var l=Ext.getCmp("loname");
                	if(l.getValue()!=""){
								doGet("/staff/bInfo.do?loginname="+l.getValue(),null,function(dt){
									var a=Ext.getCmp("mon");
	                				var b=Ext.getCmp("login");
	                				var c=Ext.getCmp("confirm");
	                				//alert(dt["flag"]);
	                				if(dt["flag"]=="NO"){
	                					b.hide();
	                					a.show();
	                					a.getEl().up('.x-form-item').setDisplayed(true);
	                					c.show();
	                					
	                				}else{
	                					b.show();
	                					a.hide();
	                					a.getEl().up('.x-form-item').setDisplayed(false);
	                					c.hide();
	                					
	                				}
	                			});
	                		}	
                	}
                }
            },{
                fieldLabel: '��&nbsp;&nbsp;&nbsp;��',
                name: 'password',
                allowBlank:false,
                inputType:"password"
            }
            ,{
            	id:"mon",
                fieldLabel: '��ʼ���',
                allowBlank:false,
                name: 'money',
                regex:/^\d$/,
                regexText:"����������",
                listeners:{
                	"render":function(){
									var a=Ext.getCmp("mon");
	                				var b=Ext.getCmp("login");
	                				var c=Ext.getCmp("confirm");
	                					a.hide();
	                					a.getEl().up('.x-form-item').setDisplayed(false);
	                					c.hide();
                	}
                }
            }
        ]
    });
    
    
    
    simple.addButton({
    	  text: "��¼",
    	  xtype:"button",
    	  id:"login",
    	  handler: function(){
  	       
    	    doPost("/login.do",getFormValues("logForm"),function(rt){
    	        window.location.href=currentPageBaseHREF+"/app/main.jsp";
    	    },false);
    	  }
    	});
     simple.addButton({
    	  text: "ȷ��",
    	  xtype:"button",
    	  id:"confirm",
    	  handler: function(){
    	    doPost("/login1.do",getFormValues("logForm"),function(rt){
    	        window.location.href=currentPageBaseHREF+"/app/main.jsp";
    	    },false);
    	  }
    	});
    simple.addButton({
    	  text:"�ر�",
    	  xtype:"button",
    	  handler:function(){
    	    window.close();
    	  }
    	});
    	
    simple.render("center");
   
};

</script>	

<table style="width: 100%; height: 100%" align="center">
	<tr>
		<td style="width: 100%; height: 100%;text-align:center" class="style1"><div id="center"></div></td>
	</tr>
</table>

</xhtml:html>