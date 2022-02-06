package com.davaohome.bo.repository.admin;

import com.davaohome.bo.model.admin.AdminMember;
import com.davaohome.bo.model.admin.AdminMemberSearchParam;
import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.repository.base.BaseRepository;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class AdminMemberRepository extends BaseRepository {

	private static final String PREFIX = "adminMember.";

	public Integer changePassword(String adminMemberId, String newPassword) {

		Map<String, Object> param = new HashMap<>();
		param.put("adminMemberId", adminMemberId);
		param.put("newPassword", newPassword);

		return this.sql.update(PREFIX + "changePassword", param);
	}

	//	public Integer withdrawAdminMember(String adminMemberId) {
	//
	//		return this.sql.update(PREFIX + "withdrawAdminMember", adminMemberId);
	//	}

	public AdminMember getAdminMember(String adminMemberId) {

		return this.sql.selectOne(PREFIX + "getAdminMember", adminMemberId);
	}


	public void insertAdminMember(AdminMember adminMember) {

		this.sql.insert(PREFIX + "insertAdminMember", adminMember);
	}

	//	public List<AdminMember> getAdminMemberList(String countryId) {
	//
	//		return this.sql.selectList(PREFIX + "getAdminMemberList", countryId);
	//	}

	public AdminMember checkLogin(String id, String password) {

		Map<String, Object> param = new HashMap<>();
		param.put("id", id);
		param.put("password", password);

		return this.sql.selectOne(PREFIX + "checkLogin", param);
	}

	public PagerResult getAdminMemberList(AdminMemberSearchParam adminSearchParam) {

		return this.selectPagerList(PREFIX + "getAdminMemberList", adminSearchParam);
	}

	public void updateAdminMember(AdminMember adminMember) {
		this.sql.update(PREFIX + "updateAdminMember", adminMember);
	}

	public void updateAdminMemberWithNoPassword(AdminMember adminMember) {
		this.sql.update(PREFIX + "updateAdminMemberWithNoPassword", adminMember);
	}
}
