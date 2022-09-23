package tw.group5.admin.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="admin")
@Component //bean id = "AdminBean" class="admin.model.AdminBean"
public class AdminBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Integer id;
	
	@Column(name = "account")
	private String account;
	
	@Column(name = "password")
	private String password;
	
	private Integer authority;
	
	@Column(name = "admin_photo")
	private String adminPhoto;
	
	
	
	public AdminBean() {
		
	}
	

	public AdminBean(String adminName, String adminPwd, Integer authority, String adminPhoto) {
		super();
		this.account = adminName;
		this.password = adminPwd;
		this.authority = authority;
		this.adminPhoto = adminPhoto;
	}
	


	public AdminBean(String adminName, String adminPwd, Integer authority) {
		super();
		this.account = adminName;
		this.password = adminPwd;
		this.authority = authority;
	}


	public String getAdminPhoto() {
		return adminPhoto;
	}


	public void setAdminPhoto(String adminPhoto) {
		this.adminPhoto = adminPhoto;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdminName() {
		return account;
	}

	public void setAdminName(String adminName) {
		this.account = adminName;
	}

	public String getAdminPwd() {
		return password;
	}

	public void setAdminPwd(String adminPwd) {
		this.password = adminPwd;
	}

	public Integer getAuthority() {
		return authority;
	}

	public void setAuthority(Integer authority) {
		this.authority = authority;
	}

	
	

}
