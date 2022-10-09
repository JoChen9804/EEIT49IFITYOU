package tw.group5.activity.service;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.activity.model.ActivityActivity;
import tw.group5.activity.model.ActivitySignUp;
import tw.group5.activity.model.ActivitySignUpRepository;

@Service
@Transactional
public class ActivitySignUpService {
	
	@Autowired
	private ActivitySignUpRepository signUpRepository;
	
	@Autowired
	private ActivityActivityService activityService;
	
	/*
	 * 時間處理
	 * 回傳sql date格式字串
	 */
	public String getTime() {
		Date date = new Date(System.currentTimeMillis());
		Format format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		return format.format(date);
	}

	public ActivitySignUp insert(ActivitySignUp signUp) {
		ActivityActivity activity = signUp.getActivity();
		ActivitySignUp signUpSave = signUpRepository.save(signUp);
		activity.setTotalSignUp(signUpRepository.countSignUpMember(activity.getActivityId()));
		activityService.update(activity);
		return signUpSave;
	}
	
	public ActivitySignUp update(ActivitySignUp signUp) {
		return signUpRepository.save(signUp);
	}
	
	public void delete(int id) {
		ActivitySignUp signUp = signUpRepository.findById(id).get();
		ActivityActivity activity = signUp.getActivity();
		signUpRepository.deleteById(id);
		activity.setTotalSignUp(signUpRepository.countSignUpMember(activity.getActivityId()));
		activityService.update(activity);
	}
	
	public List<ActivitySignUp> findAll() {
		return signUpRepository.findAll();
	}
	
	public ActivitySignUp queryById(int id) {
		Optional<ActivitySignUp> op = signUpRepository.findById(id);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
	public Set<ActivitySignUp> queryByActivity(ActivityActivity activity ) {
		return signUpRepository.findByActivity(activity);
	}
	
}
