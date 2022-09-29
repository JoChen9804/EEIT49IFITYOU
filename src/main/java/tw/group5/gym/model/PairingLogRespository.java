package tw.group5.gym.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.group5.admin.model.MemberBean;

public interface PairingLogRespository extends JpaRepository<PairingLog, Integer> {
	
	public PairingLog findByMemberAndPairingDate(MemberBean member, String pairingDate);
	
	public List<PairingLog> findByPairingNoAndPairingDate(Integer pairingNo, String pairingDate);
	
	@Query(value = "select top 1 * from pairinglog where pairingno is null and pairingdate = :date order by newid()", nativeQuery = true)
	public PairingLog findOnePair(@Param("date")String date);
	
	@Query(value = "select * from pairinglog where memberid= :member and pairingdate = :date and pairingno is null", nativeQuery = true)
	public PairingLog findTwoPairByMember(@Param("member")MemberBean member,@Param("date")String date);
	
}
