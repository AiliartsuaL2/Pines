package pines.service;

public class MemberVO {
	private String userId;
	private String pass;
	private String name;
	private String birth;
	private String phone;
	private String zipCode;
	private String address;
	private String dormantState;
	private int point;
	private String adminRights;
	

	public String getUserId() {
		System.out.println("getUserId : "+userId);	
		return userId;
	}
	public void setUserId(String userId) {
		System.out.println("SetUserId : "+userId);	
		this.userId = userId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAdminRights() {
		return adminRights;
	}
	public void setAdminRights(String adminRights) {
		this.adminRights = adminRights;
	}
	public String getDormantState() {
		return dormantState;
	}
	public void setDormantState(String dormantState) {
		this.dormantState = dormantState;
	}
	
}
