package dao.admin;

import java.sql.SQLException;

import org.springframework.transaction.annotation.Transactional;

import vo.admin.Admin;
import vo.admin.Store;
import vo.admin.StoreKeeper;

public interface AdminDao {
	public int registerAdmin(Admin admin);
	public int registerStore(Store store);
	public int registerStoreKeeper(StoreKeeper keeper);
}
