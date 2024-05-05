package cn.dao;

import cn.pojo.Recipient;
import cn.pojo.Staff;

import java.util.List;

public interface RecipientDao {
    public int addRecipient(Recipient recipient);

    public int deleteRecipient(int rid);

    public int updateRecipient(Recipient recipient);

    public Recipient queryRecipientById(int rid);

    public List<Recipient> queryRecipients();
}
