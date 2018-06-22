package kr.co.lac.repository.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.jdbc.PreparedStatement.ParseInfo;

public class Chatting {
	private int chattingNo;
	private int projectNo;
	private int sendUserNo;
	private String message;
	private Date sendDate;
	private String msgTypeCode;
	private String nickname;
	private String profilePic;
	private String oriFileName;
	private String downloadPath;
	private long fileSize;
	private int userNo;
	private int fileLength;
	private MultipartFile[] uploadPic;
	private String fileMapping;
	private Date date;
	
	
	public Date getDate() {
		return date;
	}
	public Chatting setDate(Date date) {
		this.date = date;
		return this;
	}
	public String getFileMapping() {
		return fileMapping;
	}
	public Chatting setFileMapping(String fileMapping) {
		this.fileMapping = fileMapping;
		return this;
	}
	public int getFileLength() {
		return fileLength;
	}
	public Chatting setFileLength(int fileLength) {
		this.fileLength = fileLength;
		return this;
	}
	public String getDownloadPath() {
		return downloadPath;
	}
	public Chatting setDownloadPath(String downloadPath) {
		this.downloadPath = downloadPath;
		return this;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public Chatting setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
		return this;
	}
	public long getFileSize() {
		return fileSize;
	}
	public Chatting setFileSize(long fileSize) {
		this.fileSize = fileSize;
		return this;
	}
	public MultipartFile[] getUploadPic() {
		return uploadPic;
	}
	public Chatting setUploadPic(MultipartFile[] uplodePic) {
		this.uploadPic = uplodePic;
		return this;
	}
	public String getNickname() {
		return nickname;
	}
	public Chatting setNickname(String nickname) {
		this.nickname = nickname;
		return this;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public Chatting setProfilePic(String profilePic) {
		this.profilePic = profilePic;
		return this;
	}
	public int getUserNo() {
		return userNo;
	}
	public Chatting setUserNo(int userNo) {
		this.userNo = userNo;
		return this;
	}
	public int getChattingNo() {
		return chattingNo;
	}
	public Chatting setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
		return this;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public Chatting setProjectNo(int projectNo) {
		this.projectNo = projectNo;
		return this;
	}
	public int getSendUserNo() {
		return sendUserNo;
	}
	public Chatting setSendUserNo(int sendUserNo) {
		this.sendUserNo = sendUserNo;
		return this;
	}
	public String getMessage() {
		return message;
	}
	public Chatting setMessage(String message) {
		this.message = message;
		return this;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public Chatting setSendDate(Date sendDate) throws Exception{
		this.sendDate = sendDate;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		Date date = sdf.parse(sendDate);
//		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
//		setDate(sqlDate);
		return this;
	}
	public String getMsgTypeCode() {
		return msgTypeCode;
	}
	public Chatting setMsgTypeCode(String msgTypeCode) {
		this.msgTypeCode = msgTypeCode;
		return this;
	}
}
