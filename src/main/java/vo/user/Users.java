package vo.user;

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
	private String profile_path;
}
