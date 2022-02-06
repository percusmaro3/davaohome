package com.davaohome.bo.model.country;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CountryStaticMaker {

	static List<ServiceCountry> allServiceCountryList = new ArrayList<>();

	static void initAllServiceCountry() {
		allServiceCountryList.add(makeKr());
		allServiceCountryList.add(makeUs());
		allServiceCountryList.add(makeJp());
		allServiceCountryList.add(makeTw());
		allServiceCountryList.add(makeTh());
		allServiceCountryList.add(makeVn()); // 베트남
		allServiceCountryList.add(makeGb()); // 영국
		allServiceCountryList.add(makeIn()); // 인도
		allServiceCountryList.add(makeMy()); // 말레이시아
		allServiceCountryList.add(makeRu()); // 러시아
		allServiceCountryList.add(makeDk()); // 덴마크
		allServiceCountryList.add(makeMm()); // 미얀마
		allServiceCountryList.add(makeMt()); // 몰타
		allServiceCountryList.add(makeLa()); // 라오스
		allServiceCountryList.add(makeKp()); // 북한
		allServiceCountryList.add(makeKh()); // 캄보디아
		allServiceCountryList.add(makeIs()); // 아이스랜드
		allServiceCountryList.add(makeMo()); // 마카오
		allServiceCountryList.add(makeHk()); // 홍콩
		allServiceCountryList.add(makeAu()); // 호주
		allServiceCountryList.add(makePh()); // 필리핀
		allServiceCountryList.add(makeFr()); // 프랑스
		allServiceCountryList.add(makeCa()); // 캐나다
		allServiceCountryList.add(makeCn()); // 중국
		allServiceCountryList.add(makeId()); // 인도네시아
		allServiceCountryList.add(makeIt()); // 이태리
		allServiceCountryList.add(makeAe()); // 아랍에미리트
		allServiceCountryList.add(makeSg()); // 싱가폴
		allServiceCountryList.add(makeEs()); // 스페인
		allServiceCountryList.add(makeDe()); // 독일
	}

	static ServiceCountry getCountry(String countryId) {

		for (ServiceCountry sc : allServiceCountryList) {
			if (sc.getCountryId().equalsIgnoreCase(countryId)) {
				return sc;
			}
		}
		throw new IllegalArgumentException("Not supported country : " + countryId);
	}

	private static ServiceCountry makeDe() {
		ServiceCountry sc = new ServiceCountry("de");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Germany.png");
		sc.setCurrency("€");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));


		sc.addCountryName("ko", "독일");
		sc.addCountryName("en", "Germany");
		sc.addCountryName("zh", "Germany");
		sc.addCountryName("th", "Germany");
		sc.addCountryName("ja", "Germany");

		return sc;
	}

	private static ServiceCountry makeEs() {
		ServiceCountry sc = new ServiceCountry("es");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Spain.png");
		sc.setCurrency("€");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "스페인");
		sc.addCountryName("en", "Spain");
		sc.addCountryName("zh", "Spain");
		sc.addCountryName("th", "Spain");
		sc.addCountryName("ja", "Spain");

		return sc;
	}

	private static ServiceCountry makeSg() {
		ServiceCountry sc = new ServiceCountry("sg");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Singapore.png");
		sc.setCurrency("SGD$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "싱가폴");
		sc.addCountryName("en", "Singapore");
		sc.addCountryName("zh", "Singapore");
		sc.addCountryName("th", "Singapore");
		sc.addCountryName("ja", "Singapore");

		return sc;
	}

	private static ServiceCountry makeAe() {
		ServiceCountry sc = new ServiceCountry("ae");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/UnitedArabEmirates.png");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "아랍에미리트");
		sc.addCountryName("en", "United Arab Emirates");
		sc.addCountryName("zh", "United Arab Emirates");
		sc.addCountryName("th", "United Arab Emirates");
		sc.addCountryName("ja", "United Arab Emirates");

		return sc;
	}

	private static ServiceCountry makeIt() {
		ServiceCountry sc = new ServiceCountry("it");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Italy.png");
		sc.setCurrency("€");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "이탈리아");
		sc.addCountryName("en", "Italy");
		sc.addCountryName("zh", "Italy");
		sc.addCountryName("th", "Italy");
		sc.addCountryName("ja", "Italy");

		return sc;
	}

	private static ServiceCountry makeId() {
		ServiceCountry sc = new ServiceCountry("id");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Indonesia.jpg");
		sc.setCurrency("Rp");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "인도네시아");
		sc.addCountryName("en", "Indonesia");
		sc.addCountryName("zh", "Indonesia");
		sc.addCountryName("th", "Indonesia");
		sc.addCountryName("ja", "Indonesia");

		return sc;
	}

	private static ServiceCountry makeCn() {
		ServiceCountry sc = new ServiceCountry("cn");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/China.png");
		sc.setCurrency("CNY¥");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "중국");
		sc.addCountryName("en", "China");
		sc.addCountryName("zh", "China");
		sc.addCountryName("th", "China");
		sc.addCountryName("ja", "China");

		return sc;
	}

	private static ServiceCountry makeCa() {
		ServiceCountry sc = new ServiceCountry("ca");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Canada.png");
		sc.setCurrency("C$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "캐나다");
		sc.addCountryName("en", "Canada");
		sc.addCountryName("zh", "Canada");
		sc.addCountryName("th", "Canada");
		sc.addCountryName("ja", "Canada");

		return sc;
	}

	private static ServiceCountry makeFr() {
		ServiceCountry sc = new ServiceCountry("fr");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/France.png");
		sc.setCurrency("€");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "프랑스");
		sc.addCountryName("en", "France");
		sc.addCountryName("zh", "France");
		sc.addCountryName("th", "France");
		sc.addCountryName("ja", "France");

		return sc;
	}

	private static ServiceCountry makePh() {
		ServiceCountry sc = new ServiceCountry("ph");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Philippines.png");
		sc.setCurrency("₱");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "필리핀");
		sc.addCountryName("en", "Philippines");
		sc.addCountryName("zh", "Philippines");
		sc.addCountryName("th", "Philippines");
		sc.addCountryName("ja", "Philippines");

		return sc;
	}

	private static ServiceCountry makeAu() {
		ServiceCountry sc = new ServiceCountry("au");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Australia.png");
		sc.setCurrency("AUD$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "호주");
		sc.addCountryName("en", "Australia");
		sc.addCountryName("zh", "Australia");
		sc.addCountryName("th", "Australia");
		sc.addCountryName("ja", "Australia");

		return sc;
	}

	private static ServiceCountry makeHk() {
		ServiceCountry sc = new ServiceCountry("hk");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/HongKong.png");
		sc.setCurrency("HK$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "홍콩");
		sc.addCountryName("en", "HongKong");
		sc.addCountryName("zh", "HongKong");
		sc.addCountryName("th", "HongKong");
		sc.addCountryName("ja", "HongKong");

		return sc;
	}

	private static ServiceCountry makeMo() {
		ServiceCountry sc = new ServiceCountry("mo");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Macau.png");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "마카오");
		sc.addCountryName("en", "Macau");
		sc.addCountryName("zh", "Macau");
		sc.addCountryName("th", "Macau");
		sc.addCountryName("ja", "Macau");

		return sc;
	}

	private static ServiceCountry makeIs() {
		ServiceCountry sc = new ServiceCountry("is");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Iceland.png");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "아이슬랜드");
		sc.addCountryName("en", "Iceland");
		sc.addCountryName("zh", "Iceland");
		sc.addCountryName("th", "Iceland");
		sc.addCountryName("ja", "Iceland");

		return sc;
	}

	private static ServiceCountry makeKh() {
		ServiceCountry sc = new ServiceCountry("kh");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Cambodia.png");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "캄보디아");
		sc.addCountryName("en", "Cambodia");
		sc.addCountryName("zh", "Cambodia");
		sc.addCountryName("th", "Cambodia");
		sc.addCountryName("ja", "Cambodia");

		return sc;
	}

	private static ServiceCountry makeKp() {
		ServiceCountry sc = new ServiceCountry("kp");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/NorthKorea.jpg");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "북한");
		sc.addCountryName("en", "NorthKorea");
		sc.addCountryName("zh", "NorthKorea");
		sc.addCountryName("th", "NorthKorea");
		sc.addCountryName("ja", "NorthKorea");

		return sc;
	}

	private static ServiceCountry makeLa() {
		ServiceCountry sc = new ServiceCountry("la");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Laos.png");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "라오스");
		sc.addCountryName("en", "Laos");
		sc.addCountryName("zh", "Laos");
		sc.addCountryName("th", "Laos");
		sc.addCountryName("ja", "Laos");

		return sc;
	}

	private static ServiceCountry makeMt() {
		ServiceCountry sc = new ServiceCountry("mt");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Malta.png");
		sc.setCurrency("€");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "몰타");
		sc.addCountryName("en", "Malta");
		sc.addCountryName("zh", "Malta");
		sc.addCountryName("th", "Malta");
		sc.addCountryName("ja", "Malta");

		return sc;
	}

	private static ServiceCountry makeMm() {
		ServiceCountry sc = new ServiceCountry("mm");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Myanmar.png");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "미얀마");
		sc.addCountryName("en", "Myanmar");
		sc.addCountryName("zh", "Myanmar");
		sc.addCountryName("th", "Myanmar");
		sc.addCountryName("ja", "Myanmar");

		return sc;
	}

	private static ServiceCountry makeDk() {
		ServiceCountry sc = new ServiceCountry("dk");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Denmark.jpg");
		sc.setCurrency("kr");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "덴마크");
		sc.addCountryName("en", "Denmark");
		sc.addCountryName("zh", "Denmark");
		sc.addCountryName("th", "Denmark");
		sc.addCountryName("ja", "Denmark");

		return sc;
	}

	private static ServiceCountry makeRu() {
		ServiceCountry sc = new ServiceCountry("ru");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Russia.png");
		sc.setCurrency("руб");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "러시아");
		sc.addCountryName("en", "Russia");
		sc.addCountryName("zh", "Russia");
		sc.addCountryName("th", "Russia");
		sc.addCountryName("ja", "Russia");

		return sc;
	}

	private static ServiceCountry makeMy() {
		ServiceCountry sc = new ServiceCountry("my");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/Malaysia.png");
		sc.setCurrency("RM");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "말레이시아");
		sc.addCountryName("en", "Malaysia");
		sc.addCountryName("zh", "Malaysia");
		sc.addCountryName("th", "Malaysia");
		sc.addCountryName("ja", "Malaysia");

		return sc;
	}

	private static ServiceCountry makeIn() {
		ServiceCountry sc = new ServiceCountry("in");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/inFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/inFlagUnactive.png");
		sc.setCurrency("Rs.");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));

		sc.addCountryName("ko", "인도");
		sc.addCountryName("en", "India");
		sc.addCountryName("zh", "India");
		sc.addCountryName("th", "India");
		sc.addCountryName("ja", "India");

		return sc;
	}

	private static ServiceCountry makeGb() {
		ServiceCountry sc = new ServiceCountry("gb");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/gbFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/gbFlagUnactive.png");
		sc.setCurrency("£");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));
		sc.setLanguage("en");
		sc.setHtmlDateFormat("mm.dd.yy");
		sc.setDateFormat(new SimpleDateFormat("MM.dd.yyyy"));
		sc.setDatetimeFormat(new SimpleDateFormat("MM.dd.yyyy HH:mm"));
		sc.setTimezoneOffsetHour(9);

		sc.addCountryName("ko", "영국");
		sc.addCountryName("en", "United Kingdom");
		sc.addCountryName("zh", "United Kingdom");
		sc.addCountryName("th", "United Kingdom");
		sc.addCountryName("ja", "United Kingdom");
		return sc;
	}

	private static ServiceCountry makeVn() {
		ServiceCountry sc = new ServiceCountry("vn");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/vnFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/vnFlagUnactive.png");
		sc.setCurrency("₫");
		sc.setCurrencyFormat(new DecimalFormat("##,##0"));
		sc.setLanguage("vi");
		sc.setHtmlDateFormat("mm.dd.yy");
		sc.setDateFormat(new SimpleDateFormat("MM.dd.yyyy"));
		sc.setDatetimeFormat(new SimpleDateFormat("MM.dd.yyyy HH:mm"));
		sc.setTimezoneOffsetHour(2);

		sc.addCountryName("ko", "베트남");
		sc.addCountryName("en", "Vietnam");
		sc.addCountryName("zh", "Vietnam");
		sc.addCountryName("th", "Vietnam");
		sc.addCountryName("ja", "Vietnam");
		return sc;
	}

	private static ServiceCountry makeTh() {
		ServiceCountry sc = new ServiceCountry("th");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/thFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/thFlagUnactive.png");
		sc.setCurrency("฿");
		sc.setCurrencyFormat(new DecimalFormat("##,##0"));
		sc.setLanguage("th");
		sc.setHtmlDateFormat("dd.mm.yy");
		sc.setDateFormat(new SimpleDateFormat("dd.MM.yyyy"));
		sc.setDatetimeFormat(new SimpleDateFormat("dd.MM.yyyy HH:mm"));
		sc.setTimezoneOffsetHour(2);

		sc.addCountryName("ko", "태국");
		sc.addCountryName("en", "Thailand");
		sc.addCountryName("zh", "泰國");
		sc.addCountryName("th", "ประเทศไทย");
		sc.addCountryName("ja", "タイ");
		return sc;
	}

	private static ServiceCountry makeUs() {
		ServiceCountry sc = new ServiceCountry("us");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/usFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/usFlagUnactive.png");
		sc.setCurrency("$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));
		sc.setLanguage("en");
		sc.setHtmlDateFormat("dd.mm.yy");
		sc.setDateFormat(new SimpleDateFormat("dd.MM.yyyy"));
		sc.setDatetimeFormat(new SimpleDateFormat("dd.MM.yyyy HH:mm"));
		sc.setTimezoneOffsetHour(6);

		sc.addCountryName("ko", "미국");
		sc.addCountryName("en", "America");
		sc.addCountryName("zh", "美國");
		sc.addCountryName("th", "ประเทศสหรัฐอเมริกา");
		sc.addCountryName("ja", "米国");
		return sc;
	}

	private static ServiceCountry makeTw() {
		ServiceCountry sc = new ServiceCountry("tw");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/twFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/twFlagUnactive.png");
		sc.setCurrency("NT$");
		sc.setCurrencyFormat(new DecimalFormat("##,##0.##"));
		sc.setLanguage("zh");
		sc.setHtmlDateFormat("yy.mm.dd");
		sc.setDateFormat(new SimpleDateFormat("yyyy.MM.dd"));
		sc.setDatetimeFormat(new SimpleDateFormat("yyyy.MM.dd HH:mm"));
		sc.setTimezoneOffsetHour(1);

		sc.addCountryName("ko", "대만");
		sc.addCountryName("en", "Taiwan");
		sc.addCountryName("zh", "台灣");
		sc.addCountryName("th", "ไต้หวัน");
		sc.addCountryName("ja", "台湾");
		return sc;
	}

	private static ServiceCountry makeJp() {
		ServiceCountry sc = new ServiceCountry("jp");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/jpFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/jpFlagUnactive.png");
		sc.setCurrency("¥");
		sc.setCurrencyFormat(new DecimalFormat("##,##0"));
		sc.setLanguage("ja");
		sc.setHtmlDateFormat("yy.mm.dd");
		sc.setDateFormat(new SimpleDateFormat("yyyy.MM.dd"));
		sc.setDatetimeFormat(new SimpleDateFormat("yyyy.MM.dd HH:mm"));
		sc.setTimezoneOffsetHour(0);

		sc.addCountryName("ko", "일본");
		sc.addCountryName("en", "Japan");
		sc.addCountryName("zh", "日本");
		sc.addCountryName("th", "ประเทศญี่ปุ่น\n");
		sc.addCountryName("ja", "日本");
		return sc;
	}

	private static ServiceCountry makeKr() {
		ServiceCountry sc = new ServiceCountry("kr");
		sc.setActiveFlagImageUrl("http://static.gg-trip.com/image/flag/krFlag.png");
		sc.setInactiveFlagImageUrl("http://static.gg-trip.com/image/flag/krFlagUnactive.png");
		sc.setCurrency("₩");
		sc.setCurrencyFormat(new DecimalFormat("##,##0"));
		sc.setLanguage("ko");
		sc.setHtmlDateFormat("yy.mm.dd");
		sc.setDateFormat(new SimpleDateFormat("yyyy.MM.dd"));
		sc.setDatetimeFormat(new SimpleDateFormat("yyyy.MM.dd HH:mm"));
		sc.setTimezoneOffsetHour(0);

		sc.addCountryName("ko", "한국");
		sc.addCountryName("en", "Korea");
		sc.addCountryName("zh", "韓國");
		sc.addCountryName("th", "เกาหลีใต้");
		sc.addCountryName("ja", "韓国");

		return sc;
	}
}
