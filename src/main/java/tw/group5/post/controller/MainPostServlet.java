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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.post.model.MainPostBean;
import tw.group5.post.service.MainPostService;

@Controller
public class MainPostServlet {
    
    @Autowired
    private MainPostService mainPostService;
    
    //首頁進入
    //推薦使用四種方式最終都是封裝成ModelAndView
    @GetMapping("/MainPost.all")
    public ModelAndView postHomepage2(MainPostBean mpBean) {
        
        ModelAndView mav = new ModelAndView("post/PostFrontPage");
        
        if(mpBean.getMainPostNo() != 0 ) {
            List<MainPostBean> query = firstImagePath(mainPostService.query(mpBean.getMainPostNo()));
            if(query == null) {
                mav.addObject("error","查無資料");
            }
            mav.addObject("query",query);
        }else if(mpBean.getTitle() !=null){
            System.out.println("所有貼文");
            List<MainPostBean> query = firstImagePath(mainPostService.allPosts(mpBean.getTitle()));
            if(query == null) {
                mav.addObject("error","查無資料");
            }
            mav.addObject("query",query);
        }else if(mpBean !=null){
            System.out.println("所有貼文");
            List<MainPostBean> query = firstImagePath(mainPostService.allPosts());
            mav.addObject("query",query);
        }
        return mav;
    }
    
    //返回頁面
    @GetMapping("/MainPost.return")
    public ModelAndView backToThePage(String returns) {
        return new ModelAndView("redirect:/MainPost.all");
    }

    //跳轉到新增畫面
    @PostMapping("MainPosting.add")
    public ModelAndView postPage(String addpost) {
        return new ModelAndView("post/PostMainPosting");
    }
    
    //發布貼文 圖片待處理
    @PostMapping("/MainPosting.controller")
    public String addingPostConfirming(MainPostBean addPost,
                                       @RequestParam("Filename2") List<MultipartFile> mfs) throws FileNotFoundException {
        
        addPost.setPostPermission("一般會員");
        addPost.setAddtime(mainPostService.currentDateFormat("date"));
        addPost.setLikeNumber("");
        
        //讀取照片ok
//        Set<PostImageBean> addPostImages = mainPostService.addPostImages(mfs, addPost);
//        addPost.setMainPostImages(addPostImages); 
        
        //測試用路徑串接
        if(!mfs.get(0).isEmpty()) {
        String addPostImages = mainPostService.addPostImages(mfs);
        addPost.setP_image(addPostImages);
        }
        
        mainPostService.insert(addPost);
        return "redirect:/MainPost.all";
    }
    //觀看ok
    @GetMapping("/MainPost.watch")
    public ModelAndView watchPost(Integer watch) {
        MainPostBean queryOne = mainPostService.selectById(watch);
        ModelAndView mav = new ModelAndView("post/PostDetails");
        mav.addObject("queryOne",queryOne);
        
        System.out.println("31321" +queryOne.getLikeNumber().equals("") +"!!!");
        
        if(!queryOne.getLikeNumber().equals("")) {
            String[] oldlikes =queryOne.getLikeNumber().split(",");
            mav.addObject("likes",oldlikes.length);
        }else {
            mav.addObject("likes",0);
        }
        
        
        
        //照片讀取ok
//        List<PostImageBean> allImages = mainPostService.allImages(watch);
//        mav.addObject("allImages",allImages);
        //使用串接存進去
      if(  queryOne.getP_image() !=null) {
          String[] allImages =queryOne.getP_image().split(",");
          mav.addObject("allImages",allImages);
      }
        return mav;
    }
    //刪除 ok
    @DeleteMapping("/MainPostingServlet")
    public String deleteDainPost(Integer deletepost) {
        mainPostService.deleteById(deletepost);
        return "redirect:/MainPost.all";
    }
    
    //跳到修改頁面ok
    @PostMapping("/MainPostingServlet")
    public ModelAndView modifyPage(Integer updatepost) {
        ModelAndView mav = new ModelAndView("post/PostChangePost");
        MainPostBean queryContent = mainPostService.selectById(updatepost);
        mav.addObject("queryContent",queryContent);
        return mav;
    }
    //修改後送出ok
    @PutMapping("/MainPostServlet")
    public ModelAndView updateMainPost(MainPostBean mpBean) {
        mpBean.setAddtime(mainPostService.currentDateFormat("date"));
        MainPostBean queryContent = mainPostService.update(mpBean);
        if(queryContent !=null) {
            return new ModelAndView("redirect:/MainPost.all");
        }
        return null;
    }
    
