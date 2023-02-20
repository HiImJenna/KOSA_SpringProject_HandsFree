package vo.chat;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ChatRoom {
	private String idx;
	private int status;
	private Date sDate;
	private String lastSubJect;
	private Date lastTime;
	
	@Builder
	public ChatRoom(String idx, int status, Date sDate, String lastSubJect, Date lastTime) {
		this.idx = idx;
		this.status = status;
		this.sDate = sDate;
		this.lastSubJect = lastSubJect;
		this.lastTime = lastTime;
	}
	
	
}
