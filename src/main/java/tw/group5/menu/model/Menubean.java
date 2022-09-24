package tw.group5.menu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.stereotype.Component;

@Entity
@Table(name = "menu")
@Component
public class Menubean {

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "PARTLIST")
	private String part;

	@Column(name = "SECTORLIST")
	private String exerciseName;

	@Column(name = "SETCOUNT")
	private String setCount;

	@Column(name = "EXERCISEKILLOO")
	private String exercisekilloo;

	@Column(name = "EXERCISETIMES")
	private String exerciseTimes;

	@Column(name = "BREAKTIME")
	private String breakTime;

	@Column(name = "MENUSET")
	private String menuset;

	@Column(name = "EXERCISENUM")
	private String exercisenum;

	public Menubean() {

	}

	public Menubean(int id, String part, String exerciseName, String setCount, String exercisekilloo,
			String exerciseTimes, String breakTime) {
		super();
		this.id = id;
		this.part = part;
		this.exerciseName = exerciseName;
		this.setCount = setCount;
		this.exercisekilloo = exercisekilloo;
		this.exerciseTimes = exerciseTimes;
		this.breakTime = breakTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getExerciseName() {
		return exerciseName;
	}

	public void setExerciseName(String exerciseName) {
		this.exerciseName = exerciseName;
	}

	public String getSetCount() {
		return setCount;
	}

	public void setSetCount(String setCount) {
		this.setCount = setCount;
	}

	public String getExercisekilloo() {
		return exercisekilloo;
	}

	public void setExercisekilloo(String exercisekilloo) {
		this.exercisekilloo = exercisekilloo;
	}

	public String getExerciseTimes() {
		return exerciseTimes;
	}

	public void setExerciseTimes(String exerciseTimes) {
		this.exerciseTimes = exerciseTimes;
	}

	public String getBreakTime() {
		return breakTime;
	}

	public void setBreakTime(String breakTime) {
		this.breakTime = breakTime;
	}

	public String getMenuset() {
		return menuset;
	}

	public void setMenuset(String menuset) {
		this.menuset = menuset;
	}

	public String getExercisenum() {
		return exercisenum;
	}

	public void setExercisenum(String exercisenum) {
		this.exercisenum = exercisenum;
	}

}