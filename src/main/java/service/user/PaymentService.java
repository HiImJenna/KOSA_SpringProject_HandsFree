package service.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user.PaymentDao;
import vo.admin.Store;
import vo.user.Payment;

@Service
public class PaymentService {
	
private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//결제
	public int insertPayment(Payment payment){
		int result = 0;
		System.out.println("****" + payment);
		PaymentDao dao = sqlsession.getMapper(PaymentDao.class);
		
		try {
			result = dao.insertPayment(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//상점 상세보기
	public Store findStoreByUserId(String storeId) {
		PaymentDao dao = sqlsession.getMapper(PaymentDao.class);
		return dao.findStoreByStoreId(storeId);
	}

}
