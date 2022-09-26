
package tw.group5.gym.model;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import tw.group5.admin.model.MemberBean;

@Entity
@Table(name = "gymlog")
@Component
public class GymLog implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "LOGID")
	private int logId;
	
	@Column(name = "MEMBERID")
	@Transient
	private Integer memberId;
	
	@Column(name = "GYMNO")
	@Transient
	private Integer gymId;
	
	@Column(name = "RATING")
	private Integer rating;
	
	@Column(name = "FAVORITE")
	private Integer favorite;
	
	@JoinColumn(name = "GYMNO")
	@ManyToOne
	private GymBean gym;
	
	@JoinColumn(name = "MEMBERID")
	@ManyToOne
	private MemberBean member;
	
	
	public int getLogId() {
		return logId;
	}

	public void setLogId(int logId) {
		this.logId = logId;
	}

	

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getGymId() {
		return gymId;
	}

	public void setGymId(Integer gymId) {
		this.gymId = gymId;
	}

	public Integer getRating() {
		return rating;
	}

	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public Integer getFavorite() {
		return favorite;
	}

	public void setFavorite(Integer favorite) {
		this.favorite = favorite;
	}

	public GymBean getGym() {
		return gym;
	}

	public void setGym(GymBean gym) {
		this.gym = gym;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}
	
	
	
	
	
}
