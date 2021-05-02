package com.sbs.untactTeacher.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.untactTeacher.service.ReplyService;
import com.sbs.untactTeacher.util.Util;



@Controller
public class MpaUsrReplyController {

	@Autowired
	private ReplyService replyService;
	

	
	
	@RequestMapping("/mpaUsr/reply/doWrite")
	public String doWrite(HttpServletRequest req, @RequestParam Map<String, Object> param, Model model) {
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		param.put("memberId", loginedMemberId);
		int id = replyService.write(param);

		String relTypeCode = (String)param.get("relTypeCode");
		int relId = Util.getAsInt(param.get("relId"));

		model.addAttribute("msg", String.format("%d번 댓글이 생성되였습니다.", id));
		model.addAttribute("replaceUri", String.format("/usr/%s/detail?id=%d", relTypeCode, relId));
		return "common/redirect";
	}
}
