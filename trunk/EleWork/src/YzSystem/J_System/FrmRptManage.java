package YzSystem.J_System;

import YzSystem.JMain.*;

import java.io.File;
import java.io.FileReader;
import javax.servlet.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import java.util.*;
import javax.faces.context.FacesContext;

public class FrmRptManage extends FrmFunctionBase {
    public FrmRptManage() {
    }
    /**
     * genHtmlMain
     * ���ܣ�����ҳ����Ҫ��Ϣ
     * @return String         httpString.
     */
    public String genHtmlMain() throws wlglException {
        String result = "";
        result = genHtmlPos();
        seqn = UtilCommon.NVL(UtilWebTools.getRequestParameter("seqn"));
        if (mode.equals("query")) {
            //ȡ��ĿǰĿ¼�Ĵ���Ŀ¼
            String path = "EleWork" + File.separator + "rpt"+File.separator;
            //��������ĿǰĿ¼λ�õ�d����
            File d = new File(path);
            //ȡ�ô���Ŀ¼�������ļ�
            File list[] = d.listFiles();

            // ��ɾ�Ĳ鰴ť-----------------------------
            HttpBase base = new HttpBase();
            HttpBase table = HttpBase.genHttpTable("btd", "100%", "1", "5",
                    "0");
            base.getElements().add(table);
            HttpBase tr = HttpBase.genHttpTR("btd");
            table.getElements().add(tr);
            HttpBase td = new HttpBase();
            td.setTag("td");
            td.getProperties().setProperty("height", "36");
            td.getProperties().setProperty("align", "right");
            tr.getElements().add(td);

            HttpBase uploadbutton=UtilWebFactory.genHttpBaseBtn("upload","�ϴ��ļ�","formSubmit('uploadrpt.jsp');");
            td.getElements().add(uploadbutton);

            HttpBase btnDel = UtilWebFactory.genHttpBaseBtnDel("btnDel");
            HttpBase td2 = new HttpBase();;
            td2.setTag("td");
            td2.getProperties().setProperty("height", "36");
            td2.getProperties().setProperty("align", "right");
            tr.getElements().add(td2);
            td2.getElements().add(btnDel);

            result += base.GenHtml();

            HttpBase hb = new HttpBase();
            HttpBase table11 = new HttpBase();
            table11.setTag("table");
            table11.getProperties().setProperty("class", "btd3");
            table11.getProperties().setProperty("border", "0");
            table11.getProperties().setProperty("cellspacing", "1");
            table11.getProperties().setProperty("cellpadding", "5");
            table11.getProperties().setProperty("width", "100%");
            hb.getElements().add(table11);
            HttpBase tr111 = null;
            for (int i = 0; i < list.length; i++) {
                int m = i % 4;
                if (m == 0) {
                    tr111 = HttpBase.genHttpTR("btd");
                    table11.getElements().add(tr111);
                }

                HttpBase td1 = new HttpBase();
                td1.setTag("td");
                tr111.getElements().add(td1);

                String fname = list[i].getName();
                HttpBase rb = HttpBase.genHttpInputRadio("radio", fname,
                        "Javascript:doWhich();");
                File fileName = new File(path,fname);
                HttpBase val = HttpBase.genHttpValue(fname+"("+fileName.length()+")");
                td1.getElements().add(rb);
                td1.getElements().add(val);
            }
            result += hb.GenHtml();
        }
        else if (mode.equals("del")) {
            String path = "EleWork" + File.separator + "rpt"+File.separator;
            File fileName = new File(path, seqn);
            //���File.txt�Ƿ����
            if (fileName.exists()) {
                //ɾ��File.txt��
                fileName.delete();
                String tmp;
                tmp = "alert('ɾ���ɹ�!');\n"
                      + "self.location.href='" + UtilWebTools.getRequestPath() +
                      findparam + "';";
                HttpBase val = HttpBase.genHttpScript(tmp);
                result += val.GenHtml();
            }
        }
        else if (UtilWebTools.getRequestParameter("action").equals("upload")) {
            // ��ɾ�Ĳ鰴ť-----------------------------
            HttpBase base = new HttpBase();
            HttpBase table = HttpBase.genHttpTable("btd", "100%", "1", "5",
                    "0");
            base.getElements().add(table);
            HttpBase tr1 = HttpBase.genHttpTR("btd");
            table.getElements().add(tr1);
            HttpBase su=HttpBase.genHttpValue("�ϴ��ɹ�!");
            tr1.getElements().add(su);

            HttpBase tr = HttpBase.genHttpTR("btd");
            table.getElements().add(tr);
            HttpBase td = new HttpBase();
            td.setTag("td");
            td.getProperties().setProperty("height", "36");
            td.getProperties().setProperty("align", "right");
            tr.getElements().add(td);

            HttpBase btnCancel = UtilWebFactory.genHttpBaseBtnCancel("btnCancel");
            td.getElements().add(btnCancel);

            result += base.GenHtml();
            ServletFileUpload fu = new ServletFileUpload();
            // ���������û��ϴ��ļ���С,��λ:�ֽ�
            fu.setSizeMax(10000000);
           // ����һ���ļ���С����getSizeThreshold()��ֵʱ���ݴ����Ӳ�̵�Ŀ¼
           //fu.setRepositoryPath("rpt");
           //��ʼ��ȡ�ϴ���Ϣ
           try{
               List fileItems = fu.parseRequest(UtilWebTools.getRequest());
               // ���δ���ÿ���ϴ����ļ�
               Iterator iter = fileItems.iterator();
               while (iter.hasNext()) {
                   FileItem item = (FileItem) iter.next();
                   //�������������ļ�������б���Ϣ
                   if (!item.isFormField()) {
                       String name = item.getName();
                       long size = item.getSize();
                       if ((name == null || name.equals("")) && size == 0)
                           continue;
                       //�����ϴ����ļ���ָ����Ŀ¼
                       name = name.replace(':', '_');
                       name = name.replace('\\', '_');
                       String path = "EleWork" + File.separator + "rpt" +
                                     File.separator;
                       File f = new File(path + name);
                       if (f.exists()) {
                           f.delete();
                       }
                       item.write(f);
                   }
               }
           }catch (org.apache.commons.fileupload.FileUploadException ex){
               wlglException.ProcessMainWebExceptionMessage("101",
                       "ʧ��.",
                       ex);
           }
           catch (java.lang.Exception ex){
               wlglException.ProcessMainWebExceptionMessage("101",
                       "ʧ��.",
                       ex);
           }

        }

        else if (mode.equals("view")) {
            // ��ɾ�Ĳ鰴ť-----------------------------
            HttpBase base = new HttpBase();
            HttpBase table = HttpBase.genHttpTable("btd", "100%", "1", "5",
                    "0");
            base.getElements().add(table);
            HttpBase tr = HttpBase.genHttpTR("btd");
            table.getElements().add(tr);
            HttpBase td = new HttpBase();
            td.setTag("td");
            td.getProperties().setProperty("height", "36");
            td.getProperties().setProperty("align", "right");
            tr.getElements().add(td);

            HttpBase btnCancel = UtilWebFactory.genHttpBaseBtnCancel(
                    "btnCancel");

            td.getElements().add(btnCancel);

            result += base.GenHtml();
            String path = "EleWork" + File.separator + "rpt"+File.separator;
            File fileName = new File(path, seqn);
            try {
                FileReader fr = new FileReader(path + seqn); //����FileReader����,���趨��fr������������
                int c = fr.read(); //���ļ��ж�ȡһ���ֽ�
                while (c != -1) { //�ж��Ƿ��Ѷ����ļ��Ľ�β
                    result += (char) c; //�����ȡ��������
                    c = fr.read(); //���ļ��ж�ȡ����
                    if (c == 13) { //�ж��Ƿ�Ϊ�����ֽ�
                        result += "<BR>"; //������б�ǩ
                        fr.skip(1); //�Թ�һ���ֽ�
                        c = fr.read(); //��ȡһ���ֽ�
                    }
                }
            }
            catch (java.io.IOException ex){
                wlglException.ProcessMainWebExceptionMessage("101",
                        "ʧ��.",
                        ex);
            }

        }
        return result;
    }

}
