package service.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import controller.admin.dto.AdminRegisterDto;
import dao.NoticeDao;
import dao.user.UserMyinfoDao;
import vo.Notice;
import vo.user.Users;

@Service
public class UserMyinfoService {
	// 임시 사라질 수 있음
	private final String PATH = "/files/upload";

	private SqlSession sqlsession;

	//내 정보 상세보기 서비스
	public Users userDetail(String userid) {
		Users users = null;
		try {
			 	UserMyinfoDao userdao = sqlsession.getMapper(UserMyinfoDao.class);
			 	users = userdao.getUsers(userid);
		} catch (ClassNotFoundException e) {
						e.printStackTrace();
		} catch (SQLException e) {
						e.printStackTrace();
		}
		return users;		
	}

	// 내정보 수정하기 서비스
	public Users userUpdate(String userid) {
		Users users = null;
		try {

			UserMyinfoDao usermyinfodao = sqlsession.getMapper(UserMyinfoDao.class);

			users = usermyinfodao.userUpdate(users);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}

	// 내정보 수정하기 처리 서비스
//	public String userUpdate(Users users, HttpServletRequest request) {
//
//		if (filename != null && filename.size() > 0) { // 1개라 업로드된 파일이 존재하면
//			for (CommonsMultipartFile mutifile : filename) {
//				String file = mutifile.getOriginalFilename();
//				String path = request.getServletContext().getRealPath("/customer/upload"); // 배포된 서버 경로
//				String fpath = path + "\\" + filename;
//				System.out.println(fpath);
//
//				if (!filename.equals("")) { // 실 파일 업로드 (웹서버)
//					FileOutputStream fs = null;
//					try {
//						fs = new FileOutputStream(fpath);
//						fs.write(mutifile.getBytes());
//
//						filename. // db에 입력될 파일명
//
//					} catch (Exception e) {
//						e.printStackTrace();
//					} finally {
//						try {
//							fs.close();
//						} catch (IOException e) {
//							e.printStackTrace();
//						}
//					}
//				}
//			}
//		}
//
//		users.getProfile_path();
//		
//		try {
//			UserMyinfoDao userdao = sqlsession.getMapper(UserMyinfoDao.class);
//			userdao.userUpdate(users); // DB insert
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		// 처리가 끝나면 상세 페이지로 : redirect 글번호를 가지고 ....
//		return "redirect:noticeDetail.htm?seq=" + n.getSeq(); // 서버에게 새 요청 ....
//	}

	
	public void saveAdminBusinesslicense(Users users) {
		if (!users.getProfile_path().equals("")) {
			String fpath = users.getRealFilePath();
			FileOutputStream fs = null;
			try {
				
				File dir = new File(users.getRealFilePath());
				if (!dir.isDirectory()) {
					dir.mkdir();
				}
				
				fs = new FileOutputStream(fpath + users.getProfile_path().getOriginalFilename());
				fs.write(users.getProfile_path().getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					fs.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}
	
	// 파일 다운로드 서비스 함수 -> 다운로드까지 할 지 말 지 물어보기
	public void download(String p, String f, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String fname = new String(f.getBytes("euc-kr"), "8859_1");
		response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";");

		String fullpath = request.getServletContext().getRealPath("/customer/" + p + "/" + f);
		System.out.println(fullpath);
		FileInputStream fin = new FileInputStream(fullpath);

		ServletOutputStream sout = response.getOutputStream();
		byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		int size = 0;
		while ((size = fin.read(buf, 0, buf.length)) != -1) {
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();
	}


}
