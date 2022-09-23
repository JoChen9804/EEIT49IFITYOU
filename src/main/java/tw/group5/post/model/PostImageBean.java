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

//@Entity @Table(name = "postimage")
//@Component
public class PostImageBean {
   
    @Id @Column(name = "imageno")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int imageNo;
    
    @Column(name = "p_image")
    private String P_image;
   
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "mainpostno")
    private MainPostBean mainPostBean;
    
    public PostImageBean() {
    }


    public int getImageNo() {
        return imageNo;
    }

    public void setImageNo(int imageNo) {
        this.imageNo = imageNo;
    }



    public String getP_image() {
        return P_image;
    }

    public void setP_image(String p_image) {
        P_image = p_image;
    }


    public MainPostBean getMainPostBean() {
        return mainPostBean;
    }


    public void setMainPostBean(MainPostBean mainPostBean) {
        this.mainPostBean = mainPostBean;
    }
    
}
