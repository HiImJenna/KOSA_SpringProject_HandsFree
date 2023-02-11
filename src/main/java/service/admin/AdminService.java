package service.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.admin.AdminDao;
import vo.admin.Admin;
import vo.admin.Store;
import vo.admin.StoreKeeper;

@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Transactional
	public int registerAdmin(Admin admin, StoreKeeper storeKeeper, Store store) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		dao.registerAdmin(admin);
		dao.registerStoreKeeper(storeKeeper);
		return dao.registerStore(store);
	}
}
