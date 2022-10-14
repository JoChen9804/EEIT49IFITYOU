package tw.group5.menu.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "menuIMGData")
@Component
public class MenuDatabean {
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "PART")
	private String part;
	
	@Column(name = "EXERCISENAME")
	private String exercisename;
	
	@Column(name = "INTRO")
	private String intro;
	
	@Column(name = "IMAGEURL")
	private String imageurl;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getExerciseName() {
		return exercisename;
	}
	public void setExerciseName(String exercisename) {
		this.exercisename = exercisename;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	
	
	
}
