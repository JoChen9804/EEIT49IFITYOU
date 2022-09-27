package tw.group5.gym.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tw.group5.admin.model.MemberBean;

public interface PairingLogRespository extends JpaRepository<PairingLog, Integer> {
	
	public PairingLog findByMember(MemberBean member);
	
	@Query(value = "select top 1 * from pairinglog where pairingno is null and pairingdate = :date order by newid()", nativeQuery = true)
	public PairingLog findOnePair(@Param("date")String date);
	
}
