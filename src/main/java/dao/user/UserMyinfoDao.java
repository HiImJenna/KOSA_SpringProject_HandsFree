package dao.user;

import java.sql.SQLException;
import vo.user.Users;

public interface UserMyinfoDao {
	//내 정보 상세
	Users userDetail(String userid) throws ClassNotFoundException, SQLException;
	
	//내 정보 수정
	int userUpdate(Users users) throws ClassNotFoundException, SQLException;

	//내 정보 삭제
	int  userDelete(String userid) throws ClassNotFoundException, SQLException;

}
