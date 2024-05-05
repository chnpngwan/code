package com.source.utils;
//分页的工具类
public class PageUtils {
	 private int pageNo;//当前页
	 private int pageTotal;//总页数
	 private int countTotal;//总记录数
	 private int pageSize;//每页记录数
	 private int startRow;//起始位置
	 public PageUtils() {}
	 
	 public PageUtils(int pageNo, int countTotal, int pageSize) {
	//利用三个参数来得到其他的参数
	     this.pageNo = pageNo;
	     this.pageTotal = countTotal % pageSize == 0 ? countTotal / pageSize : countTotal / pageSize + 1;
	     this.countTotal = countTotal;
	     this.pageSize = pageSize;
	     this.startRow = (pageNo - 1) * pageSize;
	  }
	 
	    public int getPageNo() {
	        return pageNo;
	    }
	 
	    public void setPageNo(int pageNo) {
	        this.pageNo = pageNo;
	    }
	 
	    public int getPageTotal() {
	        return pageTotal;
	    }
	 
	    public void setPageTotal(int pageTotal) {
	        this.pageTotal = pageTotal;
	    }
	 
	    public int getCountTotal() {
	        return countTotal;
	    }
	 
	    public void setCountTotal(int countTotal) {
	        this.countTotal = countTotal;
	    }
	 
	    public int getPageSize() {
	        return pageSize;
	    }
	 
	    public void setPageSize(int pageSize) {
	        this.pageSize = pageSize;
	    }
	 
	    public int getStartRow() {
	        return startRow;
	    }
	 
	    public void setStartRow(int startRow) {
	        this.startRow = startRow;
	    }
}
