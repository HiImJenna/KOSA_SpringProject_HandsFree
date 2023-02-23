package controller.admin;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import controller.admin.dto.AdminRegisterDto;
import controller.admin.dto.AdminReviewSaveDto;
import controller.admin.dto.AdminViewTimeDto;
import controller.admin.dto.CalendarInfoDto;
import controller.admin.dto.StoreInfoUpdateDto;
import service.ReservationService;
import service.ReviewService;
import service.admin.AdminService;
import service.admin.MailService;
import service.file.FileService;
import service.user.UserMyinfoService;
import vo.Reservation;
import vo.Review;
import vo.admin.AdminReview;
import vo.admin.Email;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.user.Users;


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
	
	@Autowired
	private UserMyinfoService usermyinfoservice;

	@GetMapping("admin") 
	public String admin(Model model, Principal principal) {
		
		String userId = principal.getName();
		
		//각 컨트롤러마다 다 설정해야함
		Users users = usermyinfoservice.userDetail(userId);
		model.addAttribute("users", users);
		// users
		//// 프로필 이미지
		Users user = adminService.findAdminUserByUserId(userId);
		String profilePath = "\\resources\\defaultProfile\\crown.png";
		if (!user.getRealFilePath().contains("/")) {
			profilePath = user.getRealFilePath();
		}
		model.addAttribute("profilePath", profilePath);
		
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
		//model.addAttribute("profilePath", storeDetails.getCertificatePath());
		
		return "admin/admin";
	}

	@GetMapping("admin/manage") 
	public String manage(Model model, Principal principal) {
		
		String userId = principal.getName();
		
		// users
		//// 프로필 이미지 필요함!!
		Users user = adminService.findAdminUserByUserId(userId);
		String profilePath = "\\resources\\defaultProfile\\crown.png";
		if (!user.getRealFilePath().contains("/")) {
			profilePath = user.getRealFilePath();
		}
		model.addAttribute("profilePath", profilePath);
		
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
		
		return "admin/mainInc/manage";
	}
	
	@PostMapping("admin/manage")
	public String changeAdminBasicInfo(StoreInfoUpdateDto  dto,
									   HttpServletRequest  request,
									   Principal           principal) 
	{
		String userId = principal.getName();
		dto.setProfilePath(request);
		adminService.updateStoreInfo(dto.toUser(userId), dto.toStore(userId), dto.toStoreDetail(userId));
		fileService.updateAdminProfile(dto, userId);
		return "redirect:/admin";
	}
	
	@GetMapping("admin/reserve")   
	public String reserve(Model model, Principal principal) {
		
		String userId = principal.getName();
		
		List<Reservation> reservationList = reservationservice.getReservationList(userId);
		model.addAttribute("reservationList", reservationList);
		return "admin/mainInc/reserve";
	}
	
	@GetMapping("admin/chatting")   
	public String chatting() {
		return "admin/mainInc/chatting";
	}
	
	@GetMapping("admin/review")   
	public String review(Model model,Principal principal) {
		String storeId = principal.getName();
		Store store = adminService.findStoreByUserId(storeId);
		model.addAttribute("storeName", store.getName());
		List<AdminReview> list = adminService.getAdminReviewListByStoreId(storeId);
		model.addAttribute("list", list);
		return "admin/mainInc/review";
	}
	
	@PostMapping("/admin/review")
	public String saveAdminReview(HttpServletRequest request) {
		AdminReviewSaveDto dto = new AdminReviewSaveDto(request);
		System.out.println("saveAdminReview");
		System.out.println(dto);
		return "redirect:/admin/review";
	}
	
	@GetMapping("admin/mail")   
	public String mail(Model model, Principal principal) {
		String userId = principal.getName();
		
		List<Reservation> reservationList = reservationservice.getReservationList(userId);
		model.addAttribute("reservationList", reservationList);
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
	public String emailForm(int idx, Model model) {		
		Reservation reservation = reservationservice.userDetail(idx);
		model.addAttribute("reservation", reservation);
		
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
	
	@ResponseBody
	@GetMapping("/api/admin/calendar")
	public ResponseEntity<CalendarInfoDto> getCalendarList(Principal principal) {
		String userId = principal.getName();
		//String userId = "admin1@naver.com";
		return new ResponseEntity<CalendarInfoDto>(new CalendarInfoDto(adminService.getCalendarList(userId)), HttpStatus.OK);
	}
}
