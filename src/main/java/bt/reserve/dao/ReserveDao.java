package bt.reserve.dao;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import bt.btframework.common.vo.CodeVO;
import bt.btframework.support.DBAbstractMapper;
import bt.btframework.utils.BMap;

@Repository
public class ReserveDao extends DBAbstractMapper {
	private static final Logger logger = LoggerFactory.getLogger(ReserveDao.class);

	/**
	 * 예약현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> reserveSelectList(BMap param) throws Exception {
		return list("ReserveMapper.reserveSelectList", param);
	}
	
	/**
	 * 공통코드 리스트 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectGetCommonCode(BMap param) throws Exception{
		return list("ReserveMapper.selectGetCommonCode", param);
	}
	
	/**
	 * 공통코드 리스트 가져오기1
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO>  selectGetCommonCode1(BMap param) throws Exception{
		return list("ReserveMapper.selectGetCommonCode1", param);
	}

	/**
	 * 공통코드 리스트 가져오기2
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO>  selectGetCommonCode2(BMap param) throws Exception{
		return list("ReserveMapper.selectGetCommonCode2", param);
	}

//	/**
//	 * 공통코드 리스트 가져오기3
//	 * @param param
//	 * @return
//	 * @throws Exception
//	 */
//	@SuppressWarnings("unchecked")
//	public List<CodeVO>  selectGetCommonCode3(BMap param) throws Exception{
//		return list("ReserveMapper.selectGetCommonCode3", param);
//	}

	/**
	 * 공통코드 리스트 가져오기3
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectGetCommonCode3(BMap param) throws Exception{
		return list("ReserveMapper.selectGetCommonCode3", param);
	}
	
	/**
	 * 예약현황 상세조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap reserveSelectDetail(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.reserveSelectDetail", param);
	}

	/**
	 * 예약현황 상세  리스트(그리드) 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int reserveSelectAddListCnt(BMap param) throws Exception{
		return(int)selectByPk("ReserveMapper.reserveSelectAddListCnt", param);
	}

	/**
	 * 예약현황 상세  리스트(그리드) 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void firstReserveSelectAddList(BMap param) throws Exception {
		insert("ReserveMapper.firstReserveSelectAddList", param);
	}

	/**
	 * 예약현황 상세  리스트(그리드) 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> reserveSelectAddList(BMap param) throws Exception {
		return list("ReserveMapper.reserveSelectAddList", param);
	}
	
	/**
	 * 인보이스 현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> invoiceSelectList(BMap param) throws Exception {
		return list("ReserveMapper.invoiceSelectList", param);
	}
	
	/**
	 * 사용자 정보 검색
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectUserInfo(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectUserInfo", param);
	}

	/**
	 * 인보이스 현황 최초 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void firstInvoiceSelectList(BMap param) throws Exception {
		insert("ReserveMapper.firstInvoiceSelectList", param);
	}
	
	/**
	 * 인보이스 총합
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int invoiceSumTot(BMap param) throws Exception {
		return (int)selectByPk("ReserveMapper.invoiceSumTot", param);
	}
	/**
	 * 멤버별 인보이스 셀렉트박스 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CodeVO> InvoiceSelectBoxList(BMap param) throws Exception{
		return list("ReserveMapper.InvoiceSelectBoxList", param);
	}
	
	
	/**
	 * 인보이스 리스트 카운트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectInvoiceListCnt(BMap param) throws Exception{
		return(int)selectByPk("ReserveMapper.selectInvoiceListCnt", param);
	}
	
	/**
	 * 인보이스 디테일 등록
	 * @param param
	 * @throws Exception
	 */
	public void insertInvoiceDetailInfo(BMap param) throws Exception{
		insert("ReserveMapper.insertInvoiceDetailInfo", param);
	}
	
	/**
	 * 인보이스 히스토리 등록(insert , update)
	 * @param param
	 * @throws Exception
	 */
	public void addInvoiceDetailHis(BMap param) throws Exception{
		insert("ReserveMapper.addInvoiceDetailHis", param);
	}
	
	/**
	 * 인보이스 히스토리 삭제(delete)
	 * @param param
	 * @throws Exception
	 */
	public void delInvoiceDetailHis(BMap param) throws Exception{
		insert("ReserveMapper.delInvoiceDetailHis", param);
	}

