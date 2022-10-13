package tw.group5.menu.model;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.group5.post.model.ReplyPostBean;

@Entity
@Table(name = "MENUSET")
@Component
public class MenuSetbean {
	
	@Id
	@Column(name = "SETID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int setid;
	
	@Column(name = "USERACCOUNT")
	private String userAccount;
	
	@Column(name = "MENUNAME")
	private String menuName;
	
	
	@Column(name = "CREATEDATE")
	private String createDate;
	
	@Column(name = "LIKERS")
	private String likers;
	

	@OneToMany(fetch = FetchType.LAZY,mappedBy = "menuSetbean",cascade = CascadeType.ALL)
	 private Set<MenuDetailbean> detailbean = new LinkedHashSet<MenuDetailbean>();
	

	public String getLikers() {
		return likers;
	}
	
	public void setLikers(String likers) {
		this.likers = likers;
	}
	
	
	public Set<MenuDetailbean> getDetailbean() {
		return detailbean;
	}
	
	public void setDetailbean(Set<MenuDetailbean> detailbean) {
		this.detailbean = detailbean;
	}
	
	public int getSetid() {
		return setid;
	}

	public void setSetid(int setid) {
		this.setid = setid;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	
	

}
