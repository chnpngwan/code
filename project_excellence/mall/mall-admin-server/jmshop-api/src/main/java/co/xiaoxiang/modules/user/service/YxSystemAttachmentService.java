/**
 * Copyright (C) 2018-2019
 * All rights reserved, Designed By www.xiaoxiang.co
 * 注意：
 * 本软件为www.xiaoxiang.co开发研制，未经购买不得使用
 * 购买后可获得全部源代码（禁止转卖、分享、上传到码云、github等开源平台）
 * 一经发现盗用、分享等行为，将追究法律责任，后果自负
 */
package co.xiaoxiang.modules.user.service;

import co.xiaoxiang.modules.user.entity.YxSystemAttachment;
import co.xiaoxiang.common.service.BaseService;
import co.xiaoxiang.modules.user.web.param.YxSystemAttachmentQueryParam;
import co.xiaoxiang.modules.user.web.vo.YxSystemAttachmentQueryVo;
import co.xiaoxiang.common.web.vo.Paging;

import java.io.Serializable;

/**
 * <p>
 * 附件管理表 服务类
 * </p>
 *
 * @author hupeng
 * @since 2019-11-11
 */
public interface YxSystemAttachmentService extends BaseService<YxSystemAttachment> {

    YxSystemAttachment getInfo(String name);

    YxSystemAttachment getByCode(String code);

    void attachmentAdd(String name,String attSize,String attDir,String sattDir);

    void newAttachmentAdd(String name,String attSize,String attDir,String sattDir,int uid,String code);

    /**
     * 根据ID获取查询对象
     * @param id
     * @return
     */
    YxSystemAttachmentQueryVo getYxSystemAttachmentById(Serializable id) throws Exception;

    /**
     * 获取分页对象
     * @param yxSystemAttachmentQueryParam
     * @return
     */
    Paging<YxSystemAttachmentQueryVo> getYxSystemAttachmentPageList(YxSystemAttachmentQueryParam yxSystemAttachmentQueryParam) throws Exception;

}
