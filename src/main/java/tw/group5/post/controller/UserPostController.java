package tw.group5.post.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import tw.group5.post.model.MainPostBean;

@Controller
@RequestMapping("/group5")
@SessionAttributes(names= {"useradmin"})
public class UserPostController {
    
    @GetMapping("/UserPost.all")
    public ModelAndView postHomepage2(MainPostBean mpBean,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("post/UserPostFrontPage");
        
        return mav;
    }
}