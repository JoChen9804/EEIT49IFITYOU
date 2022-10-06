package tw.group5.activity.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "signup")
@Component
public class ActivitySignUp {

	@Id
	@Column(name = "signupid")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int signUpId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "activityid")
	private ActivityActivity activity;
	
	@Column(name = "memberid")
	private int memberId;
	
	@Column(name = "membername")
	private String memberName;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "signuptime")
	private String signUpTime;

	public int getSignUpId() {
		return signUpId;
	}

	public void setSignUpId(int signUpId) {
		this.signUpId = signUpId;
	}

	public ActivityActivity getActivity() {
		return activity;
	}

	public void setActivity(ActivityActivity activity) {
		this.activity = activity;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSignUpTime() {
		return signUpTime;
	}

	public void setSignUpTime(String signUpTime) {
		this.signUpTime = signUpTime;
	}

	
}
