package controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import service.admin.MailService;
import vo.admin.Email;


@Controller
@RequestMapping("/")
public class AdminController {

	//
	@GetMapping("admin") 
	public String admin() {
		return "admin/adminMain";
	}

	//
	@GetMapping("adminMypage")   
	public String mypage() {
		return "admin/mainInc/mypage";
	}
	
	//
	@GetMapping("adminReserve")   
	public String reserve() {
		return "admin/mainInc/reserve";
	}
	
	//
	@GetMapping("adminChatting")   
	public String chatting() {
		return "admin/mainInc/chatting";
	}
	
	//
	@GetMapping("adminReview")   
	public String review() {
		return "admin/mainInc/review";
	}
	
	//
	@GetMapping("preMain")   
	public String preMain() {
		return "admin/mainInc/preMain";
	}
	
	//
	@GetMapping("preMarketing")   
	public String preMarketing() {
		return "admin/mainInc/preMarketing";
	}
	
	//
	@GetMapping("preMail")   
	public String preMail() {
		return "admin/mainInc/preMail";
	}
	
	//
//	@GetMapping("preMailForm")   
//	public String preMailForm() {
//		return "admin/preMailForm";
//	}
	
	//
	@GetMapping("preSchedule")   
	public String preSchedule() {
		return "admin/mainInc/preSchedule";
	}

	//
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
	
	
//
//	@RequestMapping("noticeDetail.htm")
//	public String noticesDetail(String seq  , Model model) {
//		Notice notice = customerservice.noticesDetail(seq);
//		model.addAttribute("notice", notice);
//		return "customer/noticeDetail";
//	}
//	
//	@GetMapping(value="noticeReg.htm")
//	public String noticeReg() {
//		return "customer/noticeReg";
//	}
//	@PostMapping(value="noticeReg.htm")
//	public String noticeReg(Notice n , HttpServletRequest request) {
//		//�삁�쇅媛� �뜕�졇吏� 寃쎌슦�씪�룄
//		String url = "redirect:notice.htm"; //�떎�떆 由ъ뒪�듃 蹂� �닔 �엳寃� 泥섎━ .....
//		try {
//			url = customerservice.noticeReg(n, request);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return url;
//	}
//	
//	@GetMapping(value="noticeEdit.htm")
//	public String noticeEdit(String seq , Model model) {
//		Notice notice=null;
//		try {
//		   notice =  customerservice.noticeEdit(seq);
//		} catch( Exception e) {
//				e.printStackTrace();
//		} 
//		
//		model.addAttribute("notice", notice);
//		return "customer/noticeEdit";
//	}
//	
//	
//	
//	@PostMapping(value="noticeEdit.htm")
//	public String noticeEdit(Notice n , HttpServletRequest request) {
//		return customerservice.noticeEdit(n,request);
//	}
//	
//	@RequestMapping("noticeDel.htm")
//	public String noticeDel(String seq){
//		return customerservice.noticeDel(seq);
//	}
//	//�뙆�씪 �떎�슫濡쒕뱶
//	@RequestMapping("download.htm")
//	public void download(String p , String f , HttpServletRequest request , HttpServletResponse response) throws IOException {
//		  customerservice.download(p, f, request, response);
//	}
	
}
