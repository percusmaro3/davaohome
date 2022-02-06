package com.davaohome.bo.repository.base;

import com.davaohome.bo.model.base.PagerResult;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class BaseRepository {

	@Autowired
	@Qualifier("masterSqlSessionTemplateForBO")
	protected SqlSessionTemplate sql;

	private String PAGER_STATEMENT = "Count";

	protected PagerResult selecPagertList(String statement) {

		PagerResult pr = new PagerResult();

		pr.setResult(this.sql.selectList(statement));
		pr.setTotalResultCount((Integer) this.sql.selectOne(statement + PAGER_STATEMENT));

		return pr;
	}

	public PagerResult selectPagerList(String statement, Object parameter) {

		PagerResult pr = new PagerResult();

		pr.setResult(this.sql.selectList(statement, parameter));
		Integer count = (Integer) this.sql.selectOne(statement + PAGER_STATEMENT, parameter);
		pr.setTotalResultCount(count == null ? 0 : count);

		return pr;
	}


}
