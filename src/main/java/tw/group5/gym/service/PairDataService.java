package tw.group5.gym.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.gym.model.PairData;
import tw.group5.gym.model.PairDataRespository;

@Service
@Transactional
public class PairDataService {

	@Autowired
	private PairDataRespository pdRespository;
	
	//新增或修改
	public PairData savePairData(PairData pairData) {
		return pdRespository.save(pairData);
	}
	
	
}
