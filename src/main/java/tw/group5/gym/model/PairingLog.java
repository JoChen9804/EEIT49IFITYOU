package tw.group5.gym.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import tw.group5.admin.model.MemberBean;

@Entity @Table(name = "pairinglog")
@Component
public class PairingLog {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "MEMBERID")
	private MemberBean member;
	
	@Column(name = "PAIRINGDATE")
	private String pairingDate;
	
	@Column(name = "PAIRINGNO")
	private Integer pairingNo;
	
	@Transient
	private List<GymBean> gymList;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public MemberBean getMember() {
		return member;
	}
	public void setMember(MemberBean member) {
		this.member = member;
	}
	public String getPairingDate() {
		return pairingDate;
	}
	public void setPairingDate(String pairingDate) {
		this.pairingDate = pairingDate;
	}
	public Integer getPairingNo() {
		return pairingNo;
	}
	public void setPairingNo(Integer pairingNo) {
		this.pairingNo = pairingNo;
	}
	public List<GymBean> getGymList() {
		return gymList;
	}
	public void setGymList(List<GymBean> gymList) {
		this.gymList = gymList;
	}
	
	
	
	
	
}
