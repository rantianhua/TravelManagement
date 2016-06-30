package cn.sdu.travel.bean;

//出国申请
public class Application {
	private String applicationNumber;
	private String invitationRaw;
	private String invitationZh;
	private VisitPlan plan;
	private VisitPurpose purpose;
	private Passport passport_info;
	private String type;
	private String conferenceName;
	private String conferenceDesc;
	private String speechOutline;
	private String papersOutline;
	private String groupUnit;
	private String examineUnit;
	private String groupWork;
	private String groupMembers;
	private Inviter inviterInfo;
	private String identifyType;
	private String licenceType;
	private String inviterPay;
	private Funds fundsId;
	private String loan;

	public String getApplicationNumber() {
		return applicationNumber;
	}

	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	public String getInvitationRaw() {
		return invitationRaw;
	}

	public void setInvitationRaw(String invitationRaw) {
		this.invitationRaw = invitationRaw;
	}

	public String getInvitationZh() {
		return invitationZh;
	}

	public void setInvitationZh(String invitationZh) {
		this.invitationZh = invitationZh;
	}

	public VisitPlan getPlan() {
		return plan;
	}

	public void setPlan(VisitPlan plan) {
		this.plan = plan;
	}

	public VisitPurpose getPurpose() {
		return purpose;
	}

	public void setPurpose(VisitPurpose purpose) {
		this.purpose = purpose;
	}

	public Passport getPassport_info() {
		return passport_info;
	}

	public void setPassport_info(Passport passport_info) {
		this.passport_info = passport_info;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getConferenceName() {
		return conferenceName;
	}

	public void setConferenceName(String conferenceName) {
		this.conferenceName = conferenceName;
	}

	public String getConferenceDesc() {
		return conferenceDesc;
	}

	public void setConferenceDesc(String conferenceDesc) {
		this.conferenceDesc = conferenceDesc;
	}

	public String getSpeechOutline() {
		return speechOutline;
	}

	public void setSpeechOutline(String speechOutline) {
		this.speechOutline = speechOutline;
	}

	public String getPapersOutline() {
		return papersOutline;
	}

	public void setPapersOutline(String papersOutline) {
		this.papersOutline = papersOutline;
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

	public Inviter getInviterInfo() {
		return inviterInfo;
	}

	public void setInviterInfo(Inviter inviterInfo) {
		this.inviterInfo = inviterInfo;
	}

	public String getIdentifyType() {
		return identifyType;
	}

	public void setIdentifyType(String identifyType) {
		this.identifyType = identifyType;
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

	public Funds getFundsId() {
		return fundsId;
	}

	public void setFundsId(Funds fundsId) {
		this.fundsId = fundsId;
	}

	public String getLoan() {
		return loan;
	}

	public void setLoan(String loan) {
		this.loan = loan;
	}
}
