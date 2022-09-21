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
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "mainpostno")
    private MainPostBean mainPostBean;  
    
    public ReplyPostBean() {
    }
    
    public ReplyPostBean(int replyNo, String replyPhoto, String replyAccount, String replyContent, String replyTime,
            String replyLikeNumber) {
        super();
        this.replyNo = replyNo;
        this.replyPhoto = replyPhoto;
        this.replyAccount = replyAccount;
        this.replyContent = replyContent;
        this.replyTime = replyTime;
        this.replyLikeNumber = replyLikeNumber;
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
}
