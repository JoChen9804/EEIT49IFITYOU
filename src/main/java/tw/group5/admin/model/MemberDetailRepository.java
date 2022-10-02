package tw.group5.admin.model;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberDetailRepository extends JpaRepository<MemberDetail, Integer>{
	public Optional<MemberDetail> findByReferralCode(String referralCode);
}
