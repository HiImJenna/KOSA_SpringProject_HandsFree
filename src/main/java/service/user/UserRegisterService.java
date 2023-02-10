package service.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.user.UserRegisterDao;

@Service
public class UserRegisterService {
	
	@Autowired
	private SqlSession sqlsession;

	//회원가입
	public void insert(vo.user.Users users){
		UserRegisterDao dao = sqlsession.getMapper(UserRegisterDao.class);
		int result = dao.insertMember(users);
		if(result > 0){
			System.out.println("회원가입 성공");
		}else{
			System.out.println("회원가입 실패");
		}
	}
}
