package cn.sdu.travel.bean;
//家庭成员表，在备案表中用到
public class Family {
	private String id;
	//称谓
	private String appellation;
	private String name;
	private int age;
	private String politicalStatus;
	private String otherInfo;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAppellation() {
		return appellation;
	}
	public void setAppellation(String appellation) {
		this.appellation = appellation;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPoliticalStatus() {
		return politicalStatus;
	}
	public void setPoliticalStatus(String politicalStatus) {
		this.politicalStatus = politicalStatus;
	}
	public String getOtherInfo() {
		return otherInfo;
	}
	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}
	
	
}
