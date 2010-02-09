package net.trust.utils.export;
/**
 * һ������ģʽ�Ĺ����࣬���ڴ��������ľ����࣬��ExportToExcel,ExportXml�ȡ�
 * @author chenf
 * */
public class ExportFactory {
	//private  ExportIface export = null;
	/**
	 * �����ExportIface�������Ƴɵ���ģʽ�����ܴ������⣬
	 * ���������������ģ�����ǵ���ģʽ��ô���ͬʱ����������һ����������Ҫ����
	 * excel�ļ���ʽ����һ��������Ҫ�󵼳�����ģʽʱ�������Ƿ���ڳ�ͻ�أ�
	 * ʵ����ʵ���ϲ������������ߵĳ�ͻ���ƺ���web������������߳������Ƹõ����ģ���ʱ����Ҫ�о�
	 * һ�¡�
	 * ����ģʽ
	 * @author chenf
	 * @param type �������� xlsΪexcel�ļ���xmlΪXml��ʽ�ļ���pdf....
	 * @return ExportIface �����ʵ���ࡣ
	 * */
	public static ExportIface getInstance(String type){
		ExportIface export=null;
		if(type==null){
			return null;
		}else if(type.equals("xls")){
			if(export==null || !(export instanceof ExportToPageExcel)){
				export = new ExportToPageExcel();
			}
		}else if(type.equals("xml")){
			if(export==null || !(export instanceof ExportToXml)){
				export = new ExportToXml();
			}
		}else if(type.equals("pdf")){
			
		}
		return export;
	}
	
}
