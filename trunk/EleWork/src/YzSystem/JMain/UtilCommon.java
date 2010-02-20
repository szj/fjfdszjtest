package YzSystem.JMain;

import javax.servlet.http.HttpServletRequest;
import java.util.Hashtable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>Title:��������</p>
 *
 * <p>Description: ��������</p>
 *
 * <p>Copyright: Copyright (c) 2005</p>
 *
 * <p>Company: Ȫ��������Ϣ��������</p>
 * @author qsy
 * @version 1.0
 * ��ʷ:
 * 2005-04-13  ���ɴ���
 */
public class UtilCommon {
    public UtilCommon() {
    }

    /**
     * NVL
     * ���ܣ�null��Ϊ""
     * @param aString String  �ַ���
     * @return String         ���صķǿ��ַ���
     */
    public static String NVL(String aString) {
        String val = "";
        if (aString != null) {
            val = aString;
        }
        return val;
    }

    public String getString(HttpServletRequest request, String ParamName,
                            String DefaultVal) {
        String t = request.getParameter(ParamName);
        if (t != null && !t.equals("")) {
            return (t);
        } else {
            return DefaultVal;
        }
    }

    static public int getInt(HttpServletRequest request, String ParamName) {
        if (request.getParameter(ParamName) != null) {
            return (Integer.parseInt(request.getParameter(ParamName)));
        } else {
            return (0);
        }
    }

    static public int getInt(Hashtable request, String ParamName) {
        if (request.get(ParamName) != null) {
            return (Integer.parseInt(java.lang.String.valueOf(request.get(
                    ParamName))));
        } else {
            return (0);
        }
    }

    static public int getInt(String ParamName) {
        if ((ParamName != null) && (!ParamName.equals(""))) {
            return (Integer.parseInt(ParamName));
        } else {
            return (0);
        }
    }

    static public String getDate(Date aDate,String fmtStr) {
        SimpleDateFormat us = new SimpleDateFormat(fmtStr);
        return us.format(aDate);
    }
    static public String getDate(String fmtStr) {
        return getDate(new Date(),fmtStr);
    }
    static public String getDate() {
        return getDate(new Date(),"yyyyMMdd");
    }
    static public String getTime() {
        return getDate(new Date(),"yyyyMMddHHmmss");
    }

    //--- ����ת��������������� ---
    public String GBK2ISO(String InputStr) throws Exception {
        if (InputStr != null) {
            //System.err.println("ת��ǰ:"+InputStr);
            //System.err.println("ת����:"+new String(InputStr.getBytes("GBK"),"ISO8859_1"));
            //System.err.println("ת������:"+new String(InputStr.getBytes("8859_1")));
            //return(new String(InputStr.getBytes("GBK"),"ISO8859_1"));
            return (new String(InputStr.getBytes("8859_1")));
        } else {
            return ("");
        }

    }

    public String ISO2GBK(String InputStr) throws Exception {
        return (new String(InputStr.getBytes("ISO8859_1"), "GBK"));
    }

    //--- �滻���� ---
    static public String Replace(String OldStr, String NewStr,
                                 String SourceStr) {
        int i;
        StringBuffer buffer = new StringBuffer();

        i = SourceStr.indexOf(OldStr);
        if (i == -1) {
            return (SourceStr);
        }
        buffer.append(SourceStr.substring(0, i) + NewStr);
        if ((i + OldStr.length()) < SourceStr.length()) {
            buffer.append(Replace(OldStr, NewStr,
                                  SourceStr.substring((i + OldStr.length()),
                    SourceStr.length())));
        }
        return (buffer.toString());
    }

    public String[] Split(String tag, String fieldsru) {
        char dot = tag.charAt(0);
        String field;
        field = fieldsru + dot;
        int num = 0;
        int field_len = field.length();
        for (int i = 0; i < field_len; i++) {
            if (field.charAt(i) == dot) {
                num++;
            }
        }
        String returnarray[] = new String[num];
        int begin = 0;
        int end;
        for (int j = 0; j < num; j++) {
            end = field.indexOf(dot, begin);
            returnarray[j] = field.substring(begin, end);
            begin = end + 1;
        }
        return (returnarray);
    }
  
}
