package com.dyuloon.controller;


import com.dyuloon.entity.UserAdmin;
import com.dyuloon.service.UserAdminService;
import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.ResultVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-19
 */
@RestController
@RequestMapping("/userAdmin")
public class UserAdminController {
    @Autowired
    private UserAdminService userAdminService;

    // 根据id查管理员
    @GetMapping("findAdminById/{id}")
    public ResultVO query(@PathVariable Integer id) {
        UserAdmin userAdmin = this.userAdminService.getById(id);
        ResultVO resultVO = ResultVOUtil.success(userAdmin, "查询成功！");
        return resultVO;
    }

    // 修改管理员信息
    @PutMapping
    public ResultVO update(@RequestBody UserAdmin userAdmin) {
        boolean update = this.userAdminService.updateById(userAdmin);
        ResultVO resultVO = update ? ResultVOUtil.success(null, "更新成功！") : ResultVOUtil.fail("更新失败！");
        return resultVO;
    }
}

