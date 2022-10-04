package tw.group5.admin.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;



@Entity
@Table(name="memberDetail")
@Component
public class MemberDetail {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private String gender;
	
	private String nickname;
	
	private String birthday;
	
	private String cellphone;
	
	private String postalCode;
	
	private String memberAddress;
	
	private String referralCode;
	
	private String registerReferralCode;
    
	private Integer mute;
	
	private Integer postPermission;
      
	private Integer pairWilling;
	
    private String pairContactInfo;
    
    private String pairRequest;
    
    private String pairInfo;
    
    private String recentLoginDate;
    
    @Column(name = "create_date", updatable = false)
    private String createDate;
	
    
    @OneToOne(mappedBy = "memberDetail")
	private MemberBean member;
    
	public MemberDetail() {
		
	}
	
	public MemberDetail(String gender, String nickname, String birthday, String cellphone, String postalCode,
			String memberAddress, String referralCode, String registerReferralCode, Integer mute,
			Integer postPermission, Integer pairWilling, String pairContactInfo, String pairRequest, String pairInfo,
			String recentLoginDate) {
		super();
		this.gender = gender;
		this.nickname = nickname;
		this.birthday = birthday;
		this.cellphone = cellphone;
		this.postalCode = postalCode;
		this.memberAddress = memberAddress;
		this.referralCode = referralCode;
		this.registerReferralCode = registerReferralCode;
		this.mute = mute;
		this.postPermission = postPermission;
		this.pairWilling = pairWilling;
		this.pairContactInfo = pairContactInfo;
		this.pairRequest = pairRequest;
		this.pairInfo = pairInfo;
		this.recentLoginDate = recentLoginDate;
	}
	
	


	public MemberDetail(Integer id, String gender, String nickname, String birthday, String cellphone,
			String postalCode, String memberAddress, String referralCode, String registerReferralCode, Integer mute,
			Integer postPermission, Integer pairWilling, String pairContactInfo, String pairRequest, String pairInfo,
			String recentLoginDate) {
		super();
		this.id = id;
		this.gender = gender;
		this.nickname = nickname;
		this.birthday = birthday;
		this.cellphone = cellphone;
		this.postalCode = postalCode;
		this.memberAddress = memberAddress;
		this.referralCode = referralCode;
		this.registerReferralCode = registerReferralCode;
		this.mute = mute;
		this.postPermission = postPermission;
		this.pairWilling = pairWilling;
		this.pairContactInfo = pairContactInfo;
		this.pairRequest = pairRequest;
		this.pairInfo = pairInfo;
		this.recentLoginDate = recentLoginDate;
	}

	

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getReferralCode() {
		return referralCode;
	}

	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}

	public String getRegisterReferralCode() {
		return registerReferralCode;
	}

	public void setRegisterReferralCode(String registerReferralCode) {
		this.registerReferralCode = registerReferralCode;
	}

	public Integer getMute() {
		return mute;
	}

	public void setMute(Integer mute) {
		this.mute = mute;
	}

	public Integer getPostPermission() {
		return postPermission;
	}

	public void setPostPermission(Integer postPermission) {
		this.postPermission = postPermission;
	}

	public Integer getPairWilling() {
		return pairWilling;
	}

	public void setPairWilling(Integer pairWilling) {
		this.pairWilling = pairWilling;
	}

	public String getPairContactInfo() {
		return pairContactInfo;
	}

	public void setPairContactInfo(String pairContactInfo) {
		this.pairContactInfo = pairContactInfo;
	}

	public String getPairRequest() {
		return pairRequest;
	}

	public void setPairRequest(String pairRequest) {
		this.pairRequest = pairRequest;
	}

	public String getPairInfo() {
		return pairInfo;
	}

	public void setPairInfo(String pairInfo) {
		this.pairInfo = pairInfo;
	}

	public String getRecentLoginDate() {
		return recentLoginDate;
	}

	public void setRecentLoginDate(String recentLoginDate) {
		this.recentLoginDate = recentLoginDate;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}
	
	

	


	

}
