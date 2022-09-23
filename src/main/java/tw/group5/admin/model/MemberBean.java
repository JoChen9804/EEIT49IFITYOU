package tw.group5.admin.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "member")
@Component
public class MemberBean {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String account;
	
	private String password;
	
	private Integer authority;
	
	private String name;
	
	private String photo;
	
	private String email;
	
	@OneToOne(cascade= CascadeType.ALL)
	@JoinColumn(name = "fk_memberDetail_id")
	private MemberDetail memberDetail;

	public MemberBean() {
		super();
	}

	public MemberBean(String account, String password, Integer authority, String name,
			String photo, String email, MemberDetail memberDetail) {
		super();
		this.account = account;
		this.password = password;
		this.authority = authority;
		this.name = name;
		this.photo = photo;
		this.email = email;
		this.memberDetail = memberDetail;
	}
	

	public MemberBean(String memberAccount, String memberPassword, Integer authority, String memberName, String email,
			MemberDetail memberDetail) {
		super();
		this.account = memberAccount;
		this.password = memberPassword;
		this.authority = authority;
		this.name = memberName;
		this.email = email;
		this.memberDetail = memberDetail;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMemberAccount() {
		return account;
	}

	public void setMemberAccount(String memberAccount) {
		this.account = memberAccount;
	}

	public String getMemberPassword() {
		return password;
	}

	public void setMemberPassword(String memberPassword) {
		this.password = memberPassword;
	}

	public Integer getAuthority() {
		return authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

	public String getMemberName() {
		return name;
	}

	public void setMemberName(String memberName) {
		this.name = memberName;
	}

	public String getMemberPhoto() {
		return photo;
	}

	public void setMemberPhoto(String memberPhoto) {
		this.photo = memberPhoto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public MemberDetail getMemberDetail() {
		return memberDetail;
	}

	public void setMemberDetail(MemberDetail memberDetail) {
		this.memberDetail = memberDetail;
	}
   
}
