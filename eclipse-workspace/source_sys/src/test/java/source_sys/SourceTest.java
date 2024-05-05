package source_sys;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import com.source.entity.Source;
import com.source.mapper.SourceMapper;
import com.source.utils.SqlSessionUtils;

public class SourceTest {
	@Test
	public void getSourceByLimit() {
		SqlSession session = SqlSessionUtils.init();
		SourceMapper sc = session.getMapper(SourceMapper.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("startIndex", 2);
        map.put("pageSize", 2);
		List<Source> list = sc.getSourceLimit(map);
		for(Source s:list) {
			System.out.println(s);
		}
		session.close();
	}

}
