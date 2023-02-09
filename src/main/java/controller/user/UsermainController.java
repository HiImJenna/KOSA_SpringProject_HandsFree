package controller.user;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsermainController {
	
	
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
	
	@GetMapping("/users/register")
	public String getRegisterView() {
		return "user/register";
	}
}
