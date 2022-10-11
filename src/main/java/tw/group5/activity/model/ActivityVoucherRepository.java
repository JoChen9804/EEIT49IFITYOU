package tw.group5.activity.model;


import org.springframework.data.jpa.repository.JpaRepository;

public interface ActivityVoucherRepository extends JpaRepository<ActivityVoucher, Integer> {
	public ActivityVoucher findByVoucherNo(String voucherNo);
}
