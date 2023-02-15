package dao.user;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserSearchDao {
	//가게 검색
	List<Map<String, String>> selectStore(@Param("latitude")String latitude, @Param("longitude") String longitude) throws ClassNotFoundException, SQLException;
}
