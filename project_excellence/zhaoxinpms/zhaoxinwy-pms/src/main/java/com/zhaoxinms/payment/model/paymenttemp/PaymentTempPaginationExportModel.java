package com.zhaoxinms.payment.model.paymenttemp;

import com.zhaoxinms.base.vo.Pagination;

import lombok.Data;

@Data
public class PaymentTempPaginationExportModel extends Pagination {

    private String selectKey;

    private String json;

    private String dataType;

    /** 资源名 */
    private String resourceName;

    /** 商业区 */
    private String block;

    /**  */
    private String feeItemId;

    /** 客户姓名 */
    private String feeUser;

    /** 付款方式 */
    private String payType;

}