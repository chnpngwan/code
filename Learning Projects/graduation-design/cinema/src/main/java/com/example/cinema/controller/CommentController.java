package com.example.cinema.controller;

import com.example.cinema.annotation.OptLog;
import com.example.cinema.constant.CommonConstant;
import com.example.cinema.dto.CommentReviewDTO;
import com.example.cinema.entity.Comment;
import com.example.cinema.service.CommentService;
import com.example.cinema.vo.CommentFrontVO;
import com.example.cinema.vo.CommentVO;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static com.example.cinema.constant.OptTypeConst.*;

@Api(tags = "评论模块")
@RestController
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @GetMapping
    @ApiOperation(value = "后台查看影片下的评论")
    public Response<PageResult<CommentVO>> getCommentPage(@RequestParam(value = "keywords", required = false) String keywords,
                                                          @RequestParam("movieId") Integer movieId) {
        return Response.success(commentService.getCommentPage(keywords, movieId));
    }

    @GetMapping("/movie")
    @ApiOperation(value = "前台查看影片下的评论")
    public Response<PageResult<CommentFrontVO>> getCommentFrontVO(Integer movieId) {
        return Response.success(commentService.getCommentFrontVOByMovieId(movieId));
    }

    @PostMapping
    @OptLog(optType = SAVE)
    @ApiOperation(value = "新增评论")
    public Response<?> saveComment(@RequestBody Comment comment) {
        comment.setReviewFlag(false);
        if (commentService.saveOrUpdate(comment)) {
            return Response.success();
        }
        return Response.failure();
    }

    @PutMapping
    @OptLog(optType = UPDATE)
    @ApiOperation(value = "审核评论")
    public Response<?> reviewComment(@RequestBody CommentReviewDTO commentReviewDTO) {
        if (commentService.reviewCommentById(commentReviewDTO)) {
            return Response.success();
        }
        return Response.failure();
    }

    @DeleteMapping
    @OptLog(optType = REMOVE)
    @ApiOperation(value = "删除评论")
    public Response<?> deleteComment(@RequestBody List<Integer> ids) {
        if (commentService.removeBatchByIds(ids)) {
            return Response.success();
        }
        return Response.failure();
    }
}
