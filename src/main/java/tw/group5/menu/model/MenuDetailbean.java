package tw.group5.menu.model;



import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "MENUDETAIL")
@Component
public class MenuDetailbean {
	
	@Id
	@Column(name = "EXRID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int exrid;
	
	@Column(name = "EXERCISENAME")
	private String exercisename;
	public MenuSetbean getMenuSetbean() {
		return menuSetbean;
	}
	public void setMenuSetbean(MenuSetbean menuSetbean) {
		this.menuSetbean = menuSetbean;
	}
	@Column(name = "SETCOUNT")
	private String setcount;
	@Column(name = "KILLOOCOUNT")
	private String killoocount;
	@Column(name = "TIMES")
	private String times;
	@Column(name = "CONTINUTEDTIME")
	private String continutedtime;
	@Column(name = "BREAKTIME")
	private String breaktime;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "SETID")
	private MenuSetbean menuSetbean;
	
	@Transient
	private String imgnum;
	
	
	
	
	
	public String getImgnum() {
		return imgnum;
	}
	public void setImgnum(String imgnum) {
		this.imgnum = imgnum;
	}
	public int getExrid() {
		return exrid;
	}
	public void setExrid(int exrid) {
		this.exrid = exrid;
	}
	public String getExercisename() {
		return exercisename;
	}
	public void setExercisename(String exercisename) {
		this.exercisename = exercisename;
	}
	public String getSetcount() {
		return setcount;
	}
	public void setSetcount(String setcount) {
		this.setcount = setcount;
	}
	public String getKilloocount() {
		return killoocount;
	}
	public void setKilloocount(String killoocount) {
		this.killoocount = killoocount;
	}
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getContinutedtime() {
		return continutedtime;
	}
	public void setContinutedtime(String continutedtime) {
		this.continutedtime = continutedtime;
	}
	public String getBreaktime() {
		return breaktime;
	}
	public void setBreaktime(String breaktime) {
		this.breaktime = breaktime;
	}

	
	
	
	


}
