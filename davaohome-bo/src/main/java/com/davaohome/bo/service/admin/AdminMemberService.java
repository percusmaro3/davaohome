package com.davaohome.bo.service.admin;

import com.davaohome.bo.model.admin.AdminMember;
import com.davaohome.bo.model.admin.AdminMemberSearchParam;
import com.davaohome.bo.model.base.PagerResult;
import com.davaohome.bo.repository.admin.AdminMemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberService {
	@Autowired
	private AdminMemberRepository adminMemberRepository;

	public AdminMember checkLogin(String id, String password) {

		AdminMember adminMember = adminMemberRepository.checkLogin(id, password);

		return adminMember;
	}

	public AdminMember getAdminMember(String adminMemberId) {

		AdminMember adminMember = adminMemberRepository.getAdminMember(adminMemberId);

		return adminMember;
	}

	public void changePassword(String adminMemberId, String newPassword) {

		adminMemberRepository.changePassword(adminMemberId, newPassword);
	}

	public void insertAdminMember(AdminMember adminMember) {

		adminMemberRepository.insertAdminMember(adminMember);
	}


	public PagerResult getAdminMemberList(AdminMemberSearchParam adminSearchParam) {
		return adminMemberRepository.getAdminMemberList(adminSearchParam);
	}

	public void updateAdminMember(AdminMember adminMember, String loginAdminId) {
		if (loginAdminId.equals(adminMember.getAdminMemberId())) {
			adminMemberRepository.updateAdminMember(adminMember);
		} else {
			adminMemberRepository.updateAdminMemberWithNoPassword(adminMember);
		}

	}
}
