package com.davaohome.utils.xml;

import javax.xml.bind.annotation.adapters.XmlAdapter;

import org.apache.commons.lang3.StringUtils;

public class CdataAdapter extends XmlAdapter<String, String> {

	@Override
	public String unmarshal(String v) throws Exception {
		return v;
	}

	@Override
	public String marshal(String v) throws Exception {
		if (StringUtils.isNotEmpty(v)) {
			return "<![CDATA[" + v + "]]>";
			//			return v;
		} else {
			return v;
		}
	}
}
