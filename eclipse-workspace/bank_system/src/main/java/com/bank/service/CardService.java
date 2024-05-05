package com.bank.service;

import java.util.List;

import com.bank.entity.Card;

public interface CardService {
	//²éÑ¯
	public List<Card> queryAllInfo();
	//É¾³ı
	public int deleteCardById(int id);
	//Ìí¼Ó
	public int addCardInfo(Card card);

}
