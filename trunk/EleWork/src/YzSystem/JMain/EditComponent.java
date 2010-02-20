package YzSystem.JMain;

/**
 * <p>Title:�ؼ������� </p>
 *
 * <p>Description: �ؼ�������</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ����:
 * ����ѯ�õĿؼ���������������
 * 1.������ʾ���û��༭��ѯ���ݵı༭��,idΪdisID,captionΪcaption
 * 2.�����洢��ѯ���ݵı༭��,�ؼ�idΪID,��ͨ�����1Ϊͬ���ؼ�.
 *   �������ΪhiddenInput�ؼ�����������Ӧ�����ݿ�seqn,��������Ӧ�ľ����flag.
 * ��ʷ:
 * 2005-04-25  ���ɴ���
 */

public class EditComponent {
    private String field = ""; // ��Ӧ�����ݿ��ֶ�
    private String ID = ""; // field��Ӧ�Ľ���ؼ�id
    private String defValue = ""; // ȱʡֵ
    private String disID = ""; // ��ʾ���û��Ľ���ؼ�id
    private String defDisValue = ""; // ��ʾ��ȱʡֵ
    private String oper = "="; // ��ѯ����:=,>,<�ȵ�
    private String mode = ""; // �༭������
    private String colspan = ""; // field��Ӧ�ı����
    private String width = ""; // field��Ӧ�ı����
    private boolean mustFill = false; //�����־
    private boolean unique = false; //Ψһ��־
    private boolean mustInt = false; // ��������
    private String edtType = ""; //�༭������:normal:��ͨ;date:����ѡ��;project:��Ŀѡ��...
    private String caption = ""; //�༭���label��ʾ�ַ���
    private String fillCompArray = "[]"; // �ͱ��ֶι������ֶ�
    private String fillIndexArray = "[]"; // �ͱ��ֶι������ֶζ�Ӧ��ѡ��������


    /**
     * UtilEditComponent
     * ����: �����ؼ�
     * @param atype   String  �༭������:normal:��ͨ;date:����ѡ��;project:��Ŀѡ��...
     * @param caption String  �ؼ�����
     * @param field   String  ���ݿ��Ӧ��field
     * @param oper    String  �˿ؼ���Ӧ�Ĳ�ѯ������:like,=,<=...     *
     * @param id      String  �ؼ�ID
     * @param disid   String  ��ʾ�Ŀؼ�ID
     * @param defvalue      String  Ĭ��ֵ
     * @param defDisValue   String  Ĭ����ʾֵ
     */
    public EditComponent(String atype, String caption, String field,
                         String oper, String id,
                         String disid, String defvalue, String defDisValue,
                         String width, String colspan) {
        setEdtType(atype);
        setCaption(caption);
        setOper(oper);
        setDisID(disid);
        setID(id);
        setField(field);
        setDefValue(defvalue);
        setDefDisValue(defDisValue);
        setWidth(width);
        setColspan(colspan);
    }
    public EditComponent(EditComponent acomp) {
        setEdtType(acomp.getEdtType());
        setCaption(acomp.getCaption());
        setOper(acomp.getOper());
        setDisID(acomp.getDisID());
        setID(acomp.getID());
        setField(acomp.getField());
        setDefValue(acomp.getDefValue());
        setDefDisValue(acomp.getDefDisValue());
        setWidth(acomp.getWidth());
        setColspan(acomp.getColspan());
        this.setFillCompArray(acomp.getFillCompArray());
        this.setFillIndexArray(acomp.getFillIndexArray());
        this.setMustFill(acomp.isMustFill());
        this.setMustInt(acomp.isMustInt());
        this.setDbDisField(acomp.getDbDisField());
        this.setDbField(acomp.getDbField());
        this.setMode(acomp.getMode());
        this.setSelParams(acomp.getSelParams());
        this.setUnique(acomp.isUnique());
        this.setMustFloat(acomp.isMustFloat());
    }

    public EditComponent(String caption, String field) {
        this("", caption, field, "", "", "", "", "", "", "");
    }

    public EditComponent() {
        this("", "", "", "", "", "", "", "", "", "");
    }

    public EditComponent(String atype, String caption, String field) {
        this(atype, caption, field, "", "", "", "", "", "", "");
    }

    /**
     * getValue
     * ����: ȡ�ÿؼ�value
     * @return   String  �ؼ�ֵ
     */
    public String getValue() {
        String val = UtilCommon.NVL(UtilWebTools.getRequestParameter(ID));
        return val;
    }

    /**
     * getDisValue
     * ����: ȡ����ʾ�ؼ���value
     * @return   String  �ؼ�ֵ
     */
    public String getDisValue() {
        return UtilCommon.NVL(UtilWebTools.getRequestParameter(disID));
    }