	/**
	 * 인보이스 디테일 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateInvoiceDetailInfo(BMap param) throws Exception{
		update("ReserveMapper.updateInvoiceDetailInfo", param);
	}
	
	
	/**
	 * 인보이스 디테일 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteInvoiceManager(BMap param) throws Exception{
		delete("ReserveMapper.deleteInvoiceDetailInfo", param);
	}
	
	/**
	 * 인보이스 전체 디테일 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteAllFeeInfo(BMap param) throws Exception{
		delete("ReserveMapper.deleteAllFeeInfo", param);
	}
	
	/**
	 * 상품정보 리스트 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectPrdInfo(BMap param) throws Exception{
		return list("ReserveMapper.selectPrdInfo", param);
	}
	
	/**
	 * 미팅샌드 리스트 카운트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectPickListCnt(BMap param) throws Exception{
		return(int)selectByPk("ReserveMapper.selectPickListCnt", param);
	}
	
	/**
	 * 미팅샌딩 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectPickupList(BMap param) throws Exception {
		return list("ReserveMapper.selectPickupList", param);
	}

	/**
	 * 미팅샌딩 등록
	 * @param param
	 * @throws Exception
	 */
	public int insertPickupInfo(BMap param) throws Exception{
		return insert("ReserveMapper.insertPickupInfo", param);
	}
	
	/**
	 * 미팅샌딩 수정
	 * @param param
	 * @throws Exception
	 */
	public int updatePickupInfo(BMap param) throws Exception{
        return update("ReserveMapper.updatePickupInfo", param);
	}
	
	/**
	 * 예약테이블 PickGbn 수정
	 * @param param
	 * @throws Exception
	 */
	public void updatePickGbn(BMap param) throws Exception{
        update("ReserveMapper.updatePickGbn", param);
	}

	/**
	 * 예약테이블 PickGbn 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateDeletePickGbn(BMap param) throws Exception{
        update("ReserveMapper.updateDeletePickGbn", param);
	}
	
	
	
	/**
	 * 미팅샌딩정보 삭제
	 * @param param
	 * @throws Exception
	 */
	public int deletePickupInfo(BMap param) throws Exception{
		return delete("ReserveMapper.deletePickupInfo", param);
	}
	
	/**
	 * 예약테이블 PickGbn 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateReserveStatus(BMap param) throws Exception{
        update("ReserveMapper.updateReserveStatus", param);
	}
	
	/**
	 * 금액테이블 카운트 조회(인보이스)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectFeeListCnt(BMap param) throws Exception{
		return(int)selectByPk("ReserveMapper.selectFeeListCnt", param);
	}
	
	/**
	 * 금액테이블 총액 조회(TB_REQ_FEE)
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectFeeTOT_AMT(BMap param) throws Exception{
		return(int)selectByPk("ReserveMapper.selectFeeTOT_AMT", param);
	}
	
	/**
	 * fee table insert
	 * @param param
	 * @throws Exception
	 */
	public void insertFeeInfo(BMap param) throws Exception{
		insert("ReserveMapper.insertFeeInfo", param);
	}
	

	/**
	 * fee table update
	 * @param param
	 * @throws Exception
	 */
	public void updateFeeInfo(BMap param) throws Exception{
		update("ReserveMapper.updateFeeInfo", param);
	}
	
	/**
	 * fee table update(DELETE)
	 * @param param
	 * @throws Exception
	 */
	public void deleteFeeInfo(BMap param) throws Exception{
		update("ReserveMapper.deleteFeeInfo", param);
	}
	
	/**
	 * invoice regDt update
	 * @param param
	 * @throws Exception
	 */
	public void updateInvRegDt(BMap param) throws Exception{
		update("ReserveMapper.updateInvRegDt", param);
	}
	
	/**
	 * invoice regDt delete
	 * @param param
	 * @throws Exception
	 */
	public void deleteInvRegDt(BMap param) throws Exception{
		update("ReserveMapper.deleteInvRegDt", param);
	}
	
	/**
	 * 여행사 이미지 가져오기
	 * @param param
	 * @return
	 * @throws Exception
	 */
	
