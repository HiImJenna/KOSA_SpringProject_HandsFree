package controller.user;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import service.user.UserMyinfoService;
import vo.user.Users;

@Controller
public class UserNavController {
	
	@Autowired
	private UserMyinfoService usermyinfoservice;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("/users/userDetail")
	public String userDetail(Principal pri, Model model) {
		String userid = pri.getName();
		Users users = usermyinfoservice.userDetail(userid);
		model.addAttribute("users", users);
		
		return "user/myinfo";
	}
	
	@PostMapping("userUpdate")
	public String userUpdate(Model model, Users users) {	
		int result = 0;
		String icon = "";
		 String msg = "";
	     String url = "";
 
		String rawPwd = users.getUserpwd();
		String encodedPwd = bCryptPasswordEncoder.encode(rawPwd);
		
		users.setUserpwd(encodedPwd);
		result = usermyinfoservice.userUpdate(users);
		
		//내 정보 수정이 제대로 되었는지 확인
	      if (result < 1) {
	         icon = "error";
	         msg = "내 정보 수정에 실패했습니다 :(";
	         url = "/users/userDetail";
	      } else {
	         icon = "success";
	         msg = "내 정보가 수정되었습니다:)";
	         url = "/users/userDetail";
	      }

	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);
	      model.addAttribute("icon", icon);
		
		return "common/redirect"; 
	}
	
	@GetMapping("/users/myreserve")
	public String myreserve() {
		return "user/myreserve";
	}
	
	@GetMapping("/users/shopregister")
	public String shopregister() {
		return "user/shopregister";
	}
	
}
