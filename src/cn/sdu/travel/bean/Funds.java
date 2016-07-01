package cn.sdu.travel.bean;

//经费承担方
public class Funds {
	private String id;
	private String payType;
	private String payItem;
	private String accountName;
	private String fundsAccount;
	private String proveFile;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayItem() {
		return payItem;
	}

	public void setPayItem(String payItem) {
		this.payItem = payItem;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getFundsAccount() {
		return fundsAccount;
	}

	public void setFundsAccount(String fundsAccount) {
		this.fundsAccount = fundsAccount;
	}

	public String getProveFile() {
		return proveFile;
	}

	public void setProveFile(String proveFile) {
		this.proveFile = proveFile;
	}

	@Override
	public String toString() {
		return "Funds [id=" + id + ", payType=" + payType + ", payItem="
				+ payItem + ", accountName=" + accountName + ", fundsAccount="
				+ fundsAccount + ", proveFile=" + proveFile + "]";
	}
	
}
