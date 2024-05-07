package com.xunmaw.book.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xunmaw.book.entity.ClassInfo;
import com.xunmaw.book.mapper.ClassInfoMapper;
import com.xunmaw.book.service.ClassInfoService;
import org.springframework.stereotype.Service;

@Service
public class ClassInfoServiceImpl extends ServiceImpl<ClassInfoMapper, ClassInfo> implements ClassInfoService {
}
