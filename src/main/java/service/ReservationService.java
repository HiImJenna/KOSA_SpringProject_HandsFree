package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.ReservationDao;
import vo.Reservation;

@Service
public class ReservationService {

	private SqlSession sqlsession;
	
	@Autowired
	public ReservationService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	
	public List<Reservation> reservations(){
		List<Reservation> reservationList=null;
		try {
			ReservationDao reservationdao = sqlsession.getMapper(ReservationDao.class);
			reservationList = reservationdao.getReservations();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return reservationList;
	}
	
	
	
}
