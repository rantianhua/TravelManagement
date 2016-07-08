package cn.sdu.travel.web.formbean;

import java.util.HashMap;
import java.util.Map;

public class UserInfoForm {
	private String id;
	private String nameCh;
	private String nameEn;
	private String namePinyin;
	private String otherName;
	private String sex;
	private String birthday;
	private String passport;
	private String email;
	private String mobilePhone;
	private String fixedPhone;
	private String category;
	private String position;
	private String subPosition;
	private String company;

	private String ecpName;
	private String ecpEmail;
	private String ecpMobilePhone;
	private String ecpFixedPhone;

	private Map<String, String> errors = new HashMap<String, String>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getSubPosition() {
		return subPosition;
	}

	public void setSubPosition(String subPosition) {
		this.subPosition = subPosition;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getEcpName() {
		return ecpName;
	}

	public void setEcpName(String ecpName) {
		this.ecpName = ecpName;
	}

	public String getEcpEmail() {
		return ecpEmail;
	}

	public void setEcpEmail(String ecpEmail) {
		this.ecpEmail = ecpEmail;
	}

	public String getEcpMobilePhone() {
		return ecpMobilePhone;
	}

	public void setEcpMobilePhone(String ecpMobilePhone) {
		this.ecpMobilePhone = ecpMobilePhone;
	}

	public String getEcpFixedPhone() {
		return ecpFixedPhone;
	}

	public void setEcpFixedPhone(String ecpFixedPhone) {
		this.ecpFixedPhone = ecpFixedPhone;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

	public boolean validate() {
		boolean isOk = true;
		if (this.nameCh.trim().equals("") || this.nameCh == null) {
			if (this.nameEn.trim().equals("") || this.nameEn == null) {
				isOk = false;
				this.errors.put("nameCh", "中英文名必须至少填写一项！");
			}
		} else if (this.namePinyin.trim().equals("") || this.namePinyin == null) {
			isOk = false;
			this.errors.put("namePinyin", "请填写姓名拼音！");
		}
		
		if (this.sex.trim().equals("") || this.sex == null) {
			isOk = false;
			this.errors.put("sex", "请选择您的性别！");
		}

		if (this.birthday.trim().equals("") || this.birthday == null) {
			isOk = false;
			this.errors.put("birthday", "请填写您的生日！");
		} else if (!this.birthday.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			isOk = false;
			this.errors.put("birthday", "无效的日期格式！");
		}

		if (this.passport.trim().equals("") || this.passport == null) {
			isOk = false;
			this.errors.put("passport", "请填写您的护照号码！");
		}

		if (this.email.trim().equals("") || this.email == null) {
			if (this.mobilePhone.trim().equals("") || this.mobilePhone == null) {
				if (this.fixedPhone.trim().equals("")
						|| this.fixedPhone == null) {
					isOk = false;
					this.errors.put("email", "请至少填写一种联系方式！");
				}
			}
		} else {
			if (!this.email
					.matches("^\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}$")) {
				isOk = false;
				this.errors.put("email", "无效的电子邮箱格式！");
			}
		}

		if (this.position.trim().equals("") || this.position == null) {
			isOk = false;
			this.errors.put("position", "请填写您的职务！");
		}

		if (this.company.trim().equals("") || this.company == null) {
			isOk = false;
			this.errors.put("company", "请填写您的所在单位！");
		}

		if (!(this.ecpName == null || this.ecpName.trim().equals(""))) {
			if (this.ecpEmail.trim().equals("") || this.ecpEmail == null) {
				if (this.ecpMobilePhone.trim().equals("")
						|| this.ecpMobilePhone == null) {
					if (this.ecpFixedPhone.trim().equals("")
							|| this.ecpFixedPhone == null) {
						isOk = false;
						this.errors.put("ecpEmail", "请至少填写一种联系方式！");
					}
				}
			} else {
				if (!this.email
						.matches("^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$")) {
					isOk = false;
					this.errors.put("ecpEmail", "无效的电子邮箱格式！");
				}
			}
		}

		return isOk;
	}
}
