package xyz.hjzyhh.back_end.service;

import xyz.hjzyhh.back_end.DTO.SearchSelector;

import java.util.List;

public interface SearchService {
    List<Object> search(SearchSelector selector,int page);
}
