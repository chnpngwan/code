package cn.service;

import cn.pojo.Customer;
import cn.pojo.Recipient;

import java.util.List;

public interface RecipientService {
    public void addRecipient(Recipient recipient);

    public void deleteRecipientById(int rid);

    public void updateRecipient(Recipient recipient);

    public Recipient queryRecipientById(int rid);

    public List<Recipient> queryRecipients();
}
