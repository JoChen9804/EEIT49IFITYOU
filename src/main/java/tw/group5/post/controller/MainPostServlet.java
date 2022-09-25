package tw.group5.post.controller;

import java.io.FileNotFoundException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.post.model.MainPostBean;
import tw.group5.post.model.ReplyPostBean;
import tw.group5.post.service.MainPostService;
import tw.group5.post.service.ReplyPostService;

@Controller
@RequestMapping("/group5/admin")
public class MainPostServlet {

    @Autowired
    private MainPostService mpService;

    @Autowired
    private ReplyPostService rpService;

    public final String postFrontPage = "post/PostFrontPage";
    public final String postMainPosting = "post/PostMainPosting";
    public final String postDetails = "post/PostDetails";
    public final String postChangePost = "post/PostChangePost";

    // 改成會員帳號 與會員權限
    public String memberAccount = "test123";
    public String postPermission = "一般會員";

    // 首頁進入
    // 推薦使用四種方式最終都是封裝成ModelAndView
    @GetMapping("/MainPost.all")
    public ModelAndView postHomepage2(MainPostBean mpBean) {

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

        addPost.setPostPermission(postPermission);
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
        ModelAndView mav = new ModelAndView(postDetails);

        if ("".equals(queryOne.getP_image())) {
            queryOne.setP_image(null);
        }

        mav.addObject("queryOne", queryOne);

        if (!"".equals(queryOne.getLikeNumber()) && queryOne.getLikeNumber() != null) {
            String[] oldlikes = queryOne.getLikeNumber().split(",");
            mav.addObject("likes", oldlikes.length);
        } else {
            mav.addObject("likes", 0);
        }

        // 使用串接存進去
        if (queryOne.getP_image() != null) {
            String[] allImages = queryOne.getP_image().split(",");
            mav.addObject("allImages", allImages);
        }

        // -----------上面是主貼文------------

        List<ReplyPostBean> allReply = rpService.allReply(watch);

        if (!allReply.isEmpty() && allReply != null) {

            for (ReplyPostBean oneReply : allReply) {

                if (!"".equals(oneReply.getR_image()) && oneReply.getR_image() != null) {
                    String[] allReplyImages = oneReply.getR_image().split(",");

                    oneReply.setR_imagess(allReplyImages);
                }
                    if (!"".equals(oneReply.getReplyLikeNumber()) && queryOne.getLikeNumber() != null) {
                        String[] oldlikesReply = oneReply.getReplyLikeNumber().split(",");

                        oneReply.setReplyLikeNumber(String.valueOf(oldlikesReply.length));
                    } else {

                        oneReply.setReplyLikeNumber("0");
                    }

                
            }
            mav.addObject("allReply", allReply);
        }

        return mav;
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

        System.out.println("32132131" + mpBean.getP_image());

        mpBean.setAddtime(mpService.currentDateFormat("date"));

        mpBean.setLikeNumber("");

        if (mpBean.getP_image().equals("")) {
            mpBean.setP_image("");
        }

        if (!mfs.get(0).isEmpty()) {
            String addPostImages = mpService.addPostImages(mfs);

            System.out.println(addPostImages);
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

    // 測試按讚紀錄 之後改成帳號串起來算陣列數量
    @PutMapping("/Likes")
    public ModelAndView Likes(MainPostBean mpBean, ReplyPostBean rpBean) {
        ModelAndView mav = new ModelAndView(postDetails);

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

        if ("".equals(queryOne.getP_image())) {
            queryOne.setP_image(null);
        }

        if (!"".equals(queryOne.getLikeNumber()))
            mav.addObject("likes", queryOne.getLikeNumber().split(",").length);
        else {
            mav.addObject("likes", 0);
        }

        mav.addObject("queryOne", queryOne);
        if (!"".equals(queryOne.getP_image()) && queryOne.getP_image() != null) {
            String[] allImages = queryOne.getP_image().split(",");
            mav.addObject("allImages", allImages);
        }

        // ---------------上面是主貼文---------
        
        List<ReplyPostBean> allReply = rpService.allReply(mpBean.getMainPostNo());
        if (!allReply.isEmpty() && allReply != null) {
            for (ReplyPostBean oneReply : allReply) {
                if (!"".equals(oneReply.getR_image()) && oneReply.getR_image() != null) {
                    String[] allReplyImages = oneReply.getR_image().split(",");
                    oneReply.setR_imagess(allReplyImages);
                }
                    
                    if (!"".equals(oneReply.getReplyLikeNumber()) &&oneReply.getReplyLikeNumber()!=null) {
                        String[] oldlikesReply = oneReply.getReplyLikeNumber().split(",");
                        System.out.println("999999");
                        oneReply.setReplyLikeNumber(String.valueOf(oldlikesReply.length));
                    } else {
                        oneReply.setReplyLikeNumber("0");
                    }
               
            }
            mav.addObject("allReply", allReply);
        }
        
        
        
        
        

        return mav;
    }

    @PutMapping("/ReplyLikes")
    public ModelAndView ReplyLikes(MainPostBean mpBean, ReplyPostBean rpBean) {
        ModelAndView mav = new ModelAndView(postDetails);
        MainPostBean queryOne = mpService.selectById(mpBean.getMainPostNo());

        if ("".equals(queryOne.getP_image())) {
            queryOne.setP_image(null);
        }

        if (!"".equals(queryOne.getP_image()) && queryOne.getP_image() != null) {
            String[] allImages = queryOne.getP_image().split(",");
            mav.addObject("allImages", allImages);
        }

        mav.addObject("queryOne", queryOne);
        if (!"".equals(queryOne.getP_image()) && queryOne.getP_image() != null) {
            String[] allImages = queryOne.getP_image().split(",");
            mav.addObject("allImages", allImages);
        }

        if (!"".equals(queryOne.getLikeNumber()))
            mav.addObject("likes", queryOne.getLikeNumber().split(",").length);
        else {
            mav.addObject("likes", 0);
        }

        mav.addObject("queryOne", queryOne);



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

//        if (!"".equals(replyPostBean.getReplyLikeNumber())) {
//            String[] oldlikesReply = replyPostBean.getReplyLikeNumber().split(",");
//            replyPostBean.setReplyLikeNumber(String.valueOf(oldlikesReply.length));
//        } else {
//            replyPostBean.setReplyLikeNumber("0");
//        }

        List<ReplyPostBean> allReply = rpService.allReply(mpBean.getMainPostNo());
        if (!allReply.isEmpty() && allReply != null) {
            for (ReplyPostBean oneReply : allReply) {
                if (!"".equals(oneReply.getR_image()) && oneReply.getR_image() != null) {
                    String[] allReplyImages = oneReply.getR_image().split(",");
                    oneReply.setR_imagess(allReplyImages);
                }
                    
                    if (!"".equals(oneReply.getReplyLikeNumber()) &&oneReply.getReplyLikeNumber()!=null) {
                        String[] oldlikesReply = oneReply.getReplyLikeNumber().split(",");
                        System.out.println("999999");
                        oneReply.setReplyLikeNumber(String.valueOf(oldlikesReply.length));
                    } else {
                        oneReply.setReplyLikeNumber("0");
                    }
               
            }
            mav.addObject("allReply", allReply);
        }

        return mav;
    }

    
    
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
            

            rpService.insert(rpBean);
            
            List<ReplyPostBean> allReply = rpService.allReply(mpBean.getMainPostNo());
            
            if(!allReply.isEmpty() && allReply !=null) {
                        
                for(ReplyPostBean oneReply :allReply ) {

                    if(!"".equals(oneReply.getR_image()) &&  oneReply.getR_image() !=null) {
                        String[] allReplyImages =oneReply.getR_image().split(",");
                       
                        oneReply.setR_imagess(allReplyImages);
                    } 
                    
                    if(!"".equals(oneReply.getReplyLikeNumber()) &&queryOne.getLikeNumber() !=null) {
                        String[] oldlikesReply =oneReply.getReplyLikeNumber().split(",");
                        oneReply.setReplyLikeNumber(String.valueOf(oldlikesReply.length));
                    
                    }else {
                        oneReply.setReplyLikeNumber("0");
                    }
                   
                } 
                mav.addObject("allReply",allReply);
            }
            
        return mav;
    }
    
    
    
 
    
    
    // 測試
    public List<MainPostBean> firstImagePath1(List<MainPostBean> mpBean) {
        for (int i = 0; i < mpBean.size(); i++) {
            if (mpBean.get(i).getP_image() != null && mpBean.get(i).getP_image().indexOf(",") != -1) {
                mpBean.get(i)
                        .setP_image(mpBean.get(i).getP_image().substring(0, (mpBean.get(i).getP_image().indexOf(","))));
            }
        }
        return mpBean;
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
