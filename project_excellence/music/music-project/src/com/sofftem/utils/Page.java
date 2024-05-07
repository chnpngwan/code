package com.sofftem.utils;

import java.util.List;

public class Page<T> {

    public static final Integer PAGE_SIZE = 4;
    // 当前页码
    private Integer pageNo;
    // 总页码
    private Integer pageTotal;
    // 当前页显示数量
    private Integer pageSize = PAGE_SIZE;
    // 总记录数
    private Integer pageTotalCount;
    // 当前页数据
    private List<T> items;
    // 分页条的请求地址
    private String url;


    public Page() {
    }

    public Page(Integer pageNo, Integer pageTotal, Integer pageSize, Integer pageTotalCount, List<T> items) {
        this.pageNo = pageNo;
        this.pageTotal = pageTotal;
        this.pageSize = pageSize;
        this.pageTotalCount = pageTotalCount;
        this.items = items;
    }
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    /**
     * 获取
     * @return pageNo
     */
    public Integer getPageNo() {
        return pageNo;
    }

    /**
     * 设置
     * @param pageNo
     */
    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    /**
     * 获取
     * @return pageTotal
     */
    public Integer getPageTotal() {
        return pageTotal;
    }

    /**
     * 设置
     * @param pageTotal
     */
    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    /**
     * 获取
     * @return pageSize
     */
    public Integer getPageSize() {
        return pageSize;
    }

    /**
     * 设置
     * @param pageSize
     */
    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 获取
     * @return pageTotalCount
     */
    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    /**
     * 设置
     * @param pageTotalCount
     */
    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    /**
     * 获取
     * @return items
     */
    public List<T> getItems() {
        return items;
    }

    /**
     * 设置
     * @param items
     */
    public void setItems(List<T> items) {
        this.items = items;
    }

    public String toString() {
        return "Page{PAGE_SIZE = " + PAGE_SIZE + ", pageNo = " + pageNo + ", pageTotal = " + pageTotal + ", pageSize = " + pageSize + ", pageTotalCount = " + pageTotalCount + ", items = " + items + "}";
    }
}