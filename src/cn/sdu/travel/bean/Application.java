package cn.sdu.travel.bean;

import java.util.List;

//出国申请
public class Application {
	private String applicationNumber;
	private String applicantId;
	private String assigneeId;
	private String applyDate;
	private String passportId;
	private String category;
	private String plan;
	private String purpose;
	private String purposeContent;
	private String type;
	private String canTuan;
	private String groupUnit;
	private String examineUnit;
	private String groupWork;
	private String groupMembers;
	private String inviterInfo;
	private String licenceType;
	private String inviterPay;
	private String loan;
	private String publicNotificationId;
	private String recordId;
	private String verification;
	private String status;

	// 状态的中文表述
	private String state;

	private VisitPlan vplan;
	private VisitPurpose vpurpose;
	private Passport passport;
	private Inviter inviter;
	private List<Funds> funds;
	private PublicNotification notification;
	private Record record;

	public String getApplicationNumber() {
		return applicationNumber;
	}

	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	public String getApplicantId() {
		return applicantId;
	}

	public void setApplicantId(String applicantId) {
		this.applicantId = applicantId;
	}

	public String getAssigneeId() {
		return assigneeId;
	}

	public void setAssigneeId(String assigneeId) {
		this.assigneeId = assigneeId;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getPassportId() {
		return passportId;
	}

	public void setPassportId(String passportId) {
		this.passportId = passportId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCanTuan() {
		return canTuan;
	}

	public void setCanTuan(String canTuan) {
		this.canTuan = canTuan;
	}

	public String getGroupUnit() {
		return groupUnit;
	}

	public void setGroupUnit(String groupUnit) {
		this.groupUnit = groupUnit;
	}

	public String getExamineUnit() {
		return examineUnit;
	}

	public void setExamineUnit(String examineUnit) {
		this.examineUnit = examineUnit;
	}

	public String getGroupWork() {
		return groupWork;
	}

	public void setGroupWork(String groupWork) {
		this.groupWork = groupWork;
	}

	public String getGroupMembers() {
		return groupMembers;
	}

	public void setGroupMembers(String groupMembers) {
		this.groupMembers = groupMembers;
	}

	public String getLicenceType() {
		return licenceType;
	}

	public void setLicenceType(String licenceType) {
		this.licenceType = licenceType;
	}

	public String getInviterPay() {
		return inviterPay;
	}

	public void setInviterPay(String inviterPay) {
		this.inviterPay = inviterPay;
	}

	public String getLoan() {
		return loan;
	}

	public void setLoan(String loan) {
		this.loan = loan;
	}

	public String getPlan() {
		return plan;
	}

	public void setPlan(String plan) {
		this.plan = plan;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getPurposeContent() {
		return purposeContent;
	}

	public void setPurposeContent(String purposeContent) {
		this.purposeContent = purposeContent;
	}

	public String getInviterInfo() {
		return inviterInfo;
	}

	public void setInviterInfo(String inviterInfo) {
		this.inviterInfo = inviterInfo;
	}

	public VisitPlan getVplan() {
		return vplan;
	}

	public void setVplan(VisitPlan vplan) {
		this.vplan = vplan;
	}

	public VisitPurpose getVpurpose() {
		return vpurpose;
	}

	public void setVpurpose(VisitPurpose vpurpose) {
		this.vpurpose = vpurpose;
	}

	public Passport getPassport() {
		return passport;
	}

	public void setPassport(Passport passport) {
		this.passport = passport;
	}

	public Inviter getInviter() {
		return inviter;
	}

	public void setInviter(Inviter inviter) {
		this.inviter = inviter;
	}

	public List<Funds> getFunds() {
		return funds;
	}

	public void setFunds(List<Funds> funds) {
		this.funds = funds;
	}

	public String getPublicNotificationId() {
		return publicNotificationId;
	}

	public void setPublicNotificationId(String publicNotificationId) {
		this.publicNotificationId = publicNotificationId;
	}

	public String getRecordId() {
		return recordId;
	}

	public void setRecordId(String recordId) {
		this.recordId = recordId;
	}

	public String getVerification() {
		return verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public PublicNotification getNotification() {
		return notification;
	}

	public void setNotification(PublicNotification notification) {
		this.notification = notification;
	}

	public Record getRecord() {
		return record;
	}

	public void setRecord(Record record) {
		this.record = record;
	}

	public String getState() {
		if (this.status.equals("0000000000")) {
			return "未审批";
		}
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
