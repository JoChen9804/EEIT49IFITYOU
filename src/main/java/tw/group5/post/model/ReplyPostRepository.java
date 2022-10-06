package tw.group5.post.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ReplyPostRepository extends JpaRepository<ReplyPostBean, Integer> {
    
    
    
    //原生Sql 語法
    @Query(value = "select * from replyPost",nativeQuery = true)
    public List<ReplyPostBean> allReply();
    
    //Hql 寫法
//    @Query(value = "from RreplyPostBean where mainPostBean.getMainPostNo like concat('%',?1,'%')")
//    public List<MainPostBean> allPostss(Object titles);

    //原生Sql 語法
    @Query(value = "select * from replyPost where mainPostNo = ?;",nativeQuery = true)
    public List<ReplyPostBean> allReplys(@Param("mainPostNo") int mainPostNo);
    
    //找到有檢舉資料
    public List<ReplyPostBean> findByReplyPermissionNotNull();
    
}
