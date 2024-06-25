package com.example.cinema.controller;

import com.example.cinema.annotation.AccessLimit;
import com.example.cinema.annotation.OptLog;
import com.example.cinema.utils.MinioUtil;
import com.example.cinema.dto.MovieDTO;
import com.example.cinema.service.MovieService;
import com.example.cinema.vo.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.*;

@Api(tags = "影片模块")
@RestController
@RequestMapping("/movie")
public class MovieController {
    @Autowired
    private MovieService movieService;
    @Autowired
    private MinioUtil minioUtil;

    @GetMapping
    @ApiOperation(value = "查看影片列表")
    public Response<PageResult<MovieVO>> getMovieVOPage(String keywords) {
        return Response.success(movieService.getMovieVOPage(keywords));
    }

    @GetMapping("/list")
    public Response<List<MovieSimpleVO>> getMovieVOList() {
        return Response.success(movieService.getMovieSimpleVOPage());
    }

    @GetMapping("/actor")
    @ApiOperation(value = "查看影片下的演员详情")
    public Response<List<MovieActorVO>> getMovieActor(Integer movieId) {
        return Response.success(movieService.getMovieActorByMovieId(movieId));
    }

    @GetMapping("/ongoing")
    @ApiOperation(value = "查看正在热映电影")
    public Response<PageResult<MovieFrontVO>> getOngoingMovie(@RequestParam("categoryId") Integer categoryId,
                                                              @RequestParam("areaId") Integer areaId,
                                                              @RequestParam("ageId") Integer ageId,
                                                              @RequestParam("orderType") Integer orderType) {
        return Response.success(movieService.getOngoingMovie(categoryId, areaId, ageId, orderType));
    }

    @GetMapping("/upcoming")
    @ApiOperation(value = "查看即将上映电影")
    public Response<PageResult<MovieFrontVO>> getUpcomingMovie(@RequestParam("categoryId") Integer categoryId,
                                                               @RequestParam("areaId") Integer areaId,
                                                               @RequestParam("ageId") Integer ageId,
                                                               @RequestParam("orderType") Integer orderType) {
        return Response.success(movieService.getUpcomingMovie(categoryId, areaId, ageId, orderType));
    }

    @GetMapping("/classic")
    @ApiOperation(value = "查看经典电影")
    public Response<PageResult<MovieFrontVO>> getClassicMovie(@RequestParam("categoryId") Integer categoryId,
                                                              @RequestParam("areaId") Integer areaId,
                                                              @RequestParam("ageId") Integer ageId,
                                                              @RequestParam("orderType") Integer orderType) {
        return Response.success(movieService.getClassicMovie(categoryId, areaId, ageId, orderType));
    }

    @GetMapping("/detail")
    @ApiOperation(value = "查看电影详情")
    public Response<MovieDetailVO> getMovieDetail(Integer movieId) {
        return Response.success(movieService.getMovieDetailByMovieId(movieId));
    }

    @PostMapping
    @OptLog(optType = SAVE_OR_UPDATE)
    @ApiOperation(value = "新增或修改电影")
    public Response<?> saveOrUpdateMovie(@RequestBody MovieDTO movieDTO) {
        if (movieService.saveOrUpdateMovie(movieDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PostMapping("/actor")
    @OptLog(optType = SAVE)
    @ApiOperation(value = "新增演员")
    public Response<?> saveMovieActorDuty(@RequestBody MovieActorDutyDTO movieActorDutyDTO) {
        if (movieService.saveMovieActorDuty(movieActorDutyDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping("/view/{movieId}")
    @ApiOperation(value = "电影访问量+1")
    public void incrMovieViewCount(@PathVariable("movieId") Integer movieId) {
        movieService.incrMovieViewCount(movieId);
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除电影")
    public Response<?> deleteMovie(@RequestBody List<Integer> ids) {
        if (movieService.deleteMovie(ids)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping("/actor")
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除电影下的演员")
    public Response<?> deleteMovieActorDuty(@RequestBody MovieActorDutyDTO movieActorDutyDTO) {
        if (movieService.deleteMovieActorDuty(movieActorDutyDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping("/image/{movieId}")
    public Response<?> deleteMovieImage(@PathVariable("movieId") Integer movieId) {
        if (movieService.deleteMovieImage(movieId)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PostMapping("/image")
    @ApiOperation(value = "上传图片")
    public Response<String> saveMovieImage(MultipartFile file) {
        return Response.success(minioUtil.upload(file));
    }
}
