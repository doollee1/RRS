package bt.btframework.utils;

import java.util.List;

import bt.btframework.common.vo.CodeVO;

public class Utils {
	/**
	 * 그리드용 공통코드로 변환
	 * @param codeList
	 * @return
	 */
	public static String getCommonCodeGrid(List<CodeVO> codeList) {
		String resultValue = "";
		for (int i=0; i<codeList.size(); i++) {
			if (i == 0) {
				resultValue += codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			} else {
				resultValue += ";" + codeList.get(i).getCode() + ":" + codeList.get(i).getValue();
			}
		}
		
		return resultValue;
	}
}
