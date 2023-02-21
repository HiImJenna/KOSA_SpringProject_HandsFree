package service.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import dao.user.PaymentDao;
import vo.user.Payment;
import vo.user.Users;

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
		PaymentDao dao = sqlsession.getMapper(PaymentDao.class);
		
		try {
			result = dao.insertPayment(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
