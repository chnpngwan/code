package cn.dao.impl;

import cn.dao.RecipientDao;
import cn.pojo.Recipient;

import java.util.List;

public class RecipientDaoImpl extends BaseDao implements RecipientDao {
    @Override
    public int addRecipient(Recipient recipient) {
        String sql = "insert into recipient (rid,rname,img,sex,phone,address) values (?,?,?,?,?,?)";
        return update(sql,recipient.getRid(),recipient.getRname(),recipient.getSex(),recipient.getPhone(),recipient.getAddress());
    }

    @Override
    public int deleteRecipient(int rid) {
        String sql = "delete from recipient where rid = ?";
        return update(sql,rid);
    }

    @Override
    public int updateRecipient(Recipient recipient) {
        String sql = "update recipient set rname=?,img=?,sex=?,phone=?,address=? where rid = ?";
        return update(sql,recipient.getRname(),recipient.getSex(),recipient.getPhone(),recipient.getAddress(),recipient.getRid());
    }

    @Override
    public Recipient queryRecipientById(int rid) {
        String sql = "select * from recipient where rid = ?";
        return queryForOne(Recipient.class,sql,rid);
    }

    @Override
    public List<Recipient> queryRecipients() {
        String sql = "select * from recipient";
        return queryForList(Recipient.class,sql);
    }
}
