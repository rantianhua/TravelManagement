package cn.sdu.travel.web.formbean;

import java.util.HashMap;
import java.util.Map;

public class LoginForm {
	private String id;
	private String password;
	private Map<String, String> errors = new HashMap<String, String>();

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
		} else if (this.id.length() != 18
				|| !this.id
						.matches("^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$")) {
			isOk = false;
			errors.put("id", "身份证号格式错误！");
		}

		if (this.password == null || this.password.trim().equals("")) {
			isOk = false;
			errors.put("password", "密码不能为空！");
		}
		return isOk;
	}
}
