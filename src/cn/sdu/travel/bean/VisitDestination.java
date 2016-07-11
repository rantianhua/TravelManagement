package cn.sdu.travel.bean;

public class VisitDestination {
	private String planId;
	private String country;
	private String city;
	private String arriveDate;
	private String exitCityDate;
	private String transfer;
	private String transAddr;

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getArriveDate() {
		return arriveDate;
	}

	public void setArriveDate(String arriveDate) {
		this.arriveDate = arriveDate;
	}

	public String getExitCityDate() {
		return exitCityDate;
	}

	public void setExitCityDate(String exitCityDate) {
		this.exitCityDate = exitCityDate;
	}

	public String getTransfer() {
		return transfer;
	}

	public void setTransfer(String transfer) {
		this.transfer = transfer;
	}

	public String getTransAddr() {
		return transAddr;
	}

	public void setTransAddr(String transAddr) {
		this.transAddr = transAddr;
	}

}
