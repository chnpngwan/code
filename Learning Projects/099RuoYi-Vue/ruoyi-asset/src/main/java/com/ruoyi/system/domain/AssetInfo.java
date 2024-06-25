package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 资产入库对象 asset_info
 * 
 * @author 李博文
 * @date 2024-03-25
 */
public class AssetInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 资产编号 */
    @Excel(name = "资产编号")
    private String num;

    /** 资产状态 */
    @Excel(name = "资产状态")
    private Long status;

    /** 资产名称 */
    @Excel(name = "资产名称")
    private String name;

    /** 资产类别 */
    @Excel(name = "资产类别")
    private Long classifyId;

    /** 资产照片 */
    @Excel(name = "资产照片")
    private String photo;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String type;

    /** 金额 */
    @Excel(name = "金额")
    private Long amount;

    /** 计量单位 */
    @Excel(name = "计量单位")
    private String unit;

    /** 产品序列号 */
    @Excel(name = "产品序列号")
    private String snNum;

    /** 所属公司 */
    @Excel(name = "所属公司")
    private Long companyId;

    /** 所属部门 */
    @Excel(name = "所属部门")
    private Long deptId;

    /** 存放地点 */
    @Excel(name = "存放地点")
    private String place;

    /** 来源 */
    @Excel(name = "来源")
    private Long sourceId;

    /** 购入时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "购入时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date purchaseTime;

    /** 创建人 */
    @Excel(name = "创建人")
    private Long createUser;

    /** 区域 */
    @Excel(name = "区域")
    private String region;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setNum(String num) 
    {
        this.num = num;
    }

    public String getNum() 
    {
        return num;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setClassifyId(Long classifyId) 
    {
        this.classifyId = classifyId;
    }

    public Long getClassifyId() 
    {
        return classifyId;
    }
    public void setPhoto(String photo) 
    {
        this.photo = photo;
    }

    public String getPhoto() 
    {
        return photo;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setAmount(Long amount) 
    {
        this.amount = amount;
    }

    public Long getAmount() 
    {
        return amount;
    }
    public void setUnit(String unit) 
    {
        this.unit = unit;
    }

    public String getUnit() 
    {
        return unit;
    }
    public void setSnNum(String snNum) 
    {
        this.snNum = snNum;
    }

    public String getSnNum() 
    {
        return snNum;
    }
    public void setCompanyId(Long companyId) 
    {
        this.companyId = companyId;
    }

    public Long getCompanyId() 
    {
        return companyId;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setPlace(String place) 
    {
        this.place = place;
    }

    public String getPlace() 
    {
        return place;
    }
    public void setSourceId(Long sourceId) 
    {
        this.sourceId = sourceId;
    }

    public Long getSourceId() 
    {
        return sourceId;
    }
    public void setPurchaseTime(Date purchaseTime) 
    {
        this.purchaseTime = purchaseTime;
    }

    public Date getPurchaseTime() 
    {
        return purchaseTime;
    }
    public void setCreateUser(Long createUser) 
    {
        this.createUser = createUser;
    }

    public Long getCreateUser() 
    {
        return createUser;
    }
    public void setRegion(String region) 
    {
        this.region = region;
    }

    public String getRegion() 
    {
        return region;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("num", getNum())
            .append("status", getStatus())
            .append("name", getName())
            .append("classifyId", getClassifyId())
            .append("photo", getPhoto())
            .append("type", getType())
            .append("amount", getAmount())
            .append("unit", getUnit())
            .append("snNum", getSnNum())
            .append("companyId", getCompanyId())
            .append("deptId", getDeptId())
            .append("place", getPlace())
            .append("sourceId", getSourceId())
            .append("purchaseTime", getPurchaseTime())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("remark", getRemark())
            .append("region", getRegion())
            .toString();
    }
}
