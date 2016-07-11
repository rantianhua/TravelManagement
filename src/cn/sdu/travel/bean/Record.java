package cn.sdu.travel.bean;

import java.util.List;

public class Record {

	private String id;
	private String name;
	private String sex;
	private String birthday;
	private String politicalStatus;
	private String health;
	private String secretInfo;
	private String familyMembers;
	private String groupUnit;
	private String positionInGroup;
	private String placesInfo;
	private String latestPlaces;
	
	private List<Family> familys;

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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPoliticalStatus() {
		return politicalStatus;
	}

	public void setPoliticalStatus(String politicalStatus) {
		this.politicalStatus = politicalStatus;
	}

	public String getHealth() {
		return health;
	}

	public void setHealth(String health) {
		this.health = health;
	}

	public String getSecretInfo() {
		return secretInfo;
	}

	public void setSecretInfo(String secretInfo) {
		this.secretInfo = secretInfo;
	}

	public String getFamilyMembers() {
		return familyMembers;
	}

	public void setFamilyMembers(String familyMembers) {
		this.familyMembers = familyMembers;
	}

	public String getGroupUnit() {
		return groupUnit;
	}

	public void setGroupUnit(String groupUnit) {
		this.groupUnit = groupUnit;
	}

	public String getPositionInGroup() {
		return positionInGroup;
	}

	public void setPositionInGroup(String positionInGroup) {
		this.positionInGroup = positionInGroup;
	}

	public String getPlacesInfo() {
		return placesInfo;
	}

	public void setPlacesInfo(String placesInfo) {
		this.placesInfo = placesInfo;
	}

	public String getLatestPlaces() {
		return latestPlaces;
	}

	public void setLatestPlaces(String latestPlaces) {
		this.latestPlaces = latestPlaces;
	}

	public List<Family> getFamilys() {
		return familys;
	}

	public void setFamilys(List<Family> familys) {
		this.familys = familys;
	}
	
	
	
}
