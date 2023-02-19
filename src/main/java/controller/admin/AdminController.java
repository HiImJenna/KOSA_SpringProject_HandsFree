package controller.admin;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import controller.admin.dto.AdminRegisterDto;
import controller.admin.dto.AdminViewTimeDto;
import controller.admin.dto.StoreInfoUpdateDto;
import service.ReservationService;
import service.ReviewService;
import service.admin.AdminService;
import service.admin.MailService;
import service.file.FileService;
import vo.Reservation;
import vo.Review;
import vo.admin.Email;
import vo.admin.Store;
import vo.admin.StoreDetails;


@Controller
@RequestMapping("/")
public class AdminController {
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MailService mailService;
  
  @Autowired
	private ReviewService reviewservice;
	
	@Autowired
	private ReservationService reservationservice;

	@GetMapping("admin") 
	public String admin(Model model, Principal principal) {
		
		String userId = principal.getName();
		
		// users
		//// 프로필 이미지 아래 임시 코드 있음
		//model.addAttribute("profilePath", adminService.findAdminUser(userid).getProfile_path());
		
		// store
		//// 가게 이름, 주소 , 대표번호
		Store store = adminService.findStoreByUserId(userId);
		model.addAttribute("storeName", store.getName());
		model.addAttribute("address", store.getAddress());
		model.addAttribute("phone", store.getPhone());
		
		// details
		//// 짐 보관 개수, 영업 시간, 공시 사항, 사업자등록증
		StoreDetails storeDetails = adminService.findStoreDetailsByUserId(userId);
		model.addAttribute("cnt", storeDetails.getStoreCnt());
		model.addAttribute("week", storeDetails.getManageWeekTime());
		model.addAttribute("sat", storeDetails.getManageSatTime());
		model.addAttribute("sun", storeDetails.getManageSunTime());
		model.addAttribute("notice", storeDetails.getNotice());
		model.addAttribute("cPath", storeDetails.getCertificatePath());
		
		// 프로필 이미지 임시
		model.addAttribute("profilePath", storeDetails.getCertificatePath());
		
		return "admin/admin";
	}

	@GetMapping("admin/manage") 
	public String manage(Model model, Principal principal) {
		
		String userId = principal.getName();
		
		// users
		//// 프로필 이미지 필요함!!, 아래 임시 코드 있음
		//model.addAttribute("profilePath", adminService.findAdminUser(userid).getProfile_path());
		
		// store
		//// 가게 이름, 주소 , 대표번호
		Store store = adminService.findStoreByUserId(userId);
		model.addAttribute("storeName", store.getName());
		model.addAttribute("address", store.getAddress());
		model.addAttribute("phone", store.getPhone());
		
		// details
		//// 짐 보관 개수, 영업 시간, 공시 사항, 사업자등록증
		StoreDetails storeDetails = adminService.findStoreDetailsByUserId(userId);
		model.addAttribute("cnt", storeDetails.getStoreCnt());
		model.addAttribute("timeList", new AdminViewTimeDto(storeDetails).getTimes());
		model.addAttribute("notice", storeDetails.getNotice());
		model.addAttribute("cPath", storeDetails.getCertificatePath());
		
		// 프로필 이미지 임시
		model.addAttribute("profilePath", storeDetails.getCertificatePath());
		
		return "admin/mainInc/manage";
	}
	
	@PostMapping("admin/manage")
	public String changeAdminBasicInfo(StoreInfoUpdateDto  dto,
									   HttpServletRequest  request,
									   Principal           principal) 
	{
		
		return "redirect:/admin";
	}
	
	@GetMapping("admin/reserve")   
	public String reserve(Model model) {
		List<Reservation> reservationList = reservationservice.reservations();
		model.addAttribute("reservationList", reservationList);
		return "admin/mainInc/reserve";
	}
	
	@GetMapping("admin/chatting")   
	public String chatting() {
		return "admin/mainInc/chatting";
	}
	
	@GetMapping("admin/review")   
	public String review(Model model) {
		List<Review> reviewList = reviewservice.reviews();
		model.addAttribute("reviewList", reviewList);
		return "admin/mainInc/review";
	}
	
	
	
	
	@GetMapping("admin/mail")   
	public String mail() {
		return "admin/mainInc/mail";
	}
	
	@GetMapping("admin/calendar")   
	public String calendar() {
		return "admin/mainInc/calendar";
	}

	@GetMapping("admin/chart")   
	public String chart() {
		return "admin/mainInc/chart";
	}
	
	@GetMapping("admin/mailForm")
	public String emailForm() {		
		return "admin/mainInc/mailForm";
	}
	
	@PostMapping("admin/mailForm")
	public String sendEmail(Email email, MultipartFile file) throws Exception{
		System.out.println(email.toString());
		

		String fromAddress ="winston0108@naver.com";
		
		try {
			mailService.sendEmail(fromAddress, email, file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/mainInc/mailForm";
	}
	
	@PostMapping("/admin/register")
	public String adminRegister(AdminRegisterDto dto, HttpServletRequest request) {
		// 경로 얻기 , 주소 기반 좌표 얻기, 비밀번호 암호화
		dto.findFileRealPath(request);
		dto.findCoordinates();
		dto.encryptPassword(bCryptPasswordEncoder.encode(dto.getPassword()));
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
}
