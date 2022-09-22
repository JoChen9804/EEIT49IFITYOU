package tw.group5.post.controller;

import java.io.FileNotFoundException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.post.model.MainPostBean;
import tw.group5.post.model.ReplyPostBean;
import tw.group5.post.service.MainPostService;
import tw.group5.post.service.ReplyPostService;

@Controller
@RequestMapping("/group5")
public class ReplyPostController {
    
    @Autowired
    private MainPostService mpService;
    
    @Autowired
    private ReplyPostService rpService;
    
    public final String postFrontPage ="post/PostFrontPage";
    public final String postMainPosting ="post/PostMainPosting";
    public final String postDetails ="post/PostDetails";
    public final String postChangePost = "post/PostChangePost";
    
    
    //改成會員帳號 與會員權限
    public String memberAccount ="test123";
    public String postPermission = "一般會員";
    
    
    
    
    @PostMapping("/ReplyPost")
    public ModelAndView addingPostConfirming(ReplyPostBean rpBean,MainPostBean mpBean,
                                       @RequestParam("replyfile") List<MultipartFile> mfs) throws FileNotFoundException {
            ModelAndView mav = new ModelAndView(postDetails);
        
//          rpBean.setPostPermission(postPermission);
            rpBean.setReplyTime(mpService.currentDateFormat("date"));
            rpBean.setReplyLikeNumber("");
            rpBean.setReplyAccount(memberAccount);
            rpBean.setR_image("");
            
            
            rpBean.setMainPostBean(mpBean);
            
            
            MainPostBean queryOne = mpService.selectById(mpBean.getMainPostNo());
            if("".equals(queryOne.getP_image())) {
                queryOne.setP_image(null);
            }
            
            mav.addObject("queryOne",queryOne);
        //測試用路徑串接
            if(!mfs.get(0).isEmpty()) {
                String replyImages = mpService.addPostImages(mfs);
                System.out.println(replyImages);
                rpBean.setR_image(replyImages);
            }
            
   
            
//            if(  queryOne.getP_image() !=null && !queryOne.getP_image().equals("")) {
//                String[] allImages =queryOne.getP_image().split(",");
//                mav.addObject("allImages",allImages);
//            }
            
            if(!"".equals(queryOne.getP_image()) && queryOne.getP_image() != null) {
                String[] allImages =queryOne.getP_image().split(",");
                mav.addObject("allImages",allImages);
            }
            
            if(!"".equals(queryOne.getLikeNumber()) &&queryOne.getLikeNumber() !=null) {
                String[] oldlikes =queryOne.getLikeNumber().split(",");
                mav.addObject("likes",oldlikes.length);
            }else {
                mav.addObject("likes",0);
            }
            
            
            
            System.out.println("測試-----"+ "".equals(queryOne.getLikeNumber()));
            
            rpService.insert(rpBean);
        return mav;
    }
    
    
    
}
