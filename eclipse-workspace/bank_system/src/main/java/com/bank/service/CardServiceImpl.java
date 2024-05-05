package com.bank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.dao.CardDao;
import com.bank.entity.Card;

@Service
public class CardServiceImpl implements CardService{
	//×Ô¶¯×°ÅäDao
	@Autowired
	private CardDao dao;

	@Override
	public List<Card> queryAllInfo() {
		return dao.queryAllInfo();
	}

	@Override
	public int deleteCardById(int id) {
		return dao.deleteCardById(id);
	}

	@Override
	public int addCardInfo(Card card) {
		return dao.addCardInfo(card);
	}
	

}
