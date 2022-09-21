package tw.group5.post.service;

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
    
    
    
}
