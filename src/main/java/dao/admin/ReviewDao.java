package dao.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSessionException;

import vo.Review;

public interface ReviewDao {
	
	//리뷰 개수
	int getReviewCount(String field, String query) throws ClassNotFoundException, SQLException;
	
	//전체 리뷰
	List<Review> getReviews(@Param("userid") String userid) throws ClassNotFoundException, SqlSessionException;
	
	//전체 리뷰
	List<Map<String, String>> getReviewListUser(@Param("storeid") String storeid) throws ClassNotFoundException, SqlSessionException;

}
