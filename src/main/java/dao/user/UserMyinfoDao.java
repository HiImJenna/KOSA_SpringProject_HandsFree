package dao.user;

import java.sql.SQLException;
import java.util.List;

import vo.UserReservationJoinVo;
import vo.user.Users;

public interface UserMyinfoDao {
	//내 정보 상세
	Users userDetail(String userid) throws ClassNotFoundException, SQLException;
	
	//내 정보 수정
	int userUpdate(Users users) throws ClassNotFoundException, SQLException;

	//내 정보 삭제
	int  userDelete(String userid) throws ClassNotFoundException, SQLException;
	
	// 내 예약 정보 조회
	public List<UserReservationJoinVo> getMyReservationList(String userid);

}
