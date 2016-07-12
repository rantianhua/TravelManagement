package cn.sdu.travel.web.formbean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdu.travel.bean.Funds;
import cn.sdu.travel.bean.VisitDestination;
import cn.sdu.travel.service.RegisterService;
import cn.sdu.travel.service.impl.RegisterServiceImpl;
import cn.sdu.travel.utils.Constants;

public class ApplyForm {
	private String applicationNumber;
	private String planInfo;
	private String purposeInfo;
	private String inviterInfo;

	private String startTime;

	private String category;
	private String assigneeId;

	private String licenceType;
	private String passportName;
	private String name;
	private String sex;
	private String issuingPlace;
	private String birthday;
	private String expDate;

	private String type;
	private String purpose;
	private String trainContent;
	private String studyContent;
	private String teacherName;
	private String teacherTitle;
	private String teacherExpertise;
	private String className;
	private String partnerName;
	private String partnerTitle;
	private String partnerExpertise;
	private String cooperationContent;
	private String degreeType;
	private String conferenceNameCh;
	private String conferenceNameEn;
	private String conferenceDesc;
	private String speech;
	private String speechOutline;
	private String paperOutline;

	private String outCity;
	private String exitBorderDate;
	private List<VisitDestination> dests = new ArrayList<VisitDestination>();
	private String backCity;
	private String enterBorderDate;

	private String canTuan;
	private String groupUnit;
	private String examineUnit;
	private String groupWork;
	private String groupMembers;

	private String iName;
	private String iTitleCh;
	private String iTitleEn;
	private String unitName;
	private String address;
	private String telephone;
	private String email;
	private String url;
	private String invitationRaw;
	private String invitationZh;

	private String inviterPay;
	private List<Funds> fds = new ArrayList<Funds>();
	private String loan;
	private String payDetail;
	private String proveFile;

	private Map<String, String> errors = new HashMap<String, String>();

	public boolean saveValidate() {
		boolean isOk = true;
		if (this.assigneeId != null && (!this.assigneeId.trim().equals(""))) {
			if (this.assigneeId.length() != 18
					|| !this.assigneeId
							.matches("^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$")) {
				isOk = false;
				this.errors.put("assigneeId", "身份证号格式错误！");
			}
		}

		if (this.birthday != null && !this.birthday.trim().equals("")) {
			if (!this.birthday.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
				isOk = false;
				this.errors.put("passport", "无效的日期格式！");
			}
		} else if (this.expDate != null && !this.expDate.trim().equals("")) {
			if (!this.expDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
				isOk = false;
				this.errors.put("passport", "无效的日期格式！");
			}
		}

		if (this.type == null || this.type.trim().equals("")) {
			isOk = false;
			this.errors.put("type", "请选择出访期限！");
		}

		if (this.enterBorderDate != null
				&& !this.enterBorderDate.trim().equals("")) {
			if (!this.enterBorderDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
				isOk = false;
				this.errors.put("plan", "无效的日期格式！");
			}
		} else if (this.exitBorderDate != null
				&& !this.exitBorderDate.trim().equals("")) {
			if (!this.exitBorderDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
				isOk = false;
				this.errors.put("plan", "无效的日期格式！");
			}
		}

		if (this.email != null && !this.email.trim().equals("")) {
			if (!this.email
					.matches("^\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}$")) {
				isOk = false;
				this.errors.put("invite", "错误的邮箱格式！");
			}
		}

		return isOk;
	}

