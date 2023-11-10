package bt.common.dao;

import java.util.List;

import org.apache.ibatis.session.ResultHandler;
import org.springframework.stereotype.Repository;

import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository("SampleDao")
public class SampleDao extends DBAbstractMapper {
	/**
	 * 프로그램 리스트 엑셀 출력을 위한 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void excelSample(BMap param, ResultHandler<?> handler) throws Exception{
		listToOutUsingResultHandler("AppMapper.selectProgInfo", param, handler);
	}
}
