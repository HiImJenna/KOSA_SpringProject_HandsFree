package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.AdminDao;
import dao.admin.ReviewDao;
import vo.Review;
import vo.admin.Store;

@Service
public class ReviewService {

	private SqlSession sqlsession;
	
	@Autowired
	public ReviewService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public List<Review> getReviewList(String userId){
		ReviewDao reviewDao = sqlsession.getMapper(ReviewDao.class);
		List<Review> reviewList=null;
		try {
			reviewList = reviewDao.getReviews(userId);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return reviewList;
	}
	
	
}
