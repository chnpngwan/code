package com.dyuloon.service;

import com.dyuloon.entity.Department;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dyuloon.from.SearchForm;
import com.dyuloon.vo.PageVO;
import com.dyuloon.vo.ResultVO;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author dyuloon
 * @since 2023-06-06
 */
public interface DepartmentService extends IService<Department> {

    PageVO queryPage(SearchForm searchForm);

    ResultVO getlist();
}
