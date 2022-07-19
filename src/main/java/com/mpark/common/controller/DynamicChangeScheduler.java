package com.mpark.common.controller;

import java.time.LocalDateTime;
import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.scheduling.Trigger;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;

@Component
public class DynamicChangeScheduler {
	private ThreadPoolTaskScheduler scheduler;
	private String cron = "*/3 * * * * *";

	public void startScheduler() {
		scheduler = new ThreadPoolTaskScheduler();
		scheduler.initialize();
		scheduler.schedule(getRunnable(), getTrigger());
		
	}
	
	public void startScheduler(HashMap<String, Object> param) {
		scheduler = new ThreadPoolTaskScheduler();
		scheduler.initialize();
		scheduler.schedule(getRunnable(param), getTrigger());
		
	}

	public void changeCronSet(String cron) {
		this.cron = cron;
	}

	public void stopScheduler() {
		if (scheduler != null) {
			scheduler.shutdown();
		}
	} 

		// do something
	private Runnable getRunnable() {
		
		return () -> {
			System.out.println(LocalDateTime.now().toString());
		};
	}
	
	public void setData(HashMap<String, Object> param) {
		System.out.println(LocalDateTime.now().toString());
	}
	
	private Runnable getRunnable(HashMap<String, Object> param) {
		
		return () -> {
			setData(param);
		};
	}

	private Trigger getTrigger() {
		// cronSetting
		return new CronTrigger(cron);
	}

	@PostConstruct
	public void init() {
		//startScheduler();
	}

	@PreDestroy
	public void destroy() {
		stopScheduler();
	}
}
