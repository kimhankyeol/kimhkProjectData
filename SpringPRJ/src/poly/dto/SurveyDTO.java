package poly.dto;

public class SurveyDTO {

	//SurveyTable
	private String surveyNo;
	private String surveyTitle;
	private String surveyRegister;
	private String regNo;
	private String regDate;
	private String updNo;
	private String updDate;
	private String manageCode;
	private String manageTitle;
	//SurveyTitle
	private String surveyTitleNo;
	private String surveyTitleQ;
	//SurveAnsOPT
	private String surveyAnsOptNo;
	private String surveyAnsOptType;
	private String surveyAnsOptValue;
	private String surveyAnsAudAge;
	//SurveAnsAud	
	
	private String surveyAnsAudNo;
	private String surveyAnsAudGender;
	 
	 
	 //조인 때문에 DTO
	private String manageNo;
	private String manageContent;//내용
	private String fileOrgName;
	private String fileSize;
	private String downCk;
	private String ckRadio;
	
	
	
	public String getCkRadio() {
		return ckRadio;
	}
	public void setCkRadio(String ckRadio) {
		this.ckRadio = ckRadio;
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
	public String getManageContent() {
		return manageContent;
	}
	public void setManageContent(String manageContent) {
		this.manageContent = manageContent;
	}
	public String getFileOrgName() {
		return fileOrgName;
	}
	public void setFileOrgName(String fileOrgName) {
		this.fileOrgName = fileOrgName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getManageCode() {
		return manageCode;
	}
	public void setManageCode(String manageCode) {
		this.manageCode = manageCode;
	}
	public String getManageTitle() {
		return manageTitle;
	}
	public void setManageTitle(String manageTitle) {
		this.manageTitle = manageTitle;
	}
	public String getSurveyAnsOptNo() {
		return surveyAnsOptNo;
	}
	public void setSurveyAnsOptNo(String surveyAnsOptNo) {
		this.surveyAnsOptNo = surveyAnsOptNo;
	}
	public String getSurveyNo() {
		return surveyNo;
	}
	public void setSurveyNo(String surveyNo) {
		this.surveyNo = surveyNo;
	}
	public String getSurveyTitle() {
		return surveyTitle;
	}
	public void setSurveyTitle(String surveyTitle) {
		this.surveyTitle = surveyTitle;
	}
	public String getSurveyRegister() {
		return surveyRegister;
	}
	public void setSurveyRegister(String surveyRegister) {
		this.surveyRegister = surveyRegister;
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

	public String getSurveyTitleNo() {
		return surveyTitleNo;
	}
	public void setSurveyTitleNo(String surveyTitleNo) {
		this.surveyTitleNo = surveyTitleNo;
	}
	public String getSurveyTitleQ() {
		return surveyTitleQ;
	}
	public void setSurveyTitleQ(String surveyTitleQ) {
		this.surveyTitleQ = surveyTitleQ;
	}

	public String getSurveyAnsOptType() {
		return surveyAnsOptType;
	}
	public void setSurveyAnsOptType(String surveyAnsOptType) {
		this.surveyAnsOptType = surveyAnsOptType;
	}
	public String getSurveyAnsOptValue() {
		return surveyAnsOptValue;
	}
	public void setSurveyAnsOptValue(String surveyAnsOptValue) {
		this.surveyAnsOptValue = surveyAnsOptValue;
	}
	public String getSurveyAnsAudAge() {
		return surveyAnsAudAge;
	}
	public void setSurveyAnsAudAge(String surveyAnsAudAge) {
		this.surveyAnsAudAge = surveyAnsAudAge;
	}
	public String getSurveyAnsAudNo() {
		return surveyAnsAudNo;
	}
	public void setSurveyAnsAudNo(String surveyAnsAudNo) {
		this.surveyAnsAudNo = surveyAnsAudNo;
	}
	public String getSurveyAnsAudGender() {
		return surveyAnsAudGender;
	}
	public void setSurveyAnsAudGender(String surveyAnsAudGender) {
		this.surveyAnsAudGender = surveyAnsAudGender;
	}
	
	 
	 

}
