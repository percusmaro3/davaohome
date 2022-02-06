package com.davaohome.admin.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.davaohome.bo.model.admin.AdminMemberType;

public class AdminMenuComposition {

	static Map<AdminMemberType, List<AdminMenu>> rootMenuPerAdminTypeMap = new HashMap<>();
	static Map<AdminMemberType, Map<String, String[]>> childMenuPerAdminTypeMap = new HashMap<>();

	static List<AdminMenu> rootMenuList = new ArrayList<>();
	static Map<String, String[]> childMenuMap = new HashMap<>();

	static {

		AdminMenu customerMenu = new AdminMenu("customer", "menu.customerManage", "/notice/noticeList",
											   AdminMemberType.ADMIN, AdminMemberType.SUPER_ADMIN);
		customerMenu.addChildMenu(new AdminMenu("notice", "menu.noticerManage", "/notice/noticeList",
												AdminMemberType.ADMIN, AdminMemberType.SUPER_ADMIN));
//		customerMenu.addChildMenu(new AdminMenu("faq", "menu.faqManage", "/faq/faqList"));

//		AdminMenu settingMenu = new AdminMenu("setting", "menu.settingManage", "/adminMember/adminMemberList",
//											  AdminMemberType.ADMIN, AdminMemberType.SUPER_ADMIN);
//		settingMenu.addChildMenu(new AdminMenu("adminMemberManage", "menu.adminMemberManage",
//											   "/adminMember/adminMemberList",
//											   AdminMemberType.SUPER_ADMIN));


		rootMenuList.add(customerMenu);
//		rootMenuList.add(settingMenu);

		for (AdminMenu rootMenu : rootMenuList) {
			List<AdminMenu> childMenuList = rootMenu.getChildMenuList();
			for (AdminMenu childMenu : childMenuList) {
				String[] menuIdArr = new String[2];
				menuIdArr[0] = rootMenu.getMenuId();
				menuIdArr[1] = childMenu.getMenuId();
				childMenuMap.put(childMenu.getMenuUrl(), menuIdArr);
			}
		}

		setMenuPerAuth(AdminMemberType.EXTERNAL_ADMIN);
		setMenuPerAuth(AdminMemberType.ADMIN);
		setMenuPerAuth(AdminMemberType.DEVELOPER);
		setMenuPerAuth(AdminMemberType.SUPER_ADMIN);
	}

	// Developer는 모든 권한을 갖도록 하드 코딩함
	private static void setMenuPerAuth(AdminMemberType adminType) {

		List<AdminMenu> typePerRootMenuList = new ArrayList<>();
		Map<String, String[]> typePerChildMenuMap = new HashMap<>();

		for (AdminMenu rootMenu : rootMenuList) {
			if (!rootMenu.hasAuth(adminType) && adminType != AdminMemberType.DEVELOPER) {
				continue;
			} else {
				typePerRootMenuList.add(rootMenu);
			}

			List<AdminMenu> childMenuList = rootMenu.getChildMenuList();
			for (AdminMenu childMenu : childMenuList) {
				if (!childMenu.hasAuth(adminType) && adminType != AdminMemberType.DEVELOPER) {
					continue;
				} else {
					String[] menuIdArr = new String[2];
					menuIdArr[0] = rootMenu.getMenuId();
					menuIdArr[1] = childMenu.getMenuId();
					typePerChildMenuMap.put(childMenu.getMenuUrl(), menuIdArr);
				}
			}
		}

		rootMenuPerAdminTypeMap.put(adminType, typePerRootMenuList);
		childMenuPerAdminTypeMap.put(adminType, typePerChildMenuMap);
	}

	/* ############ ALL ########### */

	public static List<AdminMenu> getRootMenuMap() {
		return rootMenuList;
	}

	public static String[] getMenuIdArrFromMenuUrl(String menuUrl) {

		if (childMenuMap.containsKey(menuUrl)) {
			return childMenuMap.get(menuUrl);
		} else {
			return getPlainMenuMap(menuUrl);
		}
	}

	private static String[] getPlainMenuMap(String menuUrl) {
		if (isPlaceDetail(menuUrl)) {
			return childMenuMap.get("/place/placeList");
		} else {
			return null;
		}
	}

	/* ############ For Auth ########### */

	public static List<AdminMenu> getRootMenuMap(AdminMemberType adminType) {

		return rootMenuPerAdminTypeMap.get(adminType);
	}

	public static String[] getMenuIdArrFromMenuUrl(AdminMemberType adminType, String menuUrl) {

		Map<String, String[]> typePerChildMenuMap = childMenuPerAdminTypeMap.get(adminType);

		if (typePerChildMenuMap.containsKey(menuUrl)) {
			return typePerChildMenuMap.get(menuUrl);
		} else {
			return getPlainMenuMap(adminType, menuUrl);
		}
	}

	private static String[] getPlainMenuMap(AdminMemberType adminType, String menuUrl) {

		Map<String, String[]> typePerChildMenuMap = childMenuPerAdminTypeMap.get(adminType);

		if (isPlaceDetail(menuUrl)) {
			return typePerChildMenuMap.get("/place/placeList");
		} else {
			return null;
		}
	}

	private static boolean isPlaceDetail(String menuUrl) {
		return menuUrl.startsWith("/place/") ||
			   menuUrl.startsWith("/coupon/couponList") ||
			   menuUrl.startsWith("/voucher/voucherList");
	}
}

