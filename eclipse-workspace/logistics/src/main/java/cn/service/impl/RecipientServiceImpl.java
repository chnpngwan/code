package cn.service.impl;

import cn.dao.RecipientDao;
import cn.dao.impl.RecipientDaoImpl;
import cn.pojo.Recipient;
import cn.service.RecipientService;

import java.util.List;

public class RecipientServiceImpl implements RecipientService {

    private RecipientDao recipientDao = new RecipientDaoImpl();

    @Override
    public void addRecipient(Recipient recipient) {
        recipientDao.addRecipient(recipient);
    }

    @Override
    public void deleteRecipientById(int rid) {
        recipientDao.deleteRecipient(rid);
    }

    @Override
    public void updateRecipient(Recipient recipient) {
        recipientDao.updateRecipient(recipient);
    }

    @Override
    public Recipient queryRecipientById(int rid) {
        return recipientDao.queryRecipientById(rid);
    }

    @Override
    public List<Recipient> queryRecipients() {
        return recipientDao.queryRecipients();
    }
}
