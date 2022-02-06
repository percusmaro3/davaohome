jindo.Component = jindo.$Class({
	_htEventHandler: null, _htOption: null, $init: function () {
		var aInstance = this.constructor.getInstance();
		aInstance.push(this);
		this._htEventHandler = {};
		this._htOption = {};
		this._htOption._htSetter = {};
	}, option: function (sName, vValue) {
		switch (typeof sName) {
			case"undefined":
				return this._htOption;
			case"string":
				if (typeof vValue != "undefined") {
					if (sName == "htCustomEventHandler") {
						if (typeof this._htOption[sName] == "undefined") {
							this.attach(vValue);
						} else {
							return this;
						}
					}
					this._htOption[sName] = vValue;
					if (typeof this._htOption._htSetter[sName] == "function") {
						this._htOption._htSetter[sName](vValue);
					}
				} else {
					return this._htOption[sName];
				}
				break;
			case"object":
				for (var sKey in sName) {
					if (sKey == "htCustomEventHandler") {
						if (typeof this._htOption[sKey] == "undefined") {
							this.attach(sName[sKey]);
						} else {
							continue;
						}
					}
					this._htOption[sKey] = sName[sKey];
					if (typeof this._htOption._htSetter[sKey] == "function") {
						this._htOption._htSetter[sKey](sName[sKey]);
					}
				}
				break;
		}
		return this;
	}, optionSetter: function (sName, fSetter) {
		switch (typeof sName) {
			case"undefined":
				return this._htOption._htSetter;
			case"string":
				if (typeof fSetter != "undefined") {
					this._htOption._htSetter[sName] = jindo.$Fn(fSetter, this).bind();
				} else {
					return this._htOption._htSetter[sName];
				}
				break;
			case"object":
				for (var sKey in sName) {
					this._htOption._htSetter[sKey] = jindo.$Fn(sName[sKey], this).bind();
				}
				break;
		}
		return this;
	}, fireEvent: function (sEvent, oEvent) {
		oEvent = oEvent || {};
		var fInlineHandler = this["on" + sEvent], aHandlerList = this._htEventHandler[sEvent] || [], bHasInlineHandler = typeof fInlineHandler == "function", bHasHandlerList = aHandlerList.length > 0;
		if (!bHasInlineHandler && !bHasHandlerList) {
			return true;
		}
		aHandlerList = aHandlerList.concat();
		oEvent.sType = sEvent;
		if (typeof oEvent._aExtend == "undefined") {
			oEvent._aExtend = [];
			oEvent.stop = function () {
				if (oEvent._aExtend.length > 0) {
					oEvent._aExtend[oEvent._aExtend.length - 1].bCanceled = true;
				}
			};
		}
		oEvent._aExtend.push({sType: sEvent, bCanceled: false});
		var aArg = [oEvent], i, nLen;
		for (i = 2, nLen = arguments.length; i < nLen; i++) {
			aArg.push(arguments[i]);
		}
		if (bHasInlineHandler) {
			fInlineHandler.apply(this, aArg);
		}
		if (bHasHandlerList) {
			var fHandler;
			for (i = 0, fHandler; (fHandler = aHandlerList[i]); i++) {
				fHandler.apply(this, aArg);
			}
		}
		return !oEvent._aExtend.pop().bCanceled;
	}, attach: function (sEvent, fHandlerToAttach) {
		if (arguments.length == 1) {
			jindo.$H(arguments[0]).forEach(jindo.$Fn(function (fHandler, sEvent) {
				this.attach(sEvent, fHandler);
			}, this).bind());
			return this;
		}
		var aHandler = this._htEventHandler[sEvent];
		if (typeof aHandler == "undefined") {
			aHandler = this._htEventHandler[sEvent] = [];
		}
		aHandler.push(fHandlerToAttach);
		return this;
	}, detach: function (sEvent, fHandlerToDetach) {
		if (arguments.length == 1) {
			jindo.$H(arguments[0]).forEach(jindo.$Fn(function (fHandler, sEvent) {
				this.detach(sEvent, fHandler);
			}, this).bind());
			return this;
		}
		var aHandler = this._htEventHandler[sEvent];
		if (aHandler) {
			for (var i = 0, fHandler; (fHandler = aHandler[i]); i++) {
				if (fHandler === fHandlerToDetach) {
					aHandler = aHandler.splice(i, 1);
					break;
				}
			}
		}
		return this;
	}, detachAll: function (sEvent) {
		var aHandler = this._htEventHandler;
		if (arguments.length) {
			if (typeof aHandler[sEvent] == "undefined") {
				return this;
			}
			delete aHandler[sEvent];
			return this;
		}
		for (var o in aHandler) {
			delete aHandler[o];
		}
		return this;
	}
});
jindo.Component.factory = function (aObject, oOption) {
	var aReturn = [], oInstance;
	if (typeof oOption == "undefined") {
		oOption = {};
	}
	for (var i = 0, el; (el = aObject[i]); i++) {
		oInstance = new this(el, oOption);
		aReturn[aReturn.length] = oInstance;
	}
	return aReturn;
};
jindo.Component.getInstance = function () {
	if (typeof this._aInstance == "undefined") {
		this._aInstance = [];
	}
	return this._aInstance;
};
jindo.UIComponent = jindo.$Class({
	$init: function () {
		this._bIsActivating = false;
	}, isActivating: function () {
		return this._bIsActivating;
	}, activate: function () {
		if (this.isActivating()) {
			return this;
		}
		this._bIsActivating = true;
		if (arguments.length > 0) {
			this._onActivate.apply(this, arguments);
		} else {
			this._onActivate();
		}
		return this;
	}, deactivate: function () {
		if (!this.isActivating()) {
			return this;
		}
		this._bIsActivating = false;
		if (arguments.length > 0) {
			this._onDeactivate.apply(this, arguments);
		} else {
			this._onDeactivate();
		}
		return this;
	}
}).extend(jindo.Component);
jindo.RolloverArea = jindo.$Class({
	$init: function (el, htOption) {
		this.option({
			sClassName: "rollover",
			sClassPrefix: "rollover-",
			bCheckMouseDown: true,
			bActivateOnload: true,
			htStatus: {sOver: "over", sDown: "down"}
		});
		this.option(htOption || {});
		this._elArea = jindo.$(el);
		this._aOveredElements = [];
		this._aDownedElements = [];
		this._wfMouseOver = jindo.$Fn(this._onMouseOver, this);
		this._wfMouseOut = jindo.$Fn(this._onMouseOut, this);
		this._wfMouseDown = jindo.$Fn(this._onMouseDown, this);
		this._wfMouseUp = jindo.$Fn(this._onMouseUp, this);
		if (this.option("bActivateOnload")) {
			this.activate();
		}
	}, _addOvered: function (el) {
		this._aOveredElements.push(el);
	}, _removeOvered: function (el) {
		this._aOveredElements.splice(jindo.$A(this._aOveredElements).indexOf(el), 1);
	}, _addStatus: function (el, sStatus) {
		jindo.$Element(el).addClass(this.option("sClassPrefix") + sStatus);
	}, _removeStatus: function (el, sStatus) {
		jindo.$Element(el).removeClass(this.option("sClassPrefix") + sStatus);
	}, _isInnerElement: function (elParent, elChild) {
		return elParent === elChild ? true : jindo.$Element(elParent).isParentOf(elChild);
	}, _onActivate: function () {
		this._wfMouseOver.attach(this._elArea, "mouseover");
		this._wfMouseOut.attach(this._elArea, "mouseout");
		if (this.option("bCheckMouseDown")) {
			this._wfMouseDown.attach(this._elArea, "mousedown");
			this._wfMouseUp.attach(document, "mouseup");
		}
	}, _onDeactivate: function () {
		this._wfMouseOver.detach(this._elArea, "mouseover");
		this._wfMouseOut.detach(this._elArea, "mouseout");
		this._wfMouseDown.detach(this._elArea, "mousedown");
		this._wfMouseUp.detach(document, "mouseup");
		this._aOveredElements.length = 0;
		this._aDownedElements.length = 0;
	}, _findRollover: function (el) {
		var sClassName = this.option("sClassName");
		return jindo.$$.test(el, "." + sClassName) ? el : jindo.$$.getSingle("! ." + sClassName, el);
	}, _onMouseOver: function (we) {
		var el = we.element, elRelated = we.relatedElement, htParam;
		for (; el = this._findRollover(el); el = el.parentNode) {
			if (elRelated && this._isInnerElement(el, elRelated)) {
				continue;
			}
			this._addOvered(el);
			htParam = {element: el, htStatus: this.option("htStatus"), weEvent: we};
			if (this.fireEvent("over", htParam)) {
				this._addStatus(htParam.element, htParam.htStatus.sOver);
			}
		}
	}, _onMouseOut: function (we) {
		var el = we.element, elRelated = we.relatedElement, htParam;
		for (; el = this._findRollover(el); el = el.parentNode) {
			if (elRelated && this._isInnerElement(el, elRelated)) {
				continue;
			}
			this._removeOvered(el);
			htParam = {element: el, htStatus: this.option("htStatus"), weEvent: we};
			if (this.fireEvent("out", htParam)) {
				this._removeStatus(htParam.element, htParam.htStatus.sOver);
			}
		}
	}, _onMouseDown: function (we) {
		var el = we.element, htParam;
		while (el = this._findRollover(el)) {
			htParam = {element: el, htStatus: this.option("htStatus"), weEvent: we};
			this._aDownedElements.push(el);
			if (this.fireEvent("down", htParam)) {
				this._addStatus(htParam.element, htParam.htStatus.sDown);
			}
			el = el.parentNode;
		}
	}, _onMouseUp: function (we) {
		var el = we.element, aTargetElementDatas = [], aDownedElements = this._aDownedElements, htParam, elMouseDown, i;
		for (i = 0; elMouseDown = aDownedElements[i]; i++) {
			aTargetElementDatas.push({element: elMouseDown, htStatus: this.option("htStatus"), weEvent: we});
		}
		for (; el = this._findRollover(el); el = el.parentNode) {
			if (jindo.$A(aDownedElements).indexOf(el) > -1) {
				continue;
			}
			aTargetElementDatas.push({element: el, htStatus: this.option("htStatus"), weEvent: we});
		}
		for (i = 0; htParam = aTargetElementDatas[i]; i++) {
			if (this.fireEvent("up", htParam)) {
				this._removeStatus(htParam.element, htParam.htStatus.sDown);
			}
		}
		this._aDownedElements = [];
	}
}).extend(jindo.UIComponent);
jindo.Calendar = jindo.$Class({
	$init: function (sLayerId, htOption) {
		this._htToday = this.constructor.getDateHashTable(new Date());
		this._elLayer = jindo.$(sLayerId);
		this.htDefaultOption = {
			sClassPrefix: "calendar-",
			nYear: this._htToday.nYear,
			nMonth: this._htToday.nMonth,
			nDate: this._htToday.nDate,
			sTitleFormat: "yyyy-mm",
			sYearTitleFormat: "yyyy",
			sMonthTitleFormat: "m",
			aMonthTitle: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
			bDrawOnload: true
		};
		this.option(this.htDefaultOption);
		this.option(htOption || {});
		this._assignHTMLElements();
		this.activate();
		this.setDate(this.option("nYear"), this.option("nMonth"), this.option("nDate"));
		if (this.option("bDrawOnload")) {
			this.draw();
		}
	}, getBaseElement: function () {
		return this._elLayer;
	}, getDate: function () {
		return this._htDate;
	}, getDateOfElement: function (el) {
		var nDateIndex = jindo.$A(this._aDateContainerElement).indexOf(el);
		if (nDateIndex > -1) {
			return this._aMetaData[nDateIndex];
		}
		return null;
	}, getToday: function () {
		return this._htToday;
	}, setDate: function (nYear, nMonth, nDate) {
		this._htDate = {nYear: nYear, nMonth: (nMonth * 1), nDate: (nDate * 1)};
	}, getShownDate: function () {
		return this._getShownDate();
	}, _getShownDate: function () {
		return this.htShownDate || this.getDate();
	}, _setShownDate: function (nYear, nMonth) {
		this.htShownDate = {nYear: nYear, nMonth: (nMonth * 1), nDate: 1};
	}, _assignHTMLElements: function () {
		var sClassPrefix = this.option("sClassPrefix"), elLayer = this.getBaseElement();
		if ((this.elBtnPrevYear = jindo.$$.getSingle(("." + sClassPrefix + "btn-prev-year"), elLayer))) {
			this.wfPrevYear = jindo.$Fn(function (oEvent) {
				oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
				this.draw(-1, 0, true);
			}, this);
		}
		if ((this.elBtnPrevMonth = jindo.$$.getSingle(("." + sClassPrefix + "btn-prev-mon"), elLayer))) {
			this.wfPrevMonth = jindo.$Fn(function (oEvent) {
				oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
				this.draw(0, -1, true);
			}, this);
		}
		if ((this.elBtnNextMonth = jindo.$$.getSingle(("." + sClassPrefix + "btn-next-mon"), elLayer))) {
			this.wfNextMonth = jindo.$Fn(function (oEvent) {
				oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
				this.draw(0, 1, true);
			}, this);
		}
		if ((this.elBtnNextYear = jindo.$$.getSingle(("." + sClassPrefix + "btn-next-year"), elLayer))) {
			this.wfNextYear = jindo.$Fn(function (oEvent) {
				oEvent.stop(jindo.$Event.CANCEL_DEFAULT);
				this.draw(1, 0, true);
			}, this);
		}
		this.elTitle = jindo.$$.getSingle(("." + sClassPrefix + "title"), elLayer);
		this.elTitleYear = jindo.$$.getSingle(("." + sClassPrefix + "title-year"), elLayer);
		this.elTitleMonth = jindo.$$.getSingle(("." + sClassPrefix + "title-month"), elLayer);
		var elWeekTemplate = jindo.$$.getSingle("." + sClassPrefix + "week", elLayer);
		this.elWeekTemplate = elWeekTemplate.cloneNode(true);
		this.elWeekAppendTarget = elWeekTemplate.parentNode;
	}, _setCalendarTitle: function (nYear, nMonth, sType) {
		if (nMonth < 10) {
			nMonth = ("0" + (nMonth * 1)).toString();
		}
		var elTitle = this.elTitle, sTitleFormat = this.option("sTitleFormat"), sTitle;
		if (typeof sType != "undefined") {
			switch (sType) {
				case"year":
					elTitle = this.elTitleYear;
					sTitleFormat = this.option("sYearTitleFormat");
					sTitle = sTitleFormat.replace(/yyyy/g, nYear).replace(/y/g, (nYear).toString().substr(2, 2));
					break;
				case"month":
					elTitle = this.elTitleMonth;
					sTitleFormat = this.option("sMonthTitleFormat");
					sTitle = sTitleFormat.replace(/mm/g, nMonth).replace(/m/g, (nMonth * 1)).replace(/M/g, this.option("aMonthTitle")[nMonth - 1]);
					break;
			}
		} else {
			sTitle = sTitleFormat.replace(/yyyy/g, nYear).replace(/y/g, (nYear).toString().substr(2, 2)).replace(/mm/g, nMonth).replace(/m/g, (nMonth * 1)).replace(/M/g, this.option("aMonthTitle")[nMonth - 1]);
		}
		jindo.$Element(elTitle).text(sTitle);
	}, draw: function (nYear, nMonth, bRelative) {
		var sClassPrefix = this.option("sClassPrefix"), htDate = this.getDate(), oShownDate = this._getShownDate();
		if (oShownDate && typeof bRelative != "undefined" && bRelative) {
			var htRelativeDate = this.constructor.getRelativeDate(nYear, nMonth, 0, oShownDate);
			nYear = htRelativeDate.nYear;
			nMonth = htRelativeDate.nMonth;
		} else {
			if (typeof nYear == "undefined" && typeof nMonth == "undefined" && typeof bRelative == "undefined") {
				nYear = htDate.nYear;
				nMonth = htDate.nMonth;
			} else {
				nYear = nYear || oShownDate.nYear;
				nMonth = nMonth || oShownDate.nMonth;
			}
		}
		if (this.fireEvent("beforeDraw", {nYear: nYear, nMonth: nMonth})) {
			if (this.elTitle) {
				this._setCalendarTitle(nYear, nMonth);
			}
			if (this.elTitleYear) {
				this._setCalendarTitle(nYear, nMonth, "year");
			}
			if (this.elTitleMonth) {
				this._setCalendarTitle(nYear, nMonth, "month");
			}
			this._clear(jindo.Calendar.getWeeks(nYear, nMonth));
			this._setShownDate(nYear, nMonth);
			var htToday = this.getToday(), nFirstDay = this.constructor.getFirstDay(nYear, nMonth), nLastDay = this.constructor.getLastDay(nYear, nMonth), nLastDate = this.constructor.getLastDate(nYear, nMonth), nDay = 0, htDatePrevMonth = this.constructor.getRelativeDate(0, -1, 0, {
				nYear: nYear,
				nMonth: nMonth,
				nDate: 1
			}), htDateNextMonth = this.constructor.getRelativeDate(0, 1, 0, {
				nYear: nYear,
				nMonth: nMonth,
				nDate: 1
			}), nPrevMonthLastDate = this.constructor.getLastDate(htDatePrevMonth.nYear, htDatePrevMonth.nMonth), aDate = [], bPrevMonth, bNextMonth, welDateContainer, nTempYear, nTempMonth, oParam, nIndexOfLastDate, elWeek, i;
			var nWeeks = this.constructor.getWeeks(nYear, nMonth);
			for (i = 0; i < nWeeks; i++) {
				elWeek = this.elWeekTemplate.cloneNode(true);
				jindo.$Element(elWeek).appendTo(this.elWeekAppendTarget);
				this._aWeekElement.push(elWeek);
			}
			this._aDateElement = jindo.$$("." + sClassPrefix + "date", this.elWeekAppendTarget);
			this._aDateContainerElement = jindo.$$("." + sClassPrefix + "week > *", this.elWeekAppendTarget);
			if (nFirstDay > 0) {
				for (i = nPrevMonthLastDate - nFirstDay; i < nPrevMonthLastDate; i++) {
					aDate.push(i + 1);
				}
			}
			for (i = 1; i < nLastDate + 1; i++) {
				aDate.push(i);
			}
			nIndexOfLastDate = aDate.length - 1;
			for (i = 1; i < 7 - nLastDay; i++) {
				aDate.push(i);
			}
			for (i = 0; i < aDate.length; i++) {
				bPrevMonth = false;
				bNextMonth = false;
				welDateContainer = jindo.$Element(this._aDateContainerElement[i]);
				nTempYear = nYear;
				nTempMonth = nMonth;
				if (i < nFirstDay) {
					bPrevMonth = true;
					welDateContainer.addClass(sClassPrefix + "prev-mon");
					nTempYear = htDatePrevMonth.nYear;
					nTempMonth = htDatePrevMonth.nMonth;
				} else {
					if (i > nIndexOfLastDate) {
						bNextMonth = true;
						welDateContainer.addClass(sClassPrefix + "next-mon");
						nTempYear = htDateNextMonth.nYear;
						nTempMonth = htDateNextMonth.nMonth;
					} else {
						nTempYear = nYear;
						nTempMonth = nMonth;
					}
				}
				if (nDay === 0) {
					welDateContainer.addClass(sClassPrefix + "sun");
				}
				if (nDay == 6) {
					welDateContainer.addClass(sClassPrefix + "sat");
				}
				if (nTempYear == htToday.nYear && (nTempMonth * 1) == htToday.nMonth && aDate[i] == htToday.nDate) {
					welDateContainer.addClass(sClassPrefix + "today");
				}
				oParam = {
					elDate: this._aDateElement[i],
					elDateContainer: welDateContainer.$value(),
					nYear: nTempYear,
					nMonth: nTempMonth,
					nDate: aDate[i],
					bPrevMonth: bPrevMonth,
					bNextMonth: bNextMonth,
					sHTML: aDate[i]
				};
				jindo.$Element(oParam.elDate).html(oParam.sHTML.toString());
				this._aMetaData.push({nYear: nTempYear, nMonth: nTempMonth, nDate: aDate[i]});
				nDay = (nDay + 1) % 7;
				this.fireEvent("draw", oParam);
			}
			this.fireEvent("afterDraw", {nYear: nYear, nMonth: nMonth});
		}
	}, _clear: function (nWeek) {
		this._aMetaData = [];
		this._aWeekElement = [];
		jindo.$Element(this.elWeekAppendTarget).empty();
	}, attachEvent: function () {
		this.activate();
	}, detachEvent: function () {
		this.deactivate();
	}, _onActivate: function () {
		if (this.elBtnPrevYear) {
			this.wfPrevYear.attach(this.elBtnPrevYear, "click");
		}
		if (this.elBtnPrevMonth) {
			this.wfPrevMonth.attach(this.elBtnPrevMonth, "click");
		}
		if (this.elBtnNextMonth) {
			this.wfNextMonth.attach(this.elBtnNextMonth, "click");
		}
		if (this.elBtnNextYear) {
			this.wfNextYear.attach(this.elBtnNextYear, "click");
		}
	}, _onDeactivate: function () {
		if (this.elBtnPrevYear) {
			this.wfPrevYear.detach(this.elBtnPrevYear, "click");
		}
		if (this.elBtnPrevMonth) {
			this.wfPrevMonth.detach(this.elBtnPrevMonth, "click");
		}
		if (this.elBtnNextMonth) {
			this.wfNextMonth.detach(this.elBtnNextMonth, "click");
		}
		if (this.elBtnNextYear) {
			this.wfNextYear.detach(this.elBtnNextYear, "click");
		}
	}
}).extend(jindo.UIComponent);
jindo.Calendar.getDateObject = function (htDate) {
	if (arguments.length == 3) {
		return new Date(arguments[0], arguments[1] - 1, arguments[2]);
	}
	return new Date(htDate.nYear, htDate.nMonth - 1, htDate.nDate);
};
jindo.Calendar.getDateHashTable = function (oDate) {
	if (arguments.length == 3) {
		return {nYear: arguments[0], nMonth: arguments[1], nDate: arguments[2]};
	}
	if (arguments.length <= 1) {
		oDate = oDate || new Date();
	}
	return {nYear: oDate.getFullYear(), nMonth: oDate.getMonth() + 1, nDate: oDate.getDate()};
};
jindo.Calendar.getTime = function (htDate) {
	return this.getDateObject(htDate).getTime();
};
jindo.Calendar.getFirstDay = function (nYear, nMonth) {
	return new Date(nYear, nMonth - 1, 1).getDay();
};
jindo.Calendar.getLastDay = function (nYear, nMonth) {
	return new Date(nYear, nMonth, 0).getDay();
};
jindo.Calendar.getLastDate = function (nYear, nMonth) {
	return new Date(nYear, nMonth, 0).getDate();
};
jindo.Calendar.getWeeks = function (nYear, nMonth) {
	var nFirstDay = this.getFirstDay(nYear, nMonth), nLastDate = this.getLastDate(nYear, nMonth);
	return Math.ceil((nFirstDay + nLastDate) / 7);
};
jindo.Calendar.getRelativeDate = function (nYear, nMonth, nDate, htDate) {
	return this.getDateHashTable(new Date(htDate.nYear + nYear, htDate.nMonth + nMonth - 1, htDate.nDate + nDate));
};
jindo.Calendar.isPast = function (htDate, htComparisonDate) {
	if (this.getTime(htDate) < this.getTime(htComparisonDate)) {
		return true;
	}
	return false;
};
jindo.Calendar.isFuture = function (htDate, htComparisonDate) {
	if (this.getTime(htDate) > this.getTime(htComparisonDate)) {
		return true;
	}
	return false;
};
jindo.Calendar.isSameDate = function (htDate, htComparisonDate) {
	if (this.getTime(htDate) == this.getTime(htComparisonDate)) {
		return true;
	}
	return false;
};
jindo.Calendar.isBetween = function (htDate, htFrom, htTo) {
	if (this.isFuture(htDate, htTo) || this.isPast(htDate, htFrom)) {
		return false;
	} else {
		return true;
	}
};
jindo.LayerManager = jindo.$Class({
	_bIsActivating: false,
	_bIsLayerVisible: false,
	_bIsHiding: false,
	_bIsShowing: false,
	_aLink: null,
	$init: function (el, htOption) {
		this.option({
			sCheckEvent: "click",
			nCheckDelay: 100,
			nShowDelay: 0,
			nHideDelay: 100,
			sMethod: "show",
			nDuration: 200,
			Transition: {
				fFadeIn: jindo.Effect.cubicEaseOut,
				fFadeOut: jindo.Effect.cubicEaseIn,
				fSlideDown: jindo.Effect.cubicEaseOut,
				fSlideUp: jindo.Effect.cubicEaseIn
			}
		});
		this.option(htOption || {});
		this.setLayer(el);
		this._aLink = [];
		this._oShowTimer = new jindo.Timer();
		this._oHideTimer = new jindo.Timer();
		this._oEventTimer = new jindo.Timer();
		this._wfOnEvent = jindo.$Fn(this._onEvent, this);
		this.getVisible();
		this.activate();
	},
	_onActivate: function () {
		this._wfOnEvent.attach(document, this.option("sCheckEvent"));
	},
	_onDeactivate: function () {
		this._wfOnEvent.detach(document, this.option("sCheckEvent"));
	},
	getVisible: function () {
		return this._bIsLayerVisible = (this._wel.visible() && this._wel.opacity() > 0);
	},
	_check: function (el) {
		var wel = jindo.$Element(el);
		for (var i = 0, elLink; elLink = this._aLink[i]; i++) {
			elLink = jindo.$Element(elLink).$value();
			if (elLink && (el == elLink || wel.isChildOf(elLink))) {
				return true;
			}
		}
		return false;
	},
	_find: function (el) {
		for (var i = 0, elLink; (elLink = this._aLink[i]); i++) {
			if (elLink == el) {
				return i;
			}
		}
		return -1;
	},
	getLayer: function () {
		return this._el;
	},
	setLayer: function (el) {
		this._el = jindo.$(el);
		this._wel = jindo.$Element(el);
		var elToMeasure = this._el.cloneNode(true);
		var welToMeasure = jindo.$Element(elToMeasure);
		welToMeasure.css({position: "absolute", left: "-5000px"}).appendTo(this._el.parentNode);
		welToMeasure.show();
		this._nLayerHeight = welToMeasure.height();
		welToMeasure.height(this._nLayerHeight);
		this._sLayerCSSHeight = welToMeasure.css("height");
		this._sLayerCSSOverflowX = this._wel.css("overflowX");
		this._sLayerCSSOverflowY = this._wel.css("overflowY");
		welToMeasure.css("overflow", "hidden").height(0);
		this._nSlideMinHeight = welToMeasure.height() + 1;
		welToMeasure.leave();
		return this;
	},
	_transform: function () {
		this._wel.css({overflowX: "hidden", overflowY: "hidden"});
	},
	_restore: function () {
		this._wel.css({overflowX: this._sLayerCSSOverflowX, overflowY: this._sLayerCSSOverflowY});
	},
	getLinks: function () {
		return this._aLink;
	},
	setLinks: function (a) {
		this._aLink = jindo.$A(a).unique().$value();
		return this;
	},
	link: function (vElement) {
		if (arguments.length > 1) {
			for (var i = 0, len = arguments.length; i < len; i++) {
				this.link(arguments[i]);
			}
			return this;
		}
		if (this._find(vElement) != -1) {
			return this;
		}
		this._aLink.push(vElement);
		return this;
	},
	unlink: function (vElement) {
		if (arguments.length > 1) {
			for (var i = 0, len = arguments.length; i < len; i++) {
				this.unlink(arguments[i]);
			}
			return this;
		}
		var nIndex = this._find(vElement);
		if (nIndex > -1) {
			this._aLink.splice(nIndex, 1);
		}
		return this;
	},
	_fireEventBeforeShow: function () {
		this._transform();
		return this.fireEvent("beforeShow", {elLayer: this.getLayer(), aLinkedElement: this.getLinks(), sMethod: this.option("sMethod")});
	},
	_fireEventAppear: function () {
		this.fireEvent("appear", {elLayer: this.getLayer(), aLinkedElement: this.getLinks(), sMethod: this.option("sMethod")});
	},
	_fireEventShow: function () {
		this._bIsShowing = false;
		this._restore();
		this.fireEvent("show", {elLayer: this.getLayer(), aLinkedElement: this.getLinks(), sMethod: this.option("sMethod")});
	},
	_fireEventBeforeHide: function () {
		this._transform();
		return this.fireEvent("beforeHide", {elLayer: this.getLayer(), aLinkedElement: this.getLinks(), sMethod: this.option("sMethod")});
	},
	_fireEventHide: function () {
		this._bIsHiding = false;
		this._restore();
		this.fireEvent("hide", {elLayer: this.getLayer(), aLinkedElement: this.getLinks(), sMethod: this.option("sMethod")});
	},
	_show: function (fShow, nDelay) {
		this._oEventTimer.abort();
		this._bIsShowing = true;
		this._bIsHiding = false;
		if (nDelay > 0) {
			this._oShowTimer.start(fShow, nDelay);
		} else {
			this._oHideTimer.abort();
			fShow();
		}
	},
	_hide: function (fHide, nDelay) {
		this._bIsShowing = false;
		this._bIsHiding = true;
		if (nDelay > 0) {
			this._oHideTimer.start(fHide, nDelay);
		} else {
			this._oShowTimer.abort();
			fHide();
		}
	},
	_getShowMethod: function () {
		switch (this.option("sMethod")) {
			case"show":
				return "showIn";
			case"fade":
				return "fadeIn";
			case"slide":
				return "slideDown";
		}
	},
	_getHideMethod: function () {
		switch (this.option("sMethod")) {
			case"show":
				return "hideOut";
			case"fade":
				return "fadeOut";
			case"slide":
				return "slideUp";
		}
	},
	show: function (nDelay) {
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nShowDelay");
		}
		this[this._getShowMethod()](nDelay);
		return this;
	},
	hide: function (nDelay) {
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nHideDelay");
		}
		this[this._getHideMethod()](nDelay);
		return this;
	},
	showIn: function (nDelay) {
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nShowDelay");
		}
		var self = this;
		this._show(function () {
			self._sAppliedMethod = "show";
			if (!self.getVisible()) {
				if (self._fireEventBeforeShow()) {
					self._wel.show();
					self._fireEventAppear();
					self._fireEventShow();
				}
			}
		}, nDelay);
		return this;
	},
	hideOut: function (nDelay) {
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nHideDelay");
		}
		var self = this;
		this._hide(function () {
			self._sAppliedMethod = "show";
			if (self.getVisible()) {
				if (self._fireEventBeforeHide()) {
					self._wel.hide();
					self._fireEventHide();
				}
			}
		}, nDelay);
		return this;
	},
	_getTransition: function () {
		if (this._oTransition) {
			return this._oTransition;
		} else {
			return (this._oTransition = new jindo.Transition().fps(30));
		}
	},
	fadeIn: function (nDelay) {
		var oTransition = this._getTransition();
		oTransition.detachAll().abort();
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nShowDelay");
		}
		var nDuration = this.option("nDuration");
		var self = this;
		this._show(function () {
			self._sAppliedMethod = "fade";
			var elLayer = self.getLayer();
			if (!self._wel.visible() || self._wel.opacity() != 1) {
				if (self._fireEventBeforeShow()) {
					if (!self._wel.visible()) {
						self._wel.opacity(0);
						self._wel.show();
					}
					nDuration *= (1 - self._wel.opacity());
					oTransition.attach({
						playing: function (oCustomEvent) {
							if (oCustomEvent.nStep === 1) {
								this.detach("playing", arguments.callee);
								self._fireEventAppear();
							}
						}, end: function (oCustomEvent) {
							this.detach("end", arguments.callee);
							self._fireEventShow();
						}
					}).start(nDuration, elLayer, {"@opacity": self.option("Transition").fFadeIn.apply(null, [1])});
				}
			}
		}, nDelay);
		return this;
	},
	fadeOut: function (nDelay) {
		var oTransition = this._getTransition();
		oTransition.detachAll().abort();
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nHideDelay");
		}
		var nDuration = this.option("nDuration");
		var self = this;
		this._hide(function () {
			self._sAppliedMethod = "fade";
			if (self.getVisible()) {
				var elLayer = self.getLayer();
				if (self._fireEventBeforeHide()) {
					nDuration *= self._wel.opacity();
					oTransition.attach({
						end: function (e) {
							this.detach("end", arguments.callee);
							self._wel.hide();
							self._wel.opacity(1);
							self._fireEventHide();
						}
					}).start(nDuration, elLayer, {"@opacity": self.option("Transition").fFadeOut.apply(null, [0])});
				}
			}
		}, nDelay);
		return this;
	},
	slideDown: function (nDelay) {
		var oTransition = this._getTransition();
		oTransition.detachAll().abort();
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nShowDelay");
		}
		var nDuration = this.option("nDuration");
		var self = this;
		this._show(function () {
			self._sAppliedMethod = "slide";
			var elLayer = self.getLayer();
			if (Math.ceil(self._wel.height()) < self._nLayerHeight) {
				if (self._fireEventBeforeShow()) {
					if (!self.getVisible()) {
						self._wel.height(0).show();
					} else {
						nDuration = Math.ceil(nDuration * ((self._nLayerHeight - self._wel.height()) / (self._nLayerHeight - self._nSlideMinHeight)));
					}
					oTransition.attach({
						playing: function (oCustomEvent) {
							if (oCustomEvent.nStep === 1) {
								this.detach("playing", arguments.callee);
								self._fireEventAppear();
							}
						}, end: function (oCustomEvent) {
							this.detach("end", arguments.callee);
							self._fireEventShow();
						}
					}).start(nDuration, {
						getter: function (sKey) {
							return jindo.$Element(elLayer)[sKey]() + 1;
						}, setter: function (sKey, nValue) {
							jindo.$Element(elLayer)[sKey](parseFloat(nValue));
						}
					}, {height: self.option("Transition").fSlideDown.apply(null, [self._nLayerHeight])});
				}
			}
		}, nDelay);
		return this;
	},
	slideUp: function (nDelay) {
		var oTransition = this._getTransition();
		oTransition.detachAll().abort();
		if (typeof nDelay == "undefined") {
			nDelay = this.option("nHideDelay");
		}
		var nDuration = this.option("nDuration");
		var self = this;
		this._hide(function () {
			self._sAppliedMethod = "slide";
			var elLayer = self.getLayer();
			if (self.getVisible()) {
				if (self._fireEventBeforeHide()) {
					nDuration = Math.ceil(nDuration * (self._wel.height() / self._nLayerHeight));
					oTransition.attach({
						end: function (e) {
							self._wel.hide().css({height: self._sLayerCSSHeight});
							this.detach("end", arguments.callee);
							self._fireEventHide();
						}
					}).start(nDuration, {
						getter: function (sKey) {
							return jindo.$Element(elLayer)[sKey]();
						}, setter: function (sKey, nValue) {
							jindo.$Element(elLayer)[sKey](Math.ceil(nValue));
						}
					}, {height: self.option("Transition").fSlideUp.apply(null, [self._nSlideMinHeight])});
				}
			}
		}, nDelay);
		return this;
	},
	toggle: function (nDelay) {
		if (!this.getVisible() || this._bIsHiding) {
			this.show(nDelay || this.option("nShowDelay"));
		} else {
			this.hide(nDelay || this.option("nHideDelay"));
		}
		return this;
	},
	_onEvent: function (we) {
		var el = we.element, self = this;
		this._oEventTimer.start(function () {
			if (!self._bIsHiding && self.getVisible()) {
				if (self._check(el)) {
					if (!self._bIsShowing) {
						self.fireEvent("ignore", {sCheckEvent: self.option("sCheckEvent")});
						self._oHideTimer.abort();
						self._bIsHiding = false;
					}
				} else {
					if (typeof el.tagName != "undefined") {
						self.hide();
					}
				}
			}
		}, this.option("nCheckDelay"));
	}
}).extend(jindo.UIComponent);
jindo.LayerPosition = jindo.$Class({
	$init: function (el, elLayer, htOption) {
		this.option({sPosition: "outside-bottom", sAlign: "left", sValign: "", nTop: 0, nLeft: 0, bAuto: false});
		this.option(htOption || {});
		this.setElement(el);
		if (elLayer) {
			this.setLayer(elLayer);
		}
		if (el && elLayer) {
			this.setPosition();
		}
		this._wfSetPosition = jindo.$Fn(function () {
			var el = this._elLayer;
			if (el && this._welLayer.visible()) {
				if (this.fireEvent("beforeAdjust", {
						elLayer: el,
						htCurrentPosition: this.getCurrentPosition(),
						htAdjustedPosition: this._adjustPosition(this.getCurrentPosition())
					})) {
					this.setPosition();
					this.fireEvent("adjust", {elLayer: el, htCurrentPosition: this.getCurrentPosition()});
				}
			}
		}, this);
		if (this.option("bAuto")) {
			this._wfSetPosition.attach(window, "scroll").attach(window, "resize");
		}
	}, getElement: function () {
		return this._el;
	}, setElement: function (el) {
		this._el = jindo.$(el);
		this._wel = jindo.$Element(el);
		return this;
	}, getLayer: function () {
		return this._elLayer;
	}, setLayer: function (elLayer) {
		this._elLayer = jindo.$(elLayer);
		this._welLayer = jindo.$Element(elLayer);
		document.body.appendChild(elLayer);
		return this;
	}, _isPosition: function (htOption, sWord) {
		if (htOption.sPosition.indexOf(sWord) > -1) {
			return true;
		}
		return false;
	}, _setLeftRight: function (htOption, htPosition) {
		var el = this.getElement(), elLayer = this.getLayer(), nWidth = el.offsetWidth, nLayerWidth = elLayer.offsetWidth;
		if (el == document.body) {
			nWidth = jindo.$Document().clientSize().width;
		}
		var bLeft = this._isPosition(htOption, "left"), bRight = this._isPosition(htOption, "right"), bInside = this._isPosition(htOption, "inside");
		if (bLeft) {
			if (bInside) {
				htPosition.nLeft += htOption.nLeft;
			} else {
				htPosition.nLeft -= nLayerWidth;
				htPosition.nLeft -= htOption.nLeft;
			}
		} else {
			if (bRight) {
				htPosition.nLeft += nWidth;
				if (bInside) {
					htPosition.nLeft -= nLayerWidth;
					htPosition.nLeft -= htOption.nLeft;
				} else {
					htPosition.nLeft += htOption.nLeft;
				}
			} else {
				if (htOption.sAlign == "left") {
					htPosition.nLeft += htOption.nLeft;
				}
				if (htOption.sAlign == "center") {
					htPosition.nLeft += (nWidth - nLayerWidth) / 2;
				}
				if (htOption.sAlign == "right") {
					htPosition.nLeft += nWidth - nLayerWidth;
					htPosition.nLeft -= htOption.nLeft;
				}
			}
		}
		return htPosition;
	}, _setVerticalAlign: function (htOption, htPosition) {
		var el = this.getElement(), elLayer = this.getLayer(), nHeight = el.offsetHeight, nLayerHeight = elLayer.offsetHeight;
		if (el == document.body) {
			nHeight = jindo.$Document().clientSize().height;
		}
		switch (htOption.sValign) {
			case"top":
				htPosition.nTop += htOption.nTop;
				break;
			case"middle":
				htPosition.nTop += (nHeight - nLayerHeight) / 2;
				break;
			case"bottom":
				htPosition.nTop += nHeight - nLayerHeight - htOption.nTop;
				break;
		}
		return htPosition;
	}, _adjustScrollPosition: function (htPosition) {
		if (this.getElement() == document.body) {
			var htScrollPosition = jindo.$Document().scrollPosition();
			htPosition.nTop += htScrollPosition.top;
			htPosition.nLeft += htScrollPosition.left;
		}
		return htPosition;
	}, getPosition: function (htOption) {
		if (typeof htOption != "object") {
			htOption = this.option();
		}
		if (typeof htOption.nTop == "undefined") {
			htOption.nTop = 0;
		}
		if (typeof htOption.nLeft == "undefined") {
			htOption.nLeft = 0;
		}
		var sArea, bCenter = this._isPosition(htOption, "center"), bInside = this._isPosition(htOption, "inside"), bTop = this._isPosition(htOption, "top"), bBottom = this._isPosition(htOption, "bottom"), bLeft = this._isPosition(htOption, "left"), bRight = this._isPosition(htOption, "right");
		if (bLeft) {
			sArea = "left";
		}
		if (bRight) {
			sArea = "right";
		}
		if (bTop) {
			sArea = "top";
		}
		if (bBottom) {
			sArea = "bottom";
		}
		if (bCenter) {
			sArea = "center";
		}
		var el = this.getElement(), wel = jindo.$Element(el), elLayer = this.getLayer(), welLayer = jindo.$Element(elLayer), htElementPosition = wel.offset(), nWidth = el.offsetWidth, nHeight = el.offsetHeight, oClientSize, nLayerWidth = elLayer.offsetWidth, nLayerHeight = elLayer.offsetHeight, htPosition = {
			nTop: htElementPosition.top,
			nLeft: htElementPosition.left
		};
		if (el == document.body) {
			oClientSize = jindo.$Document().clientSize();
			nWidth = oClientSize.width;
			nHeight = oClientSize.height;
		}
		nLayerWidth += parseInt(welLayer.css("marginLeft")) + parseInt(welLayer.css("marginRight")) || 0;
		nLayerHeight += parseInt(welLayer.css("marginTop")) + parseInt(welLayer.css("marginBottom")) || 0;
		switch (sArea) {
			case"center":
				htPosition.nTop += (nHeight - nLayerHeight) / 2;
				htPosition.nTop += htOption.nTop;
				htPosition.nLeft += (nWidth - nLayerWidth) / 2;
				htPosition.nLeft += htOption.nLeft;
				break;
			case"top":
				if (bInside) {
					htPosition.nTop += htOption.nTop;
				} else {
					htPosition.nTop -= htOption.nTop + nLayerHeight;
				}
				htPosition = this._setLeftRight(htOption, htPosition);
				break;
			case"bottom":
				htPosition.nTop += nHeight;
				if (bInside) {
					htPosition.nTop -= htOption.nTop + nLayerHeight;
				} else {
					htPosition.nTop += htOption.nTop;
				}
				htPosition = this._setLeftRight(htOption, htPosition);
				break;
			case"left":
				if (bInside) {
					htPosition.nLeft += htOption.nLeft;
				} else {
					htPosition.nLeft -= htOption.nLeft + nLayerWidth;
				}
				htPosition = this._setVerticalAlign(htOption, htPosition);
				break;
			case"right":
				htPosition.nLeft += nWidth;
				if (bInside) {
					htPosition.nLeft -= htOption.nLeft + nLayerWidth;
				} else {
					htPosition.nLeft += htOption.nLeft;
				}
				htPosition = this._setVerticalAlign(htOption, htPosition);
				break;
		}
		htPosition = this._adjustScrollPosition(htPosition);
		return htPosition;
	}, setPosition: function (htPosition) {
		var welLayer = jindo.$Element(this.getLayer());
		welLayer.css("left", "-9999px").css("top", "0px");
		if (typeof htPosition == "undefined") {
			htPosition = this.getPosition();
		}
		if (this.option("bAuto")) {
			htPosition = this._adjustPosition(htPosition);
		}
		welLayer.css("left", htPosition.nLeft + "px").css("top", htPosition.nTop + "px");
		return this;
	}, getCurrentPosition: function () {
		var welLayer = jindo.$Element(this.getLayer());
		return {nTop: parseInt(welLayer.css("top")), nLeft: parseInt(welLayer.css("left"))};
	}, _isFullyVisible: function (htPosition) {
		var elLayer = this.getLayer(), welLayer = jindo.$Element(elLayer), oScrollPosition = jindo.$Document().scrollPosition(), nScrollTop = oScrollPosition.top, nScrollLeft = oScrollPosition.left, oClientSize = jindo.$Document().clientSize(), nLayerWidth = elLayer.offsetWidth + (parseInt(welLayer.css("marginLeft")) + parseInt(welLayer.css("marginRight")) || 0), nLayerHeight = elLayer.offsetHeight + (parseInt(welLayer.css("marginTop")) + parseInt(welLayer.css("marginBottom")) || 0);
		if (htPosition.nLeft >= 0 && htPosition.nTop >= 0 && oClientSize.width >= htPosition.nLeft - nScrollLeft + nLayerWidth && oClientSize.height >= htPosition.nTop - nScrollTop + nLayerHeight) {
			return true;
		}
		return false;
	}, _mirrorHorizontal: function (htOption) {
		if (htOption.sAlign == "center" || htOption.sPosition == "inside-center") {
			return htOption;
		}
		var htConvertedOption = {};
		for (var i in htOption) {
			htConvertedOption[i] = htOption[i];
		}
		if (this._isPosition(htConvertedOption, "right")) {
			htConvertedOption.sPosition = htConvertedOption.sPosition.replace(/right/, "left");
		} else {
			if (this._isPosition(htConvertedOption, "left")) {
				htConvertedOption.sPosition = htConvertedOption.sPosition.replace(/left/, "right");
			} else {
				if (htConvertedOption.sAlign == "right") {
					htConvertedOption.sAlign = "left";
				} else {
					if (htConvertedOption.sAlign == "left") {
						htConvertedOption.sAlign = "right";
					}
				}
			}
		}
		return htConvertedOption;
	}, _mirrorVertical: function (htOption) {
		if (htOption.sValign == "middle" || htOption.sPosition == "inside-center") {
			return htOption;
		}
		var htConvertedOption = {};
		for (var i in htOption) {
			htConvertedOption[i] = htOption[i];
		}
		if (this._isPosition(htConvertedOption, "top")) {
			htConvertedOption.sPosition = htConvertedOption.sPosition.replace(/top/, "bottom");
		} else {
			if (this._isPosition(htConvertedOption, "bottom")) {
				htConvertedOption.sPosition = htConvertedOption.sPosition.replace(/bottom/, "top");
			} else {
				if (htConvertedOption.sValign == "top") {
					htConvertedOption.sValign = "bottom";
				} else {
					if (htConvertedOption.sValign == "bottom") {
						htConvertedOption.sValign = "top";
					}
				}
			}
		}
		return htConvertedOption;
	}, _adjustPosition: function (htPosition) {
		var htOption = this.option(), aCandidatePosition = [];
		aCandidatePosition.push(htPosition);
		aCandidatePosition.push(this.getPosition(this._mirrorHorizontal(htOption)));
		aCandidatePosition.push(this.getPosition(this._mirrorVertical(htOption)));
		aCandidatePosition.push(this.getPosition(this._mirrorVertical(this._mirrorHorizontal(htOption))));
		for (var i = 0, htCandidatePosition; htCandidatePosition = aCandidatePosition[i]; i++) {
			if (this._isFullyVisible(htCandidatePosition)) {
				htPosition = htCandidatePosition;
				break;
			}
		}
		return htPosition;
	}
}).extend(jindo.Component);
jindo.Timer = jindo.$Class({
	$init: function () {
		this._nTimer = null;
		this._nLatest = null;
		this._nRemained = 0;
		this._nDelay = null;
		this._fRun = null;
		this._bIsRunning = false;
	}, start: function (fRun, nDelay) {
		this.abort();
		this._nRemained = 0;
		this._nDelay = nDelay;
		this._fRun = fRun;
		this._bIsRunning = true;
		this._nLatest = this._getTime();
		this.fireEvent("wait");
		this._excute(this._nDelay, false);
		return true;
	}, isRunning: function () {
		return this._bIsRunning;
	}, _getTime: function () {
		return new Date().getTime();
	}, _clearTimer: function () {
		var bFlag = false;
		if (this._nTimer) {
			clearInterval(this._nTimer);
			this._bIsRunning = false;
			bFlag = true;
		}
		this._nTimer = null;
		return bFlag;
	}, abort: function () {
		var bReturn = this._clearTimer();
		if (bReturn) {
			this.fireEvent("abort");
			this._fRun = null;
		}
		return bReturn;
	}, pause: function () {
		var nPassed = this._getTime() - this._nLatest;
		this._nRemained = Math.max(this._nDelay - nPassed, 0);
		return this._clearTimer();
	}, _excute: function (nDelay, bResetDelay) {
		var self = this;
		this._clearTimer();
		this._bIsRunning = true;
		this._nTimer = setInterval(function () {
			if (self._nTimer) {
				self.fireEvent("run");
				var r = self._fRun();
				self._nLatest = self._getTime();
				if (!r) {
					clearInterval(self._nTimer);
					self._nTimer = null;
					self._bIsRunning = false;
					self.fireEvent("end");
					return;
				}
				self.fireEvent("wait");
				if (bResetDelay) {
					self._excute(self._nDelay, false);
				}
			}
		}, nDelay);
	}, resume: function () {
		if (!this._fRun || this.isRunning()) {
			return false;
		}
		this._bIsRunning = true;
		this.fireEvent("wait");
		this._excute(this._nRemained, true);
		this._nRemained = 0;
		return true;
	}
}).extend(jindo.Component);
jindo.Transition = jindo.$Class({
	_nFPS: 30, _aTaskQueue: null, _oTimer: null, _bIsWaiting: true, _bIsPlaying: false, $init: function (htOption) {
		this._aTaskQueue = [];
		this._oTimer = new jindo.Timer();
		this.option({fEffect: jindo.Effect.linear, bCorrection: false});
		this.option(htOption || {});
	}, fps: function (nFPS) {
		if (arguments.length > 0) {
			this._nFPS = nFPS;
			return this;
		}
		return this._nFPS;
	}, isPlaying: function () {
		return this._bIsPlaying;
	}, abort: function () {
		this._aTaskQueue = [];
		this._oTimer.abort();
		if (this._bIsPlaying) {
			this.fireEvent("abort");
		}
		this._bIsWaiting = true;
		this._bIsPlaying = false;
		this._htTaskToDo = null;
		return this;
	}, start: function (nDuration, elTarget, htInfo) {
		if (arguments.length > 0) {
			this.queue.apply(this, arguments);
		}
		this._prepareNextTask();
		return this;
	}, queue: function (nDuration, aCommand) {
		var htTask;
		if (typeof arguments[0] == "function") {
			htTask = {sType: "function", fTask: arguments[0]};
		} else {
			var a = [];
			var nLength = arguments.length;
			if (arguments[1] instanceof Array) {
				a = arguments[1];
			} else {
				var aInner = [];
				jindo.$A(arguments).forEach(function (v, i) {
					if (i > 0) {
						aInner.push(v);
						if (i % 2 == 0) {
							a.push(aInner.concat());
							aInner = [];
						}
					}
				});
			}
			htTask = {sType: "task", nDuration: nDuration, aList: []};
			for (var i = 0; i < a.length; i++) {
				var aValue = [];
				var htArg = a[i][1];
				var sEnd;
				for (var sKey in htArg) {
					sEnd = htArg[sKey];
					if (/^(@|style\.)(\w+)/i.test(sKey)) {
						aValue.push(["style", RegExp.$2, sEnd]);
					} else {
						aValue.push(["attr", sKey, sEnd]);
					}
				}
				htTask.aList.push({elTarget: a[i][0], aValue: aValue});
			}
		}
		this._queueTask(htTask);
		return this;
	}, pause: function () {
		if (this._oTimer.abort()) {
			this.fireEvent("pause");
		}
		return this;
	}, resume: function () {
		if (this._htTaskToDo) {
			if (this._bIsWaiting === false && this._bIsPlaying === true) {
				this.fireEvent("resume");
			}
			this._doTask();
			this._bIsWaiting = false;
			this._bIsPlaying = true;
			var self = this;
			this._oTimer.start(function () {
				var bEnd = !self._doTask();
				if (bEnd) {
					self._bIsWaiting = true;
					setTimeout(function () {
						self._prepareNextTask();
					}, 0);
				}
				return !bEnd;
			}, this._htTaskToDo.nInterval);
		}
		return this;
	}, precede: function (nDuration, elTarget, htInfo) {
		this.start.apply(this, arguments);
		return this;
	}, sleep: function (nDuration, fCallback) {
		if (typeof fCallback == "undefined") {
			fCallback = function () {
			};
		}
		this._queueTask({sType: "sleep", nDuration: nDuration, fCallback: fCallback});
		this._prepareNextTask();
		return this;
	}, _queueTask: function (v) {
		this._aTaskQueue.push(v);
	}, _dequeueTask: function () {
		var htTask = this._aTaskQueue.shift();
		if (htTask) {
			if (htTask.sType == "task") {
				var aList = htTask.aList;
				for (var i = 0, nLength = aList.length; i < nLength; i++) {
					var elTarget = aList[i].elTarget;
					for (var j = 0, aValue = aList[i].aValue, nJLen = aValue.length; j < nJLen; j++) {
						var sType = aValue[j][0];
						var fFunc = aValue[j][2];
						if (typeof fFunc != "function") {
							if (fFunc instanceof Array) {
								fFunc = this.option("fEffect")(fFunc[0], fFunc[1]);
							} else {
								fFunc = this.option("fEffect")(fFunc);
							}
						}
						if (fFunc.setStart) {
							if (this._isHTMLElement(elTarget)) {
								var welTarget = jindo.$Element(elTarget);
								switch (sType) {
									case"style":
										fFunc.setStart(welTarget.css(aValue[j][1]));
										break;
									case"attr":
										fFunc.setStart(welTarget.$value()[aValue[j][1]]);
										break;
								}
							} else {
								fFunc.setStart(elTarget.getter(aValue[j][1]));
							}
						}
						aValue[j][2] = fFunc;
					}
				}
			}
			return htTask;
		} else {
			return null;
		}
	}, _prepareNextTask: function () {
		if (this._bIsWaiting) {
			var htTask = this._dequeueTask();
			if (htTask) {
				switch (htTask.sType) {
					case"task":
						if (!this._bIsPlaying) {
							this.fireEvent("start");
						}
						var nInterval = 1000 / this._nFPS;
						var nGap = nInterval / htTask.nDuration;
						this._htTaskToDo = {
							aList: htTask.aList,
							nRatio: 0,
							nInterval: nInterval,
							nGap: nGap,
							nStep: 0,
							nTotalStep: Math.ceil(htTask.nDuration / nInterval)
						};
						this.resume();
						break;
					case"function":
						if (!this._bIsPlaying) {
							this.fireEvent("start");
						}
						htTask.fTask();
						this._prepareNextTask();
						break;
					case"sleep":
						if (this._bIsPlaying) {
							this.fireEvent("sleep", {nDuration: htTask.nDuration});
							htTask.fCallback();
						}
						var self = this;
						setTimeout(function () {
							self.fireEvent("awake");
							self._prepareNextTask();
						}, htTask.nDuration);
						break;
				}
			} else {
				if (this._bIsPlaying) {
					this._bIsPlaying = false;
					this.abort();
					this.fireEvent("end");
				}
			}
		}
	}, _isHTMLElement: function (el) {
		return ("tagName" in el);
	}, _doTask: function () {
		var htTaskToDo = this._htTaskToDo, nRatio = parseFloat(htTaskToDo.nRatio.toFixed(5), 1), nStep = htTaskToDo.nStep, nTotalStep = htTaskToDo.nTotalStep, aList = htTaskToDo.aList, htCorrection = {};
		var bCorrection = this.option("bCorrection");
		for (var i = 0, nLength = aList.length; i < nLength; i++) {
			var elTarget = aList[i].elTarget;
			for (var j = 0, aValue = aList[i].aValue, nJLen = aValue.length; j < nJLen; j++) {
				var sType = aValue[j][0], sKey = aValue[j][1], sValue = aValue[j][2](nRatio);
				if (this._isHTMLElement(elTarget)) {
					var welTarget = jindo.$Element(elTarget);
					if (bCorrection) {
						var sUnit = /^[0-9]*([^0-9]*)$/.test(sValue) && RegExp.$1 || "";
						if (sUnit) {
							var nValue = parseFloat(sValue);
							var nFloor;
							nValue += htCorrection[sKey] || 0;
							nValue = parseFloat(nValue.toFixed(5));
							if (i == nLength - 1) {
								sValue = Math.round(nValue) + sUnit;
							} else {
								nFloor = parseFloat(/(\.[0-9]+)$/.test(nValue) && RegExp.$1 || 0);
								sValue = parseInt(nValue, 10) + sUnit;
								htCorrection[sKey] = nFloor;
							}
						}
					}
					switch (sType) {
						case"style":
							welTarget.css(sKey, sValue);
							break;
						case"attr":
							welTarget.$value()[sKey] = sValue;
							break;
					}
				} else {
					elTarget.setter(sKey, sValue);
				}
				if (this._bIsPlaying) {
					this.fireEvent("playing", {element: elTarget, sKey: sKey, sValue: sValue, nStep: nStep, nTotalStep: nTotalStep});
				}
			}
		}
		htTaskToDo.nRatio = Math.min(htTaskToDo.nRatio + htTaskToDo.nGap, 1);
		htTaskToDo.nStep += 1;
		return nRatio != 1;
	}
}).extend(jindo.Component);
(function () {
	var b = jindo.$Element.prototype.css;
	jindo.$Element.prototype.css = function (k, v) {
		if (k == "opacity") {
			return typeof v != "undefined" ? this.opacity(parseFloat(v)) : this.opacity();
		} else {
			return typeof v != "undefined" ? b.call(this, k, v) : b.call(this, k);
		}
	};
})();
jindo.Effect = function (fEffect) {
	if (this instanceof arguments.callee) {
		throw new Error("You can't create a instance of this");
	}
	var rxNumber = /^(\-?[0-9\.]+)(%|px|pt|em)?$/;
	var rxRGB = /^rgb\(([0-9]+)\s?,\s?([0-9]+)\s?,\s?([0-9]+)\)$/i;
	var rxHex = /^#([0-9A-F]{2})([0-9A-F]{2})([0-9A-F]{2})$/i;
	var rx3to6 = /^#([0-9A-F])([0-9A-F])([0-9A-F])$/i;
	var getUnitAndValue = function (v) {
		var nValue = v, sUnit;
		if (rxNumber.test(v)) {
			nValue = parseFloat(v);
			sUnit = RegExp.$2;
		} else {
			if (rxRGB.test(v)) {
				nValue = [parseInt(RegExp.$1, 10), parseInt(RegExp.$2, 10), parseInt(RegExp.$3, 10)];
				sUnit = "color";
			} else {
				if (rxHex.test(v = v.replace(rx3to6, "#$1$1$2$2$3$3"))) {
					nValue = [parseInt(RegExp.$1, 16), parseInt(RegExp.$2, 16), parseInt(RegExp.$3, 16)];
					sUnit = "color";
				}
			}
		}
		return {nValue: nValue, sUnit: sUnit};
	};
	return function (nStart, nEnd) {
		var sUnit;
		if (arguments.length > 1) {
			nStart = getUnitAndValue(nStart);
			nEnd = getUnitAndValue(nEnd);
			sUnit = nEnd.sUnit;
		} else {
			nEnd = getUnitAndValue(nStart);
			nStart = null;
			sUnit = nEnd.sUnit;
		}
		if (nStart && nEnd && nStart.sUnit != nEnd.sUnit) {
			throw new Error("unit error");
		}
		nStart = nStart && nStart.nValue;
		nEnd = nEnd && nEnd.nValue;
		var fReturn = function (p) {
			var nValue = fEffect(p);
			var getResult = function (s, d) {
				return (d - s) * nValue + s + sUnit;
			};
			if (sUnit == "color") {
				var r = parseInt(getResult(nStart[0], nEnd[0]), 10) << 16;
				r |= parseInt(getResult(nStart[1], nEnd[1]), 10) << 8;
				r |= parseInt(getResult(nStart[2], nEnd[2]), 10);
				r = r.toString(16).toUpperCase();
				for (var i = 0; 6 - r.length; i++) {
					r = "0" + r;
				}
				return "#" + r;
			}
			return getResult(nStart, nEnd);
		};
		if (nStart === null) {
			fReturn.setStart = function (s) {
				s = getUnitAndValue(s);
				if (s.sUnit != sUnit) {
					throw new Error("unit eror");
				}
				nStart = s.nValue;
			};
		}
		return fReturn;
	};
};
jindo.Effect.linear = jindo.Effect(function (s) {
	return s;
});
jindo.Effect.easeIn = jindo.Effect(function (s) {
	return (1 - Math.sqrt(1 - (s * s)));
});
jindo.Effect.easeOut = jindo.Effect(function (s) {
	return Math.sqrt((2 - s) * s);
});
jindo.Effect.bounce = jindo.Effect(function (s) {
	if (s < (1 / 2.75)) {
		return (7.5625 * s * s);
	} else {
		if (s < (2 / 2.75)) {
			return (7.5625 * (s -= (1.5 / 2.75)) * s + 0.75);
		} else {
			if (s < (2.5 / 2.75)) {
				return (7.5625 * (s -= (2.25 / 2.75)) * s + 0.9375);
			} else {
				return (7.5625 * (s -= (2.625 / 2.75)) * s + 0.984375);
			}
		}
	}
});
jindo.Effect._cubicBezier = function (x1, y1, x2, y2) {
	return function (s) {
		var cx = 3 * x1, bx = 3 * (x2 - x1) - cx, ax = 1 - cx - bx, cy = 3 * y1, by = 3 * (y2 - y1) - cy, ay = 1 - cy - by;

		function sampleCurveX (s) {
			return ((ax * s + bx) * s + cx) * s;
		}

		function sampleCurveY (s) {
			return ((ay * s + by) * s + cy) * s;
		}

		function solveCurveX (x, epsilon) {
			var t0 = 0, t1 = 1, t2 = x, x2, d2;
			for (var i = 0; i < 8; i++) {
				x2 = sampleCurveX(t2) - x;
				if (Math.abs(x2) < epsilon) {
					return t2;
				}
				d2 = (3 * ax * t2 + 2 * bx) * t2 + cx;
				if (Math.abs(d2) < 0.000001) {
					break;
				}
				t2 = t2 - x2 / d2;
			}
			if (t2 < t0) {
				return t0;
			}
			if (t2 > t1) {
				return t1;
			}
			while (t0 < t1) {
				x2 = sampleCurveX(t2);
				if (Math.abs(x2 - x) < epsilon) {
					return t2;
				}
				if (x > x2) {
					t0 = t2;
				} else {
					t1 = t2;
				}
				t2 = (t1 - t0) * 0.5 + t0;
			}
			return t2;
		}

		return sampleCurveY(solveCurveX(s, (1 / 1000)));
	};
};
jindo.Effect.cubicBezier = function (x1, y1, x2, y2) {
	return jindo.Effect(jindo.Effect._cubicBezier(x1, y1, x2, y2));
};
jindo.Effect.overphase = jindo.Effect.cubicBezier(0.25, 0.75, 0.8, 1.3);
jindo.Effect.easeInOut = jindo.Effect.cubicBezier(0.75, 0, 0.25, 1);
jindo.Effect.easeOutIn = jindo.Effect.cubicBezier(0.25, 0.75, 0.75, 0.25);
jindo.Effect.cubicEase = jindo.Effect.cubicBezier(0.25, 0.1, 0.25, 1);
jindo.Effect.cubicEaseIn = jindo.Effect.cubicBezier(0.42, 0, 1, 1);
jindo.Effect.cubicEaseOut = jindo.Effect.cubicBezier(0, 0, 0.58, 1);
jindo.Effect.cubicEaseInOut = jindo.Effect.cubicBezier(0.42, 0, 0.58, 1);
jindo.Effect.cubicEaseOutIn = jindo.Effect.cubicBezier(0, 0.42, 1, 0.58);
jindo.Effect.pulse = function (nPulse) {
	return jindo.Effect(function (s) {
		return (-Math.cos((s * (nPulse - 0.5) * 2) * Math.PI) / 2) + 0.5;
	});
};
jindo.FileUploader = jindo.$Class({
	_bIsActivating: false, _aHiddenInput: [], $init: function (elFileSelect, htOption) {
		var htDefaultOption = {
			sUrl: "",
			sCallback: "",
			htData: {},
			sFiletype: "*",
			sMsgNotAllowedExt: "This file format is not allowed to upload",
			bAutoUpload: false,
			bActivateOnload: true
		};
		this.option(htDefaultOption);
		this.option(htOption || {});
		this._el = jindo.$(elFileSelect);
		this._wel = jindo.$Element(this._el);
		this._assignHTMLElements();
		this._aHiddenInput = [];
		this.constructor._oCallback = {};
		this._wfChange = jindo.$Fn(this._onFileSelectChange, this);
		if (this.option("bActivateOnload")) {
			this.activate();
		}
	}, _assignHTMLElements: function () {
		this._elForm = this._el.form;
		var sIframeName = "tmpFrame_" + this._makeUniqueId();
		this._elIframe = jindo.$('<iframe name="' + sIframeName + '" src="' + this.option("sCallback") + '?blank">');
		var welIframe = jindo.$Element(this._elIframe);
		welIframe.css({position: "absolute", width: "1px", height: "1px", left: "-100px", top: "-100px"});
		document.body.appendChild(this._elIframe);
	}, getBaseElement: function () {
		return this.getFileSelect();
	}, getFileSelect: function () {
		return this._el;
	}, getFormElement: function () {
		return this._elForm;
	}, upload: function () {
		var elForm = this.getFormElement();
		var welForm = jindo.$Element(elForm);
		var sIframeName = this._elIframe.name;
		var sFunctionName = sIframeName + "_func";
		var sAction = this.option("sUrl");
		welForm.attr({target: sIframeName, action: sAction});
		this._aHiddenInput.push(this._createElement("input", {type: "hidden", name: "callback", value: this.option("sCallback")}));
		this._aHiddenInput.push(this._createElement("input", {type: "hidden", name: "callback_func", value: sFunctionName}));
		for (var k in this.option("htData")) {
			this._aHiddenInput.push(this._createElement("input", {type: "hidden", name: k, value: this.option("htData")[k]}));
		}
		for (var i = 0; i < this._aHiddenInput.length; i++) {
			elForm.appendChild(this._aHiddenInput[i]);
		}
		this.constructor._oCallback[sFunctionName + "_success"] = jindo.$Fn(function (oParameter) {
			this.fireEvent("success", {htResult: oParameter});
			delete this.constructor._oCallback[oParameter.callback_func + "_success"];
			delete this.constructor._oCallback[oParameter.callback_func + "_error"];
			for (var i = 0; i < this._aHiddenInput.length; i++) {
				jindo.$Element(this._aHiddenInput[i]).leave();
			}
			this._aHiddenInput.length = 0;
		}, this).bind();
		this.constructor._oCallback[sFunctionName + "_error"] = jindo.$Fn(function (oParameter) {
			this.fireEvent("error", {htResult: oParameter});
			delete this.constructor._oCallback[oParameter.callback_func + "_success"];
			delete this.constructor._oCallback[oParameter.callback_func + "_error"];
			for (var i = 0; i < this._aHiddenInput.length; i++) {
				jindo.$Element(this._aHiddenInput[i]).leave();
			}
			this._aHiddenInput.length = 0;
		}, this).bind();
		elForm.submit();
	}, _onActivate: function () {
		this._wfChange.attach(this.getFileSelect(), "change");
	}, _onDeactivate: function () {
		this._wfChange.detach(this.getFileSelect(), "change");
	}, _makeUniqueId: function () {
		return new Date().getMilliseconds() + Math.floor(Math.random() * 100000);
	}, _createElement: function (name, attributes) {
		var el = jindo.$("<" + name + ">");
		var wel = jindo.$Element(el);
		for (var k in attributes) {
			wel.attr(k, attributes[k]);
		}
		return el;
	}, _checkExtension: function (sFile) {
		var aType = this.option("sFiletype").split(";");
		for (var i = 0; i < aType.length; i++) {
			sType = (aType[i] == "*.*") ? "*" : aType[i];
			sType = sType.replace(/^\s+|\s+$/, "");
			sType = sType.replace(/\./g, "\\.");
			sType = sType.replace(/\*/g, "[^\\/]+");
			if ((new RegExp(sType + "$", "gi")).test(sFile)) {
				return true;
			}
		}
		return false;
	}, _onFileSelectChange: function (we) {
		var sValue = we.element.value, bAllowed = this._checkExtension(sValue), htParam = {
			sValue: sValue,
			bAllowed: bAllowed,
			sMsgNotAllowedExt: this.option("sMsgNotAllowedExt")
		};
		if (this.fireEvent("select", htParam)) {
			if (bAllowed) {
				if (this.option("bAutoUpload")) {
					this.upload();
				}
			} else {
				alert(htParam.sMsgNotAllowedExt);
			}
		}
	}
}).extend(jindo.UIComponent);
jindo.MultipleAjaxRequest = jindo.$Class({
	_bIsRequesting: false, $init: function (htOption) {
		var htDefaultOption = {sMode: "parallel"};
		this.option(htDefaultOption);
		this.option(htOption);
	}, isRequesting: function () {
		return this._bIsRequesting;
	}, request: function (aAjax, htMetaData) {
		if (this.isRequesting()) {
			return false;
		}
		if (!(aAjax instanceof Array)) {
			aAjax = [aAjax];
		}
		if (typeof htMetaData == "undefined") {
			htMetaData = {};
		}
		this._htMetaData = htMetaData;
		switch (this.option("sMode")) {
			case"parallel":
				this._parallelRequest(aAjax);
				break;
			case"serial":
				this._serialRequest(aAjax);
				break;
			default:
				return false;
		}
		return true;
	}, _fireEventStart: function () {
		this._bIsRequesting = true;
		if (this.fireEvent("start", {aAjax: this._aAjax, htMetaData: this._htMetaData})) {
			return true;
		} else {
			this.abort();
			return false;
		}
	}, _fireEventBeforeEachRequest: function (nIndex) {
		if (this.fireEvent("beforeEachRequest", {oAjax: this._aAjax[nIndex], nIndex: nIndex})) {
			return true;
		} else {
			this.abort();
			return false;
		}
	}, _fireEventAfterEachResponse: function (nIndex) {
		if (this.fireEvent("afterEachResponse", {oAjax: this._aAjax[nIndex], nIndex: nIndex})) {
			return true;
		} else {
			this.abort();
			return false;
		}
	}, _parallelRequest: function (aAjax) {
		this._aAjaxData = aAjax;
		this._aAjax = [];
		this._aStatus = [];
		this._aStatus.length = aAjax.length;
		this._aResponse = [];
		if (this._fireEventStart()) {
			var self = this;
			jindo.$A(this._aAjaxData).forEach(function (htAjax, i) {
				var fParallelResponseHandler = function (oResponse) {
					oResponse._constructor = self._aAjax[i];
					var nIndex = self._findAjaxObjectIndexOfResponse(oResponse._constructor);
					self._aResponse[nIndex] = oResponse;
					self._aStatus[nIndex] = true;
					if (self._fireEventAfterEachResponse(nIndex)) {
						if (self._hasCompletedGotResponsesOfParallelResponses()) {
							self._complete();
						}
					}
				};
				self._aAjax.push(jindo.$Ajax(htAjax.sUrl, htAjax.htOption));
				htAjax.htOption.onload = fParallelResponseHandler;
				htAjax.htOption.onerror = fParallelResponseHandler;
				htAjax.htOption.ontimeout = fParallelResponseHandler;
				self._aAjax[i].option(htAjax.htOption);
				if (self._fireEventBeforeEachRequest(i)) {
					self._aAjax[i].request(htAjax.htParameter);
				} else {
					jindo.$A.Break();
				}
			});
		}
	}, _findAjaxObjectIndexOfResponse: function (oAjax) {
		return jindo.$A(this._aAjax).indexOf(oAjax);
	}, _hasCompletedGotResponsesOfParallelResponses: function () {
		var bResult = true;
		jindo.$A(this._aStatus).forEach(function (bStatus) {
			if (!bStatus) {
				bResult = false;
				jindo.$A.Break();
			}
		});
		return bResult;
	}, _serialRequest: function (aAjax) {
		this._aAjaxData = aAjax;
		this._aAjax = [];
		this._aStatus = [];
		this._aStatus.length = aAjax.length;
		this._aResponse = [];
		var self = this;
		jindo.$A(this._aAjaxData).forEach(function (htAjax, i) {
			var fSerialRequestHandler = function (e) {
				e._constructor = self._aAjax[i];
				self._aResponse.push(e);
				self._serialRequestNext();
			};
			self._aAjax.push(jindo.$Ajax(htAjax.sUrl, htAjax.htOption));
			htAjax.htOption.onload = fSerialRequestHandler;
			htAjax.htOption.onerror = fSerialRequestHandler;
			htAjax.htOption.ontimeout = fSerialRequestHandler;
			self._aAjax[i].option(htAjax.htOption);
		});
		if (this._fireEventStart()) {
			if (this._fireEventBeforeEachRequest(0)) {
				this._aAjax[0].request(this._aAjaxData[0].htParameter);
				this._aStatus[0] = true;
			}
		}
	}, _serialRequestNext: function () {
		var nIndex = -1;
		for (var i = 0; i < this._aStatus.length; i++) {
			if (!this._aStatus[i]) {
				this._aStatus[i] = true;
				nIndex = i;
				break;
			}
		}
		if (nIndex > 0) {
			if (this._fireEventAfterEachResponse(nIndex - 1)) {
				if (this._fireEventBeforeEachRequest(nIndex)) {
					this._aAjax[nIndex].request(this._aAjaxData[nIndex].htParameter);
				}
			}
		} else {
			if (nIndex == -1) {
				if (this._fireEventAfterEachResponse(this._aStatus.length - 1)) {
					this._complete();
				}
			}
		}
	}, _reset: function () {
		this._aAjaxData.length = 0;
		this._aAjax.length = 0;
		this._aStatus.length = 0;
		this._aResponse.length = 0;
		this._htMetaData = null;
		delete this._aAjaxData;
		delete this._aAjax;
		delete this._aStatus;
		delete this._aResponse;
		delete this._htMetaData;
		this._bIsRequesting = false;
	}, abort: function () {
		jindo.$A(this._aAjax).forEach(function (oAjax) {
			oAjax.abort();
		});
		this._reset();
	}, _complete: function () {
		var aResponse = this._aResponse.concat(), htMetaData = {}, sProp;
		for (sProp in this._htMetaData) {
			htMetaData[sProp] = this._htMetaData[sProp];
		}
		this._reset();
		this.fireEvent("complete", {aResponse: aResponse, htMetaData: htMetaData});
	}
}).extend(jindo.Component);
jindo.RolloverClick = jindo.$Class({
	$init: function (el, htOption) {
		this.option({
			bActivateOnload: true,
			sCheckEvent: "click",
			bCheckDblClick: false,
			RolloverArea: {
				sClassName: "rollover",
				sClassPrefix: "rollover-",
				bCheckMouseDown: false,
				bActivateOnload: false,
				htStatus: {sOver: "over", sDown: "down"}
			}
		});
		this.option(htOption || {});
		var self = this;
		this._oRolloverArea = new jindo.RolloverArea(el, this.option("RolloverArea")).attach({
			over: function (oCustomEvent) {
				if (!self.fireEvent("over", oCustomEvent)) {
					oCustomEvent.stop();
				}
			}, out: function (oCustomEvent) {
				if (!self.fireEvent("out", oCustomEvent)) {
					oCustomEvent.stop();
				}
			}
		});
		this._wfClick = jindo.$Fn(this._onClick, this);
		this._wfDblClick = jindo.$Fn(this._onClick, this);
		if (this.option("bActivateOnload")) {
			this.activate();
		}
	}, _onClick: function (we) {
		var elRollover = we.element, sType = "click";
		if (we.type == "dblclick") {
			sType = we.type;
		}
		while (elRollover = this._oRolloverArea._findRollover(elRollover)) {
			this.fireEvent(sType, {element: elRollover, htStatus: this._oRolloverArea.option("htStatus"), weEvent: we});
			elRollover = elRollover.parentNode;
		}
	}, _onActivate: function () {
		this._wfClick.attach(this._oRolloverArea._elArea, this.option("sCheckEvent"));
		if (this.option("bCheckDblClick")) {
			this._wfDblClick.attach(this._oRolloverArea._elArea, "dblclick");
		}
		this._oRolloverArea.activate();
	}, _onDeactivate: function () {
		this._wfClick.detach(this._oRolloverArea._elArea, this.option("sCheckEvent"));
		this._wfDblClick.detach(this._oRolloverArea._elArea, "dblclick");
		this._oRolloverArea.deactivate();
	}
}).extend(jindo.UIComponent);
jindo.Pagination = jindo.$Class({
	$init: function (sId, htOption) {
		this._elPageList = jindo.$(sId);
		this._welPageList = jindo.$Element(this._elPageList);
		this._waPage = jindo.$A([]);
		this._fClickPage = jindo.$Fn(this._onClickPageList, this);
		this.option({
			bActivateOnload: true,
			nItem: 10,
			nItemPerPage: 10,
			nPagePerPageList: 10,
			nPage: 1,
			sMoveUnit: "pagelist",
			bAlignCenter: false,
			sInsertTextNode: "",
			sClassFirst: "first-child",
			sClassLast: "last-child",
			sPageTemplate: "<a href='#'>{=page}</a>",
			sCurrentPageTemplate: "<strong>{=page}</strong>",
			elFirstPageLinkOn: jindo.$$.getSingle("a.pre_end", this._elPageList),
			elPrevPageLinkOn: jindo.$$.getSingle("a.pre", this._elPageList),
			elNextPageLinkOn: jindo.$$.getSingle("a.next", this._elPageList),
			elLastPageLinkOn: jindo.$$.getSingle("a.next_end", this._elPageList),
			elFirstPageLinkOff: jindo.$$.getSingle("span.pre_end", this._elPageList),
			elPrevPageLinkOff: jindo.$$.getSingle("span.pre", this._elPageList),
			elNextPageLinkOff: jindo.$$.getSingle("span.next", this._elPageList),
			elLastPageLinkOff: jindo.$$.getSingle("span.next_end", this._elPageList)
		});
		this.option(htOption || {});
		if (this.option("bActivateOnload")) {
			this.activate();
		}
	}, getBaseElement: function () {
		return this._elPageList;
	}, getItemCount: function () {
		return this.option("nItem");
	}, setItemCount: function (n) {
		this.option({nItem: n});
	}, getItemPerPage: function () {
		return this.option("nItemPerPage");
	}, setItemPerPage: function (n) {
		this.option("nItemPerPage", n);
	}, getCurrentPage: function () {
		return this._nCurrentPage;
	}, getFirstItemOfPage: function (n) {
		return this.getItemPerPage() * (n - 1) + 1;
	}, getPageOfItem: function (n) {
		return Math.ceil(n / this.getItemPerPage());
	}, _getLastPage: function () {
		return Math.ceil(this.getItemCount() / this.getItemPerPage());
	}, _getRelativePage: function (sRelative) {
		var nPage = null;
		if (this.option("sMoveUnit") == "page") {
			switch (sRelative) {
				case"pre":
					nPage = this.getCurrentPage() - 1;
					break;
				case"next":
					nPage = this.getCurrentPage() + 1;
					break;
			}
		} else {
			var nThisPageList = this._getPageList(this.getCurrentPage());
			switch (sRelative) {
				case"pre_end":
					nPage = 1;
					break;
				case"pre":
					var nLastPageOfPrePageList = (nThisPageList - 1) * this.option("nPagePerPageList");
					nPage = nLastPageOfPrePageList;
					break;
				case"next":
					var nFirstPageOfNextPageList = (nThisPageList) * this.option("nPagePerPageList") + 1;
					nPage = nFirstPageOfNextPageList;
					break;
				case"next_end":
					nPage = this._getLastPage();
					break;
			}
		}
		return nPage;
	}, _getPageList: function (nThisPage) {
		if (this.option("bAlignCenter")) {
			var nLeft = Math.floor(this.option("nPagePerPageList") / 2);
			var nPageList = nThisPage - nLeft;
			nPageList = Math.max(nPageList, 1);
			nPageList = Math.min(nPageList, this._getLastPage());
			return nPageList;
		}
		return Math.ceil(nThisPage / this.option("nPagePerPageList"));
	}, _isIn: function (el, elParent) {
		if (!elParent) {
			return false;
		}
		return (el === elParent) ? true : jindo.$Element(el).isChildOf(elParent);
	}, _getPageElement: function (el) {
		for (var i = 0, nLength = this._waPage.$value().length; i < nLength; i++) {
			var elPage = this._waPage.get(i);
			if (this._isIn(el, elPage)) {
				return elPage;
			}
		}
		return null;
	}, _onClickPageList: function (we) {
		we.stop(jindo.$Event.CANCEL_DEFAULT);
		var nPage = null, htOption = this.option(), el = we.element;
		if (this._isIn(el, htOption.elFirstPageLinkOn)) {
			nPage = this._getRelativePage("pre_end");
		} else {
			if (this._isIn(el, htOption.elPrevPageLinkOn)) {
				nPage = this._getRelativePage("pre");
			} else {
				if (this._isIn(el, htOption.elNextPageLinkOn)) {
					nPage = this._getRelativePage("next");
				} else {
					if (this._isIn(el, htOption.elLastPageLinkOn)) {
						nPage = this._getRelativePage("next_end");
					} else {
						var elPage = this._getPageElement(el);
						if (elPage) {
							nPage = parseInt(jindo.$Element(elPage).text(), 10);
						} else {
							return;
						}
					}
				}
			}
		}
		this.movePageTo(nPage);
	}, _convertToAvailPage: function (nPage) {
		var nLastPage = this._getLastPage();
		nPage = Math.max(nPage, 1);
		nPage = Math.min(nPage, nLastPage);
		return nPage;
	}, movePageTo: function (nPage, bFireEvent) {
		if (typeof bFireEvent == "undefined") {
			bFireEvent = true;
		}
		nPage = this._convertToAvailPage(nPage);
		this._nCurrentPage = nPage;
		if (bFireEvent) {
			if (!this.fireEvent("beforeMove", {nPage: nPage})) {
				return;
			}
		}
		this._paginate(nPage);
		if (bFireEvent) {
			this.fireEvent("move", {nPage: nPage});
		}
	}, reset: function (nItemCount) {
		if (typeof nItemCount == "undefined") {
			nItemCount = this.option("nItem");
		}
		this.setItemCount(nItemCount);
		this.movePageTo(1, false);
	}, _onActivate: function () {
		this._fClickPage.attach(this._elPageList, "click");
		this.setItemCount(this.option("nItem"));
		this.movePageTo(this.option("nPage"), false);
		this._welPageList.addClass("loaded");
	}, _onDeactivate: function () {
		this._fClickPage.detach(this._elPageList, "click");
		this._welPageList.removeClass("loaded");
	}, _addTextNode: function () {
		var sTextNode = this.option("sInsertTextNode");
		this._elPageList.appendChild(document.createTextNode(sTextNode));
	}, _paginate: function (nPage) {
		this._empty();
		this._addTextNode();
		var htOption = this.option(), elFirstPageLinkOn = htOption.elFirstPageLinkOn, elPrevPageLinkOn = htOption.elPrevPageLinkOn, elNextPageLinkOn = htOption.elNextPageLinkOn, elLastPageLinkOn = htOption.elLastPageLinkOn, elFirstPageLinkOff = htOption.elFirstPageLinkOff, elPrevPageLinkOff = htOption.elPrevPageLinkOff, elNextPageLinkOff = htOption.elNextPageLinkOff, elLastPageLinkOff = htOption.elLastPageLinkOff, nLastPage = this._getLastPage(), nThisPageList = this._getPageList(nPage), nLastPageList = this._getPageList(nLastPage);
		if (nLastPage === 0) {
			this._welPageList.addClass("no-result");
		} else {
			if (nLastPage == 1) {
				this._welPageList.addClass("only-one");
			} else {
				this._welPageList.removeClass("only-one").removeClass("no-result");
			}
		}
		var nFirstPageOfThisPageList, nLastPageOfThisPageList;
		if (htOption.bAlignCenter) {
			var nLeft = Math.floor(htOption.nPagePerPageList / 2);
			nFirstPageOfThisPageList = nPage - nLeft;
			nFirstPageOfThisPageList = Math.max(nFirstPageOfThisPageList, 1);
			nLastPageOfThisPageList = nFirstPageOfThisPageList + htOption.nPagePerPageList - 1;
			if (nLastPageOfThisPageList > nLastPage) {
				nFirstPageOfThisPageList = nLastPage - htOption.nPagePerPageList + 1;
				nFirstPageOfThisPageList = Math.max(nFirstPageOfThisPageList, 1);
				nLastPageOfThisPageList = nLastPage;
			}
		} else {
			nFirstPageOfThisPageList = (nThisPageList - 1) * htOption.nPagePerPageList + 1;
			nLastPageOfThisPageList = (nThisPageList) * htOption.nPagePerPageList;
			nLastPageOfThisPageList = Math.min(nLastPageOfThisPageList, nLastPage);
		}
		if (htOption.sMoveUnit == "page") {
			nThisPageList = nPage;
			nLastPageList = nLastPage;
		}
		if (nPage > 1) {
			if (elFirstPageLinkOn) {
				this._welPageList.append(elFirstPageLinkOn);
				this._addTextNode();
			}
		} else {
			if (elFirstPageLinkOff) {
				this._welPageList.append(elFirstPageLinkOff);
				this._addTextNode();
			}
		}
		if (nThisPageList > 1) {
			if (elPrevPageLinkOn) {
				this._welPageList.append(elPrevPageLinkOn);
				this._addTextNode();
			}
		} else {
			if (elPrevPageLinkOff) {
				this._welPageList.append(elPrevPageLinkOff);
				this._addTextNode();
			}
		}
		var el, wel;
		for (var i = nFirstPageOfThisPageList; i <= nLastPageOfThisPageList; i++) {
			if (i == nPage) {
				el = jindo.$(jindo.$Template(htOption.sCurrentPageTemplate).process({page: i.toString()}));
			} else {
				el = jindo.$(jindo.$Template(htOption.sPageTemplate).process({page: i.toString()}));
				this._waPage.push(el);
			}
			wel = jindo.$Element(el);
			if (i == nFirstPageOfThisPageList) {
				wel.addClass(this.option("sClassFirst"));
			}
			if (i == nLastPageOfThisPageList) {
				wel.addClass(this.option("sClassLast"));
			}
			this._welPageList.append(el);
			this._addTextNode();
		}
		if (nThisPageList < nLastPageList) {
			if (elNextPageLinkOn) {
				this._welPageList.append(elNextPageLinkOn);
				this._addTextNode();
			}
		} else {
			if (elNextPageLinkOff) {
				this._welPageList.append(elNextPageLinkOff);
				this._addTextNode();
			}
		}
		if (nPage < nLastPage) {
			if (elLastPageLinkOn) {
				this._welPageList.append(elLastPageLinkOn);
				this._addTextNode();
			}
		} else {
			if (elLastPageLinkOff) {
				this._welPageList.append(elLastPageLinkOff);
				this._addTextNode();
			}
		}
	}, _empty: function () {
		var htOption = this.option(), elFirstPageLinkOn = htOption.elFirstPageLinkOn, elPrevPageLinkOn = htOption.elPrevPageLinkOn, elNextPageLinkOn = htOption.elNextPageLinkOn, elLastPageLinkOn = htOption.elLastPageLinkOn, elFirstPageLinkOff = htOption.elFirstPageLinkOff, elPrevPageLinkOff = htOption.elPrevPageLinkOff, elNextPageLinkOff = htOption.elNextPageLinkOff, elLastPageLinkOff = htOption.elLastPageLinkOff;
		elFirstPageLinkOn = this._clone(elFirstPageLinkOn);
		elPrevPageLinkOn = this._clone(elPrevPageLinkOn);
		elLastPageLinkOn = this._clone(elLastPageLinkOn);
		elNextPageLinkOn = this._clone(elNextPageLinkOn);
		elFirstPageLinkOff = this._clone(elFirstPageLinkOff);
		elPrevPageLinkOff = this._clone(elPrevPageLinkOff);
		elLastPageLinkOff = this._clone(elLastPageLinkOff);
		elNextPageLinkOff = this._clone(elNextPageLinkOff);
		this._waPage.empty();
		this._welPageList.empty();
	}, _clone: function (el) {
		if (el && typeof el.cloneNode == "function") {
			return el.cloneNode(true);
		}
		return el;
	}
}).extend(jindo.UIComponent);
jindo.DatePicker = jindo.$Class({
	_aDatePickerSet: [], _htSelectedDatePickerSet: null, $init: function (elCalendarLayer, htOption) {
		var oDate = new Date();
		this.htDefaultOption = {
			bUseLayerPosition: true,
			Calendar: {
				sClassPrefix: "calendar-",
				nYear: oDate.getFullYear(),
				nMonth: oDate.getMonth() + 1,
				nDate: oDate.getDate(),
				sTitleFormat: "yyyy-mm",
				aMonthTitle: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
			},
			LayerManager: {sCheckEvent: "click", nShowDelay: 0, nHideDelay: 0},
			LayerPosition: {sPosition: "outside-bottom", sAlign: "left", nTop: 0, nLeft: 0, bAuto: false}
		};
		this.option(this.htDefaultOption);
		this.option(htOption);
		this._elCalendarLayer = jindo.$(elCalendarLayer);
		this._initCalendar();
		this._initLayerManager();
		this._initLayerPosition();
		this._wfFocusInput = jindo.$Fn(this._onFocusInput, this);
		this._wfClickLinkedElement = jindo.$Fn(this._onClickLinkedElement, this);
		this._wfMouseOverOutDate = jindo.$Fn(this._onMouseOverOutDate, this);
		this._wfClickDate = jindo.$Fn(this._onClickDate, this);
		this.activate();
	}, addDatePickerSet: function (ht) {
		var htOption = this.option(), htCalendarOption = this.getCalendar().option(), htDefaultOption = {
			nYear: htCalendarOption.nYear,
			nMonth: htCalendarOption.nMonth,
			nDate: htCalendarOption.nDate,
			bDefaultSet: true,
			bReadOnly: true,
			sDateFormat: "yyyy-mm-dd",
			htSelectableDateFrom: {nYear: 1900, nMonth: 1, nDate: 1},
			htSelectableDateTo: {nYear: 2100, nMonth: 12, nDate: 31}
		};
		if (typeof ht.htOption != "undefined") {
			for (var value in ht.htOption) {
				if (typeof htDefaultOption[value] != "undefined") {
					htDefaultOption[value] = ht.htOption[value];
				}
			}
		}
		ht.htOption = htDefaultOption;
		this._aDatePickerSet.push(ht);
		var oLayerManager = this.getLayerManager();
		if (typeof ht.elInput != "undefined") {
			oLayerManager.link(ht.elInput);
			if (ht.htOption.bReadOnly) {
				ht.elInput.readOnly = true;
			}
			this._wfFocusInput.attach(ht.elInput, "focus");
			this._wfClickLinkedElement.attach(ht.elInput, "click");
		}
		if (typeof ht.elButton != "undefined") {
			oLayerManager.link(ht.elButton);
			this._wfClickLinkedElement.attach(ht.elButton, "click");
		}
		if (ht.htOption.bDefaultSet) {
			this._setDate(ht, ht.htOption);
		}
		return this;
	}, removeDatePickerSet: function (ht) {
		var nIndex = -1;
		for (var i = 0, len = this._aDatePickerSet.length; i < len; i++) {
			if (this._aDatePickerSet[i].elInput == ht.elInput || this._aDatePickerSet[i].elButton == ht.elButton) {
				nIndex = i;
				break;
			}
		}
		var htDatePickerSet = this._aDatePickerSet[nIndex];
		var oLayerManager = this.getLayerManager();
		if (typeof htDatePickerSet.elButton != "undefined") {
			oLayerManager.unlink(htDatePickerSet.elButton);
			this._wfClickLinkedElement.detach(htDatePickerSet.elButton, "click");
		}
		if (typeof htDatePickerSet.elInput != "undefined") {
			this._wfFocusInput.detach(htDatePickerSet.elInput, "focus");
			this._wfClickLinkedElement.detach(htDatePickerSet.elInput, "click");
			htDatePickerSet.elInput.readOnly = false;
		}
		if (htDatePickerSet == this._htSelectedDatePickerSet) {
			this._htSelectedDatePickerSet = null;
		}
		this._aDatePickerSet.splice(i, 1);
		return this;
	}, getDatePickerSet: function (el) {
		if (typeof el == "undefined") {
			return this._aDatePickerSet;
		}
		for (var i = 0, len = this._aDatePickerSet.length; i < len; i++) {
			if (this._aDatePickerSet[i].elInput == el || this._aDatePickerSet[i].elButton == el) {
				return this._aDatePickerSet[i];
			}
		}
		return false;
	}, getCalendarLayer: function () {
		return this._elCalendarLayer;
	}, _initCalendar: function () {
		var self = this;
		this._oCalendar = new jindo.Calendar(this.getCalendarLayer(), this.option("Calendar")).attach({
			beforeDraw: function (oCustomEvent) {
				if (!self.fireEvent("beforeDraw", oCustomEvent)) {
					oCustomEvent.stop();
				}
			}, draw: function (oCustomEvent) {
				var sClassPrefix = this.option("sClassPrefix");
				var oShowDatePickerSet = self._htSelectedDatePickerSet;
				if (self.isSelectable(oShowDatePickerSet, oCustomEvent)) {
					oCustomEvent.bSelectable = true;
					if (jindo.Calendar.isSameDate(oCustomEvent, oShowDatePickerSet)) {
						jindo.$Element(oCustomEvent.elDateContainer).addClass(sClassPrefix + "selected");
					}
				} else {
					oCustomEvent.bSelectable = false;
					jindo.$Element(oCustomEvent.elDateContainer).addClass(this.option("sClassPrefix") + "unselectable");
				}
				if (!self.fireEvent("draw", oCustomEvent)) {
					oCustomEvent.stop();
				}
			}, afterDraw: function (oCustomEvent) {
				self.fireEvent("afterDraw", oCustomEvent);
			}
		});
	}, getCalendar: function () {
		return this._oCalendar;
	}, _initLayerManager: function () {
		var self = this;
		var elCalendarLayer = this.getCalendarLayer();
		this._oLayerManager = new jindo.LayerManager(elCalendarLayer, this.option("LayerManager")).attach({
			hide: function (oCustomEvent) {
				self._htSelectedDatePickerSet = null;
			}
		}).link(elCalendarLayer);
	}, getLayerManager: function () {
		return this._oLayerManager;
	}, _initLayerPosition: function () {
		if (this.option("bUseLayerPosition")) {
			this._oLayerPosition = new jindo.LayerPosition(null, this.getCalendarLayer(), this.option("LayerPosition"));
		}
	}, getLayerPosition: function () {
		return this._oLayerPosition;
	}, getInput: function (htDatePickerSet) {
		return htDatePickerSet.elInput || null;
	}, setInput: function (htDatePickerSet, htDate) {
		this._setDate(htDatePickerSet, htDate);
	}, getDate: function (htDatePickerSet) {
		return {nYear: htDatePickerSet.nYear, nMonth: htDatePickerSet.nMonth, nDate: htDatePickerSet.nDate};
	}, _setDate: function (htDatePickerSet, htDate) {
		htDatePickerSet.nYear = htDate.nYear * 1;
		htDatePickerSet.nMonth = htDate.nMonth * 1;
		htDatePickerSet.nDate = htDate.nDate * 1;
		if (typeof htDatePickerSet.elInput != "undefined") {
			htDatePickerSet.elInput.value = this._getDateFormat(htDatePickerSet, htDate);
		}
	}, isSelectable: function (htDatePickerSet, htDate) {
		return jindo.Calendar.isBetween(htDate, htDatePickerSet.htOption.htSelectableDateFrom, htDatePickerSet.htOption.htSelectableDateTo);
	}, setDate: function (htDatePickerSet, htDate) {
		if (this.isSelectable(htDatePickerSet, htDate)) {
			var sDateFormat = this._getDateFormat(htDatePickerSet, htDate);
			var htParam = {sText: sDateFormat, nYear: htDate.nYear, nMonth: htDate.nMonth, nDate: htDate.nDate};
			if (this.fireEvent("beforeSelect", htParam)) {
				this._setDate(htDatePickerSet, htDate);
				if (this.fireEvent("select", htParam)) {
					this.getLayerManager().hide();
				}
			}
			return true;
		}
		return false;
	}, _getDateFormat: function (htDatePickerSet, htDate) {
		var nYear = htDate.nYear;
		var nMonth = htDate.nMonth;
		var nDate = htDate.nDate;
		if (nMonth < 10) {
			nMonth = ("0" + (nMonth * 1)).toString();
		}
		if (nDate < 10) {
			nDate = ("0" + (nDate * 1)).toString();
		}
		var sDateFormat = htDatePickerSet.htOption.sDateFormat;
		sDateFormat = sDateFormat.replace(/yyyy/g, nYear).replace(/y/g, (nYear).toString().substr(2, 2)).replace(/mm/g, nMonth).replace(/m/g, (nMonth * 1)).replace(/M/g, this.getCalendar().option("aMonthTitle")[nMonth - 1]).replace(/dd/g, nDate).replace(/d/g, (nDate * 1));
		return sDateFormat;
	}, _linkOnly: function (htDatePickerSet) {
		var oLayerManager = this.getLayerManager();
		oLayerManager.setLinks([this.getCalendarLayer()]);
		if (typeof htDatePickerSet.elInput != "undefined") {
			oLayerManager.link(htDatePickerSet.elInput);
		}
		if (typeof htDatePickerSet.elButton != "undefined") {
			oLayerManager.link(htDatePickerSet.elButton);
		}
	}, _onActivate: function () {
		var elCalendarLayer = this.getCalendarLayer();
		this._wfMouseOverOutDate.attach(elCalendarLayer, "mouseover").attach(elCalendarLayer, "mouseout");
		this._wfClickDate.attach(elCalendarLayer, "click");
		this.getLayerManager().activate();
		this.getCalendar().activate();
	}, _onDeactivate: function () {
		var elCalendarLayer = this.getCalendarLayer();
		this._wfMouseOverOutDate.detach(elCalendarLayer, "mouseover").detach(elCalendarLayer, "mouseout");
		this._wfClickDate.detach(elCalendarLayer, "click").detach(elCalendarLayer, "mouseover").detach(elCalendarLayer, "mouseout");
		this.getLayerManager().deactivate();
		this.getCalendar().deactivate();
	}, attachEvent: function () {
		return this.activate();
	}, detachEvent: function () {
		return this.deactivate();
	}, addButton: function () {
		return this;
	}, _onFocusInput: function (we) {
		this.fireEvent("focus");
	}, _onClickLinkedElement: function (we) {
		we.stop(jindo.$Event.CANCEL_DEFAULT);
		if (this.fireEvent("click", {element: we.element})) {
			var htDatePickerSet = this.getDatePickerSet(we.currentElement);
			if (htDatePickerSet) {
				this._htSelectedDatePickerSet = htDatePickerSet;
				this._linkOnly(htDatePickerSet);
				if (!htDatePickerSet.nYear) {
					htDatePickerSet.nYear = htDatePickerSet.htOption.nYear;
				}
				if (!htDatePickerSet.nMonth) {
					htDatePickerSet.nMonth = htDatePickerSet.htOption.nMonth;
				}
				if (!htDatePickerSet.nDate) {
					htDatePickerSet.nDate = htDatePickerSet.htOption.nDate;
				}
				var nYear = htDatePickerSet.nYear;
				var nMonth = htDatePickerSet.nMonth;
				this.getCalendar().draw(nYear, nMonth);
				this.getLayerManager().show();
				if (this.option("bUseLayerPosition")) {
					if (typeof htDatePickerSet.elLayerPosition != "undefined") {
						this.getLayerPosition().setElement(htDatePickerSet.elLayerPosition).setPosition();
					} else {
						this.getLayerPosition().setElement(htDatePickerSet.elInput).setPosition();
					}
				}
			}
		}
	}, _getTargetDateElement: function (el) {
		var sClassPrefix = this.getCalendar().option("sClassPrefix");
		var elDate = (jindo.$Element(el).hasClass(sClassPrefix + "date")) ? el : jindo.$$.getSingle("." + sClassPrefix + "date", el);
		if (elDate && (elDate == el || elDate.length == 1)) {
			return elDate;
		}
		return null;
	}, _getTargetDateContainerElement: function (el) {
		var sClassPrefix = this.getCalendar().option("sClassPrefix");
		var elWeek = jindo.$$.getSingle("! ." + sClassPrefix + "week", el);
		if (elWeek) {
			var elReturn = el;
			while (!jindo.$Element(elReturn.parentNode).hasClass(sClassPrefix + "week")) {
				elReturn = elReturn.parentNode;
			}
			if (jindo.$Element(elReturn).hasClass(sClassPrefix + "unselectable")) {
				return null;
			}
			return elReturn;
		} else {
			return null;
		}
	}, _onMouseOverOutDate: function (we) {
		we.stop(jindo.$Event.CANCEL_DEFAULT);
		var sClassPrefix = this.getCalendar().option("sClassPrefix");
		var el = we.element;
		var elDateContainer = this._getTargetDateContainerElement(el);
		if (elDateContainer) {
			var htDate = this.getCalendar().getDateOfElement(elDateContainer);
			if (this._htSelectedDatePickerSet && this.isSelectable(this._htSelectedDatePickerSet, htDate)) {
				if (we.type == "mouseover") {
					if (!this._elSelected) {
						this._elSelected = jindo.$$.getSingle("." + sClassPrefix + "selected", this.elWeekAppendTarget);
						if (this._elSelected) {
							jindo.$Element(this._elSelected).removeClass(sClassPrefix + "selected");
						}
					}
					jindo.$Element(elDateContainer).addClass(sClassPrefix + "over");
					return;
				}
				if (we.type == "mouseout") {
					jindo.$Element(elDateContainer).removeClass(sClassPrefix + "over");
					return;
				}
			} else {
				if (this._elSelected) {
					jindo.$Element(this._elSelected).addClass(sClassPrefix + "selected");
					this._elSelected = null;
				}
			}
		} else {
			if (this._elSelected) {
				jindo.$Element(this._elSelected).addClass(sClassPrefix + "selected");
				this._elSelected = null;
			}
		}
	}, _onClickDate: function (we) {
		we.stop(jindo.$Event.CANCEL_DEFAULT);
		var el = we.element;
		var elDate = this._getTargetDateElement(el);
		if (elDate) {
			var elDateContainer = this._getTargetDateContainerElement(elDate);
			if (elDateContainer) {
				var htDate = this.getCalendar().getDateOfElement(elDateContainer);
				if (this.isSelectable(this._htSelectedDatePickerSet, htDate)) {
					this.setDate(this._htSelectedDatePickerSet, htDate);
				}
			}
		}
	}
}).extend(jindo.UIComponent);
jindo.StarRating = jindo.$Class({
	$init: function (el, htOption) {
		var htDefaultOption = {nStep: 1, nMaxValue: 10, nDefaultValue: 0, bSnap: false, bActivateOnload: true};
		this.option(htDefaultOption);
		this.option(htOption || {});
		this._el = jindo.$(el);
		this._wel = jindo.$Element(el);
		this._assignHTMLElements();
		this._wfMouseMove = jindo.$Fn(this._onMouseMove, this);
		this._wfMouseLeave = jindo.$Fn(this._onMouseLeave, this);
		this._wfClick = jindo.$Fn(this._onClick, this);
		if (this.option("bActivateOnload")) {
			this.activate();
		}
	}, _assignHTMLElements: function () {
		this._elRatingElement = jindo.$$.getSingle("span", this.getBaseElement());
		this._welRatingElement = jindo.$Element(this._elRatingElement);
	}, getBaseElement: function () {
		return this._el;
	}, getRatingElement: function () {
		return this._elRatingElement;
	}, getValue: function () {
		return this._nValue;
	}, getValueByWidth: function () {
		return this._welRatingElement.width() / this._nBaseWidth * this.option("nMaxValue");
	}, getValueToBeSet: function (nValue) {
		nValue = this._round(nValue, this.option("nStep"));
		nValue = Math.min(nValue, this.option("nMaxValue"));
		nValue = Math.max(nValue, 0);
		return nValue;
	}, setValue: function (nValue, bFireEvent) {
		if (typeof bFireEvent == "undefined") {
			bFireEvent = true;
		}
		var nMaxValue = this.option("nMaxValue");
		nValue = this.getValueToBeSet(nValue);
		var nWidth = this._nBaseWidth * nValue / nMaxValue;
		nWidth = Math.min(nWidth, this._nBaseWidth);
		this._welRatingElement.width(nWidth);
		this._nValue = nValue;
		if (bFireEvent) {
			this.fireEvent("set", {nValue: this._nValue});
		}
		return this;
	}, reset: function () {
		var nValue = this.option("nDefaultValue") || 0;
		this.setValue(nValue, false);
		return this;
	}, _round: function (nValue, nStep) {
		var nResult = nValue, nFloor = Math.floor(nValue), nMaxCandidate = nFloor + 1, nCompare = 1, nTempCompare, nCandidate, nFixed;
		for (nCandidate = nFloor; nCandidate <= nMaxCandidate; nCandidate += nStep) {
			nTempCompare = Math.abs(nValue - nCandidate);
			if (nTempCompare <= nCompare) {
				nCompare = nTempCompare;
				nResult = nCandidate;
			}
		}
		return nResult.toFixed(Math.max((nStep.toString().length - 2), 0));
	}, _onActivate: function () {
		var el = this.getBaseElement();
		this._wfMouseMove.attach(el, "mousemove");
		this._wfMouseLeave.attach(el, "mouseleave");
		this._wfClick.attach(el, "click");
		this._nBaseWidth = this._wel.width();
		this.reset();
	}, _onDeactivate: function () {
		var el = this.getBaseElement();
		this._wfMouseMove.detach(el, "mousemove");
		this._wfMouseLeave.detach(el, "mouseleave");
		this._wfClick.detach(el, "click");
	}, _onMouseMove: function (we) {
		var nOffsetX = we.pos(true).offsetX + 1, nWidth = (nOffsetX > this._nBaseWidth) ? this._nBaseWidth : nOffsetX, nValue;
		if (this.option("bSnap")) {
			nValue = nOffsetX / this._nBaseWidth * this.option("nMaxValue");
			nWidth = this._round(nValue, this.option("nStep")) * this._nBaseWidth / this.option("nMaxValue");
			nWidth = Math.min(nWidth, this._nBaseWidth);
		}
		this._welRatingElement.css("width", nWidth + "px");
		nValue = this.getValueByWidth();
		this.fireEvent("move", {nValue: nValue, nValueToBeSet: this.getValueToBeSet(nValue)});
	}, _onMouseLeave: function (we) {
		this.setValue(this._nValue, false);
		this.fireEvent("out");
	}, _onClick: function (we) {
		this.setValue(this.getValueByWidth());
	}
}).extend(jindo.UIComponent);
jindo.DragArea = jindo.$Class({
	$init: function (el, htOption) {
		this.option({sClassName: "draggable", bFlowOut: true, bSetCapture: true, nThreshold: 0});
		this.option(htOption || {});
		this._el = el;
		this._bIE = jindo.$Agent().navigator().ie;
		this._htDragInfo = {bIsDragging: false, bPrepared: false, bHandleDown: false, bForceDrag: false};
		this._wfOnMouseDown = jindo.$Fn(this._onMouseDown, this);
		this._wfOnMouseMove = jindo.$Fn(this._onMouseMove, this);
		this._wfOnMouseUp = jindo.$Fn(this._onMouseUp, this);
		this._wfOnDragStart = jindo.$Fn(this._onDragStart, this);
		this._wfOnSelectStart = jindo.$Fn(this._onSelectStart, this);
		this.activate();
	}, _findDraggableElement: function (el) {
		if (el.nodeType === 1 && jindo.$$.test(el, "input[type=text], textarea, select")) {
			return null;
		}
		var self = this;
		var sClass = "." + this.option("sClassName");
		var isChildOfDragArea = function (el) {
			if (el === null) {
				return false;
			}
			if (self._el === document || self._el === el) {
				return true;
			}
			return jindo.$Element(self._el).isParentOf(el);
		};
		var elReturn = jindo.$$.test(el, sClass) ? el : jindo.$$.getSingle("! " + sClass, el);
		if (!isChildOfDragArea(elReturn)) {
			elReturn = null;
		}
		return elReturn;
	}, isDragging: function () {
		var htDragInfo = this._htDragInfo;
		return htDragInfo.bIsDragging && !htDragInfo.bPrepared;
	}, stopDragging: function () {
		this._stopDragging(true);
		return this;
	}, _stopDragging: function (bInterupted) {
		this._wfOnMouseMove.detach(document, "mousemove");
		this._wfOnMouseUp.detach(document, "mouseup");
		if (this.isDragging()) {
			var htDragInfo = this._htDragInfo, welDrag = jindo.$Element(htDragInfo.elDrag);
			htDragInfo.bIsDragging = false;
			htDragInfo.bForceDrag = false;
			htDragInfo.bPrepared = false;
			if (this._bIE && this._elSetCapture) {
				this._elSetCapture.releaseCapture();
				this._elSetCapture = null;
			}
			this.fireEvent("dragEnd", {
				elArea: this._el,
				elHandle: htDragInfo.elHandle,
				elDrag: htDragInfo.elDrag,
				nX: parseInt(welDrag.css("left"), 10) || 0,
				nY: parseInt(welDrag.css("top"), 10) || 0,
				bInterupted: bInterupted
			});
		}
	}, _onActivate: function () {
		this._wfOnMouseDown.attach(this._el, "mousedown");
		this._wfOnDragStart.attach(this._el, "dragstart");
		this._wfOnSelectStart.attach(this._el, "selectstart");
	}, _onDeactivate: function () {
		this._wfOnMouseDown.detach(this._el, "mousedown");
		this._wfOnDragStart.detach(this._el, "dragstart");
		this._wfOnSelectStart.detach(this._el, "selectstart");
	}, attachEvent: function () {
		this.activate();
	}, detachEvent: function () {
		this.deactivate();
	}, isEventAttached: function () {
		return this.isActivating();
	}, startDragging: function (el) {
		var elDrag = this._findDraggableElement(el);
		if (elDrag) {
			this._htDragInfo.bForceDrag = true;
			this._htDragInfo.bPrepared = true;
			this._htDragInfo.elHandle = elDrag;
			this._htDragInfo.elDrag = elDrag;
			this._wfOnMouseMove.attach(document, "mousemove");
			this._wfOnMouseUp.attach(document, "mouseup");
			return true;
		}
		return false;
	}, _onMouseDown: function (we) {
		var mouse = we.mouse(true);
		if (!mouse.left || mouse.right || mouse.scrollbar) {
			this._stopDragging(true);
			return;
		}
		var el = this._findDraggableElement(we.element);
		if (el) {
			var oPos = we.pos(), htDragInfo = this._htDragInfo;
			htDragInfo.bHandleDown = true;
			htDragInfo.bPrepared = true;
			htDragInfo.nButton = we._event.button;
			htDragInfo.elHandle = el;
			htDragInfo.elDrag = el;
			htDragInfo.nPageX = oPos.pageX;
			htDragInfo.nPageY = oPos.pageY;
			if (this.fireEvent("handleDown", {elHandle: el, elDrag: el, weEvent: we})) {
				this._wfOnMouseMove.attach(document, "mousemove");
			}
			this._wfOnMouseUp.attach(document, "mouseup");
			we.stop(jindo.$Event.CANCEL_DEFAULT);
		}
	}, _onMouseMove: function (we) {
		var htDragInfo = this._htDragInfo, htParam, htRect, oPos = we.pos(), htGap = {
			nX: oPos.pageX - htDragInfo.nPageX,
			nY: oPos.pageY - htDragInfo.nPageY
		};
		if (htDragInfo.bPrepared) {
			var nThreshold = this.option("nThreshold"), htDiff = {};
			if (!htDragInfo.bForceDrag && nThreshold) {
				htDiff.nPageX = oPos.pageX - htDragInfo.nPageX;
				htDiff.nPageY = oPos.pageY - htDragInfo.nPageY;
				var nDistance = Math.sqrt(htDiff.nPageX * htDiff.nPageX + htDiff.nPageY * htDiff.nPageY);
				if (nThreshold > nDistance) {
					return;
				}
			}
			if (this._bIE && this.option("bSetCapture")) {
				this._elSetCapture = (this._el === document) ? document.body : this._findDraggableElement(we.element);
				if (this._elSetCapture) {
					this._elSetCapture.setCapture(false);
				}
			}
			htParam = {elArea: this._el, elHandle: htDragInfo.elHandle, elDrag: htDragInfo.elDrag, htDiff: htDiff, weEvent: we};
			htDragInfo.bIsDragging = true;
			htDragInfo.bPrepared = false;
			if (this.fireEvent("dragStart", htParam)) {
				var welDrag = jindo.$Element(htParam.elDrag), htOffset = welDrag.offset();
				htDragInfo.elHandle = htParam.elHandle;
				htDragInfo.elDrag = htParam.elDrag;
				htDragInfo.nX = parseInt(welDrag.css("left"), 10) || 0;
				htDragInfo.nY = parseInt(welDrag.css("top"), 10) || 0;
				htDragInfo.nClientX = htOffset.left + welDrag.width() / 2;
				htDragInfo.nClientY = htOffset.top + welDrag.height() / 2;
			} else {
				htDragInfo.bPrepared = true;
				return;
			}
		}
		if (htDragInfo.bForceDrag) {
			htGap.nX = oPos.clientX - htDragInfo.nClientX;
			htGap.nY = oPos.clientY - htDragInfo.nClientY;
		}
		htParam = {
			elArea: this._el,
			elFlowOut: htDragInfo.elDrag.parentNode,
			elHandle: htDragInfo.elHandle,
			elDrag: htDragInfo.elDrag,
			weEvent: we,
			nX: htDragInfo.nX + htGap.nX,
			nY: htDragInfo.nY + htGap.nY,
			nGapX: htGap.nX,
			nGapY: htGap.nY
		};
		if (this.fireEvent("beforeDrag", htParam)) {
			var elDrag = htDragInfo.elDrag;
			if (this.option("bFlowOut") === false) {
				var elParent = htParam.elFlowOut, aSize = [elDrag.offsetWidth, elDrag.offsetHeight], nScrollLeft = 0, nScrollTop = 0;
				if (elParent == document.body) {
					elParent = null;
				}
				if (elParent && aSize[0] <= elParent.scrollWidth && aSize[1] <= elParent.scrollHeight) {
					htRect = {nWidth: elParent.clientWidth, nHeight: elParent.clientHeight};
					nScrollLeft = elParent.scrollLeft;
					nScrollTop = elParent.scrollTop;
				} else {
					var htClientSize = jindo.$Document().clientSize();
					htRect = {nWidth: htClientSize.width, nHeight: htClientSize.height};
				}
				if (htParam.nX !== null) {
					htParam.nX = Math.max(htParam.nX, nScrollLeft);
					htParam.nX = Math.min(htParam.nX, htRect.nWidth - aSize[0] + nScrollLeft);
				}
				if (htParam.nY !== null) {
					htParam.nY = Math.max(htParam.nY, nScrollTop);
					htParam.nY = Math.min(htParam.nY, htRect.nHeight - aSize[1] + nScrollTop);
				}
			}
			if (htParam.nX !== null) {
				elDrag.style.left = htParam.nX + "px";
			}
			if (htParam.nY !== null) {
				elDrag.style.top = htParam.nY + "px";
			}
			this.fireEvent("drag", htParam);
		} else {
			htDragInfo.bIsDragging = false;
		}
	}, _onMouseUp: function (we) {
		this._stopDragging(false);
		var htDragInfo = this._htDragInfo;
		htDragInfo.bHandleDown = false;
		this.fireEvent("handleUp", {weEvent: we, elHandle: htDragInfo.elHandle, elDrag: htDragInfo.elDrag});
	}, _onDragStart: function (we) {
		if (this._findDraggableElement(we.element)) {
			we.stop(jindo.$Event.CANCEL_DEFAULT);
		}
	}, _onSelectStart: function (we) {
		if (this.isDragging() || this._findDraggableElement(we.element)) {
			we.stop(jindo.$Event.CANCEL_DEFAULT);
		}
	}
}).extend(jindo.UIComponent);
jindo.DefaultTextValue = jindo.$Class({
	$init: function (el, htOption) {
		this.option({sValue: "", bActivateOnload: true});
		this.option(htOption || {});
		this._elBaseTarget = jindo.$(el);
		this._wfOnFocusAndBlur = jindo.$Fn(this._onFocusAndBlur, this);
		if (this.option("bActivateOnload")) {
			this.activate();
		}
	}, getBaseElement: function () {
		return this._elBaseTarget;
	}, setDefault: function () {
		this.getBaseElement().value = this.option("sValue");
		return this;
	}, setDefaultValue: function (sValue) {
		var sOldValue = this.option("sValue");
		this.option("sValue", sValue);
		if (this.getBaseElement().value == sOldValue) {
			this.setDefault();
		}
		return this;
	}, getDefaultValue: function () {
		return this.option("sValue");
	}, paint: function () {
		return this;
	}, _onActivate: function () {
		var elInput = this.getBaseElement();
		if (elInput.value == "") {
			this.setDefault();
		}
		this._wfOnFocusAndBlur.attach(elInput, "focus").attach(elInput, "blur");
	}, _onDeactivate: function () {
		var elInput = this.getBaseElement();
		this._wfOnFocusAndBlur.detach(elInput, "focus").detach(elInput, "blur");
	}, _onFocusAndBlur: function (we) {
		var el = this._elBaseTarget;
		var sValue = el.value;
		switch (we.type) {
			case"focus":
				if (sValue == this.getDefaultValue()) {
					el.value = "";
					el.select();
				}
				break;
			case"blur":
				if (jindo.$S(sValue).trim().$value() == "") {
					this.setDefault();
				}
				break;
		}
	}
}).extend(jindo.UIComponent);
jindo.NumericStepper = jindo.$Class({
	_bIsOnFocus: false, $init: function (el, htOption) {
		this._el = jindo.$(el);
		this.option({
			sClassPrefix: "ns-",
			bActivateOnload: true,
			bUseMouseWheel: false,
			nStep: 1,
			nDecimalPoint: 0,
			nMin: -Infinity,
			nMax: Infinity,
			nDefaultValue: 0,
			bInputReadOnly: true
		});
		this.option(htOption || {});
		this._assignHTMLElements();
		this._initEventHandlers();
		if (this.option("bActivateOnload")) {
			this.activate();
		}
	}, _assignHTMLElements: function () {
		var sPrefix = this.option("sClassPrefix");
		this._elInput = jindo.$$.getSingle("." + sPrefix + "input", this._el);
		this._elPlusButton = jindo.$$.getSingle("." + sPrefix + "plus", this._el);
		this._elMinusButton = jindo.$$.getSingle("." + sPrefix + "minus", this._el);
	}, _initEventHandlers: function () {
		this._wfPlusClick = jindo.$Fn(this._onPlusClick, this);
		this._wfMinusClick = jindo.$Fn(this._onMinusClick, this);
		this._wfWheel = jindo.$Fn(this._onWheel, this);
		this._wfFocus = jindo.$Fn(this._onFocus, this);
		this._wfBlur = jindo.$Fn(this._onBlur, this);
	}, reset: function () {
		this._elInput.value = this.option("nDefaultValue").toFixed(this.option("nDecimalPoint"));
	}, getValue: function () {
		return parseFloat(this._elInput.value);
	}, setValue: function (n) {
		n = n.toFixed(this.option("nDecimalPoint"));
		var nMin = this.option("nMin"), nMax = this.option("nMax"), htParam = {nValue: n, nMin: nMin, nMax: nMax};
		if (n > nMax || n < nMin) {
			this.fireEvent("overLimit", htParam);
			return;
		}
		if (!this.fireEvent("beforeChange", htParam)) {
			return;
		}
		this._elInput.value = htParam.nValue;
		this.fireEvent("change", htParam);
	}, getBaseElement: function () {
		return this._el;
	}, getInputElement: function () {
		return this._elInput;
	}, getPlusElement: function () {
		return this._elPlusButton;
	}, getMinusElement: function () {
		return this._elMinusButton;
	}, isFocused: function () {
		return this._bIsOnFocus;
	}, _onActivate: function () {
		var elInput = this.getInputElement();
		this._wfPlusClick.attach(this.getPlusElement(), "click");
		this._wfMinusClick.attach(this.getMinusElement(), "click");
		this._wfFocus.attach(elInput, "focus");
		this._wfBlur.attach(elInput, "blur");
		if (this.option("bUseMouseWheel")) {
			this._wfWheel.attach(elInput, "mousewheel");
		}
		this._elInput.readOnly = this.option("bInputReadOnly");
		this.reset();
	}, _onDeactivate: function () {
		var elInput = this.getInputElement();
		this._wfPlusClick.detach(this.getPlusElement(), "click");
		this._wfMinusClick.detach(this.getMinusElement(), "click");
		this._wfInputClick.detach(elInput, "click");
		this._wfFocus.detach(elInput, "focus");
		this._wfBlur.detach(elInput, "blur");
		this._wfWheel.detach(elInput, "mousewheel");
	}, _onMinusClick: function (we) {
		this.setValue(this.getValue() - this.option("nStep"));
	}, _onPlusClick: function (we) {
		this.setValue(this.getValue() + this.option("nStep"));
	}, _onWheel: function (we) {
		if (this.isFocused()) {
			we.stop(jindo.$Event.CANCEL_DEFAULT);
			if (we.mouse().delta > 0) {
				this._onPlusClick();
			} else {
				this._onMinusClick();
			}
		}
	}, _onFocus: function (we) {
		this._bIsOnFocus = true;
	}, _onBlur: function (we) {
		this._bIsOnFocus = false;
		this.setValue(this.getValue());
		this._elInput.readOnly = this.option("bInputReadOnly");
	}
}).extend(jindo.UIComponent);
jindo.LazyLoading = {_waLoading: jindo.$A([]), _waLoaded: jindo.$A([]), _whtScript: jindo.$H({}), _whtCallback: jindo.$H({})};
jindo.LazyLoading.load = function (sUrl, fCallback, sCharset) {
	if (typeof fCallback != "function") {
		fCallback = function () {
		};
	}
	this._queueCallback(sUrl, fCallback);
	if (this._checkIsLoading(sUrl)) {
		return false;
	}
	if (this._checkAlreadyLoaded(sUrl)) {
		this._doCallback(sUrl);
		return true;
	}
	this._waLoading.push(sUrl);
	var self = this;
	var elHead = document.getElementsByTagName("head")[0];
	var elScript = document.createElement("script");
	elScript.type = "text/javascript";
	elScript.charset = sCharset || "utf-8";
	elScript.src = sUrl;
	this._whtScript.add(sUrl, elScript);
	if ("onload" in elScript) {
		elScript.onload = function () {
			self._waLoaded.push(sUrl);
			self._waLoading = self._waLoading.refuse(sUrl);
			self._doCallback(sUrl);
		};
	} else {
		elScript.onreadystatechange = function () {
			if (this.readyState == "complete" || this.readyState == "loaded") {
				self._waLoaded.push(sUrl);
				self._waLoading = self._waLoading.refuse(sUrl);
				self._doCallback(sUrl);
				this.onreadystatechange = null;
			}
		};
	}
	elHead.appendChild(elScript);
	return true;
};
jindo.LazyLoading._queueCallback = function (sUrl, fCallback) {
	var aCallback = this._whtCallback.$(sUrl);
	if (aCallback) {
		aCallback.push(fCallback);
	} else {
		this._whtCallback.$(sUrl, [fCallback]);
	}
};
jindo.LazyLoading._doCallback = function (sUrl) {
	var aCallback = this._whtCallback.$(sUrl).concat();
	for (var i = 0; i < aCallback.length; i++) {
		this._whtCallback.$(sUrl).splice(i, 1);
		aCallback[i]();
	}
};
jindo.LazyLoading.abort = function (sUrl) {
	if (this._checkIsLoading(sUrl)) {
		var elScript = this.getScriptElement(sUrl);
		this._waLoading = this._waLoading.refuse(sUrl);
		if ("onload" in elScript) {
			elScript.onload = null;
		} else {
			elScript.onreadystatechange = null;
		}
		jindo.$Element(elScript).leave();
		this._whtScript.remove(sUrl);
		this._whtCallback.remove(sUrl);
		return true;
	} else {
		return false;
	}
};
jindo.LazyLoading._checkAlreadyLoaded = function (sUrl) {
	return this._waLoaded.has(sUrl);
};
jindo.LazyLoading._checkIsLoading = function (sUrl) {
	return this._waLoading.has(sUrl);
};
jindo.LazyLoading.getLoaded = function () {
	return this._waLoaded.$value();
};
jindo.LazyLoading.getLoading = function () {
	return this._waLoading.$value();
};
jindo.LazyLoading.getScriptElement = function (sUrl) {
	return this._whtScript.$(sUrl) || null;
};