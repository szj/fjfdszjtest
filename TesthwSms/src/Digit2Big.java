public class Digit2Big {

	public static String changeToBig(double value) {
		char[] hunit = { 'ʰ', '��', 'Ǫ' };// ����λ�ñ�ʾ 
		char[] vunit = { '��', '��' }; // ������ʾ 
		char[] digit = { '��', 'Ҽ', '��', '��', '��', '��', '½', '��', '��', '��' }; // ���ֱ�ʾ 
		long midVal = (long) (value * 100); // ת�������� 
		String valStr = String.valueOf(midVal); // ת�����ַ��� 
		String head = valStr.substring(0, valStr.length() - 2); // ȡ�������� 
		String rail = valStr.substring(valStr.length() - 2); // ȡС������ 

		String prefix = ""; // ��������ת���Ľ�� 
		String suffix = ""; // С������ת���Ľ��
		
		if(valStr.length()>17)
		{
			return "��ֵ����";
		}

		// ����С���������� 
		if (rail.equals("00")) { // ���С������Ϊ0 
			suffix = "��";
		} else {
			suffix = digit[rail.charAt(0) - '0'] + "��"
					+ digit[rail.charAt(1) - '0'] + "��"; // ����ѽǷ�ת������ 
		}
		// ����С����ǰ����� 
		char[] chDig = head.toCharArray(); // ����������ת�����ַ����� 
		char zero = '0'; // ��־'0'��ʾ���ֹ�0 
		byte zeroSerNum = 0; // ��������0�Ĵ��� 
		for (int i = 0; i < chDig.length; i++) { // ѭ������ÿ������ 
			int idx = (chDig.length - i - 1) % 4; // ȡ����λ�� 
			int vidx = (chDig.length - i - 1) / 4; // ȡ��λ�� 
			if (chDig[i] == '0') { // �����ǰ�ַ���0 
				zeroSerNum++; // ����0�������� 
				if (zero == '0' && idx!=0) { // ��־ ,������
					zero = digit[0];
					//zero = vunit[vidx - 1];
				} else if (idx == 0 && vidx > 0 && zeroSerNum < 4) {
					prefix += vunit[vidx - 1];
					zero = '0';
				}
				continue;
			}
			zeroSerNum = 0; // ����0�������� 
			if (zero != '0') { // �����־��Ϊ0,�����,������,��ʲô�� 
				prefix += zero;
				zero = '0';
			}
			int position=chDig[i] - '0';
			
			
			if(position==1 && i==0 && idx==1)//��������������10��"ʰ",������"Ҽʰ"�� ����ʮλ���жϴ���
			{
			   
			}else{
				prefix += digit[position]; // ת�������ֱ�ʾ 
			}
			
			if (idx > 0)					 // ����λ�ñ�ʾ��ֵ
				prefix += hunit[idx - 1];
			if (idx == 0 && vidx > 0) {      // ������ʾ��ֵ 
				prefix += vunit[vidx - 1];   // �ν���λ��Ӧ�ü��϶�������,�� 
			}
		}

		if (prefix.length() > 0)
			prefix += 'Բ'; // ����������ִ���,����Բ������ 
		return prefix + suffix; // ������ȷ��ʾ 
	}

	public static void main(String[] args) {
		String tmp = changeToBig(2340912.23);
		System.out.println(tmp);
		tmp = changeToBig(2071234.00);
		System.out.println(tmp);
		tmp = changeToBig(100234.00);
		System.out.println(tmp);
		tmp = changeToBig(100000.00);
		System.out.println(tmp);
		tmp = changeToBig(10000000.00);
		System.out.println(tmp);
	}
}
