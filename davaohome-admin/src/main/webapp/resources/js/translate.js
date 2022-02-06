function _doTranslate (targetFieldType, strSelectorPrefix, targetLanguage) {

	var srcLanguage = getTranslateSrcLangage(targetLanguage);
	_doTranslateWithSrcLanguage(targetFieldType, strSelectorPrefix, srcLanguage, targetLanguage);
}

function _doTranslateWithSrcLanguage (targetFieldType, strSelectorPrefix, srcLanguage, targetLanguage) {

	var str = getTranslateSrcStr(targetFieldType, strSelectorPrefix, srcLanguage);

	var callback = getTranslateCallbackName(targetFieldType);
	var targetSelector = getTranslateStrSelector(targetFieldType, strSelectorPrefix, targetLanguage);

	translate(srcLanguage, targetLanguage, str, targetSelector, callback);
}

function getTranslateSrcLangage (targetLanguage) {
	var selectName = "srcLangage_" + targetLanguage;
	return $("select[name=" + selectName + "]").val();
}

function getTranslateSrcStr (targetFieldType, strSelectorPrefix, srcLanguage) {
	var srcSelector = getTranslateStrSelector(targetFieldType, strSelectorPrefix, srcLanguage);

	if (targetFieldType == "INPUT") {
		return $(srcSelector).val();
	} else if (targetFieldType == "TEXTAREA") {
		return $(srcSelector).val();
	} else {
		var oEditorSelector = "textarea#" + srcSelector;
		oEditors.getById[srcSelector].exec("UPDATE_CONTENTS_FIELD", []);
		return $(oEditorSelector).val();
	}
}

function getTranslateStrSelector (targetFieldType, strSelectorPrefix, language) {
	if (targetFieldType == "INPUT") {
		return strSelectorPrefix + language + "]";
	} else if (targetFieldType == "TEXTAREA") {
		return strSelectorPrefix + language + "]";
	} else {
		return strSelectorPrefix + language;
	}
}

function getTranslateCallbackName (targetFieldType) {
	if (targetFieldType == "INPUT") {
		return translateApiInputCallback;
	} else if (targetFieldType == "TEXTAREA") {
		return translateApiTextareaCallback;
	} else {
		return translateApiHtmlEditorCallback;
	}
}

function translateApiInputCallback (str, targetSelector) {
	$(targetSelector).val(str);
}

function translateApiTextareaCallback (str, targetSelector) {
	$(targetSelector).text(str);
}

function translateApiHtmlEditorCallback (str, targetSelector) {
	oEditors.getById[targetSelector].exec("SET_CONTENTS", ["", false]);
	oEditors.getById[targetSelector].exec("PASTE_HTML", [str]);
}


function translate (srcLanguage, targetLanguage, str, targetSelector, callback) {

	$.ajax({
		url: '/common/translate',
		type: 'POST',
		data: {
			src: srcLanguage,
			target: targetLanguage,
			str: str
		},
		dataType: 'json',
		success: function (resultMap) {
			if (resultMap.code == "FAIL") {
				alert(resultMap.result);
			} else {
				callback(resultMap.result, targetSelector);
			}
		},
		fail: function () {
			alert("Failed translate");
		}
	})
}