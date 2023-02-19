package controller.admin.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.user.Users;

@Getter
@AllArgsConstructor
public class StoreInfoUpdateDto {
	private String phone;
	private int storeCnt;
	private String weekStart;
	private String weekEnd;
	private String satStart;
	private String satEnd;
	private String sunStart;
	private String sunEnd;
	private String notice;
	private MultipartFile file;
	private String realFilePath;
	private String profile_path;
	
	public void setProfilePath(String userId) {
		this.profile_path = "\\" + userId + "\\" + file.getOriginalFilename();
	}
	
	public Users toUser(String userId) {
		return Users.builder()
				.userid(userId)
				.realFilePath(profile_path)
				.build();
	}
	
	public StoreDetails toStoreDetail() {
		return StoreDetails.builder()
				.manageWeekTime(weekStart)
				.manageSatTime(satStart)
				.manageSunTime(sunStart)
				.build();
	}
}
