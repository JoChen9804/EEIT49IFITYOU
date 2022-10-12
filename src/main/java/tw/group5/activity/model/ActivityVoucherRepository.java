package tw.group5.activity.model;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ActivityVoucherRepository extends JpaRepository<ActivityVoucher, Integer> {
	public Optional<ActivityVoucher> findByVoucherTitle(int voucherTitle);
	public ActivityVoucher findByVoucherNo(String voucherNo);
}
