package tw.group5.gym.model;

import org.springframework.data.jpa.repository.JpaRepository;

import tw.group5.admin.model.MemberBean;

public interface PairDataRespository extends JpaRepository<PairData, Integer> {
	public PairData findByMember(MemberBean member);
}
