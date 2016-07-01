package cn.sdu.travel.bean;

import java.util.Date;

//个人信息
public class HumanResource {
	private String id;
	private String role;
	private String nameCh;
	private String nameEn;
	private String sex;
	private String namePinyin;
	private String otherName;
	private Date birthday;
	private String position;
	private String company;
	private String passport;
	private String email;
	private String mobilePhone;
	private String fixedPhone;
	private String emergencyContactPerson;

	private EmergencyContactPerson ecp;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getNameCh() {
		return nameCh;
	}

	public void setNameCh(String nameCh) {
		this.nameCh = nameCh;
	}

	public String getNameEn() {
		return nameEn;
	}

	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNamePinyin() {
		return namePinyin;
	}

	public void setNamePinyin(String namePinyin) {
		this.namePinyin = namePinyin;
	}

	public String getOtherName() {
		return otherName;
	}

	public void setOtherName(String otherName) {
		this.otherName = otherName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getFixedPhone() {
		return fixedPhone;
	}

	public void setFixedPhone(String fixedPhone) {
		this.fixedPhone = fixedPhone;
	}

	public String getEmergencyContactPerson() {
		return emergencyContactPerson;
	}

	public void setEmergencyContactPerson(String emergencyContactPerson) {
		this.emergencyContactPerson = emergencyContactPerson;
	}

	public EmergencyContactPerson getEcp() {
		return ecp;
	}

	public void setEcp(EmergencyContactPerson ecp) {
		this.ecp = ecp;
	}

	@Override
	public String toString() {
		return "HumanResource [id=" + id + ", role=" + role + ", nameCh="
				+ nameCh + ", nameEn=" + nameEn + ", sex=" + sex
				+ ", namePinyin=" + namePinyin + ", otherName=" + otherName
				+ ", birthday=" + birthday + ", position=" + position
				+ ", company=" + company + ", passport=" + passport
				+ ", email=" + email + ", mobilePhone=" + mobilePhone
				+ ", fixedPhone=" + fixedPhone + ", emergencyContactPerson="
				+ emergencyContactPerson + ", ecp=" + ecp + "]";
	}

}
