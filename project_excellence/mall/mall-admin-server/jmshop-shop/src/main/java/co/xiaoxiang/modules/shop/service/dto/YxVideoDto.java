package co.xiaoxiang.modules.shop.service.dto;

import lombok.Data;
import java.io.Serializable;

/**
* @author yushen
* @date 2023-06-08
*/
@Data
public class YxVideoDto implements Serializable {

    /** id */
    private Integer id;

    /** 类型ID */
    private Integer typeId;

    /** 类型名称 */
    private String typeName;

    /** 标题 */
    private String title;

    /** 视频封面 */
    private String coverImage;

    /** 视频地址 */
    private String videoUrl;

    /** 奖励积分数量 */
    private Integer scoreNum;

    /** 真实浏览量 */
    private Integer watchNum;

    /** 虚拟浏览量 */
    private Integer virtualWatchNum;

    /** 创建时间 */
    private Integer createTime;

    /** 备注 */
    private String remark;

    /** 是否展示 */
    private String showFlag;

    /** 排序 */
    private Integer sortNo;
}
