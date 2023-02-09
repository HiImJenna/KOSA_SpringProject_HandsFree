package vo.admin;

import lombok.Data;

@Data
public class Email {
	private int emailIdx;			// 매일 순번
	private String userId;		// 메일 보내는사람 아이디
	private String title;			// 메일 제목
	private String content;		//  메일 내용
	private String fromMail;	//	보내는사람 Mail
	private String[] toMail;		//  추가된 Mail 수신자
	private String[] ccMail;		//  추가된 참조 Mail 수신자
	
	
}
