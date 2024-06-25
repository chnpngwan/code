package com.zpark.legou.goods;

import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Highlight;
import org.springframework.data.elasticsearch.annotations.HighlightField;
import org.springframework.data.elasticsearch.annotations.HighlightParameters;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsEsRepository extends ElasticsearchRepository<GoodsEs, String> {

    @Highlight(fields = {
            @HighlightField(name = "title",
                            parameters = @HighlightParameters(preTags = "<span style='color:red;'>",
                                                              postTags = "</span>"))
    })
    SearchPage<GoodsEs> findByTitle(String keywords, Pageable pageable);


    SearchPage<GoodsEs> findByType(String type, Pageable pageable);
}
