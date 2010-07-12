var realTimeStockingFields=[
      {label:"ԭ����ID",name:"mat_id",hide:"all"},
      {label:"ԭ��������",name:"mat_name"},
      {label:"���ز���",name:"dept_name"},
      {label:"�̵����κ�",name:"check_no"},
      {label:"�̵����",name:"mat_num"},
      {label:"�̵�����ɹ���",name:"buy_total"},
      {label:"�̵�����������",name:"sale_total"},
//      {label:"�����˲���",name:"return_total",hide:"all"},
      {label:"��ǰ�����",name:"stog_count"}
      /**
      {label:"��ǰ�����",name:"storage_total"},
      {label:"����̵�����",name:"final_total"},
      {label:"�̵�ɹ���",name:"final_total"},
      {label:"�̵����������",name:"adjust_total",xtype:"number"}
      */
   ];
 
 var TBar=function(){
    return [
       "&nbsp;&nbsp;�̵���","&nbsp;","-","&nbsp;",
       createField({xtype:"date",format:"Ymd",width:100,id:"ap_st_stocking_check_no"}),
       "&nbsp;",
       {iconCls:"gridBarItemQuery",pressed:true,text:"��ѯ",handler:stockingQuery}
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
    label       : "ʵʱ���",
    items       : realTimeStockingFields,
    region      : "center",
    url         : "/storage/realTime_query.do",
    filter      : false,
    tbar        : new TBar()
 });
 


return [grid];