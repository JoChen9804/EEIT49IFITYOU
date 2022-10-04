package tw.group5.post.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.post.model.ReplyPostBean;
import tw.group5.post.model.ReplyPostRepository;


@Service
@Transactional
public class ReplyPostService {
    
    @Autowired
    private ReplyPostRepository rpResp;
    
    public ReplyPostBean insert(ReplyPostBean pBean) {
        return rpResp.save(pBean);
    }
    
    public ReplyPostBean update(ReplyPostBean pBean) {
        return rpResp.save(pBean);
    }
    
    public void deleteById(Integer id) {
        rpResp.deleteById(id);
    }
    
    public ReplyPostBean selectById(Integer id) {
        Optional<ReplyPostBean> optional = rpResp.findById(id);
        if (optional.isPresent()) {
            return optional.get();
        }
        return null;
    }
    
    public List<ReplyPostBean> allReply(int mainPostNo) {
        return rpResp.allReplys(mainPostNo);
    }
    
    public List<ReplyPostBean> findByReplyPermissionNotNull(){
        return rpResp.findByReplyPermissionNotNull();
    }
    
    
}
