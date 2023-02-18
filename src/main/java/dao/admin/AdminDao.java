package dao.admin;

import vo.admin.Admin;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.admin.StoreKeeper;

public interface AdminDao {
	public int registerAdmin(Admin admin);
	public int registerStore(Store store);
	public int registerStoreKeeper(StoreKeeper keeper);
	public int registerStoreDetails(StoreDetails storeDetails);
	
//	public Admin getAdmin(String userid);
//	public int updateAdmin(Admin admin);
}
