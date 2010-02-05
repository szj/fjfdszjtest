import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.TimerTask;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.qzgf.GetListDatebyBytesClient;
import com.qzgf.GetListDatebyBytesPortType;
import com.qzgf.utils.FileZip;
import com.qzgf.utils.WriteFile;


public class GetGpsRecordTimer extends TimerTask {
	private static boolean isRunning = false;		//�Ƿ�����
	private static boolean flag = true;				
	private int hour = 23;	//��ʱ��ÿ������11�㿪ʼ
	
	public GetGpsRecordTimer()
	{
		try {
			Properties properties = new Properties();
			properties.load(getClass().getResourceAsStream("GpsTimerTask.properties"));//����Properties�ļ���
			hour = Integer.valueOf(properties.get("Timer.hour").toString());
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	@Override
	public void run() {
		Calendar cal = Calendar.getInstance();
		if (!isRunning) {
			if (hour == cal.get(Calendar.HOUR_OF_DAY) && flag) {
				isRunning = true;
				
				try{
					ProTimerTasker();
				}catch (Exception e){
					e.printStackTrace();
				}
				isRunning = false;
				flag = false;
			}
		}else {
			
		}
		if (hour != cal.get(Calendar.HOUR_OF_DAY)) {
			flag = true;
		}


	}
	/**
	 * ����ʱ������
	 */
	private void ProTimerTasker()
	{
		String commandStr = "";
		GetListDatebyBytesClient client = new GetListDatebyBytesClient();

		GetListDatebyBytesPortType service = client
				.getGetListDatebyBytesHttpPort();

		try {
			// 1.ȡ�������ʾֳ�����Ϣ
			commandStr = "103,C,*,*,*";
			List lsCarNum = (List) FileZip.uncompressList(service
					.getCompress(commandStr));
			if (lsCarNum.size()!=0) {
				Iterator itcarnum = lsCarNum.iterator();// �������:�õ���¼
				while (itcarnum.hasNext()) {
					HashMap rowcarnumlist = (HashMap) itcarnum.next();// ȡ�ó��ƺ�
					String CarNum = rowcarnumlist.get("CarNum").toString();
					// �����������
					commandStr = "103,GPS_Timer," + CarNum + ",*,*";
					// ȡ������
					List carRecoder = (List) FileZip.uncompressList(service
							.getCompress(commandStr));
					// д�ļ�
					if (carRecoder.size() != 0) {
						WriteFile wf = new WriteFile();
						String filename = wf.ProWriteFilebyList(CarNum, System
								.getProperty("user.dir")
								+ "\\", commandStr, carRecoder);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
