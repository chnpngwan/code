package main.java.com.bank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bank.entity.Card;
import com.bank.service.CardServiceImpl;

@Controller
public class CardController {
	//�Զ�װ�����
	@Autowired
	private CardServiceImpl service;
	//ȫ���ѯ
	@RequestMapping("/select")
	public String queryAllCard(Model model) {
		List<Card> list = service.queryAllInfo();
		model.addAttribute("list",list);
		return "main";
	}
	//����IDɾ����Ϣ
	@RequestMapping("/deleteById")
	public String deleteCardById(int id,Model model) {
		int result = service.deleteCardById(id);
		if(result>0) {
			model.addAttribute("msg", "����ɾ���ɹ�");
			return "forward:/select.do";
		}else {
			model.addAttribute("msg", "����ɾ��ʧ�ܣ�");
			return "error";
		}
	}
	//���������Ϣ
	@RequestMapping("/addCardInfo")
	public String addCardInfo(Card card,Model model) {
		int result = service.addCardInfo(card);
		if(result>0) {
			model.addAttribute("msg", "������ӳɹ���");
			return "forward:/select.do";
		}else {
			model.addAttribute("msg", "�������ʧ�ܣ�");
			return "error";
		}
	}
	
	//��תҳ��
	@RequestMapping("/goToAdd")
	public String goToAdd() {
		return "addInfo";
	}

}