    //抓取第一張圖片並重新寫入Bean
    public List<MainPostBean> firstImagePath(List<MainPostBean> mpBean) {
        if(mpBean != null) {
            for(MainPostBean oneBean : mpBean) {
                if(oneBean.getP_image() != null && oneBean.getP_image().indexOf(",") !=-1) {
                    System.out.println("==="+oneBean.getP_image().substring(0,oneBean.getP_image().indexOf(",")));
                    oneBean.setP_image(oneBean.getP_image().substring(0,(oneBean.getP_image().indexOf(",")))); 
                }
            }
            return mpBean;
        }
        return null;
    }
    
    
    
    
    //測試按讚紀錄 之後改成帳號串起來算陣列數量
    @PutMapping("/Likes")
    public ModelAndView Likes(MainPostBean mpBean) {
        ModelAndView mav = new ModelAndView("post/PostDetails");
        MainPostBean queryOne = mainPostService.selectById(mpBean.getMainPostNo());
        
        
        //會員帳號
        String test = "6666";
        
        //改成會員帳號抓取
        String[] oldlikes =queryOne.getLikeNumber().split(",");
        
        int i = 0; //找到一樣的就+1
        for(String like : oldlikes) {
            System.out.println(like);
            if(like.equals(test)) {          //test要改成會員的帳號
                i++;
                break;
            }
        }
        
        if(i == 0) {
          String newLike = queryOne.getLikeNumber() + test +",";    //test要改成會員的帳號
          queryOne.setLikeNumber(newLike);
          mainPostService.update(queryOne);
        }
        
                
        mav.addObject("likes",queryOne.getLikeNumber().split(",").length);
        
        mav.addObject("queryOne",queryOne);
        if(  queryOne.getP_image() !=null) {
            String[] allImages =queryOne.getP_image().split(",");
            mav.addObject("allImages",allImages);
        }
        return mav;
    }
    
    
    
    
    
    //測試
    public List<MainPostBean> firstImagePath1(List<MainPostBean> mpBean) {
        for(int i = 0 ; i < mpBean.size() ; i++) {
            if(mpBean.get(i).getP_image() != null && mpBean.get(i).getP_image().indexOf(",") !=-1) {
                mpBean.get(i).setP_image(mpBean.get(i).getP_image().substring(0,(mpBean.get(i).getP_image().indexOf(",")))); 
            }
        }
        return mpBean;
    }
    
    

    //觀看 測試
    @GetMapping("/MainPost.watch2/{id}")
    public ModelAndView watchPost2(@PathVariable("id") Integer watch) {
        MainPostBean queryOne = mainPostService.selectById(watch);
        ModelAndView mav = new ModelAndView("redirect:/MainPost.watch456");
        mav.addObject("queryOne",queryOne);
        
      if(  queryOne.getP_image() !=null) {
          String[] allImages =queryOne.getP_image().split(",");
          mav.addObject("allImages",allImages);
      }
        return mav;
    }
    
    @PostMapping("/MainPost.watch456")
    public ModelAndView watchPost() {
       
        ModelAndView mav = new ModelAndView("PostDetails");

        return mav;
    }
    
    
    
    
    //先給空的Bean給form:form使用 新增ok
    @RequestMapping(path = "/addMembers.get",method = RequestMethod.GET)
    public String addingPostConfirmings(Model m) {
        MainPostBean queryOne = new MainPostBean();
        m.addAttribute("addpost",queryOne);
        return "MainPosting2";
    }
    @RequestMapping(path = "/addMembers",method = RequestMethod.POST)
    public String addingPostConfirmingss(@ModelAttribute("addpost") MainPostBean addPost) {
        addPost.setPostPermission("一般會員");
        addPost.setPostPhoto(null);
        addPost.setAddtime(mainPostService.currentDateFormat("date"));
        addPost.setLastReplyTime(null);
        
        //mainPostService.add(addPost);
        return "redirect:/MainPostingServlet.all";
    }
    
    
    //首頁進入
    @GetMapping("/MainPostingServlet3.all")
    public String postHomepage3(Map<String,Object>map) {
        System.out.println("所有貼文");
        List<MainPostBean> query = mainPostService.allPosts();
        map.put("query",query);
        return "PostFrontPage";
    }
    //首頁進入
    @GetMapping("/MainPostingServlet.all")
    //@RequestMapping(path = "/MainPostingServlet.all",method = RequestMethod.GET)
    public String postHomepage(Model m) {
        System.out.println("所有貼文");
        List<MainPostBean> query = mainPostService.allPosts();
        m.addAttribute("query",query);
        return "PostFrontPage";
    }
}
