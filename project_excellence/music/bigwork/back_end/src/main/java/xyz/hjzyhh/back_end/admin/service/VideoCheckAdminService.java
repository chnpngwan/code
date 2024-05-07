package xyz.hjzyhh.back_end.admin.service;

import xyz.hjzyhh.back_end.admin.DTO.VideoCheckDTO;
import xyz.hjzyhh.back_end.admin.PO.VideoCheckPO;
import xyz.hjzyhh.back_end.vo.VideoVO;

import java.util.List;

public interface VideoCheckAdminService {

    public List<VideoCheckDTO> get( int aid);
    int uncheck(List<Long> ids, int aid);
    int pass(long id, int aid);
    int unpass(long id, int aid);
}
