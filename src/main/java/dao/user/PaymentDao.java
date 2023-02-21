package dao.user;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;

import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.user.Payment;

public interface PaymentDao {
	
	//결제
	public int insertPayment(Payment payment) throws ClassNotFoundException, SQLException;
		
	public Store findStoreByStoreId(@Param("storeid") String storeId);
}
