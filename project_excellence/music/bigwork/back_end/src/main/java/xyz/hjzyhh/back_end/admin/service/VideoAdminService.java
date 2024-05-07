package xyz.hjzyhh.back_end.admin.service;

import xyz.hjzyhh.back_end.admin.PO.UserSelector;
import xyz.hjzyhh.back_end.admin.PO.VideoSelector;
import xyz.hjzyhh.back_end.pojo.UserPO;
import xyz.hjzyhh.back_end.pojo.VideoPO;

import java.util.List;

public interface VideoAdminService {
    List<VideoPO> getBySelector(VideoSelector videoSelector, int limit, long offset);
    int ban(long id);
    int unban(long id);
    int delete(long id);
    int undelete(long id);
}
