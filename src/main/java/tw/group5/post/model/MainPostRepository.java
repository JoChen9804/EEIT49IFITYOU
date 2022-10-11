package tw.group5.post.model;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;



public interface MainPostRepository extends JpaRepository<MainPostBean, Integer> {
    
    //原生Sql 語法
    @Query(value = "select * from mainpost",nativeQuery = true)
    public List<MainPostBean> allPosts();
    
    //Hql 寫法
    @Query(value = "from MainPostBean where title like concat('%',?1,'%')")
    public List<MainPostBean> allPostss(Object titles);
    
    //Hql  找狀泰已發布的標題
    @Query(value = "from MainPostBean where title like concat('%',?1,'%') and postpermission = ?2")
    public List<MainPostBean> userallPosts(Object titles,String permission);
    
    //個人會員貼文
    public List<MainPostBean> findByAccount(String account);
    
    //Hql 寫法
    @Query(value = "from MainPostBean where title like concat('%',?1,'%') and account = ?2")
    public List<MainPostBean> findByAccountAndTitles(String titles,String account);
    

    //更新貼文狀態
    @Modifying(clearAutomatically = true)
    @Query(value = "update MainPostBean set postPermission = :permerission where mainPostNo = :mpNo")
    public void updatePermission(@Param("permerission")String permerission,@Param("mpNo")Integer mainPostNo);
    
    //找觀看前三名
    @Query(value = "select * from mainPost m\r\n"
            + "where(select count(*) from mainPost where m.ctr <ctr) <3 and postPermission ='已發布'"
            + "order by m.ctr desc;",nativeQuery = true)
    public List<MainPostBean> topThreePosts();
    
    
    //審核狀態
    public List<MainPostBean> findByPostPermission(String postPermission);
    
    public List<MainPostBean> findByPostTypeName(String postTypeName);
    
}
