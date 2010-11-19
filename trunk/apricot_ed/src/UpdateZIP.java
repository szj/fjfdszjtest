import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 */

/**
 * @author xudahu
 * 
 */
public class UpdateZIP {
	private String projectDir = "G:/Java/apricot_ed/src";
	private String version = "";
	//private String build = projectDir + "/build";
	private String build = "G:/Java/apricot_edex/src";
	/**
	 * 
	 */
	public UpdateZIP() {
		// TODO Auto-generated constructor stub
	}
	/**
	 * 
	 * Purpose      : ���������,������
	 * @param f
	 */
	private void delete(File f) {
		if (!f.exists())
			return;
		if (f.isDirectory()) {
			File[] list = f.listFiles();
			for (int i = 0; i < list.length; i++) {
				delete(list[i]);
			}
		}

		f.delete();
	}
	//===========================================================================
	/**
	 * 
	 * Purpose      : ����ָ����/version/modify_list.txt���޸��б����ļ�
	 * @param versionNo
	 * @throws IOException
	 */
	private void zip(String versionNo) throws IOException {
		this.version = new StringBuffer(this.projectDir).append("/version/")
				.append(versionNo).toString();
		File b = new File(this.build);
		delete(b);
		b.mkdirs();
		//
		BufferedReader modifyList = new BufferedReader(new InputStreamReader(
				new FileInputStream(un(this.version, "modify_list.txt"))));
		String line = null;
		while ((line = modifyList.readLine()) != null) {
			if (line.trim().length() == 0)
				continue;
			line = line.trim();
			System.out.println(line);
			copy(un(this.projectDir, line), un(this.build, line));

		}
		copy(un(this.version, "readme.txt"), un(this.build, "readme.txt"));

		modifyList.close();

	}

	private void copy(String s, String d) {
		FileInputStream source = null;
		FileOutputStream target = null;
		try {
			new File(d).getParentFile().mkdirs();
			source = new FileInputStream(s);
			target = new FileOutputStream(d);
			byte[] b = new byte[1024];
			int len = 0;
			while ((len = source.read(b)) > 0) {
				target.write(b, 0, len);
			}
		} catch (Exception e) {
			System.out.println("�ļ���������:" + s);
		}

		try {
			if (source != null)
				source.close();
		} catch (Exception ex) {
		}
		;
		try {
			if (target != null)
				target.close();
		} catch (Exception ex) {
		}
		;
	}

	private String un(String p, String a) {
		if (!a.startsWith("/"))
			a = "/" + a;
		return p + a;
	}
	//===========================================================================
	/**
	 * ת����Ŀ�ı��뷽ʽ��gbk��utf-8
	 */
	private void transfer() throws IOException {
		//Ŀ���ļ�
		File t = new File(this.build);
		//���ԭ��������
		delete(t);
		//�����µ��ļ���
		t.mkdirs();
		//Դ�ļ�
		File s = new File(this.projectDir);
		tarsferwhile(s,t);
	}

	
	public static List ignoreList = new ArrayList();
	static{
		ignoreList.add(".svn");
		ignoreList.add(".dll");
		ignoreList.add(".pdm");
		
		ignoreList.add(".gif");
		ignoreList.add(".css");
		ignoreList.add(".db");
		ignoreList.add(".jpg");
		ignoreList.add(".xml");
		ignoreList.add("lib");
	}
	
	private static boolean isIgnoreFile(File file) {

		for(int i = 0; i < ignoreList.size(); i++) {
			if(file.getName().equals(ignoreList.get(i))) {
				return true;
			}
		}
		return false;
	}
	
	private void tarsferwhile(File s,File t){
		//��������ļ�
		if(isIgnoreFile(s)){
			return;
		}
		if (!s.exists())
			return;
		else if (s.isDirectory()) {
			File[] list = s.listFiles();
			//�����Ŀ¼,��Ŀ���ļ���Ҳ����Ŀ¼
			int beginIndex=projectDir.length();
			try {
				new File(un(this.build,s.getCanonicalPath().substring(beginIndex))).mkdirs();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for (int i = 0; i < list.length; i++) {
				tarsferwhile(list[i],t);
			}
		}else{//Ҷ�ӽ��
			 try {
				 int beginIndex=projectDir.length();
				// if(s.)
				 transferFile(s.getCanonicalPath(), un(this.build,s.getCanonicalPath().substring(beginIndex)));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	//��һ��GBK������ļ�ת��UTF8��������ļ� 2010-11-18
	private static void transferFile(String srcFileName, String destFileName) throws IOException {
		   String line_separator = System.getProperty("line.separator"); 
		   FileInputStream fis = new FileInputStream(srcFileName);
		   StringBuffer content = new StringBuffer();
		   DataInputStream in = new DataInputStream(fis);
		   BufferedReader d = new BufferedReader(new InputStreamReader(in, "GBK"));// , "UTF-8" 
		   String line = null;
		   while ((line = d.readLine()) != null)
		    content.append(line + line_separator);
		   d.close();
		   in.close();
		   fis.close();
		      
		   Writer ow = new OutputStreamWriter(new FileOutputStream(destFileName), "utf-8");
		   ow.write(content.toString());
		   ow.close();
	}


	
	

	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		//new UpdateZIP().zip("100426");
		new UpdateZIP().transfer();
		/*
		String srcFileName="G:/Java/apricot_ed/src/UpdateZIP.java";
		String destFileName="G:/Java/apricot_ed/src/UpdateZIPtmp.java";
		new UpdateZIP().transferFile(srcFileName, destFileName);
		*/
		
		System.out.println("�������");
	}

}
