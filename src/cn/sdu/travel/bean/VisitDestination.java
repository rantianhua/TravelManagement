package cn.sdu.travel.bean;

import java.util.Date;

public class VisitDestination {
	private String destination;
	private Date arriveDate;
	private Date exitCityDate;
	private String transAddr;
	private String planId;

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getArriveDate() {
		return arriveDate;
	}

	public void setArriveDate(Date arriveDate) {
		this.arriveDate = arriveDate;
	}

	public Date getExitCityDate() {
		return exitCityDate;
	}

	public void setExitCityDate(Date exitCityDate) {
		this.exitCityDate = exitCityDate;
	}

	public String getTransAddr() {
		return transAddr;
	}

	public void setTransAddr(String transAddr) {
		this.transAddr = transAddr;
	}

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

}
