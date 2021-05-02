package com.sbs.untactTeacher.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyDao {

	void write(Map<String, Object> param);
}
