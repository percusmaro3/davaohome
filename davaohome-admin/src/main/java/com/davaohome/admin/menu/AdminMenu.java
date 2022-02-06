package com.davaohome.admin.menu;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import lombok.Data;

import com.davaohome.bo.model.admin.AdminMemberType;

@Data
public class AdminMenu {

	private String menuId;
	private String menuName;
	private String menuUrl;
	private List<AdminMenu> childMenuList = new ArrayList<>();
	private List<AdminMemberType> authAdminMemberTypeList;

	public AdminMenu(String menuId, String menuName, String menuUrl, AdminMemberType... adminMemberTypes) {
		this.menuId = menuId;
		this.menuName = menuName;
		this.menuUrl = menuUrl;

		authAdminMemberTypeList = Arrays.asList(adminMemberTypes);
	}

	public void addChildMenu(AdminMenu childMenu) {
		childMenuList.add(childMenu);
	}

	public boolean hasAuth(AdminMemberType adminMemberType) {

		for (AdminMemberType type : authAdminMemberTypeList) {
			if (type == adminMemberType) {
				return true;
			}
		}
		return false;
	}

}
