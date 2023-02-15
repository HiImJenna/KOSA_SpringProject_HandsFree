package dao.user;

import java.sql.SQLException;
import vo.user.Users;

public interface UserMyinfoDao {
	//내 정보 상세
	Users getUsers(String userid) throws ClassNotFoundException, SQLException;
	
	//내 정보 수정
	Users userUpdate(Users users) throws ClassNotFoundException, SQLException;
}
