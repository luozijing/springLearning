package com.ilearning.pay.dal.mysql.parent;

import java.util.*;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ilearning.common.pojo.PageResult;
import com.ilearning.common.mybatis.core.query.LambdaQueryWrapperX;
import com.ilearning.common.mybatis.core.mapper.BaseMapperX;
import com.ilearning.pay.dal.dataobject.parent.ParentDO;
import com.ilearning.pay.dal.dataobject.parent.ParentDO2;
import org.apache.ibatis.annotations.Mapper;
import com.ilearning.pay.controller.admin.parent.vo.*;
import org.apache.ibatis.annotations.Param;

/**
 *  Mapper
 *
 * @author ${table.author}
 */
@Mapper
public interface ParentMapper extends BaseMapperX<ParentDO> {

    default PageResult<ParentDO> selectPage(ParentPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<ParentDO>()
                .eqIfPresent(ParentDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ParentDO::getUserId, reqVO.getUserId())
                .orderByDesc(ParentDO::getId));
    }

    default List<ParentDO> selectList(ParentExportReqVO reqVO) {
        return selectList(new LambdaQueryWrapperX<ParentDO>()
                .eqIfPresent(ParentDO::getStatus, reqVO.getStatus())
                .eqIfPresent(ParentDO::getUserId, reqVO.getUserId())
                .orderByDesc(ParentDO::getId));
    }

    List<ParentDO2> selectPageDetail(Page page, @Param("req") ParentPageReqVO reqVO);

    List<ParentDO2> selectByRangeId(@Param("id1") Long id1, @Param("id2") Long id2);

}
