package com.sweetk.push;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.MulticastResult;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

public class PushServiceAndroid {

	static Logger log = Logger.getLogger(PushServiceAndroid.class);
	private String apiKey = "AAAA0-68nHU:APA91bEL77Ft6t0sAYB65TNjckAod_9ugmgyCqLudaK9LcQf4y8rl-jeaEx3D8fYt1WkjcnCPAook8xonQbJROn1bGkAPWU_6_MfTxiK_lV2rLstyFuseGI3OX0WU_rxES6ZH03UsDXOjVKMQ4ZgEeAuTZ65gTTdXQ";

	public static void main(String[] args) throws Exception {

		PushServiceAndroid s = new PushServiceAndroid();

		s.sendMessage("c-VjPMqRvZQ:APA91bGBswbwe_R8N8ABba-PCmFR0AOyRrkVBsDH33Ev6A8eITFzJcx645CPJhGuEj74M_dftiE4tGgkZyvGBqigEKlImMPmWRidBlCLtrwtZ7hBICSHlOzpSiPq4NfeUtPGvyuQoI0i", "i.cou", "i.cou 테스트 Push", "etc", 0);

		
	}

	public void sendMessage(String deviceToken, String name, String msg,String etc, int newcount) throws IOException {

		
		log.debug("############## PUSH Start Time : "+ new Date());
		System.out.println("############## PUSH Start Time : "+ new Date());

		Sender sender = new Sender(apiKey);
				
		Message message = new Message.Builder()
							.addData("title", name)
							.addData("msg", msg)
							.addData("etc", etc)
							.addData("badgecount", Integer.toString(newcount))
							.build();
		
		List<String> list = new ArrayList<String>();

		list.add(deviceToken);

		MulticastResult multiResult = sender.send(message, list, 5);

		System.out.println("multiResult : "+multiResult);

		if (multiResult != null) {

		List<Result> resultList = multiResult.getResults();

			for (Result result : resultList) {
				System.out.println("getMessageId : "+result.getMessageId());
	
			}
		}

		log.debug("############## PUSH End Time : "+ new Date());
		System.out.println("############## PUSH End Time : "+ new Date());
	
	}

}
