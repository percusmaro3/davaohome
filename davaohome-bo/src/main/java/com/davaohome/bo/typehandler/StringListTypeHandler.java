package com.davaohome.bo.typehandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class StringListTypeHandler implements TypeHandler<List<String>> {

	@Override
	public void setParameter(PreparedStatement ps, int i, List<String> parameter, JdbcType jdbcType) throws SQLException {

		ps.setString(i, StringUtils.join(parameter.toArray(), ","));
	}

	@Override
	public List<String> getResult(ResultSet rs, String columnName) throws SQLException {

		return returnResult(rs.getString(columnName));
	}

	@Override
	public List<String> getResult(ResultSet rs, int columnIndex) throws SQLException {

		return returnResult(rs.getString(columnIndex));
	}

	@Override
	public List<String> getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return returnResult(cs.getString(columnIndex));
	}

	private List<String> returnResult(String result) {

		if (StringUtils.isBlank(result)) {
			return null;
		}

		String[] arr = result.split(",");

		return Arrays.asList(arr);
	}
}