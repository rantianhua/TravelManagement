package cn.sdu.travel.web.formbean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.sdu.travel.bean.Family;
import cn.sdu.travel.bean.VisitMembers;

//出访公示表表单校验
public class PublicityAndRecordForm {
	
	private String notify;
	//公示表信息
	//团组成员
	private List<VisitMembers> members = new ArrayList<VisitMembers>();
	private String visitPlaces;
	private String transferPlaces;
	private String exitDate;
	private String enterDate;
	private String detailedSchedule;
	private String taskSummary;
	private String visitPersons;
	private String budget;
	private String inviterDesc;
	
	//方便用于回显
	private String memberName1;
	private String memberUnit1;
	private String memberTitle1;
	private String memberName2;
	private String memberUnit2;
	private String memberTitle2;
	private String memberName3;
	private String memberUnit3;
	private String memberTitle3;
	private String memberName4;
	private String memberUnit4;
	private String memberTitle4;
	private String memberName5;
	private String memberUnit5;
	private String memberTitle5;
	
	//备案表信息
	//家庭成员
	private List<Family> familyMembers = new ArrayList<Family>();
	private String recordName;
	private String recordSex;
	private String recordBirthday;
	private String recordPoliticalStatus;
	private String recordHealth;
	private String recordSecretInfo;
	
	private String groupUnit;
	private String positionInGroup;
	private String placesInfo;
	private String authorityUnit;
	private String latestPlaces;
	//用于回显
	private String familyAppellation1;
	private String familyName1;
	private String familyAge1;
	private String familyPoliticalStatus1;
	private String familyOtherInfo1;
	private String familyAppellation2;
	private String familyName2;
	private String familyAge2;
	private String familyPoliticalStatus2;
	private String familyOtherInfo2;
	private String familyAppellation3;
	private String familyName3;
	private String familyAge3;
	private String familyPoliticalStatus3;
	private String familyOtherInfo3;
	private String familyAppellation4;
	private String familyName4;
	private String familyAge4;
	private String familyPoliticalStatus4;
	private String familyOtherInfo4;
	private String familyAppellation5;
	private String familyName5;
	private String familyAge5;
	private String familyPoliticalStatus5;
	private String familyOtherInfo5;
	
	private Map<String, String> errors = new HashMap<String, String>();

