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

@Entity @Table(name = "favoritepost")
@Component
public class FavoritePostBean {
    
    @Id @Column(name = "favoriteno")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer favoriteNo;
    
    @Column(name = "account")
    private String account;     
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "mainpostno")
    private MainPostBean mainPostBean;

    public FavoritePostBean() {
    }
    public Integer getFavoriteNo() {
        return favoriteNo;
    }
    public void setFavoriteNo(Integer favoriteNo) {
        this.favoriteNo = favoriteNo;
    }
    public String getAccount() {
        return account;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public MainPostBean getMainPostBean() {
        return mainPostBean;
    }
    public void setMainPostBean(MainPostBean mainPostBean) {
        this.mainPostBean = mainPostBean;
    }
}
