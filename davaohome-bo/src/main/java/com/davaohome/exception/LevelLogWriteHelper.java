package com.davaohome.exception;

import org.slf4j.Logger;

import ch.qos.logback.classic.Level;

public interface LevelLogWriteHelper {
	
	public Level getLogLevel();
	
	public boolean isErrorLevel();
	
	public void writeLog(Logger logger);
	
	public void writeLog(Logger logger, String message);
}
