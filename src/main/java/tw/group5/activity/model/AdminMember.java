package tw.group5.activity.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "member")
@Component
public class AdminMember {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "memberAccount")
	private String memberAccount;
	
	@Column(name = "memberPassword")
	private String memberPassword;
	
	@Column(name = "authority")
	private int authority;
	
	@Column(name = "memberName")
	private String memberName;
	
	@Column(name = "memberPhoto")
	private String memberPhoto;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "fk_memberDetail_id")
	private int fk_memberDetail_id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberAccount() {
		return memberAccount;
	}

	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.memberPhoto = memberPhoto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getFk_memberDetail_id() {
		return fk_memberDetail_id;
	}

	public void setFk_memberDetail_id(int fk_memberDetail_id) {
		this.fk_memberDetail_id = fk_memberDetail_id;
	}
	
	
}
