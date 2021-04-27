package com.sbs.untactTeacher.dto;

import java.util.Map;

import com.sbs.untactTeacher.util.Util;

public class Rq {
	private Member loginedMember;
	private String currentUri;
	private String currentUrl;
	private Map<String, String> paramMap; 
	
	public Rq(Member loginedMember, String currentUri, Map<String, String> paramMap) {
		this.loginedMember = loginedMember;
		this.currentUrl = currentUri.split("\\?")[0];
		this.currentUri =currentUri;
		this.paramMap = paramMap;
	}
	
	public boolean isLogined() {
		return loginedMember != null;
	}
	
	public boolean isNotLogined() {
		return isLogined() == false;
	}
	
	public int getLoginedMemberId() {
		if(isNotLogined()) return 0;
		return loginedMember.getId();
	}
	
	public Member getLoginedMember() {
		return loginedMember;
	}
	
	public String getEncodedCurrentUri() {
		return Util.getUriEncoded(getCurrentUri());
	}
	
	private String getCurrentUri() {
		return currentUri;
	}
	
	
	public String getLoginPageUri() {
		String afterLoginUri;
		
		if(isLoginPage()) {
			afterLoginUri = Util.getUriEncoded(paramMap.get("afterLoginUri"));
		} else {
			afterLoginUri = getEncodedCurrentUri();
		}
		
		return "../member/login?afterLoginUri=" + afterLoginUri;
	}

	private boolean isLoginPage() {
		return currentUrl.equals("/mpaUsr/member/login");
	}
}