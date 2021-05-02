package com.sbs.untactTeacher.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.untactTeacher.dao.ReplyDao;
import com.sbs.untactTeacher.util.Util;

@Service
public class ReplyService {
	@Autowired
	private ReplyDao replyDao;

	public int write(Map<String, Object> param) {
		replyDao.write(param);
		
		int id = Util.getAsInt(param.get("id"));

		return id;
	}

}