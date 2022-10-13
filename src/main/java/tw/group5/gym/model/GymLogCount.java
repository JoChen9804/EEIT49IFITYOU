package tw.group5.gym.model;

import org.springframework.stereotype.Component;

@Component
public class GymLogCount {
	
	private int numberOfFavorite;
	private int numberOfMale;
	private int numberOfFemale;
	
	
	public GymLogCount() {
	}

	public GymLogCount(int numberOfFavorite, int numberOfMale, int numberOfFemale) {
		super();
		this.numberOfFavorite = numberOfFavorite;
		this.numberOfMale = numberOfMale;
		this.numberOfFemale = numberOfFemale;
	}
	
	public int getNumberOfFavorite() {
		return numberOfFavorite;
	}
	public void setNumberOfFavorite(int numberOfFavorite) {
		this.numberOfFavorite = numberOfFavorite;
	}
	public int getNumberOfMale() {
		return numberOfMale;
	}
	public void setNumberOfMale(int numberOfMale) {
		this.numberOfMale = numberOfMale;
	}
	public int getNumberOfFemale() {
		return numberOfFemale;
	}
	public void setNumberOfFemale(int numberOfFemale) {
		this.numberOfFemale = numberOfFemale;
	}
	
	
}
