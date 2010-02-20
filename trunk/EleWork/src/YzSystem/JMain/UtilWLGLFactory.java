package YzSystem.JMain;

import java.util.ArrayList;
import java.util.Properties;

import YzSystem.JMain.*;


/**
 * <p>Title:Webҳ��ؼ�����</p>
 *
 * <p>Description: ��������ҳ�������ҵ����ؿؼ�</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-20  ���ɴ���
 */
public class UtilWLGLFactory {

    /**
     * genClientEdit
     * ���ܣ�������Ŀѡ��ť.
     * @return HttpBase            ����������ť
     */
    public static HttpBase genEdit(EditComponent comp) throws wlglException {

        String edtType = comp.getEdtType();
		String name = comp.getCaption();
		String ID = comp.getID();
		String disID = comp.getDisID();
		String fillCompArray = comp.getFillCompArray();
		String fillIndexArray = comp.getFillIndexArray();
		String selParams = comp.getSelParams();
		boolean mustFill = comp.isMustFill();
		if (edtType.equals("textarea")) {
			return UtilWebFactory.genHttpBaseTextArea(comp, "");
		}

		else if (edtType.equals("date")) {
			return UtilWebFactory.genHttpBaseDateSelect(name, ID, mustFill,
					comp.getColspan());
		}
		// ѡ��ҳ��
		else if (edtType.equals("Employee")) {
			return UtilWebFactory.genHttpBaseAhrefEdit(comp, "selectseqn('"
					+ ID + "','" + disID + "','selectEmployee','EmployeeName',"
					+ fillCompArray + "," + fillIndexArray + ",'')");

		} else if (edtType.equals("EmployeeEx")) {
			return UtilWebFactory.genHttpBaseAhrefEdit(comp, "selectseqnex('"
					+ ID + "','" + disID + "','selectEmployee','EmployeeName',"
					+ fillCompArray + "," + fillIndexArray + ",'')");

		} else if (edtType.equals("Product")) {
			return UtilWebFactory.genHttpBaseAhrefEdit(comp, "selectseqn('"
					+ ID + "','" + disID + "','selectProduct','ProductName',"
					+ fillCompArray + "," + fillIndexArray + ",'')");

		}
		else if (edtType.equals("Client")) {
			return UtilWebFactory.genHttpBaseAhrefEdit(comp, "selectseqn('"
				+ ID + "','" + disID + "','selectClient','ClientName',"
				+ fillCompArray + "," + fillIndexArray + ",'')");

		}
		// ��ѡ��
		else if (edtType.equals("Department")) {
			UtilDB utildb = new UtilDB();
			utildb.exeQuery("select TheCode,TheName from tbdatumDepartment");
			ArrayList val = new ArrayList();
			ArrayList dis = new ArrayList();
			try {
				while (utildb.myRs.next()) {
					val.add(utildb.myRs.getString(1));
					dis.add(utildb.myRs.getString(2));
				}
				utildb.closeCon();
				if (val.size() > 0) {
					return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
				}
			} catch (Exception e) {
				utildb.closeCon();
				wlglException.ProcessMainWebExceptionMessage("203", "genEdit",
						e);

			}
		} else if (edtType.equals("Group")) {
			UtilDB utildb = new UtilDB();
			utildb.exeQuery("select TheCode,TheName from tsSystemGroup order by TheCode");
			ArrayList val = new ArrayList();
			ArrayList dis = new ArrayList();
			try {
				while (utildb.myRs.next()) {
					val.add(utildb.myRs.getString(1));
					dis.add(utildb.myRs.getString(2));
				}
				utildb.closeCon();
				if (val.size() > 0) {
					return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
				}
			} catch (Exception e) {
				utildb.closeCon();
				wlglException.ProcessMainWebExceptionMessage("203", "genEdit",
						e);

			}

		}else if (edtType.equals("vBillSort")) {
			UtilDB utildb = new UtilDB();
			utildb.exeQuery("select BillSort,BillName from vBillSort order by BillSort");
			ArrayList val = new ArrayList();
			ArrayList dis = new ArrayList();
			try {
				while (utildb.myRs.next()) {
					val.add(utildb.myRs.getString(1));
					dis.add(utildb.myRs.getString(2));
				}
				utildb.closeCon();
				if (val.size() > 0) {
					return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
				}
			} catch (Exception e) {
				utildb.closeCon();
				wlglException.ProcessMainWebExceptionMessage("203", "genEdit",
						e);

			}

		}else if (edtType.equals("StorageFlow")) {
			UtilDB utildb = new UtilDB();
			utildb.exeQuery("select BillNo,TheName from tbstorageflow order by BillNo");
			ArrayList val = new ArrayList();
			ArrayList dis = new ArrayList();
			try {
				while (utildb.myRs.next()) {
					val.add(utildb.myRs.getString(1));
					dis.add(utildb.myRs.getString(2));
				}
				utildb.closeCon();
				if (val.size() > 0) {
					return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
				}
			} catch (Exception e) {
				utildb.closeCon();
				wlglException.ProcessMainWebExceptionMessage("203", "genEdit",
						e);

			}
		}else if (edtType.equals("Storage")) {
				UtilDB utildb = new UtilDB();
				utildb.exeQuery("select TheCode,TheName from tbdatumstorage order by TheCode");
				ArrayList val = new ArrayList();
				ArrayList dis = new ArrayList();
				try {
					while (utildb.myRs.next()) {
						val.add(utildb.myRs.getString(1));
						dis.add(utildb.myRs.getString(2));
					}
					utildb.closeCon();
					if (val.size() > 0) {
						return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
					}
				} catch (Exception e) {
					utildb.closeCon();
					wlglException.ProcessMainWebExceptionMessage("203", "genEdit",
							e);

				}


		} else if (edtType.equals("Function")) {
			UtilDB utildb = new UtilDB();
			utildb.exeQuery("select TheCode,TheName from tsSystemFunction order by TheCode");
			ArrayList val = new ArrayList();
			ArrayList dis = new ArrayList();
			try {
				while (utildb.myRs.next()) {
					val.add(utildb.myRs.getString(1));
					dis.add(utildb.myRs.getString(2));
				}
				utildb.closeCon();
				if (val.size() > 0) {
					return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
				}
			} catch (Exception e) {
				utildb.closeCon();
				wlglException.ProcessMainWebExceptionMessage("203", "genEdit",
						e);

			}

		}
		// ��ٱȽϹ̶�
		else if (edtType.equals("bool")) {
			ArrayList val = new ArrayList();
			ArrayList dis = new ArrayList();
			dis.add("��");
			dis.add("��");
			val.add("1");
			val.add("0");
			return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
		} else if (!edtType.equals("")) {
			UtilDB utildb = new UtilDB();
			ArrayList params = new ArrayList();
			params.add(edtType);
			utildb
					.exeQuery(
							"select a.RowNo,a.TheName from tssystemsubjectrecord a "
									+ "\n"
									+ " left outer join tssystemrecord b on b.subjectsort=a.subjectsort and b.TheCode=a.TheCode "
									+ "\n" + "where b.flag=? order by  a.RowNo",
							params);
			ArrayList val = new ArrayList();
			ArrayList dis = new ArrayList();
			try {
				while (utildb.myRs.next()) {
					val.add(utildb.myRs.getString(1));
					dis.add(utildb.myRs.getString(2));
				}
				utildb.closeCon();
				if (val.size() > 0) {
					return UtilWebFactory.genHttpBaseCombobox(comp, dis, val);
				}
			} catch (Exception e) {
				utildb.closeCon();
				wlglException.ProcessMainWebExceptionMessage("203", "genEdit",
						e);

			}
		}

		return UtilWebFactory.genHttpBaseEdit(comp);
    }

