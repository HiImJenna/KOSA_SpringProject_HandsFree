package service.chat;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.chat.ChatDao;
import vo.chat.ChatRoom;

@Service
public class ChatService {
	
	@Autowired	
	private SqlSession sqlsession;
	
	public void insertChatRoom(ChatRoom chatroom) {
		try {
			System.out.println(chatroom);
			ChatDao chatDao = sqlsession.getMapper(ChatDao.class);
			chatDao.insertChatRoom(chatroom);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
