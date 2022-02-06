package com.davaohome.bo.model.base;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

@Data
public class RegisterInfo implements Serializable {

	@JsonIgnore
	private Long registerDate;

	@JsonIgnore
	public long getNow() {
		return System.currentTimeMillis();
	}
}
