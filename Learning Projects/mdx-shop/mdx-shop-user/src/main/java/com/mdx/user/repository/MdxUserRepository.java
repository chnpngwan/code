package com.mdx.user.repository;
import com.mdx.user.entity.MdxUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * @author : jiagang
 * @date : Created in 2022/2/8 17:01
 */
@Repository
public interface MdxUserRepository extends JpaRepository<MdxUser,Long> {

    /**
     * 获取用户信息
     * @param userName
     * @return
     */
    MdxUser findByUserName(String userName);
}
