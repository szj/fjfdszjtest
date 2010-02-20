package YzSystem.JMain;

import java.util.ArrayList;
import java.util.Properties;

/**
 * <p>Title:selectProduct.jsp������� </p>
 *
 * <p>Description: ����selectProduct.jsp������</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-17  ���ɴ���
 */
public class FrmSelectProduct extends FrmFunctionBase {
    public FrmSelectProduct() throws wlglException {
        super();
        // ����ҳ�����
        caption = "��Ʒѡ��";

        // ���ò�ѯ���
        qryComps.clear();
        qryComps.add(new EditComponent("","��Ʒ���", "a.TheCode","like","QTheCode","","","","",""));
        qryComps.add(new EditComponent("","��Ʒ����","a.TheName","like","QTheName","","","","",""));
        qryComps.add(new EditComponent("ProductTypeCode","��Ʒ�������", "a.ProductTypeCode","=","QProductTypeCode","","","","",""));

        // ���ò�ѯSQL
        qry_selectSQL ="select 	a.TheCode ProductCode,a.ProductTypeCode,  a.TheName ProductName,g.TheName ProductTypeName,  a.SpecCode,c.TheName SpecName, a.UnitCode,e.TheName UnitName,a.ModelCode,b.TheName ModelName ,a.Remark" +
		"\n"+"from tbdatumproduct a " +
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='ModelCode') b on b.RowNo=a.ModelCode" +
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='SpecCode') c on c.RowNo=a.SpecCode" +
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='UnitCode') e on e.RowNo=a.UnitCode"+
   		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
   		"\n"+"where b.Flag='ProductTypeCode') g on g.RowNo=a.ProductTypeCode";
		
        
        qry_orderSQL = "order by a.TheCode desc ";

        // ����������
        columnsInfo.clear();
        Properties prop1= new Properties();
        columnsInfo.add(prop1);
        prop1.setProperty("type","choose");
        prop1.setProperty("title","��Ʒ���");
        prop1.setProperty("data","0");
        
        Properties prop2= new Properties();
        columnsInfo.add(prop2);
        prop2.setProperty("type","choose");
        prop2.setProperty("title","��Ʒ����");
        prop2.setProperty("data","2");

        Properties prop3= new Properties();
        columnsInfo.add(prop3);
        prop3.setProperty("type","choose");
        prop3.setProperty("title","��Ʒ���");
        prop3.setProperty("data","3");
        
        /*
        Properties prop8= new Properties();
        columnsInfo.add(prop8);
        prop8.setProperty("title","�ͺű��");
        prop8.setProperty("data","8");
        */
        Properties prop9= new Properties();
        columnsInfo.add(prop9);
        prop9.setProperty("title","�ͺ�");
        prop9.setProperty("data","9");
        
        /*
        Properties prop6= new Properties();
        columnsInfo.add(prop6);
        prop6.setProperty("title","�����");
        prop6.setProperty("data","4");
        */
        
        Properties prop4= new Properties();
        columnsInfo.add(prop4);
        prop4.setProperty("title","���");
        prop4.setProperty("data","5");
        
        /*
        Properties prop7= new Properties();
        columnsInfo.add(prop7);
        prop7.setProperty("title","��λ���");
        prop7.setProperty("data","6");
        */
        
        Properties prop5= new Properties();
        columnsInfo.add(prop5);
        prop5.setProperty("title","��λ");
        prop5.setProperty("data","7");
        

    }
}
