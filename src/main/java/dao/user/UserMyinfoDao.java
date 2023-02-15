package dao.user;

import java.sql.SQLException;

import vo.Notice;

public interface UserMyinfoDao {
	//게시물 수정
	int update(Notice notice) throws ClassNotFoundException, SQLException;

}
