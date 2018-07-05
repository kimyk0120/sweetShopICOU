package com.sweetk.push;

import javapns.*;

import java.util.Date;

import org.apache.log4j.Logger;

public class PushService extends Thread  {

	static Logger log = Logger.getLogger(PushService.class);
	
	private String certificateFile = null;
	private String deviceToken = null ;
	private String name = null;
	private String msg = null;
	private int newcount = 0;
	
	public PushService(String deviceToken, String name, String msg, int newcount) throws Exception {
		
		String pushPath = "/home/testdev/APP/webapp/icou/WEB-INF/config";
		
		//this.certificateFile = pushPath + "/Certificates_Pro.p12"; // ad hoc
		this.certificateFile = pushPath + "/legaltraq_production.p12"; // product

		this.deviceToken = deviceToken;
		this.name = name;
		this.msg = msg;
		this.newcount = newcount;    
	}

	public void run() {
		try {

			this.startup();

		}catch (Exception e) {
			System.out.println("Push Service Error : "+e);
		}
	}
	
	public void startup() throws Exception {

		log.debug("############## PUSH Start Time : "+ new Date());
		System.out.println("############## PUSH Start Time : "+ new Date());

		String sound = "1";
		 //패스워드 다음 항목 배포버전 true, 개발버전 false 

		System.out.println("pushPhone deviceToken : " +this.deviceToken + " msg : "+this.name+"\n"+this.msg);
        Push.combined(this.name+"\n"+this.msg, this.newcount, sound,this.certificateFile, "pt1234", false, this.deviceToken);
		//Push.combined(this.name+"\n"+this.msg, this.newcount, sound,this.certificateFile, "sweetk1004", true, this.deviceToken);

		log.debug("############## PUSH End Time : "+ new Date());
		System.out.println("############## PUSH End Time : "+ new Date());

	}

}
