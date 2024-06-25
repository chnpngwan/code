package com.zpark.legou.goods;

import com.zpark.legou.utils.JsonResult;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;

@RestController
@Tag(name = "GoodsController", description = "商品模块")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    //根据关键词分页查询商品
    @GetMapping("anonymous/goods")
    @Operation(description = "根据关键词分页查询商品")
    public JsonResult searchGoods(@Parameter(description = "关键字") String keywords,
                                  @Parameter(description = "当前页") @RequestParam(required = false, defaultValue = "0") int page,
                                  @Parameter(description = "每页显示的条数") @RequestParam(required = false, defaultValue = "15") int pageSize){

        Map<String, Object> map = goodsService.searchGoods(keywords, page, pageSize);

        return JsonResult.successful("查询成功")
                .add("goodsList", map.get("goodsList"))
                .add("totalPages", map.get("totalPages"))
                .add("totalGoods", map.get("totalGoods"))
                .add("keywords", keywords)
                .add("page", page);
    }

    //自动补全
    @GetMapping("anonymous/goods/suggest")
    public JsonResult getSuggest(String prefix){
        List<String> suggestList = goodsService.suggestSearch(prefix);
        return JsonResult.successful("查询成功")
                .add("suggestList", suggestList);
    }


    //新增商品
    @PutMapping("admin/goods/add")
    public JsonResult addGoods(Goods goods, MultipartFile file) throws IOException {

        //获取图片的名称  a.png
        String filename = file.getOriginalFilename();

        //图片上传路径  legou-y48325425943593-a.png
        String pathName = "legou-" + UUID.randomUUID() + "-" + filename;
        //图片上传  d:\data-2104\legou-y48325425943593-a.png
        Files.write(Paths.get("d:\\data-2104\\" + pathName), file.getBytes());
        // http://127.0.0.1:8080/anonymous/data/legou-y48325425943593-a.png
        // anonymous/data  ->  d:\data-2104
        goods.setUrl("http://127.0.0.1:8080/anonymous/data/" + pathName);

        Boolean flag = goodsService.addGoods(goods);

        return flag ? JsonResult.successful("新增商品成功").add("goods", goods)
                : JsonResult.successful("新增商品失败");
    }

    //根据 id 去 es查询商品详情
    @GetMapping("goods/{id}")
    public JsonResult getGoods(@PathVariable String id){
        GoodsEs goodsEs = goodsService.findGoodsEsById(id, true);
        return Objects.nonNull(goodsEs) ? JsonResult.successful("查询成功").add("goods", goodsEs)
                : JsonResult.successful("抱歉，该商品已下架");
    }

    //获取热门商品列表  view 按浏览量 deal 按销量 round 综合
    @GetMapping("anonymous/goods/hotgoods")
    public JsonResult hotGoods(@RequestParam(required = false, defaultValue = "round") String key,
                               @RequestParam(required = false, defaultValue = "10") Integer size){
        return JsonResult.successful("热门商品已更新")
                .add("goods", goodsService.getHotGoods(key, size));

    }

    //根据分类去 es 里查询分类商品
    @GetMapping("anonymous/goods/type")
    public JsonResult searchGoodsByType(String type,
                                        @RequestParam(required = false, defaultValue = "0") Integer page,
                                        @RequestParam(required = false, defaultValue = "15") Integer size){

        Map<String, Object> map = goodsService.searchGoodsByType(type, page, size);

        return JsonResult.successful("查询成功")
                .add("type", type)
                .add("page", page)
                .add("size", size)
                .add("goodsList", map.get("goodsList"))
                .add("totalPages", map.get("totalPages"))
                .add("totalGoods", map.get("totalElements"));
    }

    @GetMapping("anonymous/goodstype")
    public JsonResult searchGoodsByAllType(@RequestParam(required = false, defaultValue = "0") int page,
                                           @RequestParam(required = false, defaultValue = "5") int size){
        Map<String, Object> map = goodsService.searchGoodsByAllType(page, size);
        return JsonResult.successful("查询成功")
                .add("goodsList", map);
    }


    //商品批量上架、下架
    //localhost:8080/goods/status/down 下架
    //localhost:8080/goods/status/up 上架
    @PostMapping("goods/status/{flag}")
    public JsonResult updateGoodsStatus(@RequestBody List<String> goodsId,
                                        @PathVariable String flag){
        Boolean result = goodsService.updateGoodsStatus(goodsId, flag);
        return result ? JsonResult.successful("修改成功")
                : JsonResult.successful("修改失败");
    }



}
