package YzSystem.J_Report;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import YzSystem.JMain.*;

public class FrmRtpStorageApplySortCol extends FrmFunctionBase {
	String qry_GroupbySQL="";
    public FrmRtpStorageApplySortCol() throws wlglException {
 	   super();
	   setQueryComp();
       // ���ò�ѯSQL
	   setQueryInfo();
    }
    private void setQueryComp() throws wlglException {
        EditComponent e1 = new EditComponent("Department",
                                             "���벿��",
                                             "a.ApplyDepCode",
                                             "=",
                                             "QApplyDepCode",
                                             "QApplyDepName",
                                             "",
                                             "",
                                             "",
                                             "");
        e1.setDefDisValue("����ѡ��");
        //e1.setMode("readonly");
        EditComponent e2 = new EditComponent("date",
                                             "¼������",
                                             "a.TheDate",
                                             ">=",
                                             "Qbegindate",
                                             "",
                                             "",
                                             "",
                                             "",
                                             "");
        EditComponent e3 = new EditComponent("date",
                                             "��",
                                             "a.TheDate",
                                             "<=",
                                             "Qenddate",
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
        qryComps.clear();
        qryComps.add(e1);
        qryComps.add(e2);
        qryComps.add(e3);

        qryPanels.clear();
        qryPanels.add(tr1);
    }
    
    private void setQueryInfo() {
        qry_selectSQL ="select e.ProductCode,k.TheName ProductName,f.TheName SepcName,h.TheName UnitName,sum(IFNULL(e.TotalMoney,0)) TotalMoney, sum(IFNULL(e.Number,0)) Number" +
   		"\n"+"from tbstorageapply a left outer join tbdatumemployee b on a.ApplyerCode=b.TheCode" +
   		"\n"+"left outer join tbdatumdepartment c on  a.ApplyDepCode=c.TheCode" +
   		"\n"+"left outer join tbdatumemployee d on a.HandleCode=d.TheCode " +
   		"\n"+"left outer join tbdatumemployee j on a.MarkerCode=j.TheCode" +
   		"\n"+"left outer join tbstorageapplyitem e on a.BillNo=e.BillNo" +
   		"\n"+"left outer join tbdatumproduct k on e.ProductCode=k.TheCode " +
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='SpecCode') f on f.RowNo=k.SpecCode" +
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='UnitCode') h on h.RowNo=k.UnitCode";
        
        qry_orderSQL = "order by k.TheName ";
        qry_GroupbySQL="Group by k.TheName,f.TheName,h.TheName";


        // ����������(���ͣ����⣬��ȣ�������)
        columnsInfo.clear();

        Properties prop1 = new Properties();
        prop1.setProperty("title", "��Ʒ����");
        prop1.setProperty("data", "1");
        columnsInfo.add(prop1);
        
        Properties prop2 = new Properties();
        prop2.setProperty("title", "���");
        prop2.setProperty("data", "2");
        columnsInfo.add(prop2);
        
        Properties prop3 = new Properties();
        prop3.setProperty("title", "��λ");
        prop3.setProperty("data", "3");
        columnsInfo.add(prop3);

        Properties prop4 = new Properties();
        prop4.setProperty("title", "�ܽ��");
        prop4.setProperty("data", "4");
        columnsInfo.add(prop4);

        Properties prop5 = new Properties();
        prop5.setProperty("title", "������");
        prop5.setProperty("data", "5");
        columnsInfo.add(prop5);
    }
    
    
    public String genHtmlTotalResult() throws wlglException {
        UtilDB utildb = new UtilDB();
        String  tmp= "select sum(IFNULL(TotalMoney,0)) TotalMoney, sum(IFNULL(Number,0))Number  from ("+Query_SQL+") a" ;
        //utildb.exeUpdate("create   temporary   table   tmp "+Query_SQL);
        ArrayList a=utildb.exeQueryOneRow(tmp,Query_SQLParam);
        //utildb.exeUpdate("drop table tmp");
        String ototalMoney=(String)a.get(0);
        String ototalNumber=(String)a.get(1);
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

         HttpBase hb=HttpBase.genHttpValue("�ϼƣ������ܽ��:"+ototalMoney+"��������:"+ototalNumber+";");

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
