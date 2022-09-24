package tw.group5.post.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity @Table(name = "replypost")
@Component
public class ReplyPostBean {
    
    @Id @Column(name = "replyno")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int replyNo;                 // 回覆貼文編號
    
    @Column(name = "replyphoto")
    private String replyPhoto;           // 回覆會員照片   
    
    @Column(name = "replyaccount")
    private String replyAccount;         // 回覆帳號 
    
    @Column(name = "replycontent")
    private String replyContent;        // 回覆內容
    
    @Column(name = "replytime")
    private String replyTime;           // 回覆時間
    
    @Column(name = "replylikenumber")
    private String replyLikeNumber;        // 按鑽數量
    
    @Column(name = "r_image")
    private String r_image;              //照片路徑
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "mainpostno")
    private MainPostBean mainPostBean;  
    
    @Transient
    private String [] r_imagess;
    
    @Transient
    private int replyLikeNumbers;
    
    
    public ReplyPostBean() {
    }

    public ReplyPostBean(int replyNo, String replyPhoto, String replyAccount, String replyContent, String replyTime,
            String replyLikeNumber, String r_image, MainPostBean mainPostBean) {
        super();
        this.replyNo = replyNo;
        this.replyPhoto = replyPhoto;
        this.replyAccount = replyAccount;
        this.replyContent = replyContent;
        this.replyTime = replyTime;
        this.replyLikeNumber = replyLikeNumber;
        this.r_image = r_image;
        this.mainPostBean = mainPostBean;
    }

    public int getReplyLikeNumbers() {
        return replyLikeNumbers;
    }

    public void setReplyLikeNumbers(int replyLikeNumbers) {
        this.replyLikeNumbers = replyLikeNumbers;
    }

    public int getReplyNo() {
        return replyNo;
    }
    public void setReplyNo(int replyNo) {
        this.replyNo = replyNo;
    }
    public String getReplyPhoto() {
        return replyPhoto;
    }
    public void setReplyPhoto(String replyPhoto) {
        this.replyPhoto = replyPhoto;
    }
    public String getReplyAccount() {
        return replyAccount;
    }
    public void setReplyAccount(String replyAccount) {
        this.replyAccount = replyAccount;
    }
    public String getReplyContent() {
        return replyContent;
    }
    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }
    public String getReplyTime() {
        return replyTime;
    }
    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }
    public String getReplyLikeNumber() {
        return replyLikeNumber;
    }
    public void setReplyLikeNumber(String replyLikeNumber) {
        this.replyLikeNumber = replyLikeNumber;
    }

    public MainPostBean getMainPostBean() {
        return mainPostBean;
    }

    public void setMainPostBean(MainPostBean mainPostBean) {
        this.mainPostBean = mainPostBean;
    }

    public String getR_image() {
        return r_image;
    }

    public void setR_image(String r_image) {
        this.r_image = r_image;
    }

    public String[] getR_imagess() {
        return r_imagess;
    }

    public void setR_imagess(String[] r_imagess) {
        this.r_imagess = r_imagess;
    }
    
}
