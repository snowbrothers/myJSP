package el;

public class MyElClass {

	public MyElClass() {

	}

	/**
	 * 주민번호를 입력받아 성별을 반환 하는 메서드
	 * 
	 * @param jumin
	 * @return
	 */
	public String getGender(String jumin) {

		// 시작 인덱스와 끝 인덱스
		// 시작 인덱스는 포함 끝 인덱스는 미포함
		String res = "";

		try {

			// 문자열의 위치 확인
			int startIndex = jumin.indexOf("-") + 1;
			int endIndex = startIndex + 1;

			String gender = jumin.substring(startIndex, endIndex);

			if (gender.equals("1") || gender.equals("3")) {
				res = "남자";
			} else if (gender.equals("2") || gender.equals("4")) {
				res = "여자";

			} else {
				// throw new Exception();
				res = "주민등록번호를 확인 해주세요 !";
			}

		} catch (Exception e) {
			System.out.println("주민등록번호를 확인 해주세요 !");
		}

		return res;
	}

	/**
	 * 입력받은 문자열이 숫자인지 판별하는 정적메서드
	 * 
	 * @return
	 */
	public static boolean isNumber(String value) {

//	1.   try {
//			// 형변환 시도.
//			Integer.parseInt(value);
//			return true;
//			
//		} catch (Exception e) {
//			return false;
//		}

		char c = '0';
		char cc = '9';
		System.out.println("0 : " + (int) c);
		System.out.println("9 : " + (int) cc);
		char[] chArr = value.toCharArray();

		for (int i = 0; i < chArr.length; i++) {

			// 문자가 포함되어 있으면 return false;
			// System.out.println(chArr[i]);
			if (!(chArr[i] >= '0' && chArr[i] <= '9')) {

				return false;
			}

		}
		return true;

	}

	// 입력받은 정수까지 구구단을 HTML 테이블로 출력하는 정적 메서드
	// 1 ~ 9 단
	public static String showGugudan(int limitDan) {
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("<table border='1' width ='60%'>");

		for (int dan = 2; dan <= limitDan; dan++) {
			
			sb.append("<tr>");
			
			for (int i = 1; i <= 9; i++) {

				sb.append("<td>" + dan + " * " + i + "= " + (dan * i) + "</td>");
				
			}
			
			sb.append("</tr>");
		}
		
		sb.append("</table>");
		
		
		return sb.toString();
	}

	public static void main(String[] args) {
//		MyElClass el = new MyElClass();
//		System.out.println(el.getGender("001225-3000000"));
//
//		// System.out.println(MyElClass.isNumber("123"));
//
//		
//		
//		
//		
//		String str = "1234";
//
//		
//		
//		System.out.println(MyElClass.isNumber("3333"));

		System.out.println(MyElClass.showGugudan(2));

	}

}
