package com.source.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.source.entity.Source;

public interface SourceMapper {
	//��ѯ
	public List<Source> queryInfo(@Param("name") String name);
	//���
	public int addSourceInfo(Source source);
	//ɾ��
	public int delSourceById(int id);
    //�޸�
	public int updateSource(Source source);
	//�������ݲ�ѯ
	public Source findSourceById(int id);
	
	//��ҳ��ѯ
	List<Source> getSourceLimit(Map<String,Integer> map);
	//�ܼ�¼����ѯ
	public int countTotal();
	
}
