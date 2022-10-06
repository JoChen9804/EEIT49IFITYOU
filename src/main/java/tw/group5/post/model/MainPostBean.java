package tw.group5.post.model;

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


@Entity @Table(name = "mainpost")
@Component
public class MainPostBean {
    
    @Id @Column(name = "mainpostno")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer mainPostNo;           // 主貼文編號
    
    @Column(name = "posttypename")
    private String postTypeName;        //貼文種類名稱
    
    @Column(name = "account")
    private String account;             //會員帳號
    
    @Column(name = "title")
    private String title;               //標題
    
    @Column(name = "postpermission")
    private String postPermission;      //論壇會員權限
    
    @Column(name = "postphoto")
    private String postPhoto;           //會員照片        如何使用什麼型態???   
   
    @Column(name = "addtime")
    private String addtime;               //新增時間
    
    @Column(name = "content")
    private String content;             //內容
    
    @Column(name = "likenumber")
    private String likeNumber;             //按鑽數量
    
    @Column(name = "p_image")
    private String p_image;
    
    @Column(name = "lastreplytime")
    private String lastReplyTime;         //最後回覆時間
    
    @Column(name = "replyaccount")
    private String replyAccount;         //最後回覆會員
    
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "mainPostBean",cascade = CascadeType.ALL)
    private Set<ReplyPostBean> replyPostBean = new LinkedHashSet<ReplyPostBean>();
    
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "mainPostBean",cascade = CascadeType.ALL)
    private Set<FavoritePostBean> favoritePostBean = new LinkedHashSet<FavoritePostBean>();
    
    public MainPostBean() {
    }

    public MainPostBean(int mainPostNo, String postTypeName, String account, String title, String postPermission,
            String postPhoto, String addtime, String lastReplyTime, String content, String likeNumber) {
        super();
        this.mainPostNo = mainPostNo;
        this.postTypeName = postTypeName;       //貼文種類名稱
        this.account = account;                 //會員帳號
        this.title = title;                     //標題
        this.postPermission = postPermission;   //論壇會員權限<<新增中
        this.postPhoto = postPhoto;             //圖片<<新增中
        this.addtime = addtime;                 //新增時間
        this.lastReplyTime = lastReplyTime;     //最後回覆時間
        this.content = content;                 //內容
        this.likeNumber = likeNumber;           //按鑽
    }
    public Integer getMainPostNo() {
        return mainPostNo;
    }
    public void setMainPostNo(Integer mainPostNo) {
        this.mainPostNo = mainPostNo;
    }
    public String getPostTypeName() {
        return postTypeName;
    }
    public void setPostTypeName(String postTypeName) {
        this.postTypeName = postTypeName;
    }
    public String getAccount() {
        return account;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getPostPermission() {
        return postPermission;
    }
    public void setPostPermission(String postPermission) {
        this.postPermission = postPermission;
    }
    public String getPostPhoto() {
        return postPhoto;
    }
    public void setPostPhoto(String postPhoto) {
        this.postPhoto = postPhoto;
    }
    public String getAddtime() {
        return addtime;
    }
    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
    public String getReplyAccount() {
        return replyAccount;
    }
    public void setReplyAccount(String replyAccount) {
        this.replyAccount = replyAccount;
    }
    public String getLastReplyTime() {
        return lastReplyTime;
    }
    public void setLastReplyTime(String lastReplyTime) {
        this.lastReplyTime = lastReplyTime;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getLikeNumber() {
        return likeNumber;
    }
    public void setLikeNumber(String likeNumber) {
        this.likeNumber = likeNumber;
    }
    public String getP_image() {
        return p_image;
    }
    public void setP_image(String p_image) {
        this.p_image = p_image;
    }
    
}