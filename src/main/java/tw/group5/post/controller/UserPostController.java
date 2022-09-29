package tw.group5.post.controller;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.service.AdminService;
import tw.group5.admin.service.AuthUserDetailService;
import tw.group5.post.model.MainPostBean;
import tw.group5.post.model.ReplyPostBean;
import tw.group5.post.service.MainPostService;
import tw.group5.post.service.ReplyPostService;

@Controller
@RequestMapping("/group5")
@SessionAttributes(names= {"useradmin"})
public class UserPostController {
    
    //主貼文
    @Autowired  
    private MainPostService mpService;
    
    //回復
    @Autowired
    private ReplyPostService rpService;
    
    //管理員與會員
    @Autowired
    private AdminService amService;
    
    
    //view
    public static final String USERPOSTFRONTPAGE = "post/UserPostFrontPage";
    public static final String USERPOSTDETAILS = "post/UserPostDetails";
    
    //會員資料
    public String memberAccount ="test123" ;
    public String postPermission ;
    public String postPhoto ;
    public String replyPhoto ;
    
    public void adminBean() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AdminBean adminBean = amService.findByAccount(username);
        memberAccount = adminBean.getAdminName();
        postPhoto = adminBean.getAdminPhoto();
        replyPhoto = adminBean.getAdminPhoto();
    }
    
    public void memberBean() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        MemberBean memBer = amService.findByAccountMember(username);
        //memberAccount = memBer.getMemberAccount();
        postPhoto = memBer.getMemberPhoto();
        replyPhoto = memBer.getMemberPhoto();
    }
    
    
    //貼文首頁
    @GetMapping("/UserPostAll")
    public ModelAndView postFornt(MainPostBean mpBean) {
        ModelAndView mav = new ModelAndView(USERPOSTFRONTPAGE);
        
        if (mpBean.getTitle() != null) {
            List<MainPostBean> query = firstImagePath(mpService.allPosts(mpBean.getTitle()));
            if (query.isEmpty()) {
                mav.addObject("error", "查無資料");
            }
            mav.addObject("query", query);
            
        } else {
            List<MainPostBean> query = firstImagePath(mpService.allPosts());
            mav.addObject("query", query);
            List<MainPostBean> userposts = firstImagePath(mpService.findByAccount(memberAccount));
            mav.addObject("userposts", userposts);
            System.out.println(userposts.get(0).getAccount());
        }
        
        return mav;
    }
    
    // 發布貼文
    @PostMapping("/Posting")
    public String addingPostConfirming(MainPostBean addPost, @RequestParam("file") List<MultipartFile> mfs)
            throws FileNotFoundException {

        addPost.setPostPhoto(postPhoto);
        addPost.setPostPermission(postPermission);
        addPost.setAccount(memberAccount);
        addPost.setAddtime(mpService.currentDateFormat("date"));
        addPost.setLikeNumber("");
        addPost.setP_image("");
        addPost.setLastReplyTime(mpService.currentDateFormat("date"));
        addPost.setPostPermission("待審核");

        // 測試用路徑串接
        if (!mfs.get(0).isEmpty()) {
            String addPostImages = mpService.addPostImages(mfs);
            System.out.println("有檔案~~~");
            addPost.setP_image(addPostImages);
        }
        mpService.insert(addPost);
        return "redirect:/group5/UserPostAll";
    }
    
    // 觀看ok
    @GetMapping("/PostWtch")
    public ModelAndView watchPost(Integer mainPostNo) {
        MainPostBean queryOne = mpService.selectById(mainPostNo);
        ModelAndView mavMpost = takeOutmpBean(queryOne,USERPOSTDETAILS);
        mavMpost.addObject("postPhoto", postPhoto);
        
        // -----------上面是主貼文------------

        List<ReplyPostBean> allReply = rpService.allReply(mainPostNo);
        if(!allReply.isEmpty()) {
            ModelAndView mav = takeOutrpBean(allReply,mavMpost);
            return mav;
        }
        return mavMpost;
    }
    
    //發表回復
    @PostMapping("/ReplyPost")
    public ModelAndView addingPostConfirming(ReplyPostBean rpBean,MainPostBean mpBean,
                                       @RequestParam("replyfile") List<MultipartFile> mfs) throws FileNotFoundException {
            
            rpBean.setReplyTime(mpService.currentDateFormat("date"));
            rpBean.setReplyLikeNumber("");
            rpBean.setReplyAccount(memberAccount);
            rpBean.setR_image("");
            rpBean.setReplyPhoto(replyPhoto);
            rpBean.setMainPostBean(mpBean);
            MainPostBean queryOne = mpService.selectById(mpBean.getMainPostNo());
            ModelAndView mavmPost = takeOutmpBean(queryOne,USERPOSTDETAILS);
            mavmPost.addObject("postPhoto", postPhoto);
            
            if("".equals(queryOne.getP_image())) {
                queryOne.setP_image(null);
            }
            
            if(!mfs.get(0).isEmpty()) {
                String replyImages = mpService.addPostImages(mfs);
                rpBean.setR_image(replyImages);
            }
            rpService.insert(rpBean);
            
            List<ReplyPostBean> allReply = rpService.allReply(mpBean.getMainPostNo());
            ModelAndView mav = takeOutrpBean(allReply,mavmPost);
            return mav;
    }
    
    
    
    //主貼文重新整理一個bean
    public ModelAndView takeOutmpBean(MainPostBean mpBean ,String view) {
        ModelAndView mav = new ModelAndView(view);
        if ("".equals(mpBean.getP_image()) || mpBean.getP_image()==null) {
            mpBean.setP_image(null);
        }else {
            String[] allImages = mpBean.getP_image().split(",");
            mav.addObject("allImages", allImages);
        }
        if(!"".equals(mpBean.getLikeNumber()) && mpBean.getLikeNumber().indexOf(",") !=-1 && mpBean.getLikeNumber()!=null) {
            String[] oldlikes = mpBean.getLikeNumber().split(",");
            mpBean.setLikeNumber(String.valueOf(oldlikes.length));
        }else {
            mpBean.setLikeNumber("0");
        }
        mav.addObject("queryOne", mpBean);
        return mav;
    }
    
    public ModelAndView takeOutrpBean(List<ReplyPostBean> rpBeans,ModelAndView mav) {
        if (!rpBeans.isEmpty() && rpBeans != null) {
            for (ReplyPostBean oneReply : rpBeans) {
                if (!"".equals(oneReply.getR_image()) && oneReply.getR_image() != null) {
                    String[] allReplyImages = oneReply.getR_image().split(",");
                    oneReply.setR_imagess(allReplyImages);
                }
                if (!"".equals(oneReply.getReplyLikeNumber()) && oneReply.getReplyLikeNumber() != null) {
                    String[] oldlikesReply = oneReply.getReplyLikeNumber().split(",");
                    oneReply.setReplyLikeNumber(String.valueOf(oldlikesReply.length));
                } else {
                    oneReply.setReplyLikeNumber("0");
                }
            }
            mav.addObject("allReply", rpBeans);
            return mav;
        }
        return null;
    }
    
    //貼文點讚
    @PutMapping("/LikesAJAX") @ResponseBody
    public MainPostBean LikesAJAX(MainPostBean mpBean) {
       
        ModelAndView mav = new ModelAndView();
        System.out.println("有找到嗎?");
        MainPostBean queryOne = mpService.selectById(mpBean.getMainPostNo());
        
        String[] oldlikes = queryOne.getLikeNumber().split(",");
        
        int i = 0; // 找到一樣的就+1
        for (String like : oldlikes) {
            System.out.println(like);
            if (like.equals(memberAccount)) {
                i++;
                List<String> list = new ArrayList<String>(Arrays.asList(oldlikes));
                list.remove(memberAccount);

                String newlinkes = "";
                for(String lists : list) {
                    newlinkes += lists+","; 
                    
                    System.out.println(list.toArray());
                }
                queryOne.setLikeNumber(newlinkes);
                mpService.update(queryOne);
                break;
            }
        }
        if (i == 0) {
            String newLike = queryOne.getLikeNumber() + memberAccount + ",";
            queryOne.setLikeNumber(newLike);
            mpService.update(queryOne);
        }
        
        if (!"".equals(queryOne.getLikeNumber())) {
            queryOne.setLikeNumber(String.valueOf(oldlikes.length));
            mav.addObject("likes", queryOne.getLikeNumber().split(",").length);
        }
        else {
            queryOne.setLikeNumber("0");
        }
        return queryOne;
    }
    
    //回覆點讚
    @PutMapping("/ReplyLikesAJAX") @ResponseBody
    public ReplyPostBean ReplyLikesAJAX(ReplyPostBean rpBean) {
        ReplyPostBean replyPostBean = rpService.selectById(rpBean.getReplyNo());
        String[] oldReplylikes = replyPostBean.getReplyLikeNumber().split(",");
        int j = 0; // 找到一樣的就+1
        for (String likeReply : oldReplylikes) {
            if (likeReply.equals(memberAccount)) {
                j++;
                List<String> list = new ArrayList<String>(Arrays.asList(oldReplylikes));
                list.remove(memberAccount);
    
                String newlinkes = "";
                for(String lists : list) {
                    newlinkes += lists + ","; 
                }
                replyPostBean.setReplyLikeNumber(newlinkes);
                rpService.update(replyPostBean);
                break;
            }
        }
        
        if (j == 0) {
            String newLikeReply = replyPostBean.getReplyLikeNumber() + memberAccount + ",";
            replyPostBean.setReplyLikeNumber(newLikeReply);
            rpService.update(replyPostBean);
        }
        if (!"".equals(replyPostBean.getReplyLikeNumber())) {
            replyPostBean.setReplyLikeNumber(String.valueOf(oldReplylikes.length));
        }
        else {
            replyPostBean.setReplyLikeNumber("0");
        }
        return replyPostBean;
    }
    
    
    
    
    // 主貼文抓取第一張圖片並重新寫入Bean，找不到給預設圖片
    public List<MainPostBean> firstImagePath(List<MainPostBean> mpBean) {
        if (mpBean != null) {
            for (MainPostBean oneBean : mpBean) {
                if (!"".equals(oneBean.getP_image()) && oneBean.getP_image() != null
                        && oneBean.getP_image().indexOf(",") != -1) {
                    System.out.println("===" + oneBean.getP_image().substring(0, oneBean.getP_image().indexOf(",")));
                    oneBean.setP_image(oneBean.getP_image().substring(0, (oneBean.getP_image().indexOf(","))));
                } else {
                    oneBean.setP_image("imagestest/defaultScreen.jpg");
                }
            }
            return mpBean;
        }
        return null;
    }

}