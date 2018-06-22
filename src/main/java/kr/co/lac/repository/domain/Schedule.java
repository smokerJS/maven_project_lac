package kr.co.lac.repository.domain;

import java.util.Date;

public class Schedule {
	private int schNo;
	public int getSchNo() {
		return schNo;
	}
	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}
	private int userNo;
	private String startDate;
	private String endDate;
	private String schDetail;
	private String schColor;
	private int eventMonth;
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getSchDetail() {
		return schDetail;
	}
	
	public String getStartDate() {
		return startDate;
	}
	public int getEventMonth() {
		return eventMonth;
	}
	public void setEventMonth(int eventMonth) {
		this.eventMonth = eventMonth;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public void setSchDetail(String schDetail) {
		this.schDetail = schDetail;
	}
	public String getSchColor() {
		return schColor;
	}
	public void setSchColor(String schColor) {
		this.schColor = schColor;
	}
	
}
