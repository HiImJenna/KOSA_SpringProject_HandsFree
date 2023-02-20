package vo.user;

import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
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
	
	@Builder
	public Users(String userid, String userpwd, String first_name, String last_name, MultipartFile profile_path,
			String realFilePath) {
		this.userid = userid;
		this.userpwd = userpwd;
		this.first_name = first_name;
		this.last_name = last_name;
		this.profile_path = profile_path;
		this.realFilePath = realFilePath;
	}
	
	// 실제 파일 경로 얻기
//	public void findFileRealPath(HttpServletRequest request) {
//		String path = request.getServletContext().getRealPath("/files/upload");
//		this.realFilePath = path + "\\" + userid + "\\";
//	}
}
