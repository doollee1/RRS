package bt.common.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bt.btframework.utils.BMap;
import bt.btframework.utils.BReqData;
import bt.btframework.utils.BRespData;
import bt.btframework.utils.LoginInfo;
import bt.btframework.utils.StringUtils;
import bt.common.dao.DeputyDao;

@Service("DeputyService")
public class DeputyService {
	@Resource(name="DeputyDao")
	private DeputyDao deputyDao;
	
	/**
	 * Approval ID List 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectApprovalIdList(BMap param) throws Exception{
		return deputyDao.selectApprovalIdList(param);
	}
	
	public void savedDeputy(BMap master, List<BMap> detail) throws Exception{
		master.put("LOGIN_USER", LoginInfo.getUserId());
		deputyDao.updateDeputyMaster(master);
		
		for(int i = 0; i < detail.size(); i++){
			BMap detailMap = new BMap(detail.get(i));
			detailMap.put("APPROVAL_ID", master.get("APPROVAL_ID").toString());
			detailMap.put("COMP_CD", LoginInfo.getCompCd());
			detailMap.put("LOGIN_USER", LoginInfo.getUserId());

			if(StringUtils.isNotEmpty(detailMap.get("DEPUTY_ID").toString())){
				if(!StringUtils.isNotEmpty(detailMap.get("SEQ").toString())){
					deputyDao.insertDeputyDetail(detailMap);
				}else{
					deputyDao.updateDeputyDetail(detailMap);
				}
			}
		}
	}
	
	public void savedDeputyEX(BReqData reqData) throws Exception{
		
		String userid = (String)reqData.get("USER_ID");
		List<BMap> detail = (List<BMap>)reqData.getParamDataList("detail");
		
		for (int i = 0; i < detail.size(); i++) {
			BMap bMap = new BMap(detail.get(i));
			bMap.put("APPROVAL_ID", userid);
			bMap.put("COMP_CD", LoginInfo.getCompCd());
			bMap.put("LOGIN_USER", LoginInfo.getUserId());
			
			if(StringUtils.isNotEmpty(bMap.get("DEPUTY_ID").toString())){
				if(!StringUtils.isNotEmpty(bMap.get("SEQ").toString())){
					deputyDao.insertDeputyDetail(bMap);
				}else{
					deputyDao.updateDeputyDetail(bMap);
				}
			}
		}
	}	
	
	/**
	 * Deputy Detail List
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public List<BMap> selectDeputyDetail(BMap param) throws Exception{
		return deputyDao.selectDeputyDetail(param);
	}
}
