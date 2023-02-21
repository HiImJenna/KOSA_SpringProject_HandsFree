package dao.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import vo.user.Users;

public interface UserMyinfoDao {
	//내 정보 상세
	Users userDetail(String userid) throws ClassNotFoundException, SQLException;
	
	//내 정보 수정
	int userUpdate(Users users) throws ClassNotFoundException, SQLException;

	//내 정보 삭제
	int  userDelete(String userid) throws ClassNotFoundException, SQLException;
	
	//예약 내역 상세
	List<Map<String, String>> reserveInfo(String userid) throws ClassNotFoundException, SQLException;

}