	public BMap selectAirlineImg(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectAirlineImg", param);
	}
	
	
	/**
	 * 예약데이터 등록
	 * @param param
	 * @throws Exception
	 */
	
	public int insertReserveInfo(BMap param) throws Exception{
		return insert("ReserveMapper.insertReserveInfo", param);
	}
	
	/**
	 * 예약 데이터 수정(요금테이블)
	 * @param param
	 * @throws Exception
	 */
	public void updateReserveFee(BMap param) throws Exception{
		update("ReserveMapper.updateReserveFee", param);
	}
	
	/**
	 * 예약 데이터 등록(요금테이블)
	 * @param param
	 * @throws Exception
	 */
	public void insertFeeInfoDetail(BMap param) throws Exception{
		insert("ReserveMapper.insertFeeInfoDetail", param);
	}
	
	/**
	 * 예약데이터 수정
	 * @param param
	 * @throws Exception
	 */
	
	public void updateReserveInfo(BMap param) throws Exception{
		update("ReserveMapper.updateReserveInfo", param);
	}
	
	/**
	 * 예약데이터 최초등록
	 * @param param
	 * @throws Exception
	 */
	
	public int insertReserve(BMap param) throws Exception{
		return insert("ReserveMapper.insertReserve", param);
	}
	
	/**
	 * 입금금액 수정
	 * @param param
	 * @throws Exception
	 */
	
	public void depositComplete(BMap param) throws Exception{
		update("ReserveMapper.depositComplete", param);
	}
	
	/**
	 * 상품시퀀스 확인
	 * @param param
	 * @return
	 * @throws Exception
	 */
	
	public BMap checkBasYy(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.checkBasYy", param);
	}
	
	/**
	 * 기준년도기간과 예약기간 확인
	 * @param param
	 * @return
	 * @throws Exception
	 */
	
	public BMap selectDayDiffChk(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectDayDiffChk", param);
	}
	
	/**
	 * Rplan 테이블 insert
	 * @param param
	 * @throws Exception
	 */
	
	public int insertRplan(BMap param) throws Exception{
		return insert("ReserveMapper.insertRplan", param);
	}
	
	/**
	 * 환불시 Fee 데이터초기화
	 * @param param
	 * @throws Exception
	 */
	public void depositRefund(BMap param) throws Exception{
		update("ReserveMapper.depositRefund", param);
	}
	
	/**
	 * 멤버및 일반 리조트컨펌번호 업데이트
	 * @param param
	 * @throws Exception
	 */
	public void updateReserveResortNum(BMap param) throws Exception{
		update("ReserveMapper.updateReserveResortNum", param);
	}
	
	/**
	 * 인보이스 - 메일전송시 예약기한, 예약금 업데이트
	 * @param param
	 * @throws Exception
	 */
	public void updateInvoiceDetailItem(BMap param) throws Exception{
		update("ReserveMapper.updateInvoiceDetailItem", param);
	}
	
	/**
	 * 상품정보 선조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectProdSeq(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectProdSeq", param);
	}
	
	/**
	 * 라운딩계획테이블 개수조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int selectRplanCnt(BMap param) throws Exception{
		return(int)selectByPk("ReserveMapper.selectRplanCnt", param);
	}
	
	/**
	 * 라운딩계획테이블 삭제
	 * @param param
	 * @throws Exception
	 */
	public int deleteRplanCnt(BMap param) throws Exception{
		return delete("ReserveMapper.deleteRplanCnt", param);
	}

	/**
	 * 기타테이블 삭제
	 * @param param
	 * @throws Exception
	 */
	public int deleteEtcAll(BMap param) throws Exception{
		return delete("ReserveMapper.deleteEtcAll", param);
	}
	
	/**
	 * PDF_UID 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deletePdfInfo(BMap param) throws Exception{
		 update("ReserveMapper.deletePdfUid", param);
	}
	
	/**
	 * 객실풀관리(예약불가 객실) 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> reserveNoRoomList(Map<String, Object> param) throws Exception {
		return list("ReserveMapper.reserveNoRoomList", param);
	}
	
	/**
	 * 객실풀 데이터 추가
	 * @param list
	 * @throws Exception
	 */
	public int insertNoRoomInfo(List<BMap> list) throws Exception{
		return insert("ReserveMapper.insertNoRoomInfo", list);
	}
	