	public boolean commitValid() {
		List<String> memberNames = new ArrayList<String>();
		for(Family family : familyMembers) {
			if(family.getName() == null || family.getName().length() == 0) {
				this.errors.put("record", "家庭成员的姓名不能为空");
				return false;
			}
			if(memberNames.contains(family.getName())) {
				this.errors.put("record", "家庭成员不能重复填写（姓名不能相同）");
				return false;
			}
		}
		if(this.placesInfo == null || this.placesInfo.length() == 0) {
			this.errors.put("record", "出国任务、所赴国家（地区）及停留时间不能为空");
			return false;
		}
		if(this.authorityUnit == null || this.authorityUnit.length() == 0) {
			this.errors.put("record", "出国任务审批单位不能为空");
			return false;
		}
		if(this.recordName == null || this.recordName.length() == 0) {
			this.errors.put("record", "姓名不能为空");
			return false;
		}
		if(this.recordSex == null || this.recordSex.length() == 0) {
			this.errors.put("record", "性别不能为空");
			return false;
		}
		if(this.recordBirthday == null || this.recordBirthday.length() == 0) {
			this.errors.put("record", "出生年月不能为空");
			return false;
		}
		if(this.recordPoliticalStatus == null || this.recordPoliticalStatus.length() == 0) {
			this.errors.put("record", "政治面貌不能为空");
			return false;
		}
		if(this.recordHealth == null || this.recordHealth.length() == 0) {
			this.errors.put("record", "健康状况不能为空");
			return false;
		}
		if(this.recordSecretInfo == null || this.recordSecretInfo.length() == 0) {
			this.errors.put("record", "请填写工作单位及职务、是否为涉密人员及涉密等级");
			return false;
		}
		if(!notify.equals("1")) {
			System.out.println("不需要公示");
			return true;
		}
		memberNames.clear();
		for(VisitMembers member : members) {
			if(member.getName() == null || member.getName().length() == 0) {
				this.errors.put("publicity", "团组成员姓名不能为空");
				return false;
			}
			if(memberNames.contains(member.getName())) {
				this.errors.put("publicity", "团组成员不能重复填写（姓名不能一样）");
				return false;
			}else  {
				memberNames.add(member.getName());
			}
		}
		if(this.visitPlaces == null || this.visitPlaces.trim().equals("")) {
			this.errors.put("publicity", "出访国家或地区不能为空");
			return false;
		}
		if( this.visitPlaces.trim().length() > 85) {
			this.errors.put("publicity", "出访国家或地区的内容长度不能超过85");
			return false;
		}
		if(this.transferPlaces == null || this.transferPlaces.trim().equals("")) {
			this.errors.put("publicity", "出访国家或地区不能为空");
			return false;
		}
		if( this.transferPlaces.trim().length() > 85) {
			this.errors.put("publicity", "顺访国家或地区的内容长度不能超过85");
			return false;
		}
		if(this.exitDate == null || this.exitDate.length() == 0) {
			this.errors.put("publicity", "出境日期不能为空");
			return false;
		}
		if (!this.exitDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			this.errors.put("publicity", "出境日期格式无效！");
			return false;
		}
		if(this.enterDate == null || this.enterDate.length() == 0) {
			this.errors.put("publicity", "入境日期不能为空");
			return false;
		}
		if (!this.enterDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			this.errors.put("publicity", "入境日期格式无效！");
			return false;
		}
		if(this.detailedSchedule == null || this.detailedSchedule.length() == 0) {
			this.errors.put("publicity", "详细日程不能为空");
			return false;
		}
		if(this.detailedSchedule.trim().length() > 300) {
			this.errors.put("publicity", "详细日程内容不能超过300个字符");
			return false;
		}
		if(this.taskSummary == null || this.taskSummary.length() == 0) {
			this.errors.put("publicity", "出访任务及预期出访结果不能为空");
			return false;
		}
		if(this.taskSummary.trim().length() > 200) {
			this.errors.put("publicity", "出访任务及预期出访结果内容不能超过200个字符");
			return false;
		}
		if(this.visitPersons == null || this.visitPersons.length() == 0) {
			this.errors.put("publicity", "会见人员不能为空");
			return false;
		}
		if(this.visitPersons.trim().length() > 200) {
			this.errors.put("publicity", "会见人员内容不能超过200个字符");
			return false;
		}
		if(this.budget == null || this.budget.length() == 0) {
			this.errors.put("publicity", "费用来源及预算不能为空");
			return false;
		}
		if(this.budget.trim().length() > 200) {
			this.errors.put("publicity", "费用来源及预算内容不能超过200个字符");
			return false;
		}
		if(this.inviterDesc == null || this.inviterDesc.length() == 0) {
			this.errors.put("publicity", "邀请方简介不能为空");
			return false;
		}
		if(this.inviterDesc.trim().length() > 200) {
			this.errors.put("publicity", "邀请方简介内容不能超过200个字符");
			return false;
		}
		return true;
	}
	
	public Map<String, String> getErrors() {
		return errors;
	}

	public List<VisitMembers> getMembers() {
		return members;
	}

	public String getVisitPlaces() {
		return visitPlaces;
	}

	public void setVisitPlaces(String visitPlaces) {
		this.visitPlaces = visitPlaces;
	}

	public String getTransferPlaces() {
		return transferPlaces;
	}

	public void setTransferPlaces(String transferPlaces) {
		this.transferPlaces = transferPlaces;
	}

	public String getExitDate() {
		return exitDate;
	}

	public void setExitDate(String exitDate) {
		this.exitDate = exitDate;
	}

