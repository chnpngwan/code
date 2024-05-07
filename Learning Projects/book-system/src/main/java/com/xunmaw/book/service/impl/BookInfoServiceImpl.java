package com.xunmaw.book.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xunmaw.book.entity.BookInfo;
import com.xunmaw.book.mapper.BookInfoMapper;
import com.xunmaw.book.service.BookInfoService;
import org.springframework.stereotype.Service;

@Service
public class BookInfoServiceImpl extends ServiceImpl<BookInfoMapper, BookInfo> implements BookInfoService {
}
