package cn.sdu.travel.web.formbean;

import java.util.HashMap;
import java.util.Map;

import cn.sdu.travel.service.RegisterService;
import cn.sdu.travel.service.impl.RegisterServiceImpl;
import cn.sdu.travel.utils.Constants;

public class RegisterForm {
	private String id;
	private String password;
	private String passwordConfirm;
	private Map errors = new HashMap<String, String>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public Map getErrors() {
		return errors;
	}

	public void setErrors(Map errors) {
		this.errors = errors;
	}

	public boolean validate() {
		boolean isOk = true;
		if (this.id == null || this.id.trim().equals("")) {
			isOk = false;
			errors.put("id", "身份证号不能为空！");
		} else {
			if (this.id.length() != 18
					|| !this.id
							.matches("^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$")) {
				isOk = false;
				errors.put("id", "身份证号格式错误！");
			} else {
				RegisterService service = new RegisterServiceImpl();
				Map map = service.checkId(id);
				if ((int) map.get("returnCode") == Constants.USED_ID) {
					isOk = false;
					errors.put("id", "该身份证已被使用！");
				}
			}
		}

		if (this.password == null || this.password.trim().equals("")) {
			isOk = false;
			errors.put("password", "密码不能为空！");
		}

		if (this.passwordConfirm == null
				|| this.passwordConfirm.trim().equals("")) {
			isOk = false;
			errors.put("passwordConfirm", "密码确认不能为空！");
		} else {
			if (!this.password.equals(this.passwordConfirm)) {
				isOk = false;
				errors.put("passwordConfirm", "两次输入的密码不同！");
			}
		}
		return isOk;
	}
}
