/**
 * Paging JavaScript
 */

function displayPage(paging, tag){
	
	content = '';
	content += '<a href="javascript:goPage(' + paging.firstPage + ') class="pre_end">맨앞</a>';
	content += '<a href="javascript:goPage(' + paging.jumpPrevPage + ')" class="pre">이전</a>';
	
	for (var i = paging.pageBegin; i <= paging.pageEnd; i++) {
		if (i == paging.currentPage) {
			content += '<strong>' + i + '</strong>';
		} else {
			content += '<a href="javascript:goPage(' + i + ')">' + i + '</a>';
		}
	}
	
	content += '<a href="javascript:goPage(' + paging.jumpNextPage + ')" class="next">다음</a>';
	content += '<a href="javascript:goPage(' + paging.pageCount + ')" class="next_end">맨뒤</a>';
		
	tag.html(content);
}
