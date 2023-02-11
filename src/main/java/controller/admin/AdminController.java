package controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import controller.admin.dto.AdminRegisterDto;
import service.admin.MailService;
import service.file.FileService;
import vo.admin.Email;


@Controller
@RequestMapping("/")
public class AdminController {

	@GetMapping("admin") 
	public String admin() {
		return "admin/adminMain";
	}

	@GetMapping("adminMypage")   
	public String mypage() {
		return "admin/mainInc/mypage";
	}
	
	@GetMapping("adminReserve")   
	public String reserve() {
		return "admin/mainInc/reserve";
	}
	
	@GetMapping("adminChatting")   
	public String chatting() {
		return "admin/mainInc/chatting";
	}
	
	@GetMapping("adminReview")   
	public String review() {
		return "admin/mainInc/review";
	}
	
	@GetMapping("preMain")   
	public String preMain() {
		return "admin/mainInc/preMain";
	}
	
	@GetMapping("preMarketing")   
	public String preMarketing() {
		return "admin/mainInc/preMarketing";
	}
	
	@GetMapping("preMail")   
	public String preMail() {
		return "admin/mainInc/preMail";
	}
	
	@GetMapping("preSchedule")   
	public String preSchedule() {
		return "admin/mainInc/preSchedule";
	}

	@GetMapping("preStastics")   
	public String preStastics() {
		return "admin/mainInc/preStastics";
	}
	
	@Autowired
	private MailService mailService;
	
	@GetMapping("preMailForm")
	public String emailForm() {		
		return "admin/mainInc/preMailForm";
	}
	
	@PostMapping("preMailForm")
	public String sendEmail(Email email, MultipartFile file) throws Exception{
		System.out.println(email.toString());
		

		String fromAddress ="winston0108@naver.com";
		
		try {
			mailService.sendEmail(fromAddress, email, file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/mainInc/preMailForm";
	}
	
	@Autowired
	private FileService fileService;
	
	@PostMapping("/admin/register")
	public String adminRegister(AdminRegisterDto dto, 
							    HttpServletRequest request) 
	{
		// 경로 얻기
		String filePath = dto.getFileRealPath(request);
		//= fileService.saveAdminBusinesslicense(dto.getFile(), dto.getEmail(), request);
		
		// 주소 기반 좌표 얻기
		
		// Admin 파일경로 채워서 객체 얻기 
		
		// StoreKeeper 객체 얻기 
		
		// Store 객체 얻기
		
		// DB 저장
		
		// 사업자 등록증 파일 저장
		
		//
		return "redirect:/users/login";
	}
}
