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
@RequestMapping("/admin/")
public class AdminController {

	//점주페이지 이동
	@GetMapping("admin") 
	public String admin() {
		return "aadmin";
	}
	
	//마이페이지
	@GetMapping("mypage")   
	public String mypage() {
		return "admin/mypage";
	}
	
	//
	@GetMapping("reserve")   
	public String reserve() {
		return "admin/reserve";
	}
	
	//
	@GetMapping("chatting")   
	public String chatting() {
		return "admin/chatting";
	}
	
	//
	@GetMapping("review")   
	public String review() {
		return "admin/review";
	}
	
	//
	@GetMapping("preMain")   
	public String preMain() {
		return "admin/preMain";
	}
	
	//
	@GetMapping("preMarketing")   
	public String preMarketing() {
		return "admin/preMarketing";
	}
	
	//
	@GetMapping("preMail")   
	public String preMail() {
		return "admin/preMail";
	}
	
	//
	@GetMapping("preMailForm")   
	public String preMailForm() {
		return "admin/preMailForm";
	}
	
	//
	@GetMapping("preSchedule")   
	public String preSchedule() {
		return "admin/preSchedule";
	}

	//
	@GetMapping("preStastics")   
	public String preStastics() {
		return "admin/preStastics";
	}
	
	
	
	
	
	
	
	@Autowired
	private MailService mailService;
	
	@GetMapping("/preMailAAA")
	public String emailForm() {		
		return "admin/preMailAAA";
	}
	
	@PostMapping("/preMailAAA")
	public String sendEmail(Email email, MultipartFile file) throws Exception{
		System.out.println(email.toString());
		

		String fromAddress ="winston0108@naver.com";
		
		try {
			mailService.sendEmail(fromAddress, email, file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/preMailAAA";
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
//		//예외가 던져질 경우라도
//		String url = "redirect:notice.htm"; //다시 리스트 볼 수 있게 처리 .....
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
//	//파일 다운로드
//	@RequestMapping("download.htm")
//	public void download(String p , String f , HttpServletRequest request , HttpServletResponse response) throws IOException {
//		  customerservice.download(p, f, request, response);
//	}
	
}
