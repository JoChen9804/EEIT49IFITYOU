package tw.group5.gym.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonBackReference;

import tw.group5.admin.model.MemberBean;

@Entity
@Table(name = "PAIRDATA")
@Component
public class PairData {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PDID")
	private int pdId;

	@Transient
	private Integer memberId;
	
	@OneToOne(cascade= CascadeType.MERGE)
	@JoinColumn(name = "MEMBERID")
	@JsonBackReference
	private MemberBean member;
	
	@Column(name = "WORKOUTTIME")
	private Integer workoutTime;
	
	@Column(name = "WORKOUTFREQUENCY")
	private Integer workoutFrequency;
	
	@Column(name = "WORKOUTTYPE")
	private Integer workoutType;
	
	@Column(name = "RELATIONSHIP")
	private Integer relationship;
	
	@Column(name = "CURRENTLOCATION")
	private String currentLocation;
	
	@Transient
	private String connection;
	
	@Transient
	private String toPartner;
	
	@Column(name = "PAIRGENDER")
	private Integer pairGender;
	
	@Column(name = "PAIRRELATIONSHIP")
	private Integer pairRelationship;
	
	
	
	public int getPdId() {
		return pdId;
	}

	public void setPdId(int pdId) {
		this.pdId = pdId;
	}


	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public Integer getWorkoutTime() {
		return workoutTime;
	}

	public void setWorkoutTime(Integer workoutTime) {
		this.workoutTime = workoutTime;
	}

	public Integer getWorkoutFrequency() {
		return workoutFrequency;
	}

	public void setWorkoutFrequency(Integer workoutFrequency) {
		this.workoutFrequency = workoutFrequency;
	}

	public Integer getWorkoutType() {
		return workoutType;
	}

	public void setWorkoutType(Integer workoutType) {
		this.workoutType = workoutType;
	}

	public Integer getRelationship() {
		return relationship;
	}

	public void setRelationship(Integer relationship) {
		this.relationship = relationship;
	}

	public String getCurrentLocation() {
		return currentLocation;
	}

	public void setCurrentLocation(String currentLocation) {
		this.currentLocation = currentLocation;
	}

	public String getConnection() {
		return connection;
	}

	public void setConnection(String connection) {
		this.connection = connection;
	}

	public String getToPartner() {
		return toPartner;
	}

	public void setToPartner(String toPartner) {
		this.toPartner = toPartner;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getPairGender() {
		return pairGender;
	}

	public void setPairGender(Integer pairGender) {
		this.pairGender = pairGender;
	}

	public Integer getPairRelationship() {
		return pairRelationship;
	}

	public void setPairRelationship(Integer pairRelationship) {
		this.pairRelationship = pairRelationship;
	}
	
	
	
}
