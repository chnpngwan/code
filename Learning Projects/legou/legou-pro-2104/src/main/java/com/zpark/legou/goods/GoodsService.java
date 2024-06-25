package com.zpark.legou.goods;

import co.elastic.clients.elasticsearch.core.search.CompletionSuggester;
import co.elastic.clients.elasticsearch.core.search.FieldSuggester;
import co.elastic.clients.elasticsearch.core.search.Suggester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.client.elc.NativeQuery;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.SearchPage;
import org.springframework.data.elasticsearch.core.suggest.response.Suggest;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GoodsService {

    @Autowired
    GoodsEsRepository goodsEsRepository;
    @Autowired
    ElasticsearchOperations elasticsearchOperations;
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    RedisTemplate<String, Object> redisTemplate;
    @Autowired
    RedisRecord redisRecord;

    /**
     * 关键词分页查找商品列表
     * @param keywords 关键词
     * @param page 当前页
     * @param pageSize 每页显示条数
     * @return 商品列表、总页数、符合条件的商品总数
     */
    public Map<String, Object> searchGoods(String keywords, int page, int pageSize){

        //分页
        Pageable pageable = Pageable.ofSize(pageSize).withPage(page);
        //获取查询结果 包括分页信息、高亮信息.....
        SearchPage<GoodsEs> searchPage = goodsEsRepository.findByTitle(keywords, pageable);

        List<SearchHit<GoodsEs>> searchHits = searchPage.getContent();

        List<GoodsEs> goodsList = searchHits.stream().map(searchHit -> {
            //获取原始数据
            GoodsEs goodsEs = searchHit.getContent();
            //高亮数据 替换 原始 title
            List<String> highlightTitle = searchHit.getHighlightField("title");
            goodsEs.setTitle(highlightTitle.get(0));
            return goodsEs;
        }).toList();

        //获取分页总数
        int totalPages = searchPage.getTotalPages();
        //获取商品总数
        long totalGoods = searchPage.getTotalElements();

        return Map.of("goodsList", goodsList,
                "totalPages", totalPages,
                "totalGoods", totalGoods);

    }


    /**
     * 搜索自动补全
     * @param prefix 前缀
     * @return 推荐列表
     */
    public List<String> suggestSearch(String prefix){

        CompletionSuggester completionSuggester = new CompletionSuggester.Builder().field("title.pre_sug_name").skipDuplicates(true).size(5).build();

        FieldSuggester fieldSuggester = new FieldSuggester.Builder().prefix(prefix).completion(completionSuggester).build();

        Suggester suggester = new Suggester.Builder().suggesters("prefix_suggestion", fieldSuggester).build();

        NativeQuery nativeQuery = NativeQuery.builder()
                .withSuggester(suggester)
                .build();

        SearchHits<GoodsEs> searchHits = elasticsearchOperations.search(nativeQuery, GoodsEs.class);

        Suggest suggest = searchHits.getSuggest();

        ArrayList<String> list = new ArrayList<>();

        suggest.getSuggestion("prefix_suggestion")
                .getEntries()
                .forEach(sug -> sug.getOptions().forEach(option -> list.add(option.getText())));

        return list;
    }

    /**
     * 新增商品
     * @param goods 要新增的商品信息
     * @return 新增结果
     */
    public Boolean addGoods(Goods goods){
        return goodsMapper.insertGoods(goods) > 0;
    }


    //根据 id 查询商品详情
    public GoodsEs findGoodsEsById(String id, boolean flag){
        Optional<GoodsEs> optional = goodsEsRepository.findById(id);
        //如果是用户调用 需要记录一次访问量
        if (optional.isPresent()){
            GoodsEs goodsEs = optional.get();
            //根据 flag 决定此次查询是否需要记录访问量到redis
            //如果不是用户 ，代码逻辑上需要调用当前方法，不需要记录访问量
            if (flag) {
                redisRecord._record(RedisRecord.VIEWKEY, id);
            }
            return goodsEs;
        }
        return null;
    }

    /**
     * 获取热门商品数据
     * @param key view 按浏览量 deal 按销量 round 综合
     * @param size 前 size 名
     * @return 热门商品列表
     */
    public List<GoodsEs> getHotGoods(String key, int size){
        key = switch (key){
            case "view" -> RedisRecord.VIEWKEY;
            case "deal" -> RedisRecord.DEALKEY;
            default -> RedisRecord.ROUNDKEY;
        };
        //获取到前 size 名的热门商品 id
        Set<Object> goodsIdList = redisTemplate.opsForZSet().reverseRange(key, 0, -1);

        ArrayList<GoodsEs> hotGoodsList = new ArrayList<>();

        for (Object goodsId: goodsIdList){
            GoodsEs goods = findGoodsEsById((String) goodsId, false);
            if (goods != null){
                hotGoodsList.add(goods);
            }
            if (size == hotGoodsList.size()) break;
        }

        return hotGoodsList;
        
        // Set<Object> hotGoodsIdSet = redisTemplate.opsForZSet().reverseRange(key, 0, size - 1);
        // return hotGoodsIdSet == null ? null
        //         : hotGoodsIdSet.stream().map(id -> findGoodsEsById((String) id, false)).toList();
    }

    /**
     * 根据分类 查询商品列表
     * @param type 商品类型
     * @param page 当前页
     * @param size 每页显示条数
     * @return 商品列表、总页数、总商品数
     */
    public Map<String, Object> searchGoodsByType(String type, int page, int size){
        //分页
        Pageable pageable = Pageable.ofSize(size).withPage(page);
        //查询数据
        SearchPage<GoodsEs> searchPage = goodsEsRepository.findByType(type, pageable);
        //获取查询结果
        List<SearchHit<GoodsEs>> content = searchPage.getContent();
        List<GoodsEs> goodsEsList = content.stream().map(SearchHit::getContent).toList();
        //获取总页数
        int totalPages = searchPage.getTotalPages();
        //总商品数
        long totalElements = searchPage.getTotalElements();

        return Map.of("goodsList", goodsEsList,
                    "totalPages", totalPages,
                    "totalElements", totalElements);
    }

    /**
     * 查询所有分类商品
     * @param page 当前页
     * @param size 每页条数
     * @return
     */
    public Map<String, Object> searchGoodsByAllType(int page, int size){

        GoodsTypeEnum[] goodsTypeEnums = GoodsTypeEnum.values();

        HashMap<String, Object> result = new HashMap<>();

        for (GoodsTypeEnum typeEnum : goodsTypeEnums){
            //分类名称
            String typeName = typeEnum.getTypeName();
            //根据分类名称查询商品列表
            Map<String, Object> map = searchGoodsByType(typeName, page, size);
            result.put(typeName, map.get("goodsList"));
        }
        return result;
    }

    //status: down 下架   up上架
    public Boolean updateGoodsStatus(List<String> goodsId, String status){

        int num = 0;
        //下架
        if ("down".equals(status)){
            //修改mysql商品状态 0
            num = goodsMapper.updateStatusDown(goodsId);
            //删除 es 库里的商品
            goodsEsRepository.deleteAllById(goodsId);
        }
        //上架
        if ("up".equals(status)){
            num = goodsMapper.updateStatusUp(goodsId);
        }

        return goodsId.size() == num;
    }

}