	/**
	 * 객실풀 데이터 삭제
	 * @param param
	 * @throws Exception
	 */
	public void deleteNoRoomInfo(BMap param) throws Exception{
		delete("ReserveMapper.deleteNoRoomInfo", param);
		
	}

	/**
	 * 예약등록 디테일 등록(insert , update)
	 * @param param
	 * @throws Exception
	 */
	public void addReserveDetail(BMap param) throws Exception{
		insert("ReserveMapper.addReserveDetail", param);
	}

	/**
	 * 예약등록 디테일 수정
	 * @param param
	 * @throws Exception
	 */
	public void updateReserveDetailInfo(BMap param) throws Exception{
		update("ReserveMapper.updateReserveDetailInfo", param);
	}
	
	
	/**
	 * 일반 패키지비 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectPackageCharge(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectPackageCharge", param);
	}
	
	
	/**
	 * 멤버 숙박비 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectMemRoomChargeCalc(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectMemRoomChargeCalc", param);
	}
	
	
	/**
	 * 비라운딩, 소아 추가숙박비 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectNokidChargeCalc(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectNokidChargeCalc", param);
	}
	
	
	/**
	 * 싱글룸 추가 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap roomupCalc(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.roomupCalc", param);
	}
	
	
	/**
	 * 프리미엄 추가 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap primCalc(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.primCalc", param);
	}
	
	
	/**
	 * Early Check In 추가 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap earlyCheckInCalc(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.earlyCheckInCalc", param);
	}
	
	
	/**
	 * Late Check Out 추가 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap lateCheckOutCalc(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.lateCheckOutCalc", param);
	}
	
	
	/**
	 * 미팅샌딩 추가 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> sendingCalc(BMap param) throws Exception {
		return list("ReserveMapper.sendingCalc", param);
	}
	
	
	/**
	 * 야간할증미팅샌딩 추가 계산
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> sendingSubCalc(BMap param) throws Exception {
		return list("ReserveMapper.sendingSubCalc", param);
	}
	
	
	/**
	 * 인보이스 코드정보 조회
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap selectInvoiceCodeInfo(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.selectInvoiceCodeInfo", param);
	}

	/**
	 * 체크인 일자 변경 시 상품 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> selectHdngGbnList_M(BMap param ) throws Exception{
		return list("ReserveMapper.selectHdngGbnList_M", param);
	}
	@SuppressWarnings("unchecked")
	public List<BMap> selectHdngGbnList_A(BMap param ) throws Exception{
		return list("ReserveMapper.selectHdngGbnList_A", param);
	}

	/**
	 * 예약 데이터 동반자정보 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void deleteReserveDetail(BMap param) throws Exception {
		delete("ReserveMapper.deleteReserveDetail", param);
	}
	
	/**
	 * 패키지 리스트 호출
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> packageResetList(BMap param) throws Exception {
		return list("ReserveMapper.packageResetList", param);
	}

	public void updateReservePerson(BMap param) throws Exception {
		update("ReserveMapper.updateReservePerson",param);
	}
	
	/**
	 * 예약등록시 객실풀 확인
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noRoomChk(Map<String, Object> param) throws Exception {
		return list("ReserveMapper.noRoomChk",param);
	}
	
	/**
	 * 예약 상세 데이터 삭제
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public void deleteReserveInfo(Map<String, Object> param) throws Exception {
		delete("ReserveMapper.deleteReserveInfo", param);
	}
	
	/**
	 * 예약관리-상태변경 잔금 조회
	 * @param paramAmt
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public int selectBalAmt(BMap paramAmt) throws Exception {
		return (int)selectByPk("ReserveMapper.selectBalAmt", paramAmt);
	}
	
	/**
	 * 예약첨부파일 등록
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int insertTbReqAddFile(Map<String, Object> param) throws Exception{
		
		return insert("ReserveMapper.insertTbReqAddFile", param);
	}
	
	
	/**
	 * 예약첨부파일 일련번호 업데이트
	 * 
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public int updateAddFileSeq(Map<String, Object> param) throws Exception{
		return update("ReserveMapper.updateAddFileSeq", param);
	}
}
