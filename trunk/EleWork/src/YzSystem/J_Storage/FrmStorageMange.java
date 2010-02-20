package YzSystem.J_Storage;

import java.util.*;

import YzSystem.JMain.*;

public class FrmStorageMange  extends FrmFunctionBase {
	
	String qry_GroupbySQL="";
    public FrmStorageMange() throws wlglException {
 	   super();
	   setQueryComp();
       // ���ò�ѯSQL
	   setQueryInfo();
    }
    private void setQueryComp() throws wlglException {
        EditComponent e1 = new EditComponent("Storage",
                                             "�ֿ�",
                                             "a.StorageCode",
                                             "=",
                                             "QStorageCode",
                                             "QStorageName",
                                             "",
                                             "",
                                             "",
                                             "");
        e1.setDefDisValue("����ѡ��");

        
        EditComponent e2 = new EditComponent("",
                "���к�",
                "a.ListNo",
                "like",
                "QListNo",
                "",
                "",
                "",
                "",
                "");

        // ���ý����1������

        HttpBase tr1 = HttpBase.genHttpTR("btd");
        tr1.getElements().add(e1.genHttpBase());
        tr1.getElements().add(e2.genHttpBase());

        qryComps.clear();
        qryComps.add(e1);
        qryComps.add(e2);

        qryPanels.clear();
        qryPanels.add(tr1);
    }
    
    private void setQueryInfo() {
        qry_selectSQL ="select a.StorageCode, c.TheName StorageName,a.PlaceCode, a.ProductCode,d.TheName ProductName," +
        		"\n"+"a.ProductTypeCode, Number,b.ListNo,b.AssentsCode " +
        		"\n"+"from tbstorage a left outer join tbstorageItem b on a.StorageCode=b.StorageCode and a.Placecode=b.Placecode " +
        		"\n"+"and a.ProductCode=b.ProductCode and a.ProductTypeCode=b.ProductTypeCode" +
        		"\n"+"left outer join tbdatumstorage c on c.TheCode=a.StorageCode" +
        		"\n"+"left outer join tbdatumproduct d on a.ProductCode=d.TheCode and a.ProductTypeCode=b.ProductTypeCode";
        
        qry_orderSQL = "order by a.StorageCode,b.ListNo";
    
        // ����������(���ͣ����⣬��ȣ�������)
        columnsInfo.clear();

        Properties prop2 = new Properties();
        prop2.setProperty("title", "�ֿ�");
        prop2.setProperty("data", "1");
        columnsInfo.add(prop2);

        Properties prop3 = new Properties();
        prop3.setProperty("title", "�豸");
        prop3.setProperty("data", "4");
        columnsInfo.add(prop3);

        Properties prop4 = new Properties();
        prop4.setProperty("title", "����");
        prop4.setProperty("data", "6");
        columnsInfo.add(prop4);
        
        Properties prop5 = new Properties();
        prop5.setProperty("title", "���к�");
        prop5.setProperty("data", "7");
        columnsInfo.add(prop5);
        
        Properties prop6 = new Properties();
        prop6.setProperty("title", "���ʺ�");
        prop6.setProperty("data", "8");
        columnsInfo.add(prop6);
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
            //result += genHtmlTotalResult();
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
