package com.bank.dao;

import java.util.List;

import com.bank.entity.Card;

public interface CardDao {
	//��ѯ
	public List<Card> queryAllInfo();
	//ɾ��
	public int deleteCardById(int id);
	//���
	public int addCardInfo(Card card);
}
