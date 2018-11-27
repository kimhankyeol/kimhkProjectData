package poly.dto;


public class ManagePresentationDTO {
	 private String manageNo;
	 private String manageTitle;//제목
	 private String manageContent;//내용
     private String manageCode;//방 입장코드
     private String downCk;//다운로드 체크여부
	 private String regNo;
	 private String regDate;
	 private String updNo;
	 private String updDate;
	 private String email;
	 
	 
	 
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDownCk() {
		return downCk;
	}
	public void setDownCk(String downCk) {
		this.downCk = downCk;
	}
	public String getManageNo() {
		return manageNo;
	}
	public void setManageNo(String manageNo) {
		this.manageNo = manageNo;
	}
	public String getManageTitle() {
		return manageTitle;
	}
	public void setManageTitle(String manageTitle) {
		this.manageTitle = manageTitle;
	}
	public String getManageContent() {
		return manageContent;
	}
	public void setManageContent(String manageContent) {
		this.manageContent = manageContent;
	}
	public String getManageCode() {
		return manageCode;
	}
	public void setManageCode(String manageCode) {
		this.manageCode = manageCode;
	}
	public String getRegNo() {
		return regNo;
	}
	public void setRegNo(String regNo) {
		this.regNo = regNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUpdNo() {
		return updNo;
	}
	public void setUpdNo(String updNo) {
		this.updNo = updNo;
	}
	public String getUpdDate() {
		return updDate;
	}
	public void setUpdDate(String updDate) {
		this.updDate = updDate;
	}
}
    