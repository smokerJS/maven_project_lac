package kr.co.lac.repository.domain;

public class FriendsRequest {
	private int fReqUNo;
	private int fResUNo;
	private int fReqDate;
	public int getfReqUNo() {
		return fReqUNo;
	}
	public FriendsRequest setfReqUNo(int fReqUNo) {
		this.fReqUNo = fReqUNo;
		return this;
	}
	public int getfResUNo() {
		return fResUNo;
	}
	public FriendsRequest setfResUNo(int fResUNo) {
		this.fResUNo = fResUNo;
		return this;
	}
	public int getfReqDate() {
		return fReqDate;
	}
	public FriendsRequest setfReqDate(int fReqDate) {
		this.fReqDate = fReqDate;
		return this;
	}
}
