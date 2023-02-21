package service.chat;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.chat.ChatDao;
import vo.chat.ChatJoin;
import vo.chat.ChatRoom;

@Service
@Transactional(readOnly = true)
public class ChatService {
	
	@Autowired	
	private SqlSession sqlsession;
	
	
	@Transactional
	public void insertAllChat(ChatRoom chatroom, ChatJoin chatjoin, ChatJoin chatjoinAdmin) {
		try {
			ChatDao chatDao = sqlsession.getMapper(ChatDao.class);
			chatDao.insertChatRoom(chatroom);
			chatDao.insertChatJoin(chatjoin);
			chatDao.insertChatJoin(chatjoinAdmin);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}
