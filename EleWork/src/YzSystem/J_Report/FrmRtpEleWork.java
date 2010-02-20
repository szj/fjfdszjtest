package YzSystem.J_Report;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import YzSystem.JMain.EditComponent;
import YzSystem.JMain.FrmFunctionBase;
import YzSystem.JMain.HttpBase;
import YzSystem.JMain.UtilCommon;
import YzSystem.JMain.UtilDB;
import YzSystem.JMain.UtilWebTools;
import YzSystem.JMain.wlglException;

public class FrmRtpEleWork extends FrmFunctionBase{
	String qry_GroupbySQL="";
    public FrmRtpEleWork() throws wlglException {
 	   super();
	   setQueryComp();
       // ���ò�ѯSQL
	   setQueryInfo();
    }
    private void setQueryComp() throws wlglException {
        EditComponent e1 = new EditComponent("Employee",
                                             "����ʦ",
                                             "aa.EngineSign",
                                             "=",
                                             "QEngineSigne",
                                             "QEngineSignName",
                                             "",
                                             "",
                                             "",
                                             "");
        e1.setDefDisValue("����ѡ��");
        //e1.setMode("readonly");
        EditComponent e2 = new EditComponent("date",
                                             "¼������",
                                             "aa.TheDate",
                                             ">=",
                                             "Qbegindate",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "");
        EditComponent e3 = new EditComponent("date",
                                             "��",
                                             "aa.TheDate",
                                             "<=",
                                             "Qenddate",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "");
        
        EditComponent e4 = new EditComponent("vBillSort",
                "�������",
                "aa.BillSortCode",
                "=",
                "QBillSortCode",
                "",
                "",
                "",
                "",
                "");

        // ���ý����1������

        HttpBase tr1 = HttpBase.genHttpTR("btd");
        tr1.getElements().add(e1.genHttpBase());
        tr1.getElements().add(e2.genHttpBase());
        tr1.getElements().add(e3.genHttpBase());
        tr1.getElements().add(e4.genHttpBase());
        qryComps.clear();
        qryComps.add(e1);
        qryComps.add(e2);
        qryComps.add(e3);
        qryComps.add(e4);

        qryPanels.clear();
        qryPanels.add(tr1);
    }
    
    private void setQueryInfo() {
        qry_selectSQL ="select aa.BillNo,aa.BillSortCode,bb.BillName BillSortName,aa.TheDate,aa.ClientCode,dd.theName ClientName," +
        		"\n"+"aa.CopartnerType,aa.EngineSign,cc.TheName EngineSignName,aa.TotalMoney,aa.Number from" +
        		"\n"+"(select a.BillNo,a.BillSortCode,a.TheDate,a.ClientCode,a.CopartnerType,a.EngineSign,sum(IFNULL(b.TotalMoney,0)) TotalMoney,sum(IFNULL(b.Number,0)) Number from tbeleworkoutrepair a " +
        		"\n"+"left outer join tbeleworkoutrepairItemdetail b on a.billno=b.billno group by a.BillNo,a.BillSortCode,a.TheDate,a.ClientCode,a.CopartnerType,a.EngineSign " +
        		"\n"+"union all" +
        		"\n"+"select a.BillNo,a.BillSortCode,a.TheDate,a.ClientCode,a.CopartnerType,a.EngineSign,sum(IFNULL(b.TotalMoney,0)) TotalMoney,sum(IFNULL(b.Number,0)) Number from tbeleworkrepair a " +
        		"\n"+"left outer join tbeleworkrepairItem b on a.billno=b.billno group by a.BillNo,a.BillSortCode,a.TheDate,a.ClientCode,a.CopartnerType,a.EngineSign " +
         		"\n"+"union all" +
        		"\n"+"select BillNo,BillSortCode,PatrolDate,ClientCode,CopartnerType,EngineSign,0,0 from tbeleworkpatrol" +
        		"\n"+")aa" +
        		"\n"+"left outer join vBillSort bb on aa.BillsortCode=bb.BillSort" +
        		"\n"+"left outer join tbdatumemployee cc on aa.EngineSign=cc.TheCode" +
        		"\n"+"left outer join tbdatumcopartner dd on aa.ClientCode=dd.theCode and aa.CopartnerType=dd.CopartnerType";
        
        qry_orderSQL = "order by aa.BillNo ";
        //qry_GroupbySQL="Group by a.ApplyDepCode, c.TheName";
    
        // ����������(���ͣ����⣬��ȣ�������)
        columnsInfo.clear();

        Properties prop2 = new Properties();
        prop2.setProperty("title", "���ݺ�");
        prop2.setProperty("width", "15%");
        prop2.setProperty("data", "0");
        columnsInfo.add(prop2);

        Properties prop3 = new Properties();
        prop3.setProperty("title", "�������");
        prop3.setProperty("width", "10%");
        prop3.setProperty("data", "2");
        columnsInfo.add(prop3);

        Properties prop4 = new Properties();
        prop4.setProperty("title", "��������");
        prop4.setProperty("width", "10%");
        prop4.setProperty("data", "3");
        columnsInfo.add(prop4);
        
        Properties prop5 = new Properties();
        prop5.setProperty("title", "�ͻ�");
        prop5.setProperty("width", "10%");
        prop5.setProperty("data", "5");
        columnsInfo.add(prop5);
        
        Properties prop6 = new Properties();
        prop6.setProperty("title", "����ʦ");
        prop6.setProperty("width", "10%");
        prop6.setProperty("data", "8");
        columnsInfo.add(prop6);
        
        Properties prop7 = new Properties();
        prop7.setProperty("title", "���");
        prop7.setProperty("width", "10%");
        prop7.setProperty("data", "9");
        columnsInfo.add(prop7);
        
        
        Properties prop8 = new Properties();
        prop8.setProperty("title", "����");
        prop8.setProperty("width", "10%");
        prop8.setProperty("data", "10");
        columnsInfo.add(prop8);
    }
    
    
    public String genHtmlTotalResult() throws wlglException {
        UtilDB utildb = new UtilDB();
        String  tmp= "select sum(IFNULL(TotalMoney,0)) TotalMoney, sum(IFNULL(Number,0))Number,count(*) RecoderNumber  from ("+Query_SQL+") a" ;
        ArrayList a=utildb.exeQueryOneRow(tmp,Query_SQLParam);
        String ototalMoney=(String)a.get(0);
        String ototalNumber=(String)a.get(1);
        String ototalRecordNumber=(String)a.get(2);
        utildb.closeCon();
        HttpBase base = new HttpBase();
        HttpBase table11 = HttpBase.genHttpTable("btd", "100%", "1", "5",
                                                 "0");
        base.getElements().add(table11);
        HttpBase tr111 = HttpBase.genHttpTR("btd");
        table11.getElements().add(tr111);
        HttpBase td1111 = new HttpBase();
        td1111.setTag("td");
        td1111.getProperties().setProperty("height", "36");
        td1111.getProperties().setProperty("align", "right");
        tr111.getElements().add(td1111);

         HttpBase hb=HttpBase.genHttpValue("�ϼƣ��ܽ��:"+ototalMoney+"��������:"+ototalNumber+";������:"+ototalRecordNumber+";");

        td1111.getElements().add(hb);

         return base.GenHtml();
    }
    
