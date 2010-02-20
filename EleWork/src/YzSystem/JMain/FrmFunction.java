package YzSystem.JMain;

import java.util.ArrayList;

public class FrmFunction {
	
    public FrmFunction() {
	}

	protected void finalize()

	throws Throwable {
		super.finalize();

		// other finalization code...

	}

	public FrmFunctionBase getFunctionBase() throws wlglException {
		String tseqn = UtilWebTools.getRequestParameter("tseqn");
		FrmFunctionBase frmSysFunctionBase = null;
		UtilDB utildb = new UtilDB();
		ArrayList param = new ArrayList();
		param.add(tseqn);
		// ȡ����������д��д
		String tmp = " select TheShortCode from tsSystemFunction where theCode=?";
		ArrayList r = utildb.exeQueryOneRow(tmp, param);
		utildb.closeCon();
		String classname = "";
		if (r.size() > 0) {
			classname = UtilCommon.NVL((String) r.get(0));
		}
		if (classname.equals("")) {
			classname = "";
		}

		try {
			// ������������Class���͵Ķ���
			Class cc = null;
			cc = Class.forName(classname);

			// ���������������ʵ����ǿ������ת����
			// ֵ����share���͵ı�����

			//frmSysFunctionBase = (FrmFunctionBase) cc.newInstance();
			frmSysFunctionBase=(FrmFunctionBase) UtilWebTools.getValueBinding(classname);
			// ���ø���ķ������й�����
		} catch (Exception ex) {
			// ����������⣬�������Ӧ����
			wlglException.ProcessMainWebExceptionMessage("203",
					"getSysFunctionBaseʧ��", ex);

		}

		return frmSysFunctionBase;
	}

}
