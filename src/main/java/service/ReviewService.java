package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.ReviewDao;
import vo.Review;

@Service
public class ReviewService {

	private SqlSession sqlsession;
	
	@Autowired
	public ReviewService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	
	public List<Review> reviews(){
		List<Review> reviewList=null;
		try {
			ReviewDao reviewdao = sqlsession.getMapper(ReviewDao.class);
			reviewList = reviewdao.getReviews();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return reviewList;
	}
	
	
	
}
