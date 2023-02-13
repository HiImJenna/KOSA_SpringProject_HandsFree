package controller.admin.dto;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.util.StreamUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import vo.admin.Admin;
import vo.admin.Store;
import vo.admin.StoreKeeper;

@Getter
@AllArgsConstructor
public class AdminRegisterDto {
	private String email;
	private String validateNumber;
	private String password;
	private String lastName;
	private String firstName;
	private String address;
	private MultipartFile file;
	private String latitude; // 위도
	private String longitude; // 경도 
	private String realFilePath;
	private String storeName;
	private String phone;
	
	// 실제 파일 경로 얻기
	public void findFileRealPath(HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("/files/upload");
		this.realFilePath = path + "\\" + email + "\\";
	}
	
	// 도로명주소 좌표 얻기
	public void findCoordinates() {
		try {
	        String targetURL = "https://dapi.kakao.com/v2/local/search/address.json?query=" + URLEncoder.encode(address, "UTF-8");
	        URL url = new URL(targetURL);
	        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

	        httpURLConnection.setRequestMethod("GET");
	        //httpURLConnection.setDoOutput(true);

	        httpURLConnection.setRequestProperty("Content-type", "application/json; charset=utf-8");
	        httpURLConnection.setRequestProperty("Authorization", "KakaoAK 4f42a6e1a004ceaf7fa6e850efa2de2b");
	        
	        String messageBody = StreamUtils.copyToString(httpURLConnection.getInputStream(), StandardCharsets.UTF_8);
	        
	        JSONParser jsonParser = new JSONParser();
	        JSONObject obj =  (JSONObject) jsonParser.parse(messageBody);
	        JSONArray jsonArray = (JSONArray) jsonParser.parse(obj.get("documents").toString());
	        obj =  (JSONObject) jsonParser.parse(jsonArray.get(0).toString());
	        obj = (JSONObject) jsonParser.parse(obj.get("road_address").toString());
	        
	        this.latitude = obj.get("x").toString();
	        this.longitude = obj.get("y").toString();
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
	public Admin toAdmin() {
		return Admin.builder()
				.userId(email)
				.password(password)
				.firstName(firstName)
				.lastName(lastName)
				.mailReceptionStatus("TRUE")
				.profilePath("/")
				.accountType(1)
				.build();
	}
	
	public StoreKeeper toStoreKeeper() {
		return StoreKeeper.builder()
				.storeId(email)
				.build();
	}
	
	public Store toStore() {
		return Store.builder()
				.storeId(email)
				.name("임시상호")
				.phone("010-ABCD-EFG")
				.address(address)
				.latitude(latitude)
				.longitude(longitude)
				.build();
	}
}