    public String genHtmlMain() throws wlglException {
        String result = "";
        result = genHtmlPos();
        seqn = UtilCommon.NVL(UtilWebTools.getRequestParameter("seqn"));
        if (mode.equals("query")) {
            // ����¼����
            result += genHtmlQueryComp();
            // ��ѯ�����
            result += genHtmlQueryResult();
            // ��ɾ�Ĳ鰴ť
            result += genHtmlTotalResult();
        }

        return result;
    }
    
    /**
     * genQueryDBResult
     * ���ܣ����ݵ�ǰ������ѯ���ݿ⣬ȡ�÷������������ݿ���
     * @return UtilDB  ���ݿ��ѯ���
     */
    public UtilDB genDBQueryResult() throws wlglException {
        UtilDB utilDB = new UtilDB();
        ArrayList params = new ArrayList();
        Iterator itx = qryComps.iterator();
        String mywhereStr = "";
        String conditionparam = "";
        mywhereStr = "";
        // ���춯̬SQL������.��
        while (itx.hasNext()) {
            EditComponent comp = (EditComponent) itx.next();
            String param = "";
            String qval = "";
            if (initpage) {
                param = comp.getQryValue();
                qval = comp.getValue();
                if (param.equals("")) {
                    param = comp.getQryValue(comp.getDefValue());
                    qval = comp.getDefValue();
                }
            } else {
                param = comp.getQryValue();
                qval = comp.getValue();
            }
            if (!param.equals("")) {
                if (!comp.getField().equals("")) {
                    if (!mywhereStr.equals("")) {
                        mywhereStr += " and (upper(" + comp.getField() + ") " +
                                comp.getOper() +
                                " upper(?" +"))";
                    } else {
                        mywhereStr += "(upper(" + comp.getField() + ") " +
                                comp.getOper() +
                                " upper(?" +"))";
                    }
                    params.add(param);
                }
                if (conditionparam.equals("")) {
                    conditionparam += comp.getID() + "=" + qval;
                } else {
                    conditionparam += "&" + comp.getID() + "=" + qval;
                }

                if (!comp.getDisID().equals(comp.getID())) {
                    conditionparam += "&" + comp.getDisID() + "=" +
                            comp.getDisValue();
                }
            }

        }
        if (!qry_whereSQL.equals("")) {
            if (!mywhereStr.equals("")) {
                mywhereStr += " and " + qry_whereSQL;
            } else {
                mywhereStr = qry_whereSQL;
            }
            params.addAll(qry_whereSQLParam);
        }
        if (!(mywhereStr.equals(""))) {
            mywhereStr = " where " + mywhereStr;
        }
        findparam = "?tseqn=" + tseqn;
        if (!conditionparam.equals("")) {
            findparam += "&" + conditionparam;
        }
        Query_SQL = qry_selectSQL + " " + mywhereStr + " " +qry_GroupbySQL;
        Query_SQLParam = params;
        utilDB.exeQuery(qry_selectSQL + " " + mywhereStr + " " +qry_GroupbySQL+" "+
                        qry_orderSQL,
                        params);
        return utilDB;
    }

}
