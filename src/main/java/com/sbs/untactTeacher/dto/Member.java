package com.sbs.untactTeacher.dto;

import com.sbs.untactTeacher.util.Util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {
	private int id;
	private String regDate;
	private String updateDate;
	private String loginId;
	private String loginPw;
	private String name;
	private String nickname;
	private String cellphoneNo;
	private String email;
    private boolean delStatus;
    private String delDate;
    
    public String getAuthLevelName() {
    	return "μΌλ°νμ";
    }
    
    public String toJsonStr() {
        return Util.toJsonStr(this);
    }
}
