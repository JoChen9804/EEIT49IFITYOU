package tw.group5.post.controller;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
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

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import tw.group5.admin.model.AdminBean;
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
import tw.group5.admin.service.AdminService;
import tw.group5.post.model.FavoritePostBean;
import tw.group5.post.model.MainPostBean;
import tw.group5.post.model.ReplyPostBean;
import tw.group5.post.service.FavoritePostService;
import tw.group5.post.service.MainPostService;
import tw.group5.post.service.ReplyPostService;

@Controller
@RequestMapping("/group5")
@SessionAttributes(names= {"user"})
public class UserPostController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //主貼文
    @Autowired  
    private MainPostService mpService;
    
    //回復
    @Autowired
    private ReplyPostService rpService;
    
    //收藏
    @Autowired
    private FavoritePostService fpService;
    
    
    //管理員與會員
    @Autowired
    private AdminService amService;
    
    
    //view
    public static final String USERPOSTFRONTPAGE = "post/UserPostFrontPage";
    public static final String USERPOSTDETAILS = "post/UserPostDetails";
    public static final String USERPOSTCHANGEPOST = "post/UserPostChangePost";
    
    //會員資料
    public String memberAccount  ;
    public String postPermission ;
    public String postPhoto ;
    public String replyPhoto  ;
    
    //預設資料
    public String presetPhotos = "postfolder/images/defaultScreen.jpg";
    public String state = "待審核";
    public String published = "已發布";
    
    
