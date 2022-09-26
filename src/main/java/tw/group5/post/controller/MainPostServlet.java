package tw.group5.post.controller;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import tw.group5.admin.service.AdminService;
import tw.group5.post.model.MainPostBean;
import tw.group5.post.model.ReplyPostBean;
import tw.group5.post.service.MainPostService;
import tw.group5.post.service.ReplyPostService;

@Controller
@RequestMapping("/group5/admin")
@SessionAttributes(names= {"useradmin"})
public class MainPostServlet {

    @Autowired
    private MainPostService mpService;

    @Autowired
    private ReplyPostService rpService;
    
    @Autowired
    private AdminService amService;
    

    public final String postFrontPage = "post/PostFrontPage";
    public final String postMainPosting = "post/PostMainPosting";
    public final String postDetails = "post/PostDetails";
    public final String postChangePost = "post/PostChangePost";

    // 改成會員帳號 與會員權限
    public String memberAccount = "";
    public String postPermission = "一般會員";
    public String postPhoto ="";
    public String replyPhoto ="";
    
    
    public AdminBean adminBean() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AdminBean admin = amService.findByAccount(username);
        return admin;
    }
    
    
    
    // 首頁進入
    // 推薦使用四種方式最終都是封裝成ModelAndView
    @GetMapping("/MainPost.all")
    public ModelAndView postHomepage2(MainPostBean mpBean,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView(postFrontPage);
        AdminBean adminBean = adminBean();
        memberAccount = adminBean.getAdminName();
        postPhoto = adminBean.getAdminPhoto();
        replyPhoto = adminBean.getAdminPhoto();
        
 
        
        if (mpBean.getMainPostNo() != null) {
            List<MainPostBean> query = firstImagePath(mpService.query(mpBean.getMainPostNo()));
            if (query == null) {
                mav.addObject("error", "查無資料");
            }
            mav.addObject("query", query);
        } else if (mpBean.getTitle() != null) {
            System.out.println("所有貼文");
            List<MainPostBean> query = firstImagePath(mpService.allPosts(mpBean.getTitle()));
            if (query.isEmpty()) {
                mav.addObject("error", "查無資料");
            }
            mav.addObject("query", query);
      
        } else if (mpBean != null ) {
            System.out.println("所有貼文");
         
            List<MainPostBean> query = firstImagePath(mpService.allPosts());
            mav.addObject("query", query);

        }
        return mav;
    }

    // 返回頁面
    @GetMapping("/MainPost.return")
    public ModelAndView backToThePage(String returns) {
        return new ModelAndView("redirect:MainPost.all");
    }

    // 跳轉到新增畫面
    @PostMapping("/MainPosting.add")
    public ModelAndView postPage(String addpost) {
        ModelAndView mav = new ModelAndView(postMainPosting);
        mav.addObject("memberAccount", memberAccount);

        return mav;
    }

    // 發布貼文
    @PostMapping("/MainPosting.controller")
    public String addingPostConfirming(MainPostBean addPost, @RequestParam("Filename2") List<MultipartFile> mfs)
            throws FileNotFoundException {
        
        
//        AdminBean adminBean = adminBean();
//        memberAccount = adminBean.getAdminName();
//        postPhoto = adminBean.getAdminPhoto();
        addPost.setPostPhoto(postPhoto);
        addPost.setPostPermission(postPermission);
        addPost.setAccount(memberAccount);
        addPost.setAddtime(mpService.currentDateFormat("date"));
        addPost.setLikeNumber("");
        addPost.setP_image("");

        // 測試用路徑串接
        if (!mfs.get(0).isEmpty()) {
            String addPostImages = mpService.addPostImages(mfs);
            System.out.println("有檔案~~~");
            addPost.setP_image(addPostImages);
        }
        mpService.insert(addPost);
        return "redirect:MainPost.all";
    }

    // 觀看ok
    @PostMapping("/MainPost.watch")
    public ModelAndView watchPost(Integer watch) {
        
        
        
        MainPostBean queryOne = mpService.selectById(watch);
        ModelAndView mavMpost = takeOutmpBean(queryOne,postDetails);
        mavMpost.addObject("postPhoto", postPhoto);
        
        // -----------上面是主貼文------------

        List<ReplyPostBean> allReply = rpService.allReply(watch);
        if(!allReply.isEmpty()) {
            ModelAndView mav = takeOutrpBean(allReply,mavMpost);
            return mav;
        }
        return mavMpost;
    }

    // 刪除 ok
    @DeleteMapping("/MainPostingServlet")
    public String deleteDainPost(Integer deletepost) {
        mpService.deleteById(deletepost);
        return "redirect:MainPost.all";
    }

    // 跳到修改頁面ok
    @PostMapping("/MainPostingServlet")
    public ModelAndView modifyPage(Integer updatepost) {
        ModelAndView mav = new ModelAndView(postChangePost);
        MainPostBean queryContent = mpService.selectById(updatepost);

        if (!"".equals(queryContent.getP_image()) && queryContent.getP_image() != null) {
            String[] allImages = queryContent.getP_image().split(",");
            mav.addObject("updatImages", allImages);
        } else {
            queryContent.setP_image("");
        }
        mav.addObject("queryContent", queryContent);
        return mav;
    }

    // 修改後送出ok
    @PutMapping("/MainPostServlet")
    public ModelAndView updateMainPost(MainPostBean mpBean, @RequestParam("chamgeimages") List<MultipartFile> mfs) {
        mpBean.setAddtime(mpService.currentDateFormat("date"));
        
        if("".equals(mpBean.getLikeNumber()) || mpBean.getLikeNumber() == null) {
            mpBean.setLikeNumber("");
        }

        if ("".equals(mpBean.getP_image())) {
            mpBean.setP_image("");
        }

        if (!mfs.get(0).isEmpty()) {
            String addPostImages = mpService.addPostImages(mfs);
            mpBean.setP_image(addPostImages);
        }

        MainPostBean queryContent = mpService.update(mpBean);
        if (queryContent != null) {
            return new ModelAndView("redirect:MainPost.all");
        }
        return null;
    }

    // 抓取第一張圖片並重新寫入Bean，找不到給預設圖片
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
            ModelAndView mavmPost = takeOutmpBean(queryOne,postDetails);
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
    
    
    
    
    
    
    
    
    
    
    
    
//    //計算有多少帳號按鑽
//    public Map<String,String> quantityLike(String likes) {
//        Map<String,String> map = new  HashMap<>();
//        String[] oldlikes = likes.split(",");
//        
//        int i = 0; // 找到一樣的就+1
//        for (String like : oldlikes) {
//            
//            if (memberAccount.equals(like)) {
//                i++;
//                List<String> list = new ArrayList<String>(Arrays.asList(oldlikes));
//                list.remove(memberAccount);
//                String [] newStr = new String [list.size()];
//                list.toArray(newStr);
//                String newlinkes = "";
//                
//                for(String oneStr : newStr) {
//                    newlinkes += oneStr+','; 
//                }
//                
//                String[] newlinkess = newlinkes.split(",");
//                map.put("writeAccount",newlinkes);
//                
//                if(!"".equals(likes) && likes!=null ) {
//                    map.put("quantityLike",String.valueOf(newlinkess.length));
//                }else {
//                    map.put("quantityLike","0");
//                }
//   
//                break;
//            }
//        }
//        if (i == 0) {
//            String newlinkes = likes + memberAccount + ",";
//            String[] newlinkess = newlinkes.split(",");
//            map.put("writeAccount",newlinkes);
//            map.put("quantityLike",String.valueOf(newlinkess.length));
//            //queryOne.setLikeNumber(newLike);
//            //mpService.update(queryOne);
//        }
//        
//        
//        return map;
//    }
    
    
    
    
    
    
    
    
    // 測試按讚紀錄 之後改成帳號串起來算陣列數量
   // @PutMapping("/Likes")
    public ModelAndView Likes(MainPostBean mpBean, ReplyPostBean rpBean) {
        MainPostBean queryOne = mpService.selectById(mpBean.getMainPostNo());
        // 改成會員帳號抓取
        String[] oldlikes = queryOne.getLikeNumber().split(",");

        int i = 0; // 找到一樣的就+1
        for (String like : oldlikes) {
            System.out.println(like);
            if (like.equals(memberAccount)) {
                i++;
                break;
            }
        }
        if (i == 0) {
            String newLike = queryOne.getLikeNumber() + memberAccount + ",";
            queryOne.setLikeNumber(newLike);
            mpService.update(queryOne);
        }

        ModelAndView mavMpost = takeOutmpBean(queryOne,postDetails);
        
        List<ReplyPostBean> allReply = rpService.allReply(mpBean.getMainPostNo());
        if(!allReply.isEmpty()) {
            ModelAndView mav = takeOutrpBean(allReply,mavMpost);
            return mav;
        }
        return mavMpost;
    }

    
   // @PutMapping("/ReplyLikes")
    public ModelAndView ReplyLikes(MainPostBean mpBean, ReplyPostBean rpBean) {
       
        MainPostBean queryOne = mpService.selectById(mpBean.getMainPostNo());
        ModelAndView mavmPost = takeOutmpBean(queryOne,postDetails);

        ReplyPostBean replyPostBean = rpService.selectById(rpBean.getReplyNo());
        String[] oldReplylikes = replyPostBean.getReplyLikeNumber().split(",");

        int j = 0; // 找到一樣的就+1
        for (String likeReply : oldReplylikes) {
            if (likeReply.equals(memberAccount)) {
                j++;
                break;
            }
        }
        if (j == 0) {
            String newLikeReply = replyPostBean.getReplyLikeNumber() + memberAccount + ",";
            replyPostBean.setReplyLikeNumber(newLikeReply);
            rpService.update(replyPostBean);
        }

        List<ReplyPostBean> allReply = rpService.allReply(mpBean.getMainPostNo());
        ModelAndView mav = takeOutrpBean(allReply,mavmPost);

        return mav;
    }
    


    // 觀看 測試
    //@GetMapping("/MainPost.watch2/{id}")
    public ModelAndView watchPost2(@PathVariable("id") Integer watch) {
        MainPostBean queryOne = mpService.selectById(watch);
        ModelAndView mav = new ModelAndView("redirect:/MainPost.watch456");
        mav.addObject("queryOne", queryOne);

        if (queryOne.getP_image() != null) {
            String[] allImages = queryOne.getP_image().split(",");
            mav.addObject("allImages", allImages);
        }
        return mav;
    }
    //@PostMapping("/MainPost.watch456")
    public ModelAndView watchPost() {

        ModelAndView mav = new ModelAndView("PostDetails");

        return mav;
    }

    // 先給空的Bean給form:form使用 新增ok
    //@RequestMapping(path = "/addMembers.get", method = RequestMethod.GET)
    public String addingPostConfirmings(Model m) {
        MainPostBean queryOne = new MainPostBean();
        m.addAttribute("addpost", queryOne);
        return "MainPosting2";
    }
    //@RequestMapping(path = "/addMembers", method = RequestMethod.POST)
    public String addingPostConfirmingss(@ModelAttribute("addpost") MainPostBean addPost) {
        addPost.setPostPermission("一般會員");
        addPost.setPostPhoto(null);
        addPost.setAddtime(mpService.currentDateFormat("date"));
        addPost.setLastReplyTime(null);
        // mainPostService.add(addPost);
        return "redirect:/MainPostingServlet.all";
    }
    // 首頁進入
    //@GetMapping("/MainPostingServlet3.all")
    public String postHomepage3(Map<String, Object> map) {
        System.out.println("所有貼文");
        List<MainPostBean> query = mpService.allPosts();
        map.put("query", query);
        return "PostFrontPage";
    }
    // 首頁進入
    //@GetMapping("/MainPostingServlet.all")
    // @RequestMapping(path = "/MainPostingServlet.all",method = RequestMethod.GET)
    public String postHomepage(Model m) {
        System.out.println("所有貼文");
        List<MainPostBean> query = mpService.allPosts();
        m.addAttribute("query", query);
        return "PostFrontPage";
    }
}
