package cn.sdu.travel.web.formbean;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PassportInfoForm {
	private String passportName;
	private String name;
	private String sex;
	private String issuingPlace;
	private String birthday;
	private String expDate;
	private String img;
	private String idCard;
	private String accountBook;

	private Map<String, String> errors = new HashMap<String, String>();

	List types = Arrays.asList("jpg", "gif", "jpeg", "png", "bmp");

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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getAccountBook() {
		return accountBook;
	}

	public void setAccountBook(String accountBook) {
		this.accountBook = accountBook;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Map<String, String> errors) {
		this.errors = errors;
	}

	public boolean validate() {
		boolean isOk = true;
		if (this.passportName == null || this.passportName.trim().equals("")) {
			isOk = false;
			this.errors.put("passportName", "请填写您的护照名！");
		}

		if (this.name == null || this.name.trim().equals("")) {
			isOk = false;
			this.errors.put("name", "请填写您的姓名！");
		}

		if (this.sex == null || this.sex.trim().equals("")) {
			isOk = false;
			this.errors.put("sex", "请选择您的性别！");
		}

		if (this.issuingPlace == null || this.issuingPlace.trim().equals("")) {
			isOk = false;
			this.errors.put("issuingPlace", "请填写护照的签发地！");
		}

		if (this.birthday == null || this.birthday.trim().equals("")) {
			isOk = false;
			this.errors.put("birthday", "请填写您的生日！");
		} else if (!this.birthday.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			isOk = false;
			this.errors.put("birthday", "无效的日期格式！");
		}

		if (this.expDate == null || this.expDate.trim().equals("")) {
			isOk = false;
			this.errors.put("expDate", "请填写护照的有效日期！");
		} else if (!this.expDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			isOk = false;
			this.errors.put("expDate", "无效的日期格式！");
		}

		if (this.img == null || this.img.trim().equals("")) {
			isOk = false;
			this.errors.put("img", "请上传您的护照照片！");
		} else {
			String ext = this.img.substring(this.img.lastIndexOf(".") + 1);
			if (!types.contains(ext)) {
				isOk = false;
				this.errors.put("img", "不支持的上传格式！");
			}
		}

		if (this.idCard == null || this.idCard.trim().equals("")) {
			isOk = false;
			this.errors.put("idCard", "请上传您的护照照片！");
		} else {
			String ext = this.idCard
					.substring(this.idCard.lastIndexOf(".") + 1);
			if (!types.contains(ext)) {
				isOk = false;
				this.errors.put("idCard", "不支持的上传格式！");
			}
		}
		
		if (this.accountBook == null || this.accountBook.trim().equals("")) {
			isOk = false;
			this.errors.put("accountBook", "请上传您的护照照片！");
		} else {
			String ext = this.accountBook.substring(this.accountBook.lastIndexOf(".") + 1);
			if (!types.contains(ext)) {
				isOk = false;
				this.errors.put("accountBook", "不支持的上传格式！");
			}
		}

		return isOk;
	}
}
