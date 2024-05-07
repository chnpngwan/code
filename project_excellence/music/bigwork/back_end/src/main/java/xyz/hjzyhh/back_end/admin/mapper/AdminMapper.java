package xyz.hjzyhh.back_end.admin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.admin.PO.AdminPO;


@Mapper
public interface AdminMapper {
    public AdminPO login(@Param("username") String username, @Param("password") String password);
    AdminPO getById(@Param("id") int id);
}
