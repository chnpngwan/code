/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.xiaoxiang.co
 * 注意：
 * 本软件为www.xiaoxiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.xiaoxiang.modules.user.service;

import co.xiaoxiang.modules.user.entity.YxWechatUser;
import co.xiaoxiang.common.service.BaseService;
import co.xiaoxiang.modules.user.web.param.YxWechatUserQueryParam;
import co.xiaoxiang.modules.user.web.vo.YxWechatUserQueryVo;
import co.xiaoxiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 微信用户表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-10-27
 */
public interface YxWechatUserService extends BaseService<YxWechatUser> {

    YxWechatUser getUserAppInfo(String openid);

    YxWechatUser getUserInfo(String openid);

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxWechatUserQueryVo getYxWechatUserById(Serializable id);

    /**
     * 获取分页对象
     * @param yxWechatUserQueryParam
     * @return
     */
    Paging<YxWechatUserQueryVo> getYxWechatUserPageList(YxWechatUserQueryParam yxWechatUserQueryParam) throws Exception;

}
