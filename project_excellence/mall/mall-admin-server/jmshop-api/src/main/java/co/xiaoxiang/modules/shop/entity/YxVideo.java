package co.xiaoxiang.modules.shop.entity;

import co.xiaoxiang.common.entity.BaseEntity;
import co.xiaoxiang.modules.shop.web.vo.YxStoreProductQueryVo;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Transient;
import java.util.List;

/**
* @author yushen
* @date 2023-05-11
*/
@Data
@EqualsAndHashCode(callSuper = true)
@ApiModel(value = "YxVideoType对象", description = "视频类型")
public class YxVideo extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /** 模板id */
    @TableId(value = "id", type = IdType.AUTO)
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
