package cn.sdu.travel.bean;

import java.util.Date;
import java.util.List;

//出行计划
public class VisitPlan {
	private String planId;
	private String outCity;
	private Date exitBorderDate;
	private String backCity;
	private Date enterBorderDate;
	private List<VisitDestination> destinations;

	public String getPlanId() {
		return planId;
	}

	public void setPlanId(String planId) {
		this.planId = planId;
	}

	public String getOutCity() {
		return outCity;
	}

	public void setOutCity(String outCity) {
		this.outCity = outCity;
	}

	public Date getExitBorderDate() {
		return exitBorderDate;
	}

	public void setExitBorderDate(Date exitBorderDate) {
		this.exitBorderDate = exitBorderDate;
	}

	public String getBackCity() {
		return backCity;
	}

	public void setBackCity(String backCity) {
		this.backCity = backCity;
	}

	public Date getEnterBorderDate() {
		return enterBorderDate;
	}

	public void setEnterBorderDate(Date enterBorderDate) {
		this.enterBorderDate = enterBorderDate;
	}

	public List<VisitDestination> getDestinations() {
		return destinations;
	}

	public void setDestinations(List<VisitDestination> destinations) {
		this.destinations = destinations;
	}

}
