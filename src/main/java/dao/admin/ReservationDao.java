package dao.admin;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSessionException;

import vo.Reservation;

public interface ReservationDao {
	
	//예약 개수
	//int getReservationCount(String field, String query) throws ClassNotFoundException, SQLException;
	
	//전체 예약 개수
	List<Reservation> getReservations() throws ClassNotFoundException, SqlSessionException;
	
}
