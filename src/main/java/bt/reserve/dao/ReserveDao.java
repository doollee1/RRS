package bt.reserve.dao;
import java.util.List;
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
	 * 예약현황 상세조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	public BMap reserveSelectDetail(BMap param) throws Exception {
		return (BMap) selectByPk("ReserveMapper.reserveSelectDetail", param);
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
	 * 인보이스 현황 최초 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> firstInvoiceSelectList(BMap param) throws Exception {
		return list("ReserveMapper.firstInvoiceSelectList", param);
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
	 * 인보이스 히스토리 등록(delete)
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
	 * 예약현황 리스트 조회
	 * @param param
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<BMap> reserveReportInfoList(BMap param) throws Exception {
		return list("ReserveMapper.reserveReportInfoList", param);
	}
	
}
