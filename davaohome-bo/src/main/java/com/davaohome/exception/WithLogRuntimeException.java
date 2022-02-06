package com.davaohome.exception;

import org.slf4j.Logger;

import ch.qos.logback.classic.Level;

public abstract class WithLogRuntimeException extends RuntimeException implements LevelLogWriteHelper{

	private static final long serialVersionUID = 1L;
	private Level logLevel = Level.ERROR;
	
	public WithLogRuntimeException() {
		super();
	}

	public WithLogRuntimeException(String message) {
		super(message);
	}
	
	public WithLogRuntimeException(Throwable cause) {
		super(cause);
	}

	public WithLogRuntimeException(String message, Throwable cause) {
		super(message, cause);
	}
	
	public WithLogRuntimeException(Level logLevel) {
		super();
		initLevel(logLevel);
	}

	public WithLogRuntimeException(String message, Level logLevel) {
		super(message);
		initLevel(logLevel);
	}
	
	public WithLogRuntimeException(Throwable cause, Level logLevel) {
		super(cause);
		initLevel(logLevel);
	}

	public WithLogRuntimeException(String message, Throwable cause, Level logLevel) {
		super(message, cause);
		initLevel(logLevel);
	}
	

	
	protected void initLevel(Level logLevel){
		this.logLevel = logLevel;
	}
	
	public Level getLogLevel(){
		return this.logLevel;
	}
	
	public boolean isErrorLevel(){
		return this.logLevel == Level.ERROR;
	}
	
	public void writeLog(Logger logger){
		
		writeLog(logger, "");
	}
	
	public void writeLog(Logger logger, String message){
		
		if (this.logLevel == Level.ERROR) {
			logger.error(message, this);
		} else if (this.logLevel == Level.WARN) {
			logger.warn(message, this);
		} else if (this.logLevel == Level.INFO) {
			logger.info(message, this);
		} else if (this.logLevel == Level.DEBUG) {
			logger.debug(message, this);
		} else {
			throw new IllegalArgumentException("Not supported level : "+this.logLevel.toString());
		}
	}
	
}
