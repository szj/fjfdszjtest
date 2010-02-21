import java.io.UnsupportedEncodingException;

public class Gbk2Short {

	public String GetPYString(String str) {
        String tempStr = "";
        for(int i=0; i<str.length(); i++) {
                char c = str.charAt(i);
                if((int)c >= 33 && (int)c <=126) {//��ĸ�ͷ���ԭ������
                        tempStr += String.valueOf(c).toUpperCase();//ת��Ϊ��д��ĸ
                }
                else {//�ۼ�ƴ����ĸ
                        tempStr += GetPYChar( String.valueOf(c) );
                }
        }
        return tempStr;
	}

	public String GetPYChar(String c) {
		byte[] array = new byte[2];
		try {
			array = String.valueOf(c).getBytes("GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int i = (short) (array[0] - '\0'+256) * 256 + ((short) (array[1] - '\0'+256));
        System.out.println(c+":"+i);
//		if (i < 0xB0A1)
//			return "*";
		if (i < 0xB0A1)
		return c;
		if (i < 0xB0C5)
			return "A";
		if (i < 0xB2C1)
			return "B";
		if (i < 0xB4EE)
			return "C";
		if (i < 0xB6EA)
			return "D";
		if (i < 0xB7A2)
			return "E";
		if (i < 0xB8C1)
			return "F";
		if (i < 0xB9FE)
			return "G";
		if (i < 0xBBF7)
			return "H";
		if (i < 0xBFA6)
			return "J";
		if (i < 0xC0AC)
			return "K";
		if (i < 0xC2E8)
			return "L";
		if (i < 0xC4C3)
			return "M";
		if (i < 0xC5B6)
			return "N";
		if (i < 0xC5BE)
			return "O";
		if (i < 0xC6DA)
			return "P";
		if (i < 0xC8BB)
			return "Q";
		if (i < 0xC8F6)
			return "R";
		if (i < 0xCBFA)
			return "S";
		if (i < 0xCDDA)
			return "T";
		if (i < 0xCEF4)
			return "W";
		if (i < 0xD1B9)
			return "X";
		if (i < 0xD4D1)
			return "Y";
		if (i < 0xD7FA)
			return "Z";

		return "*";
	}

/*==========================================================================*/
	public static void main(String[] args) {
		Gbk2Short t = new Gbk2Short();
		String tmp = t.GetPYString("aA12!�����ş�,��,��,��,��,��");
		System.out.println(tmp);
		System.out.println(0xB0C5);
		System.out.println(0xB9FE);
		tmp = string2Alpha("�ݽ��ş�123�л����񹲺͹�123һ��");
		System.out.println(tmp);
	}
/*==========================================================================*/
	
	
	private static char[] chartable = { '��', '��', '��', '��', '��', '��', '��', '��',
			'��', '��', '��', '��', '��', '��', 'Ŷ', 'ž', '��', 'Ȼ', '��', '��', '��',
			'��', '��', '��', 'ѹ', '��', '��' };

	public static final char[] firstLetter = { 'A', 'B', 'C', 'D', 'E', 'F',
			'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
			'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	private static int[] table = new int[27];

	// ��ʼ��
	static {
		for (int i = 0; i < 27; ++i) {
			table[i] = gbValue(chartable[i]);
		}
	}

	// ������,�����ַ�,�õ�������ĸ,
	// Ӣ����ĸ���ض�Ӧ�Ĵ�д��ĸ
	// �����Ǽ��庺�ַ��� '0'

	public static char char2Alpha(char ch) {

		if (ch >= 'a' && ch <= 'z')
			return (char) (ch - 'a' + 'A');
		if (ch >= 'A' && ch <= 'Z')
			return ch;

		int gb = gbValue(ch);
		if (gb < table[0])
			return '0';

		int i;
		for (i = 0; i < 26; ++i) {
			if (match(i, gb))
				break;
		}

		if (i >= 26)
			return '0';
		else
			return firstLetter[i];
	}

	// ����һ���������ֵ��ַ�������һ������ƴ������ĸ���ַ���
	public static String string2Alpha(String SourceStr) {
		String Result = "";
		int StrLength = SourceStr.length();
		int i;
		try {
			for (i = 0; i < StrLength; i++) {
				Result += char2Alpha(SourceStr.charAt(i));
			}
		} catch (Exception e) {
			Result = "";
		}
		return Result;
	}

	// ��ȡһ���ַ�����ƴ�����д
	public static String getFirstWordFirstLetter(String SourceStr) {
		String Result = "*";
		try {
			Result = String.valueOf(char2Alpha(SourceStr.charAt(0)));
		} catch (Exception e) {
			Result = "*";
		}
		return Result;
	}

	private static boolean match(int i, int gb) {
		if (gb < table[i])
			return false;

		int j = i + 1;

		// ��ĸZʹ����������ǩ
		while (j < 26 && (table[j] == table[i]))
			++j;

		if (j == 26)
			return gb <= table[j];
		else
			return gb < table[j];

	}

	// ȡ�����ֵı���
	private static int gbValue(char ch) {
		String str = new String();
		str += ch;
		try {
			byte[] bytes = str.getBytes("GBK");
			if (bytes.length < 2)
				return 0;
			return (bytes[0] << 8 & 0xff00) + (bytes[1] & 0xff);
		} catch (Exception e) {
			return 0;
		}
	}

}
