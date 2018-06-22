package kr.co.lac.repository.domain;

import java.util.Date;

public class Notification {
	private int notiNo;
	private String notiTypeNo;
	private int notiReqNo;
	private int notiResNo;
	private String notiStateCode;
	private Date notiReqDate;
	private String notiAttachMsg;
	private int projectNo;
	public int getNotiNo() {
		return notiNo;
	}
	public Notification setNotiNo(int notiNo) {
		this.notiNo = notiNo;
		return this;
	}
	public String getNotiTypeNo() {
		return notiTypeNo;
	}
	public Notification setNotiTypeNo(String notiTypeNo) {
		this.notiTypeNo = notiTypeNo;
		return this;
	}
	public int getNotiReqNo() {
		return notiReqNo;
	}
	public Notification setNotiReqNo(int notiReqNo) {
		this.notiReqNo = notiReqNo;
		return this;
	}
	public int getNotiResNo() {
		return notiResNo;
	}
	public Notification setNotiResNo(int notiResNo) {
		this.notiResNo = notiResNo;
		return this;
	}
	public String getNotiStateCode() {
		return notiStateCode;
	}
	public Notification setNotiStateCode(String notiStateCode) {
		this.notiStateCode = notiStateCode;
		return this;
	}
	public Date getNotiReqDate() {
		return notiReqDate;
	}
	public Notification setNotiReqDate(Date notiReqDate) {
		this.notiReqDate = notiReqDate;
		return this;
	}
	public String getNotiAttachMsg() {
		return notiAttachMsg;
	}
	public Notification setNotiAttachMsg(String notiAttachMsg) {
		this.notiAttachMsg = notiAttachMsg;
		return this;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public Notification setProjectNo(int projectNo) {
		this.projectNo = projectNo;
		return this;
	}
	
}