//    public void adminBean() {
//        String username = SecurityContextHolder.getContext().getAuthentication().getName();
//        AdminBean adminBean = amService.findByAccount(username);
//        memberAccount = adminBean.getAdminName();
//        postPhoto = adminBean.getAdminPhoto();
//        replyPhoto = adminBean.getAdminPhoto();
//    }
//    
    public void memberBean(MemberBean mbBean) {
        //String username = SecurityContextHolder.getContext().getAuthentication().getName();
        //MemberBean memBer = amService.findByAccountMember(username);
        memberAccount = mbBean.getMemberAccount();
        postPhoto = mbBean.getMemberPhoto();
        replyPhoto = mbBean.getMemberPhoto();
    }
    
    //判斷使用者禁言
    @ResponseBody
    @PostMapping("/WhetherToMute/{useraccount}")
    public Integer whetherToMute(@PathVariable("useraccount")String useraccount) {
        MemberBean mbBean = amService.findByAccountMember(useraccount);
        MemberDetail memberDetail = mbBean.getMemberDetail();
        System.out.println("禁言嗎:"+memberDetail.getMute());
        return memberDetail.getMute();
    }
    
    
    
    
    //貼文首頁
    @GetMapping("/UserPostAll")
    public ModelAndView postFornt(MainPostBean mpBean,HttpSession session) {
        MemberBean user = (MemberBean)session.getAttribute("loginMember");
        if(user != null) {
            memberBean((MemberBean) user);
            MemberDetail memberDetail = user.getMemberDetail();
            
            System.out.println("找會員id"+memberDetail.getId());
            System.out.println("找會員id"+memberDetail.getMute());
            
            
        }
        System.out.println("目前使用者:"+memberAccount);
        //找到會員帳號先入到Bean
        //mpBean.setAccount(memberAccount);
        ModelAndView mav = new ModelAndView(USERPOSTFRONTPAGE);
        mav.addObject("user",user);
        
        //查詢標題已發布的
        if (mpBean.getTitle() != null) {
            List<MainPostBean> query = firstImagePath(mpService.userallPosts(mpBean.getTitle(),published));
            
//            List<MainPostBean> userposts = firstImagePath(mpService.findByAccount(memberAccount));
            if (query.isEmpty()) {
                mav.addObject("error", "查無資料");
            }else {
                mav.addObject("query", query);
            }
            
//            if(mpBean.getTitle() != null && mpBean.getAccount() != null){
//                mpService.findByAccountAndTitles(mpBean.getTitle(),mpBean.getAccount());
//                
//                mav.addObject("userposts", userposts);
//            }else if(mpBean.getAccount() ==null){
//                mav.addObject("notYetPublished", "請登入會員或加入會員");
//            }else {
//                mav.addObject("notYetPublished", "尚未發布貼文");
//            }
            
        } else {
            
            
            //使用的發布的
            List<MainPostBean> query = firstImagePath(mpService.findByPostPermission(published));
            mav.addObject("query", query);
        } 
        return mav;
    }
    
    //貼文首頁
    @GetMapping("/UserPostAllAJAX") @ResponseBody
    public List<MainPostBean> postForntAJAX(MainPostBean mpBean,HttpSession session) {
        
        MemberBean user = (MemberBean)session.getAttribute("loginMember");
        List<MainPostBean> query =null;
        if(user != null) {
            memberBean((MemberBean) user);
            MemberDetail memberDetail = user.getMemberDetail();
            System.out.println("找會員id"+memberDetail.getId());
            System.out.println("找會員id"+memberDetail.getMute());
        }
        System.out.println("目前使用者Ajax:"+memberAccount);
        //找到會員帳號先入到Bean
        //mpBean.setAccount(memberAccount);
        ModelAndView mav = new ModelAndView(USERPOSTFRONTPAGE);
        mav.addObject("user",user);
        
        //查詢標題已發布的
        if (mpBean.getTitle() != null) {
             query = firstImagePath(mpService.userallPosts(mpBean.getTitle(),published));
            if (query.isEmpty()) {
                MainPostBean mpBeans = new MainPostBean();
                mpBeans.setMainPostNo(0);
                query.add(mpBeans);
                System.out.println("131232"+query.get(0).getMainPostNo());
                return query;
            }
            
        } else {
            //使用的發布的
            query = firstImagePath(mpService.findByPostPermission(published));
            System.out.println("AjaxAjax:");
        } 
        
        return query;
    }
    
    
    //點閱率前三名貼文
    @ResponseBody 
    @PostMapping("/TopThreePostsAJAX") 
    public List<MainPostBean> topThreePosts() {
        List<MainPostBean> topThreePosts = firstImagePath(mpService.topThreePosts());
        //System.out.println("次數:"+topThreePosts.get(2).getCtr());
        
        return topThreePosts;
    }
    
    //案讚前三名貼文
    @ResponseBody 
    @PostMapping("/CaseDrilltopThreeAJAX") 
    public List<MainPostBean> caseDrilltopThree() {
        List<MainPostBean> query = firstImagePath(mpService.findByPostPermission(published));
        for(MainPostBean beans : query) {
            if(!"".equals(beans.getLikeNumber()) && beans.getLikeNumber().indexOf(",") !=-1 && beans.getLikeNumber()!=null) {
                String[] oldlikes = beans.getLikeNumber().split(",");
                beans.setLikeNumber(String.valueOf(oldlikes.length));
            }else {
                beans.setLikeNumber("0");
            }
        }
        List<MainPostBean> newquery = 
                query.stream().sorted(Comparator.comparing(MainPostBean::getLikeNumber).reversed()).collect(Collectors.toList());
        for(int i = 1 ; i<newquery.size() ; i++) {
            newquery.remove(i);
        }
        
        System.out.println("77777777777"+newquery.size());
        
        return newquery;
    }
    
    
    //找user發布的貼文
    @ResponseBody 
    @PostMapping("/UserPostsAJAX/{account}") 
    public List<MainPostBean> userPostsAJAX(@PathVariable("account") String account){
        System.out.println("有使用者的貼文嗎?");
        List<MainPostBean> userposts = firstImagePath(mpService.findByAccount(memberAccount));
        if(!userposts.isEmpty()) {
            return userposts;
        }else {
            MainPostBean mpBean = new MainPostBean();
            mpBean.setMainPostNo(0);
            userposts.add(mpBean);
            return userposts;
        }
    }
    
    
    // 發布貼文
    @PostMapping("/Posting")
    public String addingPostConfirming(MainPostBean addPost, @RequestParam("file") List<MultipartFile> mfs)
            throws FileNotFoundException {
        addPost.setPostPhoto(postPhoto);
        addPost.setAccount(memberAccount);
        addPost.setAddtime(mpService.currentDateFormat("date"));
        addPost.setLikeNumber("");
        addPost.setP_image("");
        addPost.setReplyAccount(memberAccount);
        addPost.setLastReplyTime(mpService.currentDateFormat("date"));
        addPost.setPostPermission(state);
        addPost.setCtr(0);

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
    public ModelAndView watchPost(Integer mainPostNo,HttpSession session) {
        MainPostBean queryOne = mpService.selectById(mainPostNo);
        //已發布的 點閱率+1
        if("已發布".equals(queryOne.getPostPermission())){
            queryOne.setCtr(queryOne.getCtr()+1);
            mpService.update(queryOne);
        }
        ModelAndView mavMpost = takeOutmpBean(queryOne,USERPOSTDETAILS);
        mavMpost.addObject("postPhoto", postPhoto);
        //mavMpost.addObject("user",user);
        // -----------上面是主貼文------------

        List<ReplyPostBean> allReply = rpService.allReply(mainPostNo);
        if(!allReply.isEmpty()) {
            ModelAndView mav = takeOutrpBean(allReply,mavMpost);
            return mav;
        }
        return mavMpost;
    }
    
    // 觀看 測試超連結
    @GetMapping("/MainPost.watch/{mainPostNo}")
    public ModelAndView getWatchPost(@PathVariable("mainPostNo")Integer mainPostNo) {
        MainPostBean queryOne = mpService.selectById(mainPostNo);
        //已發布的 點閱率+1
        if("已發布".equals(queryOne.getPostPermission())){
            queryOne.setCtr(queryOne.getCtr()+1);
            mpService.update(queryOne);
        }
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
    
    
    // 刪除 ok
    @ResponseBody
    @DeleteMapping("/UserPost")
    public void deleteDainPost(Integer deletepost) {
        mpService.deleteById(deletepost);
        //return "redirect:/group5/UserPostAll";
    }

    
    // 跳到修改頁面ok
    @PostMapping("/UserPostChange")
    public ModelAndView modifyPage(Integer updatepost) {
        
        ModelAndView mav = new ModelAndView(USERPOSTCHANGEPOST);
        
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
    
    //修改
    @PutMapping("/UserPost")
    public ModelAndView updateMainPost(MainPostBean mpBean, @RequestParam("changeimages") List<MultipartFile> mfs) {
        mpBean.setAddtime(mpService.currentDateFormat("date"));
        mpBean.setPostPermission(state);
        
        System.out.println(mpBean.getAccount());
        
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
            return new ModelAndView("redirect:/group5/UserPostAll");
        }
        return null;
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
            queryOne.setLastReplyTime(rpBean.getReplyTime());
            queryOne.setReplyAccount(memberAccount);
            mpService.update(queryOne);
            
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
    //回覆重新整理一個bean
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
    @ResponseBody
    @PutMapping("/LikesAJAX") 
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
            String[] newlikes = queryOne.getLikeNumber().split(",");
            
            queryOne.setLikeNumber(String.valueOf(newlikes.length));
            mav.addObject("likes", queryOne.getLikeNumber().split(",").length);
        }
        else {
            queryOne.setLikeNumber("0");
        }
        return queryOne;
    }
    
    //回覆點讚
    @ResponseBody
    @PutMapping("/ReplyLikesAJAX") 
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
            String[] newReplylikes = replyPostBean.getReplyLikeNumber().split(",");
            replyPostBean.setReplyLikeNumber(String.valueOf(newReplylikes.length));
        }
        else {
            replyPostBean.setReplyLikeNumber("0");
        }
        return replyPostBean;
    }
    
    //檢舉
    @ResponseBody
    @PutMapping("/ReplyReportAJAX/{replyNo}/{text}") 
    public void report(@PathVariable("replyNo") Integer replyNo,
                            @PathVariable("text") String text) {
        ReplyPostBean rpBean = rpService.selectById(replyNo);
        rpBean.setReplyPermission(text);
        rpService.update(rpBean);
    }
    
    //收藏貼文
    @ResponseBody 
    @PostMapping("/FavoritePostAJAX") 
    public String favoritePost(MainPostBean mpBean) {
        List<FavoritePostBean> fpBean = fpService.findAccountFavorite(memberAccount, mpBean.getMainPostNo());
        
        if(memberAccount != null) {
            if(!fpBean.isEmpty()) {
                System.out.println("已經加入過收藏");
                return "已經加入過收藏";
            }
            FavoritePostBean newfpBean = new FavoritePostBean();
            newfpBean.setMainPostBean(mpBean);
            newfpBean.setAccount(memberAccount);
            fpService.insert(newfpBean);
            return "已加入收藏";
        }
        return "請登入會員或加入會員";
    }
    
    //使用者收藏紀錄
    @ResponseBody 
    @GetMapping("/FavoritePostAJAX")
    public List<MainPostBean>  userFavortes(){
        if(memberAccount != null) {
            List<FavoritePostBean> fpBean = fpService.allFavoriteUser(memberAccount);
            if(!fpBean.isEmpty()) {
                List<MainPostBean> mpBeans = new ArrayList<MainPostBean>();
               for(FavoritePostBean fpBeans : fpBean) {
                   MainPostBean mpBean = mpService.selectById(fpBeans.getMainPostBean().getMainPostNo());
                   mpBeans.add(mpBean);
               }
                System.out.println("有收藏資料");
                System.out.println(mpBeans.get(0).getTitle());
                return mpBeans;
            }else {
                System.out.println("查無收藏紀錄");
                List<MainPostBean> mpBeans = new ArrayList<MainPostBean>();
                MainPostBean mpBean = new MainPostBean();
                mpBean.setMainPostNo(0);
                mpBeans.add(mpBean);
                return mpBeans;
            }
        }else
        return null;
    }
    
    @ResponseBody
    @DeleteMapping("/FavoritePostAJAX/{mainPostNo}")
    public void  deleteFavorte(@PathVariable("mainPostNo") MainPostBean mpBean){
        FavoritePostBean fpBean = fpService.findByMainPostBean(mpBean);
        System.out.println(mpBean.getMainPostNo());
        fpService.deleteById(fpBean.getFavoriteNo());
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
                    oneBean.setP_image(presetPhotos);
                }
            }
            return mpBean;
        }
        return null;
    }



}