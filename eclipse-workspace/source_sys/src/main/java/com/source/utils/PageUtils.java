package com.source.utils;
//��ҳ�Ĺ�����
public class PageUtils {
	 private int pageNo;//��ǰҳ
	 private int pageTotal;//��ҳ��
	 private int countTotal;//�ܼ�¼��
	 private int pageSize;//ÿҳ��¼��
	 private int startRow;//��ʼλ��
	 public PageUtils() {}
	 
	 public PageUtils(int pageNo, int countTotal, int pageSize) {
	//���������������õ������Ĳ���
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
