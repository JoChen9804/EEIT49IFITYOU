package tw.group5.post.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface FavoritePostRepository extends JpaRepository<FavoritePostBean, Integer> {
    
    //原生Sql 語法
    @Query(value = "select * from favoritePost where account = ?;",nativeQuery = true)
    public List<FavoritePostBean> allFavoriteUser(@Param("account") String account);
    
    //找到是否有收藏過
    @Modifying(clearAutomatically = true)
    @Query(value = "from FavoritePostBean where account = :account and mainPostNo = :mpNo")
    public List<FavoritePostBean> findAccountFavorite(@Param("account")String account,@Param("mpNo")Integer mainPostNo);
}
