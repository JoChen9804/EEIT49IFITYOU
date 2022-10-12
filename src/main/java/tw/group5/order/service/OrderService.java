package tw.group5.order.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.order.model.Order;
import tw.group5.order.model.OrderRepository;

@Service
@Transactional
public class OrderService {

	@Autowired
	private OrderRepository oRepo;
	
	//新增訂單
	public Order insert(Order newOrder) {
		return oRepo.save(newOrder);
	}
	
	//找到該筆訂單
	public Order findOrder(String orderNo) {
		Optional<Order> optional = oRepo.findById(orderNo);
		return optional.get();
	}
	
	//找出該客人所有訂單
	public List<Order> findAllOrders(String account) {
		return oRepo.findAllOrders(account);
	}
	
	
}
