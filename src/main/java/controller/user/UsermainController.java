package controller.user;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import dao.user.UserRegisterDao;
import service.user.UserRegisterService;

@Controller
public class UsermainController {
	
	//memberDao  의존
	private UserRegisterDao registerdao;
	
	@Autowired
	private UserRegisterService registerservice;

	
	
	@GetMapping("search")
	public String home(HttpServletRequest httpServletRequest, Model model) {
		String destination = httpServletRequest.getParameter("destination");		
		String dropDate = httpServletRequest.getParameter("dropDate");
		String pickupDate = httpServletRequest.getParameter("pickupDate");
		
		model.addAttribute("destination", destination);
		model.addAttribute("dropDate", dropDate);
		model.addAttribute("pickupDate", pickupDate);
		
		return "/user/search";
	}
	
	@GetMapping("/users/login")
	public String getloginView() {
		return "user/login";
	}
	
	//GET 요청
	//user/register.jsp 회원가입 페이지로 이동
	@GetMapping("/users/register")
	public String getRegisterView() {
		return "user/register";
	}
	
}
