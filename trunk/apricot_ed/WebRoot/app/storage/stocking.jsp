var stockingFields=[
      {label:"ԭ����ID",name:"mat_id",hide:"all"},
      {label:"ԭ��������",name:"mat_name"},
      {label:"�̵����κ�",name:"check_no"},
      {label:"���ز���",name:"dept_name"},
      {label:"�����̵����",name:"storage_total"},
      {label:"�̵�����������",name:"sale_total"},
//      {label:"�����˲���",name:"return_total",hide:"all"},
      {label:"�̵�����ɹ���",name:"buy_total"},
      {label:"��ǰ�����",name:"stog_count"},
      {label:"������",name:"adjust_total",xtype:"number"},
      {label:"�̵���",name:"mat_num"}
   ];
 
 function checkSave(){
    var ss={check_no:getCmp("ap_st_stocking_check_no").getValue()};
    if(ss.check_no=="" || !ss.check_no){
       $alt("���Ȳ�ѯ�����Ϣ��Ȼ���̵㣡");
       return;
    }
    var d=getAllData("ap_st_stocking");
    if(d.length<1){
       $alt("���Ȳ�ѯ�����Ϣ��Ȼ���̵㣡");
       return;
    }
    d.push(ss);
    
    doPost("/storage/check_save.do",d,cLoadEvent("ap_st_stocking",ss));
 }  
 
 var TBar=function(){
    return [
       "&nbsp;&nbsp;�̵���","&nbsp;","-","&nbsp;",
       createField({xtype:"datetime",width:100,id:"ap_st_stocking_check_no"}),
       "&nbsp;",
       {iconCls:"gridBarItemQuery",pressed:true,text:"��ѯ",handler:stockingQuery},
       "&nbsp;",
       {iconCls:"stocking",pressed:true,text:"�̵�",handler:checkSave}
    ];
 }
 
 function stockingQuery(){
    var d={check_no:getCmp("ap_st_stocking_check_no").getValue()};
    if(d.check_no=="" || !d.check_no){
       $alt("��ѡ��һ�����ڽ����̵��ѯ��");
       return;
    }
    
    load("ap_st_stocking",d);
 }
 

   
 var grid=cEditGrid({
    id          : "ap_st_stocking",
    label       : "����̵�",
    items       : stockingFields,
    region      : "center",
    url         : "/storage/check_query.do",
    filter      : false,
    tbar        : new TBar()
 });
 


return [grid];