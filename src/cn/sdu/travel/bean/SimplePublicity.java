package cn.sdu.travel.bean;

public class SimplePublicity {
	
	
	private String applicationNumber;
	private String applyDate;
	private String purposeContent;
	private String name;
	private String publicNotificationId;
	
	public String getApplicationNumber() {
		return applicationNumber;
	}
	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getPurposeContent() {
		return purposeContent;
	}
	public void setPurposeContent(String purposeContent) {
		this.purposeContent = purposeContent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public void setPublicNotificationId(String publicNotificationId) {
		this.publicNotificationId = publicNotificationId;
	}

	public String getPublicNotificationId() {
		return publicNotificationId;
	}
}
