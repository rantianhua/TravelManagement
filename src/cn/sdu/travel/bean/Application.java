package cn.sdu.travel.bean;

//出国申请
public class Application {
	private String applicationNumber;
	private String invitationRaw;
	private String invitationZh;
	private String plan;
	private String purpose;
	private String passportInfo;
	private String type;
	private String conferenceName;
	private String conferenceDesc;
	private String speechOutline;
	private String papersOutline;
	private String groupUnit;
	private String examineUnit;
	private String groupWork;
	private String groupMembers;
	private String inviterInfo;
	private String identifyType;
	private String licenceType;
	private String inviterPay;
	private String fundsId;
	private String loan;

	private VisitPlan vplan;
	private VisitPurpose vpurpose;
	private Passport passport;
	private Inviter inviter;
	private Funds funds;

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

	public String getPassportInfo() {
		return passportInfo;
	}

	public void setPassportInfo(String passportInfo) {
		this.passportInfo = passportInfo;
	}

	public String getInviterInfo() {
		return inviterInfo;
	}

	public void setInviterInfo(String inviterInfo) {
		this.inviterInfo = inviterInfo;
	}

	public String getFundsId() {
		return fundsId;
	}

	public void setFundsId(String fundsId) {
		this.fundsId = fundsId;
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

	public Funds getFunds() {
		return funds;
	}

	public void setFunds(Funds funds) {
		this.funds = funds;
	}
}
