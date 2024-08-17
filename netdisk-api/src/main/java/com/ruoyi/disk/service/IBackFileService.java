package com.ruoyi.disk.service;


import com.ruoyi.disk.domain.BackChunk;
import com.ruoyi.disk.domain.BackFilelist;
import com.ruoyi.disk.domain.vo.CheckChunkVO;

import javax.servlet.http.HttpServletResponse;

public interface IBackFileService {

    int postFileUpload(BackChunk chunk, HttpServletResponse response);

    CheckChunkVO getFileUpload(BackChunk chunk, HttpServletResponse response);

    int deleteBackFileByIds(Long id);

    String mergeFile(BackFilelist fileInfo);
}