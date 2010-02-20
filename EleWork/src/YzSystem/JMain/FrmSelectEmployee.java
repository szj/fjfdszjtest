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
public class FrmSelectEmployee extends FrmFunctionBase {
    public FrmSelectEmployee() throws wlglException {
        super();
        // ����ҳ�����
        caption = "Ա��ѡ��";

        // ���ò�ѯ���
        qryComps.clear();
        qryComps.add(new EditComponent("","����", "a.TheCode","like","QTheCode","","","","",""));
        qryComps.add(new EditComponent("","����","a.TheName","like","QTheName","","","","",""));
        qryComps.add(new EditComponent("EmployeTypeCode","����", "a.EmployeTypeCode","=","QEmployeTypeCode","","","","",""));

        // ���ò�ѯSQL
        qry_selectSQL ="select a.TheCode EmployeeCode,  a.EmployeTypeCode,a.TheName EmployeeName, a.RelTelphone, a.DepCode,i.TheName DepName" +
	        		"\n"+ " from tbdatumemployee a "+
	           		"\n"+"left outer join (select a.RowNo,a.TheName from tssystemsubjectrecord  a left outer join tssystemrecord b on b.TheCode=a.TheCode and b.SubjectSort=b.SubjectSort" +
	           		"\n"+"where b.Flag='EmployeTypeCode') e on e.RowNo=a.EmployeTypeCode"+
	        		"\n"+"left outer join tbdatumdepartment i on a.DepCode=i.Thecode";
        
	    //qry_whereSQL=" f.flag='EmployeTypeCode' ";

        // ����������
        columnsInfo.clear();
        Properties prop1= new Properties();
        columnsInfo.add(prop1);
        prop1.setProperty("type","choose");
        prop1.setProperty("title","����");
        prop1.setProperty("data","0");
        
        Properties prop2= new Properties();
        columnsInfo.add(prop2);
        prop2.setProperty("type","choose"); 	
        prop2.setProperty("title","����");
        prop2.setProperty("data","2");

        Properties prop3= new Properties();
        columnsInfo.add(prop3);
        prop3.setProperty("title","����");
        prop3.setProperty("data","5");
        
        Properties prop4= new Properties();
        columnsInfo.add(prop4);
        prop4.setProperty("title","��ϵ�绰");
        prop4.setProperty("data","3");

    }
}