    public UtilWLGLFactory() {
    }

    //���Ӹ��������ݰ�
    public static void addColumnsInfo(ArrayList columnsInfo, String title,
                                      String width, StringBuffer si) {
        addColumnsInfo(columnsInfo, "", title, width, si);
    }

    public static void addColumnsInfo(ArrayList columnsInfo, String type,
                                      String title, String width,
                                      StringBuffer si) {
        int i = Integer.parseInt(si.toString());
        si.delete(0, si.length());
        si.append(i + 1);
        Properties prop = new Properties();
        columnsInfo.add(prop);
        prop.setProperty("title", title);
        if (!width.equals("")) {
            prop.setProperty("width", width);
        }
        if (!type.equals("")) {
            prop.setProperty("type", type);
        }
        prop.setProperty("data", Integer.toString(i));
    }
    //������Ϣ�Ĵ�������"d"
    public static void setEditColumns(Properties editcolumns, StringBuffer si,
                                      StringBuffer fi, String dis) {
        int i = Integer.parseInt(si.toString());
        int j = Integer.parseInt(fi.toString());
        if (dis.equals("")) {
            editcolumns.setProperty(Integer.toString(i), Integer.toString(j));
        } else {
            editcolumns.setProperty(Integer.toString(i), Integer.toString(j));
            editcolumns.setProperty(Integer.toString(i) + "d",
                                    Integer.toString(j + 1));
            j = j + 1;
        }
        i = i + 1;
        j = j + 1;
        si.delete(0, si.length());
        si.append(i);
        fi.delete(0, fi.length());
        fi.append(j);

    }

    public static void addEditComps(HttpBase tr, ArrayList editComps,
                                    String atype, String caption, String field,
                                    String id,
                                    String disid, String defvalue,
                                    String defdisvalue,
                                    String mode, boolean mustfill, String width,
                                    String colspan) throws wlglException {
        EditComponent ec = new EditComponent(atype, caption, field, "", id,
                                             disid, defvalue, defdisvalue,
                                             width, colspan);
        if (!mode.equals("")) {
            ec.setMode(mode);
        }
        ec.setMustFill(mustfill);
        editComps.add(ec);
        tr.getElements().add(ec.genHttpBase());
    }
    
    /*
     * �ֿ����
     * 
     */
}
