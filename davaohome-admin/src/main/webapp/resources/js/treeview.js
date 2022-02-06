/**
 *  트리뷰 적용을 위한 리스트 생성
 *  param treeId > 트리객체정보 담을 id값
 *  param ajax_url > 트리리스트 가져올 ajax url
 *  param ajax_data > 트리리스트 가져올 ajax url 호출 파라메터
 *  param errMsg > ajax fail 메세지
 *  param field_id > return data 처리시 트리 항목의 id값에 매칭되는 필드명
 *  param field_upper_id > return data 처리시 트리 항목의 상위트리항목id값에 매칭되는 필드명
 *  param field_level > return data 처리시 트리 항목의 level값에 매칭되는 필드명
 *  param field_name > return data 처리시 트리 항목의 명칭(name)값에 매칭되는 필드명
 *  param field_useyn > return data 처리시 트리 항목의 사용여부(use_flag)에 매칭되는 필드명
 *
 *  * treeItemOnClick 함수가 정의되어 있어야함>>>
 *    function treeItemOnClick(카테고리ID,상위카테고리ID,카테고리레벨){...}
 *  * 트리의 Depth 오픈상태를 유지하기 위해 아래 항목 추가 필수
 *    <input type="hidden" name="openItemSub" id="openItemSub" />
 *    <input type="hidden" name="openItemMain" id="openItemMain" />
 */
function setTree (treeId, ajax_url, ajax_data, errMsg, field_id, field_upper_id, field_level, field_name, field_useyn, file_name_eng) {

	treeId.html("");

	// 중앙 카테고리 리스트 노출&새로고침
	$.ajax({
		dataType: 'json',
		type: 'GET',
		cache: false,
		async: false,
		timeout: 30000,
		url: ajax_url,
		data: ajax_data,
		success: function (result) {

			var prevlevel = 1;
			var innerHtml = "";
			var itemHtml = "";
			var itemHref = "";

			$.each(result, function (index, entry) {

				if (index == "data") {

					//본체만 가져옴
					$(entry).each(function (indexRow, entryRow) {

						itemHref = "<a href='#' onclick=\"javascript:treeItemOnClick('" + entryRow[field_id] + "','" + entryRow[field_upper_id] + "','" + entryRow[field_level] + "');\"><label>" + entryRow[field_name];

						if (entryRow[file_name_eng] != null && entryRow[file_name_eng] != '') {
							itemHref += " | " + entryRow[file_name_eng];
						}

						itemHref += "</label></a>";
						liClassName = "class='depth1'";

						if (!(ajax_url.indexOf('managementCategory') > 0)) {

							if (entryRow[field_useyn] == 'Y') {
								itemHref = itemHref + "<em class='ctg_lock'>잠김</em>";
							}
						}

						if (entryRow[field_level] == 1) {
							liClassName = "class='depth1'";
							className = "depth1";
						} else if (entryRow[field_level] == 2) {
							liClassName = "";
							className = "depth2";
						} else if (entryRow[field_level] == 3) {
							className = "depth3";
							liClassName = "";
						}


						//레벨이 달라지고
						if (prevlevel != entryRow[field_level]) {
							if (entryRow["categoryOrder"] == 0) {
								//order가 0이면 - 명칭 뒤에 ul 열어
								itemHtml = "<ul class='" + className + "' name='" + entryRow[field_name] + "'><li " + liClassName + " id ='" + entryRow[field_id] + "' name='" + entryRow[field_name] + "'>" + itemHref;
							} else {
								if (Math.abs(prevlevel - entryRow[field_level]) > 1) {
									itemHtml = "</ul></li></ul></li><li " + liClassName + " id ='" + entryRow[field_id] + "' name='" + entryRow[field_name] + "'>" + itemHref;
								} else {
									//레벨이 달라지긴 했는데 order가 0이 아니면 - 명칭 앞에 ul닫고 li닫아
									itemHtml = "</ul></li><li " + liClassName + " id ='" + entryRow[field_id] + "' name='" + entryRow[field_name] + "'>" + itemHref;
								}
							}
						} else {
							indexRow == 1 ? itemHtml = "<li " + liClassName + " id ='" + entryRow[field_id] + "' name='" + entryRow[field_name] + "'>" + itemHref : itemHtml = "</li><li " + liClassName + " id ='" + entryRow[field_id] + "' name='" + entryRow[field_name] + "'>" + itemHref;
						}

						innerHtml = innerHtml + itemHtml;
						prevlevel = entryRow[field_level];

					});

					//loop 끝나고 마지막 레코드 level 에 맞춰서 ul닫고 li닫아
					if (prevlevel == 1) {
						innerHtml = innerHtml + "</ul></li>";
					} else if (prevlevel == 2) {
						innerHtml = innerHtml + "</ul></li></ul></li>";
					} else if (prevlevel == 3) {
						innerHtml = innerHtml + "</ul></li></ul></li></ul></li>";
					}
				}


			});

			treeId.html(innerHtml);

			treeId.treeview({
				collapsed: true,
				animated: "fast"
			});
			//unique: true

			//트리 상태 유지
			var arrSub = new Array();
			var arrMain = new Array();
			var itemSub = $("#openItemSub").val();
			var itemMain = $("#openItemMain").val();

			arrSub = itemSub.split(",");
			arrMain = itemMain.split(",");

			if (arrMain.length > 1) {
				for (temp in arrMain) {
					if (arrMain[temp] != "") {
						$("li[name='" + arrMain[temp] + "']").removeClass('expandable lastExpandable').addClass('collapsable lastCollapsable');
						$("li[name='" + arrMain[temp] + "'] > ul").css("display", "block");
					}
				}
			}

			if (arrSub.length > 1) {
				for (temp in arrSub) {
					if (arrSub[temp] != "") {
						$("li[name='" + arrSub[temp] + "']").removeClass('expandable').addClass('collapsable');
						$("li[name='" + arrSub[temp] + "'] > ul").css("display", "block");
					}
				}
			}


		},
		error: function (request, status, error) {
			alert(errMsg);
		}

	});

}
