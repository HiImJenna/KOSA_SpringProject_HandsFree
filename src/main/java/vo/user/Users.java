package vo.user;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import lombok.Data;

@Data
public class Users {
	private String userid;
	private String userpwd;
	//private char enabled;
	//private Date joindate;
	private String first_name;
	private String last_name;
	//private String mail_accept;
	private MultipartFile profile_path;
	private String realFilePath;
	
	// 실제 파일 경로 얻기
	public void findFileRealPath(HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/files/upload");
		this.realFilePath = path + "\\" + userid + "\\";
	}

}
