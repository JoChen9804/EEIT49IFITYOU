package tw.group5.post.controller;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sound.midi.Soundbank;

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
import tw.group5.admin.model.MemberBean;
import tw.group5.admin.model.MemberDetail;
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
    public String postPermission ;
    public String postPhoto ="";
    public String replyPhoto ="";
    
    public AdminBean adminBean() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        AdminBean admin = amService.findByAccount(username);
        return admin;
    }
    
    
    @GetMapping("/MainPost.all")
    public ModelAndView allPostStatus(MainPostBean mpBean) {
        AdminBean adminBean = adminBean();
        memberAccount = adminBean.getAdminName();
        postPhoto = adminBean.getAdminPhoto();
        replyPhoto = adminBean.getAdminPhoto();
        System.out.println(memberAccount);
        
        
        ModelAndView mav = new ModelAndView(postFrontPage);
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
      
        } else if (mpBean.getPostPermission() != null) {
            System.out.println(mpBean.getPostPermission());
            List<MainPostBean> query = firstImagePath(mpService.findByPostPermission(mpBean.getPostPermission()));
            
            
            if (query.isEmpty()) {
                mav.addObject("error", "查無資料");
            }else {
                System.out.println(query.get(0).getPostPermission());
                mav.addObject("query", query);
            }
                

        }  else if (mpBean != null ) {
            System.out.println("所有貼文");
         
            List<MainPostBean> query = firstImagePath(mpService.allPosts());
            
            List<ReplyPostBean> reportBean = rpService.findByReplyPermissionNotNull();
            mav.addObject("reportBean", reportBean);
            mav.addObject("query", query);

            
            ModelAndView statistics = statistics(query,mav);
            
            return statistics;
        }
        return mav;
    }
    
    // 觀看ok
    @PostMapping("/MainPost.watch")
    public ModelAndView watchPost(MainPostBean mpBean) {
        MainPostBean queryOne = mpService.selectById(mpBean.getMainPostNo());
        ModelAndView mavMpost = takeOutmpBean(queryOne,postDetails);
        mavMpost.addObject("postPhoto", postPhoto);
        // -----------上面是主貼文------------
        List<ReplyPostBean> allReply = rpService.allReply(mpBean.getMainPostNo());
        if(!allReply.isEmpty()) {
            ModelAndView mav = takeOutrpBean(allReply,mavMpost);
            return mav;
        }
        return mavMpost;
    }
    
    //審核
    @PostMapping("/auditPost") 
    public String audit(String auditNo) {
        System.out.println("審核審核審核審核審核審核審核審核"+auditNo);
        
        if( !"貼文編號".equals(auditNo)) {
            System.out.println(auditNo);
            String[] mpNoList = auditNo.split(",");
            System.out.println(mpNoList.length);
            for(String mpNoLists : mpNoList) {
                System.out.println(mpNoLists);
                mpService.updatePermission("已發布",Integer.parseInt(mpNoLists));
            }
        }
        return "redirect:MainPost.all";
    }
    //駁回
    @PostMapping("/turnDownPost") @ResponseBody
    public void turnDown(Integer mainPostNo,String xreason) {
        System.out.println(xreason);
        System.out.println(mainPostNo);
        mpService.updatePermission("駁回，"+xreason,mainPostNo);
        //return "redirect:MainPost.all";
    }
    
    //禁止發言
    @ResponseBody
    @PostMapping("/UserPostMute/{replyaccount}")
    public void userMute(@PathVariable("replyaccount")String replyaccount) {
        MemberBean resultMember = amService.findByAccountMember(replyaccount);
        MemberDetail memberDetail = resultMember.getMemberDetail();
        memberDetail.setMute(1);
        resultMember.setMemberDetail(memberDetail);
        amService.updateOne(resultMember);
        System.out.println("fffffffffff"+memberDetail.getMute());
    }
    
    
    
    
    // 刪除貼文
    @DeleteMapping("/MainPostingServlet")
    public String deleteDainPost(Integer deletepost) {
        mpService.deleteById(deletepost);
        return "redirect:MainPost.all";
    }
    
    // 刪除回覆
    @DeleteMapping("/ReplyPost") @ResponseBody
    public void deleteReplyPostAJAX(ReplyPostBean rpBean) {
        rpService.deleteById(rpBean.getReplyNo());
    }

    // 撤銷檢舉
    @PutMapping("/RevokeReport") @ResponseBody
    public void revokeReplyPostAJAX(ReplyPostBean rpBean) {
        ReplyPostBean selectById = rpService.selectById(rpBean.getReplyNo());
        selectById.setReplyPermission(null);
        rpService.update(selectById);
    }
    
    ////////////////////////////////////下面已搬到前台/////////////////////////
    
    
    // 首頁進入
    // 推薦使用四種方式最終都是封裝成ModelAndView
    //@GetMapping("/MainPost.all")
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
        System.out.println(mpBean.getAccount());
       
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
        //bug在這辣
        if (!"".equals(queryOne.getLikeNumber())) {
            String[] newlikes = queryOne.getLikeNumber().split(",");
            
            queryOne.setLikeNumber(String.valueOf(newlikes.length));
            mav.addObject("likes", queryOne.getLikeNumber().split(",").length);
        }
        else {
            queryOne.setLikeNumber("0");
        }
        
        System.out.println(memberAccount);
        System.out.println("多少喇:"+oldlikes.length);
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
            String[] newReplylikes = replyPostBean.getReplyLikeNumber().split(",");
            replyPostBean.setReplyLikeNumber(String.valueOf(newReplylikes.length));
        }
        else {
            replyPostBean.setReplyLikeNumber("0");
        }
        return replyPostBean;
    }
    
    
    public ModelAndView statistics(List<MainPostBean> listmpBean,ModelAndView mav) {
        //貼文類型
        int share = 0 ,diet = 0 , question = 0;
        //貼文每月比數
        int jan = 0, feb =0, mar=0, apr=0, may=0, jun=0, jul=0, aug=0, sep=0, oct=0, nov=0, dec=0;

        for(MainPostBean oneBean : listmpBean) {
            if("分享".equals(oneBean.getPostTypeName())) {
                share++;
            }
            if("飲食".equals(oneBean.getPostTypeName())) {
                diet++;
            }
            if("問題".equals(oneBean.getPostTypeName())) {
                question++;
            }
            
            switch (oneBean.getAddtime().substring(5, oneBean.getAddtime().indexOf("-",oneBean.getAddtime().indexOf("-")+1))) {
                case  "1": jan ++; break;
                case  "2": feb ++; break;
                case  "3": mar ++; break;
                case  "4": apr ++; break;  
                case  "5": may ++; break; 
                case  "6": jun ++; break; 
                case  "7": jul ++; break; 
                case  "8": aug ++; break; 
                case  "9": sep ++; break;
                case "10": oct ++; break;
                case "11": nov ++; break;
                case "12": dec ++; break;
                default: break;
            }
          
        }
        //貼文類型
        mav.addObject("share",share);
        mav.addObject("diet",diet);
        mav.addObject("question",question);
        
        mav.addObject("jan",jan);
        mav.addObject("feb",feb);
        mav.addObject("mar",mar);
        mav.addObject("apr",apr);
        mav.addObject("may",may);
        mav.addObject("jun",jun);
        mav.addObject("jul",jul);
        mav.addObject("aug",aug);
        mav.addObject("sep",sep);
        mav.addObject("oct",oct);
        mav.addObject("nov",nov);
        mav.addObject("dec",dec);
        
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
