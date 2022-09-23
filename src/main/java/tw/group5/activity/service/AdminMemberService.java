package tw.group5.activity.service;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.activity.model.AdminMember;
import tw.group5.activity.model.AdminMemberRepository;

@Service
@Transactional
public class AdminMemberService {

	@Autowired
	private AdminMemberRepository amr;
	
	public AdminMember selectById(int id) {
		Optional<AdminMember> op = amr.findById(id);
		if(op.isPresent()) {
			return op.get();
		}
		return null;
	}
	
}
