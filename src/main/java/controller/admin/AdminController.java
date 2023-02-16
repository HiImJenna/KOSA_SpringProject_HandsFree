package controller.admin;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import controller.admin.dto.AdminRegisterDto;
import service.admin.AdminService;
import service.admin.MailService;
import service.file.FileService;
import vo.admin.Admin;
import vo.admin.Email;


@Controller
@RequestMapping("/")
public class AdminController {

	@GetMapping("admin") 
	public String admin() {
		return "admin/adminMain";
	}

	@GetMapping("adminManage") 
	public String manage() {
		return "admin/mainInc/manage";
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
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@PostMapping("/admin/register")
	public String adminRegister(AdminRegisterDto dto, HttpServletRequest request) {
		// 경로 얻기 , 주소 기반 좌표 얻기, 비밀번호 암호화
		dto.findFileRealPath(request);
		dto.findCoordinates();
		dto.encryptPassword(bCryptPasswordEncoder);
		// DB 저장
		adminService.registerAdmin(dto.toAdmin(), dto.toStoreKeeper(), dto.toStore(), dto.toStoreDetails());
		// 사업자 등록증 파일 저장
		fileService.saveAdminBusinesslicense(dto);
		return "redirect:/users/login";
	}
	
	@PostMapping("/storeLogin")
	public String storeLogin() {
		//System.out.println("점주로그인");
		return "redirect:/";
	}
	
	@GetMapping("/admin/adminUpate")
	public String adminUpdate(Model model, Principal principal) {
		String userid = principal.getName();
		Admin admin = adminService.getAdmin(userid);
		model.addAttribute("admin", admin);
		return "adminUpdate";
	}
		
//	@PostMapping("/admin/adminUpdate")
//	public String adminUpdate(Model model, Admin admin, Principal principal) {
//		String userid = principal.getName();
//		
//		Admin adminupdate = adminService.getAdmin(userid);
//		
//		adminupdate.setPassword(bCryptPasswordEncoder.encode(admin.getPassword()));
//		adminupdate.setFirstName(admin.getFirstName());
//		adminupdate.setLastName(admin.getLastName());
//		adminService.updateAdmin(adminupdate);
//
//		return "redirect:/admin";
//	}
	
	
}
