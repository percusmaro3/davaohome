package com.davaohome.bo.model.base;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.io.Serializable;

@Data
public class RegisterUpdateInfo implements Serializable {

	@JsonIgnore
	private Long registerDate;
	@JsonIgnore
	private Long updateDate;
	@JsonIgnore
	private String lastUpdater;

	@JsonIgnore
	public long getNow() {
		return System.currentTimeMillis();
	}
}
