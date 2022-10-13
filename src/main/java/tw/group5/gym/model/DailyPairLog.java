package tw.group5.gym.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;
import org.springframework.stereotype.Component;

@Entity @Table(name = "DAILYPAIRLOG")
@Component
public class DailyPairLog {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "DPLOGID")
	private int dplogId;
	
	@ManyToOne
	@JoinColumn(name = "MAINPID")
	private PairData mainData;
	
	@ManyToOne
	@JoinColumn(name = "PAIRID")
	private PairData pair;
	
	@Column(name = "RESULT")
	private Integer result;
	
	@Column(name = "PAIRSCORE")
	private Integer pairScore;
	
	
	
	public DailyPairLog() {
	}

	public DailyPairLog(int dplogId, PairData mainData, PairData pair) {
		this.dplogId = dplogId;
		this.mainData = mainData;
		this.pair = pair;
	}

	public DailyPairLog(PairData mainData, PairData pair) {
		this.mainData = mainData;
		this.pair = pair;
	}

	public int getDplogId() {
		return dplogId;
	}

	public void setDplogId(int dplogId) {
		this.dplogId = dplogId;
	}

	public Integer getResult() {
		return result;
	}

	public void setResult(Integer result) {
		this.result = result;
	}

	public PairData getMainData() {
		return mainData;
	}

	public void setMainData(PairData mainData) {
		this.mainData = mainData;
	}

	public PairData getPair() {
		return pair;
	}

	public void setPair(PairData pair) {
		this.pair = pair;
	}

	public Integer getPairScore() {
		return pairScore;
	}

	public void setPairScore(Integer pairScore) {
		this.pairScore = pairScore;
	}
	
	
	
}