    /**
     * getQryValue
     * ����: ȡ�ò�����ѯ�õ�value
     * @return   String  �ؼ�ֵ
     */
    public String getQryValue() {
        String val = getValue();
        val = getQryValue(val);
        return val;
    }

    public String getQryValue(String avalue) {
        if (oper.equals("like")) {
            if (!avalue.equals("")) {
                avalue = "%" + avalue + "%";
            }
        }
        return avalue;
    }

    /**
     * getHttpBase()
     * ����httpBase;
     * @return HttpBase
     */
    public HttpBase genHttpBase() throws wlglException {
        HttpBase httpBase = UtilWLGLFactory.genEdit(this);
        if (!UtilWebTools.
            getRequestParameter(ID).equals("")) {
            HttpBase.setCompValue(httpBase, disID,
                                  UtilWebTools.
                                  getRequestParameter(disID));
            HttpBase.setCompValue(httpBase, ID,
                                  UtilWebTools.
                                  getRequestParameter(ID));

        }
        return httpBase;
    }

    public void setCaption(String caption) {
        if (caption != null && !caption.equals("")) {
            this.caption = caption;
        }
    }

    public String getCaption() {
        return caption;
    }

    public void setColspan(String colspan) {
        if (colspan != null && !colspan.equals("")) {
            this.colspan = colspan;
        }
    }

    public String getColspan() {
        return colspan;
    }

    public void setDefDisValue(String defDisValue) {
        if (defDisValue != null && !defDisValue.equals("")) {
            this.defDisValue = defDisValue;
        }
    }

    public String getDefDisValue() {
        return defDisValue;
    }

    public void setDefValue(String defValue) {
        if (defValue != null && !defValue.equals("")) {
            this.defValue = defValue;
            if (defDisValue.equals("")) {
                setDefDisValue(defValue);
            }
        }
    }

    public String getDefValue() {
        return defValue;
    }

    public void setDisID(String disID) {
        if (disID != null && !disID.equals("")) {
            this.disID = disID;
        }
    }

    public String getDisID() {
        return disID;
    }

    public void setEdtType(String edtType) {
        if (edtType != null && !edtType.equals("")) {
            this.edtType = edtType;
        }
    }

    public String getEdtType() {
        return edtType;
    }

    public void setField(String field) {
        if (field != null && !field.equals("")) {
            this.field = field;
            if (this.ID.equals("")) {
                setID(field);
            }
        }
    }

    public String getField() {
        return field;
    }

    public void setID(String ID) {
        if (ID != null && !ID.equals("")) {
            this.ID = ID;
            if (disID.equals("")) {
                setDisID(ID);
            }
        }
    }

    public String getID() {
        return ID;
    }

    public void setMode(String mode) {
        if (mode != null && !mode.equals("")) {
            this.mode = mode;
        }
    }

    public String getMode() {
        return mode;
    }

    public void setMustFill(boolean mustFill) {
        this.mustFill = mustFill;
    }

    public boolean isMustFill() {
        return mustFill;
    }

    public void setOper(String oper) {
        if (caption != null && oper.equals("")) {
            this.oper = "=";
        } else {
            this.oper = oper;
        }
    }

    public String getOper() {
        return oper;
    }

    public void setUnique(boolean unique) {
        this.unique = unique;
    }

    public boolean isUnique() {
        return unique;
    }

    public void setWidth(String width) {
        if (width != null && !width.equals("")) {
            this.width = width;
        }
    }

    public void setFillCompArray(String fillCompArray) {
        this.fillCompArray = fillCompArray;
    }

    public void setFillIndexArray(String fillIndexArray) {
        this.fillIndexArray = fillIndexArray;
    }

    public void setMustInt(boolean mustInt) {
        this.mustInt = mustInt;
    }

    public void setSelParams(String selParams) {
        this.selParams = selParams;
    }

    public void setDbField(String dbField) {
        this.dbField = dbField;
    }

    public void setDbDisField(String dbDisField) {
        this.dbDisField = dbDisField;
    }

    public void setMustFloat(boolean MustFloat) {
        this.MustFloat = MustFloat;
    }

    public String getWidth() {
        return width;
    }

    public String getFillCompArray() {
        return fillCompArray;
    }

    public String getFillIndexArray() {
        return fillIndexArray;
    }

    public boolean isMustInt() {
        return mustInt;
    }

    public String getSelParams() {
        return selParams;
    }

    public String getDbField() {
        return dbField;
    }

    public String getDbDisField() {
        return dbDisField;
    }

    public boolean isMustFloat() {
        return MustFloat;
    }

    private String selParams;
    private String dbField;
    private String dbDisField;
    private boolean MustFloat;

}