	public boolean commitValidate() throws ParseException {
		boolean isOk = true;
		if (this.assigneeId != null && (!this.assigneeId.trim().equals(""))) {
			if (this.assigneeId.length() != 18
					|| !this.assigneeId
							.matches("^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$")) {
				isOk = false;
				this.errors.put("assigneeId", "身份证号格式错误！");
			} else {
				RegisterService service = new RegisterServiceImpl();
				Map<String, Object> map = service.checkId(this.assigneeId);
				if ((int) map.get("returnCode") == Constants.UNUSED_ID) {
					isOk = false;
					errors.put("assigneeId", "系统未录入该身份证号！");
				}
			}
		}

		if (this.licenceType == null || this.licenceType.equals("")) {
			isOk = false;
			this.errors.put("passport", "请选择证照类型！");
		} else if (this.passportName == null
				|| this.passportName.trim().equals("")) {
			isOk = false;
			this.errors.put("passport", "请填写您的证照名称！");
		} else if (this.name == null || this.name.trim().equals("")) {
			isOk = false;
			this.errors.put("passport", "请填写您证照上的姓名！");
		} else if (this.sex == null || this.sex.trim().equals("")) {
			isOk = false;
			this.errors.put("passport", "请选择您证照上的性别！");
		} else if (!this.sex.equals("男") && !this.sex.equals("女")) {
			isOk = false;
			this.errors.put("passport", "请填写正确的性别！");
		} else if (this.issuingPlace == null
				|| this.issuingPlace.trim().equals("")) {
			isOk = false;
			this.errors.put("passport", "请填写证照的签发地！");
		} else if (this.birthday == null || this.birthday.trim().equals("")) {
			isOk = false;
			this.errors.put("passport", "请填写您证照上的生日！");
		} else if (this.expDate == null || this.expDate.trim().equals("")) {
			isOk = false;
			this.errors.put("passport", "请填写证照的有效日期！");
		} else if (!this.birthday.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")
				|| !this.expDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			isOk = false;
			this.errors.put("passport", "无效的日期格式！");
		}

		if (this.type == null || this.type.trim().equals("")) {
			isOk = false;
			this.errors.put("type", "请选择出访期限！");
		} else {
			if (this.purpose.equals("培训")) {
				if (this.trainContent == null
						|| this.trainContent.trim().equals("")) {
					isOk = false;
					this.errors.put("trainContent", "请填写培训内容！");
				}
			}

			if (this.purpose.equals("进修")) {
				if (this.studyContent == null
						|| this.studyContent.trim().equals("")) {
					isOk = false;
					this.errors.put("studyContent", "请填写进修内容！");
				}
			}

			if (this.purpose.equals("科研合作")) {
				if (this.cooperationContent == null
						|| this.cooperationContent.trim().equals("")) {
					isOk = false;
					this.errors.put("cooperationCotent", "请填写合作内容！");
				}
			}

			if (this.purpose.equals("任教")) {
				if (this.className == null || this.className.trim().equals("")) {
					isOk = false;
					this.errors.put("className", "请填写授课名称！");
				}
			}

			if (this.purpose.equals("攻读学位")) {
				if (this.degreeType == null
						|| this.degreeType.trim().equals("")) {
					isOk = false;
					this.errors.put("degreeType", "请填写学位类别！");
				}
			}

			if (this.purpose.equals("进修") || this.purpose.equals("攻读学位")) {
				if (this.teacherName == null
						|| this.teacherName.trim().equals("")) {
					isOk = false;
					this.errors.put("teacherName", "请填写指导老师姓名！");
				}
				if (this.teacherTitle == null
						|| this.teacherTitle.trim().equals("")) {
					isOk = false;
					this.errors.put("teacherTitle", "请填写指导老师头衔！");
				}
				if (this.teacherExpertise == null
						|| this.teacherExpertise.trim().equals("")) {
					isOk = false;
					this.errors.put("teacherExpertise", "请填写指导老师专长！");
				}
			}

			if (this.purpose.equals("科研合作") || this.purpose.equals("任教")) {
				if (this.partnerName == null
						|| this.partnerName.trim().equals("")) {
					isOk = false;
					this.errors.put("partnerName", "请填写外方合作伙伴姓名！");
				}
				if (this.partnerTitle == null
						|| this.partnerTitle.trim().equals("")) {
					isOk = false;
					this.errors.put("partnerTitle", "请填写外方合作伙伴头衔！");
				}
				if (this.partnerExpertise == null
						|| this.partnerExpertise.trim().equals("")) {
					isOk = false;
					this.errors.put("partnerExpertise", "请填写外方合作伙伴专长！");
				}
			}

			if (this.purpose.equals("参加国际会议")) {
				if (this.conferenceNameCh == null
						|| this.conferenceNameCh.trim().equals("")) {
					isOk = false;
					this.errors.put("conferenceNameCh", "请填写国际会议中文名！");
				}
				if (this.conferenceNameEn == null
						|| this.conferenceNameEn.trim().equals("")) {
					isOk = false;
					this.errors.put("conferenceNameEn", "请填写国际会议英文名！");
				}
				if (this.conferenceDesc == null
						|| this.conferenceDesc.trim().equals("")) {
					isOk = false;
					this.errors.put("conferenceDesc", "请填写会议情况简介！");
				}
				if (this.speech == null || this.speech.equals("")) {
					isOk = false;
					this.errors.put("speech", "请选择是否受邀发言！");
				}
			}
		}

		if (this.outCity == null || this.outCity.trim().equals("")) {
			isOk = false;
			this.errors.put("plan", "请填写离境城市！");
		} else if (this.exitBorderDate == null
				|| this.exitBorderDate.trim().equals("")) {
			isOk = false;
			this.errors.put("plan", "请填写离境日期！");
		} else if (this.backCity == null || this.backCity.trim().equals("")) {
			isOk = false;
			this.errors.put("plan", "请填写入境城市！");
		} else if (this.enterBorderDate == null
				|| this.enterBorderDate.trim().equals("")) {
			isOk = false;
			this.errors.put("plan", "请填写入境日期！");
		} else if (!this.exitBorderDate
				.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")
				|| !this.enterBorderDate
						.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			isOk = false;
			this.errors.put("plan", "出境/入境日期格式错误！");
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date enter = sdf.parse(this.enterBorderDate);
			Date exit = sdf.parse(this.exitBorderDate);
			if (enter.before(exit)) {
				isOk = false;
				this.errors.put("plan", "入境时间不能早于出境时间！");
			} else {
				for (VisitDestination vd : this.dests) {
					if (vd.getCountry() == null
							|| vd.getCountry().trim().equals("")
							|| vd.getCity() == null
							|| vd.getCity().trim().equals("")
							|| vd.getArriveDate() == null
							|| vd.getArriveDate().trim().equals("")
							|| vd.getExitCityDate() == null
							|| vd.getExitCityDate().trim().equals("")) {
						isOk = false;
						this.errors.put("plan", "中途抵达城市信息不完整,请重新填写！");
					} else {
						enter = sdf.parse(vd.getArriveDate());
						exit = sdf.parse(vd.getExitCityDate());
						if (exit.before(enter)) {
							isOk = false;
							this.errors.put("plan", "中途城市的离开时间不能早于抵达时间！");
						} else if (vd.getTransfer() == null
								|| vd.getTransfer().equals("")) {
							isOk = false;
							this.errors.put("plan", "请选择是否转机！");
						} else if (vd.getTransfer().equals("0")
								&& (vd.getTransAddr() == null || vd
										.getTransAddr().trim().equals(""))) {
							isOk = false;
							this.errors.put("plan", "请填写转机地点！");
						}
					}
				}
			}
		}

		if (this.canTuan == null || this.canTuan.equals("")) {
			isOk = false;
			this.errors.put("group", "请选择是否参团！");
		} else if (this.canTuan.equals("是")) {
			if (this.groupUnit == null || this.groupUnit.trim().equals("")) {
				isOk = false;
				this.errors.put("group", "请填写组团单位！");
			} else if (this.examineUnit == null
					|| this.examineUnit.trim().equals("")) {
				isOk = false;
				this.errors.put("group", "请填写出访审批单位！");
			} else if (this.groupWork == null
					|| this.groupWork.trim().equals("")) {
				isOk = false;
				this.errors.put("group", "请填写团队职务！");
			} else if (this.groupMembers == null
					|| this.groupMembers.trim().equals("")) {
				isOk = false;
				this.errors.put("group", "请上传成员名单！");
			}
		}

		if (this.iName == null || this.iName.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方姓名！");
		} else if (this.iTitleCh == null || this.iTitleCh.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方中文头衔！");
		} else if (this.iTitleEn == null || this.iTitleEn.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方英文头衔！");
		} else if (this.unitName == null || this.unitName.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方单位名称！");
		} else if (this.address == null || this.address.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方单位地址！");
		} else if (this.telephone == null || this.telephone.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方联系电话！");
		} else if (this.email == null || this.email.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方电子邮箱！");
		} else if (!this.email
				.matches("^\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}$")) {
			isOk = false;
			this.errors.put("invite", "错误的邮箱格式！");
		} else if (this.url == null || this.url.trim().equals("")) {
			isOk = false;
			this.errors.put("invite", "请填写邀请方单位网址！");
		}

		if (this.inviterPay == null || this.inviterPay.equals("")) {
			isOk = false;
			this.errors.put("loan", "请选择邀请方经费负担情况！");
		} else if (this.inviterPay.equals("1")) {
			if (this.fds.get(0).getPayItem() == null
					|| this.fds.get(0).getPayItem().equals("")) {
				isOk = false;
				this.errors.put("loan", "请选择邀请方负责的经费类型！");
			} else if (this.fds.get(0).getPayItem().equals("其他")
					&& (this.fds.get(0).getPs() == null || this.fds.get(0)
							.getPs().trim().equals(""))) {
				isOk = false;
				this.errors.put("loan", "您选择了其他经费类型，请填写具体类型！");
			}

			if ((this.fds.get(1).getPayAmount() == null || this.fds.get(1)
					.getPayAmount().trim().equals(""))
					&& (this.fds.get(2).getPayAmount() == null || this.fds
							.get(2).getPayAmount().trim().equals(""))
					&& (this.fds.get(3).getPayAmount() == null || this.fds
							.get(3).getPayAmount().trim().equals(""))) {
				isOk = false;
				this.errors.put("loan", "请填写我方经费负担情况！");
			} else {
				for (int i = 1; i < 4; i++) {
					if (this.fds.get(i).getPayAmount() != null
							&& !this.fds.get(i).getPayAmount().trim()
									.equals("")) {
						if (this.fds.get(i).getAccountName() == null
								|| this.fds.get(i).getAccountName().trim()
										.equals("")) {
							isOk = false;
							this.errors.put("loan", "请填写我方经费账号！");
						} else if (this.fds.get(i).getPayItem() == null
								|| this.fds.get(i).getPayItem().trim()
										.equals("")) {
							isOk = false;
							this.errors.put("loan", "请选择我方经费类型！");
						} else if (this.fds.get(i).getPayItem().equals("其他")
								&& (this.fds.get(i).getPs() == null || this.fds
										.get(i).getPs().trim().equals(""))) {
							isOk = false;
							this.errors.put("loan", "您选择了其他经费类型，请填写具体类型！");
						}
						
						RegisterService service = new RegisterServiceImpl();
						Map<String, Object> map = service.checkId(this.fds.get(
								i).getAccountName());
						if ((int) map.get("returnCode") == Constants.UNUSED_ID) {
							isOk = false;
							this.errors.put("loan", "经费账号不存在！");
						}
					}
				}
			}
		} else if (this.inviterPay.equals("2")) {
			if ((this.fds.get(1).getPayAmount() == null || this.fds.get(1)
					.getPayAmount().trim().equals(""))
					&& (this.fds.get(2).getPayAmount() == null || this.fds
							.get(2).getPayAmount().trim().equals(""))
					&& (this.fds.get(3).getPayAmount() == null || this.fds
							.get(3).getPayAmount().trim().equals(""))) {
				isOk = false;
				this.errors.put("loan", "请填写我方经费负担情况！");
			} else {
				for (int i = 1; i < 4; i++) {
					if (this.fds.get(i).getPayAmount() != null
							&& !this.fds.get(i).getPayAmount().trim()
									.equals("")) {
						if (this.fds.get(i).getAccountName() == null
								|| this.fds.get(i).getAccountName().trim()
										.equals("")) {
							isOk = false;
							this.errors.put("loan", "请填写我方经费账号！");
						} else if (this.fds.get(i).getPayItem() == null
								|| this.fds.get(i).getPayItem().trim()
										.equals("")) {
							isOk = false;
							this.errors.put("loan", "请选择我方经费类型！");
						} else if (this.fds.get(i).getPayItem().equals("其他")
								&& (this.fds.get(i).getPs() == null || this.fds
										.get(i).getPs().trim().equals(""))) {
							isOk = false;
							this.errors.put("loan", "您选择了其他经费类型，请填写具体类型！");
						}

						RegisterService service = new RegisterServiceImpl();
						Map<String, Object> map = service.checkId(this.fds.get(
								i).getAccountName());
						if ((int) map.get("returnCode") == Constants.UNUSED_ID) {
							isOk = false;
							this.errors.put("loan", "经费账号不存在！");
						}
					}
				}
			}
		}

		return isOk;
	}

