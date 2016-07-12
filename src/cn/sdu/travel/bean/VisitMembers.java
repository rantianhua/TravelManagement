package cn.sdu.travel.bean;

//团组成员信息，在公示表中使用
public class VisitMembers {
	private String id;
	private String name;
	private String unit;
	//在团组中的职务
	private String title;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
