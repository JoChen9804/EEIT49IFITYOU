package tw.group5.post.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import tw.group5.post.model.MainPostBean;
import tw.group5.post.model.MainPostRepository;

@Service
@Transactional
public class MainPostService {

    @Autowired
    private MainPostRepository mpResp;

    public MainPostBean insert(MainPostBean javaBean) {
        return mpResp.save(javaBean);
    }

    public MainPostBean update(MainPostBean javaBean) {
        return mpResp.save(javaBean);
    }

    public void deleteById(Integer id) {
        mpResp.deleteById(id);
    }

    public MainPostBean selectById(Integer id) {
        Optional<MainPostBean> optional = mpResp.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return null;
    }

    public List<MainPostBean> findByAccount(String account) {
        return mpResp.findByAccount(account);
    }
    
    public List<MainPostBean> findByAccountAndTitles(String titles,String account) {
        return mpResp.findByAccountAndTitles(titles,account);
    }
    
    public List<MainPostBean> findByPostPermission(String postPermission){
        return mpResp.findByPostPermission(postPermission);
    }
    
    
    public List<MainPostBean> allPosts(Object titles) {
        return mpResp.allPostss(titles);
    }

    public List<MainPostBean> allPosts() {
        return mpResp.allPosts();
    }

    public List<MainPostBean> query(Integer id) {
        Optional<MainPostBean> optional = mpResp.findById(id);
        if (optional.isPresent()) {
            List<MainPostBean> mpbList = new ArrayList<MainPostBean>();
            mpbList.add(optional.get());
            return mpbList;
        }
        return null;
    }

    // 用,隔開寫入
    public String addPostImages(List<MultipartFile> mfs) {
        String sqlImage = "";
        String imgsrc = "C:/images/posts/";
        for (MultipartFile ms : mfs) {
            String imageName = ms.getOriginalFilename();
            if (imageName != null && imageName != "") {
                String newImageName = currentDateFormat("millisecond") + "_" + imageName;
                try {
                    File file = new File(imgsrc, newImageName);
                    ms.transferTo(file);
                    sqlImage += "/images" + "/" + newImageName + ",";
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return sqlImage;
    }



    // 當前系統日期與毫秒數
    public String currentDateFormat(String format) {
        String returnString = "";
        switch (format) {
        case "date":
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d hh:mm:ss");
            returnString = sdf.format(new Date());
            break;
        case "millisecond":
            long nowMilli = Instant.now().toEpochMilli();
            returnString = Long.toString(nowMilli);
            break;
        }
        return returnString;
    }
    
      
    // 照片位置與貼文id寫到Set<PostImageBean>
//    public Set<PostImageBean> addPostImages(List<MultipartFile> mfs, MainPostBean mainPostBean) {
//        Set<PostImageBean> imgsrcs = new LinkedHashSet<PostImageBean>();
//        for (MultipartFile ms : mfs) {
//
//            String submittedFileName = ms.getOriginalFilename();
//            if (submittedFileName != null && submittedFileName != "") {
//                // 檔名
//                String imageName = currentDateFormat("millisecond") + "_" + submittedFileName;
//
//                String sqlImage = "";
//                String imgsrc = "C:/images/posts/";
//
//                try {
//
//                    File file = new File(imgsrc, imageName);
//                    ms.transferTo(file);
//
//                    sqlImage = "/images" + "/" + imageName;
//                    PostImageBean img = new PostImageBean();
//                    img.setP_image(sqlImage); // 寫入照片位置
//                    img.setMainPostBean(mainPostBean);// 寫入貼文的編號
//                    imgsrcs.add(img);
//                    System.out.println("檔名已更新");
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return imgsrcs;
//    }

}
