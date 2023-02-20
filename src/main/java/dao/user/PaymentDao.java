package dao.user;

import java.sql.SQLException;
import vo.user.Payment;

public interface PaymentDao {
	
	//결제
	public int insertPayment(Payment payment) throws ClassNotFoundException, SQLException;

}
