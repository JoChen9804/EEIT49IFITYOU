package tw.group5.post.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.group5.post.model.FavoritePostBean;
import tw.group5.post.model.FavoritePostRepository;
import tw.group5.post.model.MainPostBean;
import tw.group5.post.model.ReplyPostBean;

@Service
@Transactional
public class FavoritePostService {

    @Autowired
    private FavoritePostRepository fpResp;
    
    public FavoritePostBean insert(FavoritePostBean fbean) {
        return fpResp.save(fbean);
    }
    
    public List<FavoritePostBean> allFavoriteUser(@Param("account") String account) {
        return fpResp.allFavoriteUser(account);
    }
    
    public List<FavoritePostBean> findAccountFavorite(String account,Integer mainPostNo) {
        return fpResp.findAccountFavorite(account,mainPostNo);
    }
    
    public void deleteById(Integer id) {
        fpResp.deleteById(id);
    }
    
    public FavoritePostBean findByMainPostBean(MainPostBean mpBean) {
        return fpResp.findByMainPostBean(mpBean);
    }
}
