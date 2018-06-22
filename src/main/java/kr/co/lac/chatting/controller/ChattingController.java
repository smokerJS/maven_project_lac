package kr.co.lac.chatting.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.io.ByteStreams;

import kr.co.lac.chatting.service.ChattingService;
import kr.co.lac.repository.domain.Chatting;

@Controller
@RequestMapping("/chatting")
public class ChattingController {
	@Autowired
	private ChattingService chattingService;
	
	
	@RequestMapping("/send.json")
	@ResponseBody
	public List<Integer> chattingSend(Chatting chatting) throws Exception{
		if(chatting.getFileLength() == 0) {
			chattingService.chattingSend(chatting);
			return null;
		}
		List<Integer> chattingNo = new ArrayList<>();
		for(int i = 0 ; i<chatting.getFileLength() ; i++) {

			chattingService.chattingSend(chatting);
			chattingNo.add(chatting.getChattingNo());
		}
		return chattingNo;
	}
	
	
	

	
	@RequestMapping("/listLoad.json")  
	@ResponseBody
	public List<Chatting> chattingListLoad(int projectNo) {
		return chattingService.retrieveChattingList(projectNo);
	}

	@RequestMapping(value="/fileUpload.json", method=RequestMethod.POST)  
	@ResponseBody
	public List<Map> fileUpload(Chatting chatting,HttpServletRequest request) throws Exception{
		System.out.println("파일 랭스 : "+chatting.getUploadPic().length);
		System.out.println("DATE : "+chatting.getSendDate());
		System.out.println("파일매핑 : "+chatting.getFileMapping());
		
		
		String[] arr = chatting.getFileMapping().split(";");
		int chattingNo = 0;
		List<Map> success = new ArrayList<>();
		ServletContext context = request.getServletContext();                    
		String saveFolder="/upload_images";
		String realFolder = context.getRealPath(saveFolder);
		String uploadPath = "/maven_project_lac/upload_images";
		
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		File fileFolder = new File(realFolder+datePath);
		if(!fileFolder.exists()) { fileFolder.mkdirs(); } // 디렉토리 생성
		int count = 0;
		for(MultipartFile file : chatting.getUploadPic()) {
			String oriName = file.getOriginalFilename();	                    // 원본파일명
			for(String str : arr) {
				String[] fileInfo = str.split(":");
				if(fileInfo[0].equals(oriName)) {
					chattingNo = Integer.parseInt(fileInfo[1]);
					break;
				}
			}
			
			System.out.println("count : " + ++count + ", oriName : " + oriName);
			long fileSize = file.getSize();	                                    // 파일 사이즈
			String ext = "";                                                    // 1. 파일 확장자 담을 변수 생성
			int index = oriName.lastIndexOf(".");                               // 2. 원본 파일명에서 . 위치 찾기
			if (index != -1) { ext = oriName.substring(index); }                // 3. 파일명에서 확장자명(.포함)을 추출	.jsp .html 등
			String systemName = "mlec-" + UUID.randomUUID().toString() + ext;	// 시스템에 저장하는 파일명 (랜덤생성 파일명 + 확장자)
			file.transferTo(new File(realFolder+datePath+"/"+systemName));	                    // 서버에 파일 저장
			chatting.setDownloadPath(realFolder+datePath+"/"+systemName)
			        .setMessage(uploadPath+datePath+"/"+systemName)
			        .setFileSize(fileSize)
					.setOriFileName(oriName)
					.setChattingNo(chattingNo)
					.setSendDate(chatting.getSendDate());
			Map<String,String> map = new HashMap<>();
			map.put("chattingNo", ""+chattingNo);
			map.put("message", uploadPath+datePath+"/"+systemName);
			success.add(map);
			chattingService.uploadFile(chatting);
		}
		
		return success;
	}
	
	@RequestMapping("/{chattingNo}/filedown.do")//URL호출
	public void getFile(@PathVariable int chattingNo,HttpServletResponse response) throws Exception {
		Chatting chatting = chattingService.retrieveChattingByChattingNo(chattingNo);
		String filePath = chatting.getDownloadPath(); //파일 전체경로(파일명도 포함)
	    String oriFileName = chatting.getOriFileName(); // 원본파일명
	    System.out.println(filePath); 
	    System.out.println(oriFileName); 
	    
	    String docName = URLEncoder.encode(oriFileName,"UTF-8").replaceAll("\\+", "%20"); //한글파일명 깨지지 않도록
	    response.setHeader("Content-Disposition", "attachment;filename=" + docName + ";");
	    response.setContentType("text/plain");
	 
	    File down_file = new File(filePath); //파일 생성
	    FileInputStream fileIn = new FileInputStream(down_file); //파일 읽어오기
	    ByteStreams.copy(fileIn, response.getOutputStream());
	    response.flushBuffer();
	}
	
}








