package xyz.hjzyhh.back_end.service.impl;

import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.hjzyhh.back_end.DTO.SearchSelector;
import xyz.hjzyhh.back_end.mapper.SearchMapper;
import xyz.hjzyhh.back_end.service.SearchService;
import xyz.hjzyhh.back_end.service.TagService;
import xyz.hjzyhh.back_end.service.UserService;
import xyz.hjzyhh.back_end.service.VideoService;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class SearchServiceImpl implements SearchService {
    private final int PAGE_LIMIT = 20;
    private Set<SearchItem> set = new HashSet<>();

    public SearchServiceImpl() {
        Class<? extends SearchServiceImpl> aClass = this.getClass();
        Class<?>[] declaredClasses = aClass.getDeclaredClasses();
        for (Class clazz : declaredClasses) {
            if (!Modifier.isAbstract(clazz.getModifiers()) && !Modifier.isInterface(clazz.getModifiers())) {
                if (SearchItem.class.isAssignableFrom(clazz)) {
                    try {
                        Constructor<?> constructor = clazz.getDeclaredConstructor(this.getClass());
                        constructor.setAccessible(true);
                        set.add((SearchItem) constructor.newInstance(this));
                    } catch (InstantiationException e) {
                        e.printStackTrace();
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    } catch (NoSuchMethodException e) {
                        e.printStackTrace();
                    } catch (InvocationTargetException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    @Autowired
    SearchMapper searchMapper;

    @Autowired
    UserService userService;

    @Autowired
    VideoService videoService;

    @Autowired
    TagService tagService;

    private long getOffset(int page) {
        return PAGE_LIMIT * (page - 1);
    }

    private SearchItem getMatched(String mode) {
        for (SearchItem item : set) {
            if (item.match(mode)) {
                return item;
            }
        }
        return null;
    }

    @Override
    public List<Object> search(SearchSelector selector, int page) {
        String searchMod = selector.getSearchMod();
        SearchItem searchItem = getMatched(selector.getSearchMod());
        if (searchItem == null) {
            throw new RuntimeException("参数异常");
        }
        return searchItem.search(selector, page);
    }

    abstract class SearchItem {
        private String HANDLE_MODE = "";

        String getHANDLE_MODE() {
            return HANDLE_MODE;
        }

        boolean match(String mode) {
            return mode.equals(getHANDLE_MODE());
        }

        abstract List search(SearchSelector selector, int page);
    }


    public class SearchVideo extends SearchItem {
        protected String HANDLE_MODE = "video";

        @Override
        String getHANDLE_MODE() {
            return HANDLE_MODE;
        }

        public SearchVideo() {
        }


        @Override
        public List search(SearchSelector selector, int page) {
            return searchMapper.searchVideoByKeyword(selector.getKeyword(), PAGE_LIMIT, getOffset(page));
        }
    }

    public class SearchUser extends SearchItem {
        protected String HANDLE_MODE = "user";

        @Override
        String getHANDLE_MODE() {
            return HANDLE_MODE;
        }

        public SearchUser() {
        }


        @Override
        public List search(SearchSelector selector, int page) {
            return searchMapper.searchUserByKeyword(selector.getKeyword(), PAGE_LIMIT, getOffset(page));
        }
    }

    public class SearchClass extends SearchItem {
        protected String HANDLE_MODE = "class";

        @Override
        String getHANDLE_MODE() {
            return HANDLE_MODE;
        }

        public SearchClass() {
        }


        @Override
        List search(SearchSelector selector, int page) {
            return searchMapper.searchClassByKeyword(selector.getKeyword(), PAGE_LIMIT, getOffset(page));
        }
    }
}