	public String getApplicationNumber() {
		return applicationNumber;
	}

	public void setApplicationNumber(String applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	public String getPlanInfo() {
		return planInfo;
	}

	public void setPlanInfo(String planInfo) {
		this.planInfo = planInfo;
	}

	public String getPurposeInfo() {
		return purposeInfo;
	}

	public void setPurposeInfo(String purposeInfo) {
		this.purposeInfo = purposeInfo;
	}

	public String getInviterInfo() {
		return inviterInfo;
	}

	public void setInviterInfo(String inviterInfo) {
		this.inviterInfo = inviterInfo;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAssigneeId() {
		return assigneeId;
	}

	public void setAssigneeId(String assigneeId) {
		this.assigneeId = assigneeId;
	}

	public String getLicenceType() {
		return licenceType;
	}

	public void setLicenceType(String licenceType) {
		this.licenceType = licenceType;
	}

	public String getPassportName() {
		return passportName;
	}

	public void setPassportName(String passportName) {
		this.passportName = passportName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIssuingPlace() {
		return issuingPlace;
	}

	public void setIssuingPlace(String issuingPlace) {
		this.issuingPlace = issuingPlace;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getTrainContent() {
		return trainContent;
	}

	public void setTrainContent(String trainContent) {
		this.trainContent = trainContent;
	}

	public String getStudyContent() {
		return studyContent;
	}

	public void setStudyContent(String studyContent) {
		this.studyContent = studyContent;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public String getTeacherTitle() {
		return teacherTitle;
	}

	public void setTeacherTitle(String teacherTitle) {
		this.teacherTitle = teacherTitle;
	}

	public String getTeacherExpertise() {
		return teacherExpertise;
	}

	public void setTeacherExpertise(String teacherExpertise) {
		this.teacherExpertise = teacherExpertise;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getPartnerTitle() {
		return partnerTitle;
	}

	public void setPartnerTitle(String partnerTitle) {
		this.partnerTitle = partnerTitle;
	}

	public String getPartnerExpertise() {
		return partnerExpertise;
	}

	public void setPartnerExpertise(String partnerExpertise) {
		this.partnerExpertise = partnerExpertise;
	}

	public String getCooperationContent() {
		return cooperationContent;
	}

	public void setCooperationContent(String cooperationContent) {
		this.cooperationContent = cooperationContent;
	}

	public String getDegreeType() {
		return degreeType;
	}

	public void setDegreeType(String degreeType) {
		this.degreeType = degreeType;
	}

	public String getConferenceNameCh() {
		return conferenceNameCh;
	}

	public void setConferenceNameCh(String conferenceNameCh) {
		this.conferenceNameCh = conferenceNameCh;
	}

	public String getConferenceNameEn() {
		return conferenceNameEn;
	}

	public void setConferenceNameEn(String conferenceNameEn) {
		this.conferenceNameEn = conferenceNameEn;
	}

	public String getConferenceDesc() {
		return conferenceDesc;
	}

	public void setConferenceDesc(String conferenceDesc) {
		this.conferenceDesc = conferenceDesc;
	}

	public String getSpeech() {
		return speech;
	}

	public void setSpeech(String speech) {
		this.speech = speech;
	}

	public String getSpeechOutline() {
		return speechOutline;
	}

	public void setSpeechOutline(String speechOutline) {
		this.speechOutline = speechOutline;
	}

	public String getPaperOutline() {
		return paperOutline;
	}

	public void setPaperOutline(String paperOutline) {
		this.paperOutline = paperOutline;
	}

	public String getOutCity() {
		return outCity;
	}

	public void setOutCity(String outCity) {
		this.outCity = outCity;
	}

	public String getExitBorderDate() {
		return exitBorderDate;
	}

	public void setExitBorderDate(String exitBorderDate) {
		this.exitBorderDate = exitBorderDate;
	}

	public List<VisitDestination> getDests() {
		return dests;
	}

	public void setDests(List<VisitDestination> dests) {
		this.dests = dests;
	}

	public String getBackCity() {
		return backCity;
	}

	public void setBackCity(String backCity) {
		this.backCity = backCity;
	}

	public String getEnterBorderDate() {
		return enterBorderDate;
	}

	public void setEnterBorderDate(String enterBorderDate) {
		this.enterBorderDate = enterBorderDate;
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

	public String getiName() {
		return iName;
	}

	public void setiName(String iName) {
		this.iName = iName;
	}

	public String getiTitleCh() {
		return iTitleCh;
	}

	public void setiTitleCh(String iTitleCh) {
		this.iTitleCh = iTitleCh;
	}

	public String getiTitleEn() {
		return iTitleEn;
	}

	public void setiTitleEn(String iTitleEn) {
		this.iTitleEn = iTitleEn;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
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

	public String getInviterPay() {
		return inviterPay;
	}

	public void setInviterPay(String inviterPay) {
		this.inviterPay = inviterPay;
	}

	public List<Funds> getFds() {
		return fds;
	}

	public void setFds(List<Funds> fds) {
		this.fds = fds;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

	public String getLoan() {
		return loan;
	}

	public void setLoan(String loan) {
		this.loan = loan;
	}

	public String getPayDetail() {
		return payDetail;
	}

	public void setPayDetail(String payDetail) {
		this.payDetail = payDetail;
	}

	public String getProveFile() {
		return proveFile;
	}

	public void setProveFile(String proveFile) {
		this.proveFile = proveFile;
	}

}
