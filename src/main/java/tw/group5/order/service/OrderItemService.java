package tw.group5.order.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.group5.order.model.OrderItem;
import tw.group5.order.model.OrderItemRepository;

@Service
@Transactional
public class OrderItemService {
	
	@Autowired
	public OrderItemRepository oIRepo;
	
	//從購物車加入
	public void insertFromShoppingCartItem(OrderItem orderItem) {
		oIRepo.save(orderItem);
	}
	
	
	//找出該訂單所有商品
	public List<OrderItem> findAllOrderItems(String orderNo){
		return oIRepo.findAllOrderItems(orderNo);
	}
	
	
}

	