	public String getEnterDate() {
		return enterDate;
	}

	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}

	public String getDetailedSchedule() {
		return detailedSchedule;
	}

	public void setDetailedSchedule(String detailedSchedule) {
		this.detailedSchedule = detailedSchedule;
	}

	public String getTaskSummary() {
		return taskSummary;
	}

	public void setTaskSummary(String taskSummary) {
		this.taskSummary = taskSummary;
	}

	public String getVisitPersons() {
		return visitPersons;
	}

	public void setVisitPersons(String visitPersons) {
		this.visitPersons = visitPersons;
	}

	public String getBudget() {
		return budget;
	}

	public void setBudget(String budget) {
		this.budget = budget;
	}

	public String getInviterDesc() {
		return inviterDesc;
	}

	public void setInviterDesc(String inviterDesc) {
		this.inviterDesc = inviterDesc;
	}

	public List<Family> getFamilyMembers() {
		return familyMembers;
	}

	public String getMemberName1() {
		return memberName1;
	}

	public void setMemberName1(String memberName1) {
		this.memberName1 = memberName1;
	}

	public String getMemberUnit1() {
		return memberUnit1;
	}

	public void setMemberUnit1(String memberUnit1) {
		this.memberUnit1 = memberUnit1;
	}

	public String getMemberTitle1() {
		return memberTitle1;
	}

	public void setMemberTitle1(String memberTitle1) {
		this.memberTitle1 = memberTitle1;
	}

	public String getMemberName2() {
		return memberName2;
	}

	public void setMemberName2(String memberName2) {
		this.memberName2 = memberName2;
	}

	public String getMemberUnit2() {
		return memberUnit2;
	}

	public void setMemberUnit2(String memberUnit2) {
		this.memberUnit2 = memberUnit2;
	}

	public String getMemberTitle2() {
		return memberTitle2;
	}

	public void setMemberTitle2(String memberTitle2) {
		this.memberTitle2 = memberTitle2;
	}

	public String getMemberName3() {
		return memberName3;
	}

	public void setMemberName3(String memberName3) {
		this.memberName3 = memberName3;
	}

	public String getMemberUnit3() {
		return memberUnit3;
	}

	public void setMemberUnit3(String memberUnit3) {
		this.memberUnit3 = memberUnit3;
	}

	public String getMemberTitle3() {
		return memberTitle3;
	}

	public void setMemberTitle3(String memberTitle3) {
		this.memberTitle3 = memberTitle3;
	}

	public String getMemberName4() {
		return memberName4;
	}

	public void setMemberName4(String memberName4) {
		this.memberName4 = memberName4;
	}

	public String getMemberUnit4() {
		return memberUnit4;
	}

	public void setMemberUnit4(String memberUnit4) {
		this.memberUnit4 = memberUnit4;
	}

	public String getMemberTitle4() {
		return memberTitle4;
	}

	public void setMemberTitle4(String memberTitle4) {
		this.memberTitle4 = memberTitle4;
	}

	public String getMemberName5() {
		return memberName5;
	}

	public void setMemberName5(String memberName5) {
		this.memberName5 = memberName5;
	}

	public String getMemberUnit5() {
		return memberUnit5;
	}

	public void setMemberUnit5(String memberUnit5) {
		this.memberUnit5 = memberUnit5;
	}

	public String getMemberTitle5() {
		return memberTitle5;
	}

	public void setMemberTitle5(String memberTitle5) {
		this.memberTitle5 = memberTitle5;
	}

	public String getGroupUnit() {
		return groupUnit;
	}

	public void setGroupUnit(String groupUnit) {
		this.groupUnit = groupUnit;
	}

	public String getPositionInGroup() {
		return positionInGroup;
	}

	public void setPositionInGroup(String positionInGroup) {
		this.positionInGroup = positionInGroup;
	}

	public String getPlacesInfo() {
		return placesInfo;
	}

	public void setPlacesInfo(String placesInfo) {
		this.placesInfo = placesInfo;
	}

	public String getAuthorityUnit() {
		return authorityUnit;
	}

	public void setAuthorityUnit(String authorityUnit) {
		this.authorityUnit = authorityUnit;
	}

	public String getLatestPlaces() {
		return latestPlaces;
	}

	public void setLatestPlaces(String latestPlaces) {
		this.latestPlaces = latestPlaces;
	}

	public String getFamilyAppellation1() {
		return familyAppellation1;
	}

	public void setFamilyAppellation1(String familyAppellation1) {
		this.familyAppellation1 = familyAppellation1;
	}

	public String getFamilyName1() {
		return familyName1;
	}

	public void setFamilyName1(String familyName1) {
		this.familyName1 = familyName1;
	}

	public String getFamilyAge1() {
		return familyAge1;
	}

	public void setFamilyAge1(String familyAge1) {
		this.familyAge1 = familyAge1;
	}

	public String getFamilyPoliticalStatus1() {
		return familyPoliticalStatus1;
	}

	public void setFamilyPoliticalStatus1(String familyPoliticalStatus1) {
		this.familyPoliticalStatus1 = familyPoliticalStatus1;
	}

	public String getFamilyOtherInfo1() {
		return familyOtherInfo1;
	}

	public void setFamilyOtherInfo1(String familyOtherInfo1) {
		this.familyOtherInfo1 = familyOtherInfo1;
	}

	public String getFamilyAppellation2() {
		return familyAppellation2;
	}

	public void setFamilyAppellation2(String familyAppellation2) {
		this.familyAppellation2 = familyAppellation2;
	}

	public String getFamilyName2() {
		return familyName2;
	}

	public void setFamilyName2(String familyName2) {
		this.familyName2 = familyName2;
	}

	public String getFamilyAge2() {
		return familyAge2;
	}

	public void setFamilyAge2(String familyAge2) {
		this.familyAge2 = familyAge2;
	}

	public String getFamilyPoliticalStatus2() {
		return familyPoliticalStatus2;
	}

	public void setFamilyPoliticalStatus2(String familyPoliticalStatus2) {
		this.familyPoliticalStatus2 = familyPoliticalStatus2;
	}

	public String getFamilyOtherInfo2() {
		return familyOtherInfo2;
	}

	public void setFamilyOtherInfo2(String familyOtherInfo2) {
		this.familyOtherInfo2 = familyOtherInfo2;
	}

	public String getFamilyAppellation3() {
		return familyAppellation3;
	}

	public void setFamilyAppellation3(String familyAppellation3) {
		this.familyAppellation3 = familyAppellation3;
	}

	public String getFamilyName3() {
		return familyName3;
	}

	public void setFamilyName3(String familyName3) {
		this.familyName3 = familyName3;
	}

	public String getFamilyAge3() {
		return familyAge3;
	}

	public void setFamilyAge3(String familyAge3) {
		this.familyAge3 = familyAge3;
	}

	public String getFamilyPoliticalStatus3() {
		return familyPoliticalStatus3;
	}

	public void setFamilyPoliticalStatus3(String familyPoliticalStatus3) {
		this.familyPoliticalStatus3 = familyPoliticalStatus3;
	}

	public String getFamilyOtherInfo3() {
		return familyOtherInfo3;
	}

	public void setFamilyOtherInfo3(String familyOtherInfo3) {
		this.familyOtherInfo3 = familyOtherInfo3;
	}

	public String getFamilyAppellation4() {
		return familyAppellation4;
	}

	public void setFamilyAppellation4(String familyAppellation4) {
		this.familyAppellation4 = familyAppellation4;
	}

	public String getFamilyName4() {
		return familyName4;
	}

	public void setFamilyName4(String familyName4) {
		this.familyName4 = familyName4;
	}

	public String getFamilyAge4() {
		return familyAge4;
	}

	public void setFamilyAge4(String familyAge4) {
		this.familyAge4 = familyAge4;
	}

	public String getFamilyPoliticalStatus4() {
		return familyPoliticalStatus4;
	}

	public void setFamilyPoliticalStatus4(String familyPoliticalStatus4) {
		this.familyPoliticalStatus4 = familyPoliticalStatus4;
	}

	public String getFamilyOtherInfo4() {
		return familyOtherInfo4;
	}

	public void setFamilyOtherInfo4(String familyOtherInfo4) {
		this.familyOtherInfo4 = familyOtherInfo4;
	}

	public String getFamilyAppellation5() {
		return familyAppellation5;
	}

	public void setFamilyAppellation5(String familyAppellation5) {
		this.familyAppellation5 = familyAppellation5;
	}

	public String getFamilyName5() {
		return familyName5;
	}

	public void setFamilyName5(String familyName5) {
		this.familyName5 = familyName5;
	}

	public String getFamilyAge5() {
		return familyAge5;
	}

	public void setFamilyAge5(String familyAge5) {
		this.familyAge5 = familyAge5;
	}

	public String getFamilyPoliticalStatus5() {
		return familyPoliticalStatus5;
	}

	public void setFamilyPoliticalStatus5(String familyPoliticalStatus5) {
		this.familyPoliticalStatus5 = familyPoliticalStatus5;
	}

	public String getFamilyOtherInfo5() {
		return familyOtherInfo5;
	}

	public void setFamilyOtherInfo5(String familyOtherInfo5) {
		this.familyOtherInfo5 = familyOtherInfo5;
	}

	public void setMembers(List<VisitMembers> members) {
		this.members = members;
	}

	public void setFamilyMembers(List<Family> familyMembers) {
		this.familyMembers = familyMembers;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

	public String getRecordName() {
		return recordName;
	}

	public void setRecordName(String recordName) {
		this.recordName = recordName;
	}

	public String getRecordSex() {
		return recordSex;
	}

	public void setRecordSex(String recordSex) {
		this.recordSex = recordSex;
	}

	public String getRecordBirthday() {
		return recordBirthday;
	}

	public void setRecordBirthday(String recordBirthday) {
		this.recordBirthday = recordBirthday;
	}

	public String getRecordPoliticalStatus() {
		return recordPoliticalStatus;
	}

	public void setRecordPoliticalStatus(String recordPoliticalStatus) {
		this.recordPoliticalStatus = recordPoliticalStatus;
	}

	public String getRecordHealth() {
		return recordHealth;
	}

	public void setRecordHealth(String recordHealth) {
		this.recordHealth = recordHealth;
	}

	public String getRecordSecretInfo() {
		return recordSecretInfo;
	}

	public void setRecordSecretInfo(String recordSecretInfo) {
		this.recordSecretInfo = recordSecretInfo;
	}
	
	public void setNotify(String notify) {
		this.notify = notify;
	}
	
	public String getNotify() {
		return notify;
	}
	
}
