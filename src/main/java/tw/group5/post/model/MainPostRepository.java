package tw.group5.post.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface MainPostRepository extends JpaRepository<MainPostBean, Integer> {
    
    //原生Sql 語法
    @Query(value = "select * from mainpost",nativeQuery = true)
    public List<MainPostBean> allPosts();
    
    //Hql 寫法
    @Query(value = "from MainPostBean where title like concat('%',?1,'%')")
    public List<MainPostBean> allPostss(Object titles);
    
    public List<MainPostBean> findByAccount(String account);
    
}
