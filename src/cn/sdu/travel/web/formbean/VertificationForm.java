package cn.sdu.travel.web.formbean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VertificationForm {
	private  String vertificationId;
	  private  String exitBorderDate;
	  private  String enterBorderDate;
	  private  String vertificationProgram;
	  private  String vertificationMoney;
	  private  String vertificationSummerize;
	  private  String vertificationStuff;
	  
	  private Map<String, Object> errors = new HashMap<String,Object>();
	  
	  List types = Arrays.asList("txt", "word", "pdf");
	  
	
	public String getVertificationId() {
		return vertificationId;
	}
	public void setVertificationId(String vertificationId) {
		this.vertificationId = vertificationId;
	}
	public String getExitBorderDate() {
		return exitBorderDate;
	}
	public void setExitBorderDate(String exitBorderDate) {
		this.exitBorderDate = exitBorderDate;
	}
	public String getEnterBorderDate() {
		return enterBorderDate;
	}
	public void setEnterBorderDate(String enterBorderDate) {
		this.enterBorderDate = enterBorderDate;
	}
	
	
	public Map<String, Object> getErrors() {
		return errors;
	}
	public void setErrors(Map<String, Object> errors) {
		this.errors = errors;
	}
	public List getTypes() {
		return types;
	}
	public void setTypes(List types) {
		this.types = types;
	}
	public String getVertificationProgram() {
		return vertificationProgram;
	}
	public void setVertificationProgram(String vertificationProgram) {
		this.vertificationProgram = vertificationProgram;
	}
	public String getVertificationMoney() {
		return vertificationMoney;
	}
	public void setVertificationMoney(String vertificationMoney) {
		this.vertificationMoney = vertificationMoney;
	}
	public String getVertificationSummerize() {
		return vertificationSummerize;
	}
	public void setVertificationSummerize(String vertificationSummerize) {
		this.vertificationSummerize = vertificationSummerize;
	}
	public String getVertificationStuff() {
		return vertificationStuff;
	}
	public void setVertificationStuff(String vertificationStuff) {
		this.vertificationStuff = vertificationStuff;
	}
	
	
	public boolean validate() throws ParseException {
		boolean isOk = true;

		if (this.vertificationId == null || this.vertificationId.trim().equals("")) {
			isOk = false;
			this.errors.put("returnInfo", "请选择您的申请编号！");
		}else if (this.exitBorderDate == null || this.exitBorderDate.trim().equals("")) {
			isOk = false;
			this.errors.put("returnInfo", "请填写您的离境日期！");
		} else if (!this.exitBorderDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			isOk = false;
			this.errors.put("returnInfo", "无效的离境日期！");
		}else if (this.enterBorderDate == null || this.enterBorderDate.trim().equals("")) {
			isOk = false;
			this.errors.put("returnInfo", "请填写您的入境日期！");
		} else if (!this.enterBorderDate.matches("^[12]\\d{3}-[01]\\d-[0123]\\d$")) {
			isOk = false;
			this.errors.put("returnInfo", "无效的入境日期！");
		}
		else{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    Date enter = sdf.parse(this.enterBorderDate);
		    Date exit = sdf.parse(this.exitBorderDate);
		if (enter.before(exit)) {
			isOk = false;
			this.errors.put("returnInfo", "入境时间不能早于出境时间！");}	 
		else if (this.vertificationProgram == null || this.vertificationProgram.trim().equals("")) {
			isOk = false;
			this.errors.put("returnInfo", "请填写您的报销项目！");
		}
		else if (this.vertificationMoney== null || this.vertificationMoney.trim().equals("")) {
			isOk = false;
			this.errors.put("returnInfo", "请填写您的报销金额！");
		}
		else if (this.vertificationSummerize== null || this.vertificationSummerize.trim().equals("")) {
			isOk = false;
			this.errors.put("returnInfo", "请填写您的出访总结！");
		}
		else if (this.vertificationStuff == null || this.vertificationStuff.trim().equals("")) {
			isOk = false;
			this.errors.put("returnInfo", "请上传您的核销材料！");
		} else {
			String ext = this.vertificationStuff.substring(this.vertificationStuff.lastIndexOf(".") + 1);
			if (!types.contains(ext)) {
				isOk = false;
				this.errors.put("returnInfo", "不支持的上传格式！");
			}
		}
	  }
		return isOk;
	}
	
	
	
	
}
