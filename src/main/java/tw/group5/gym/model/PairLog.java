package tw.group5.gym.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

@Entity @Table(name = "PAIRLOG")
@Component
public class PairLog {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "PLOGID")
	private int plogId;
	
	@Transient
	private int mainPId;
	
	@Transient
	private int pairId;
	
	@ManyToOne
	@JoinColumn(name = "MAINPID")
	private PairData mainPd;
	
	@ManyToOne
	@JoinColumn(name = "PAIRID")
	private PairData pairPd;
	
	
	
	public int getPlogId() {
		return plogId;
	}

	public void setPlogId(int plogId) {
		this.plogId = plogId;
	}

	public int getMainPId() {
		return mainPId;
	}

	public void setMainPId(int mainPId) {
		this.mainPId = mainPId;
	}

	public int getPairId() {
		return pairId;
	}

	public void setPairId(int pairId) {
		this.pairId = pairId;
	}

	public PairData getMainPd() {
		return mainPd;
	}

	public void setMainPd(PairData mainPd) {
		this.mainPd = mainPd;
	}

	public PairData getPairPd() {
		return pairPd;
	}

	public void setPairPd(PairData pairPd) {
		this.pairPd = pairPd;
	}
	
	
}
